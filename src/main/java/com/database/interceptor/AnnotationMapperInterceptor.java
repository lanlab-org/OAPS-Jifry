package com.database.interceptor;

import com.database.annotation.Query;
import com.database.annotation.Update;

import javax.sql.DataSource;
import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.sql.*;
import java.util.*;

/**
 * 基于注解的Mapper方法拦截器
 * @author wisecoach
 */
public class AnnotationMapperInterceptor extends AbstractMapperInterceptor{

    /**
     * 如果用Query注解了，就说明该方法是查询方法；
     * 使用了Update，就说明用的是修改方法；
     * @param conn
     * @param method
     * @param args
     * @return
     * @throws Throwable
     */
    @Override
    public Object process(Connection conn, Method method, Object[] args) throws Throwable {
        Query query = method.getAnnotation(Query.class);
        if(query != null){
            return processQuery(conn, method, args);
        }
        Update update = method.getAnnotation(Update.class);
        if (update != null){
            int row = processUpdate(conn, method, args);
            return row;
        }
        return null;
    }

    /**
     * 读取Query注解中的sql语句，并执行，并且将返回的结果封装到对应的bean对象中
     * @param conn
     * @param method
     * @param args
     * @return
     * @throws SQLException
     * @throws IntrospectionException
     * @throws IllegalAccessException
     * @throws InstantiationException
     * @throws InvocationTargetException
     */
    @Override
    protected Object excuteOne(Connection conn, Method method, Object[] args)
        throws SQLException, IntrospectionException, IllegalAccessException, InstantiationException, InvocationTargetException {
        //读取Query中的值
        Query query = method.getAnnotation(Query.class);
        if (query == null){
            throw new SQLException("该方法无对应的sql语句");
        }
        String sql = query.value();
        //生成PrepareStatement，并且将参数注入到pstm中
        PreparedStatement pstm = conn.prepareStatement(sql);
        int i = 1;
        for (Object arg : args) {
            pstm.setObject(i++, arg);
        }
        //执行查询
        ResultSet rs = pstm.executeQuery();
        ResultSetMetaData metaData = rs.getMetaData();
        Integer columnCount = metaData.getColumnCount();
        Class<?> returnType = method.getReturnType();
        //根据返回类型,取得对应的映射
        Map<String, PropertyDescriptor> propertyDescriptors = getPropertyDescriptor(returnType);
        //此为匹配到的<列标, 属性描述器>的映射
        Map<Integer, PropertyDescriptor> descriptors = new HashMap<>();
        //根据列名匹配属性描述起
        for (int col = 1; col <= columnCount; col++) {
            String columnName = metaData.getColumnName(col);
            PropertyDescriptor descriptor = propertyDescriptors.get(columnName);
            if(descriptor != null){
                descriptors.put(col, descriptor);
            }
        }
        Object instance = null;
        if(rs.next()){
            //生成实例,并注入对应的属性值
            instance = returnType.newInstance();
            for (Map.Entry<Integer, PropertyDescriptor> entry : descriptors.entrySet()) {
                Integer column = entry.getKey();
                PropertyDescriptor descriptor = entry.getValue();
                descriptor.getWriteMethod().invoke(instance, rs.getObject(column));
            }
        }
        if(rs.next()){
            throw new SQLException("结果超出一行");
        }
        return instance;
    }

    @Override
    protected Collection<?> excuteMany(Connection conn, Method method, Object[] args) throws SQLException, IllegalAccessException, InstantiationException, InvocationTargetException, IntrospectionException {
        Query query = method.getAnnotation(Query.class);
        if (query == null){
            throw new SQLException("该方法无对应的sql语句");
        }
        String sql = query.value();
        PreparedStatement pstm = conn.prepareStatement(sql);
        int i = 1;
        for (Object arg : args) {
            pstm.setObject(i++, arg);
        }
        ResultSet rs = pstm.executeQuery();
        //取得集合的类型
        Class<? extends Collection> collectionType = (Class<? extends Collection>) method.getReturnType();
        //取得集合元素的类型
        Class<?> beanClass = ((ParameterizedType)method.getGenericReturnType()).getActualTypeArguments()[0].getClass();
        Collection collection = collectionType.newInstance();
        //根据集合元素的类型获得对应的映射
        Map<String, PropertyDescriptor> propertyDescriptors = getPropertyDescriptor(beanClass);
        List<PropertyDescriptor> descriptors = new ArrayList<>();
        ResultSetMetaData metaData = rs.getMetaData();
        Integer columnCount = metaData.getColumnCount();
        for (int col = 0; col < columnCount; col++) {
            PropertyDescriptor descriptor = propertyDescriptors.get(metaData.getColumnName(col));
            if (descriptor == null){
                throw new SQLException("该列无对应的属性");
            }
            descriptors.add(descriptor);
        }
        //读取每一行的结果,生成实例,注入属性值
        while (rs.next()){
            Object instance = beanClass.newInstance();
            for (int col=0; col<columnCount; col++) {
                descriptors.get(col).getWriteMethod().invoke(instance, rs.getObject(col));
            }
            collection.add(instance);
        }
        return collection;
    }

    /**
     * 读取Update的sql语句,并且执行,返回修改的行数
     * @param conn
     * @param method
     * @param args
     * @return
     * @throws SQLException
     */
    @Override
    protected int excuteUpdate(Connection conn, Method method, Object[] args) throws SQLException {
        Update update = method.getAnnotation(Update.class);
        if (update == null){
            throw new SQLException("无对应的sql语句");
        }
        String sql = update.value();
        PreparedStatement pstm = conn.prepareStatement(sql);
        int i = 1;
        for (Object arg : args) {
            pstm.setObject(i++, arg);
        }
        int row = pstm.executeUpdate();
        return row;
    }
}
