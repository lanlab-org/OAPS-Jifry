package com.database.interceptor;

import com.database.annotation.Column;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

/**
 * @author wisecoach
 */
public abstract class AbstractMapperInterceptor implements MapperInterceptor{
    /**缓存bean类和（字段名或{@link Column}的值和属性描述器的映射）的映射*/
    private Map<Class, Map<String, PropertyDescriptor>> propertyDescriptors = new HashMap<>();

    /**
     * 处理mapper中的查询方法，主要根据返回结果是否为集合来判断是使用queryOne还是queryMany
     * @param conn
     * @param method
     * @param args
     * @return
     * @throws SQLException
     * @throws InvocationTargetException
     * @throws IntrospectionException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    protected Object processQuery(Connection conn, Method method, Object[] args) throws SQLException, InvocationTargetException, IntrospectionException, InstantiationException, IllegalAccessException {
        Class<?> returnType = method.getReturnType();
        boolean many = Collection.class.isAssignableFrom(returnType);
        if(!many){
            return excuteOne(conn, method, args);
        }else {
            return excuteMany(conn, method, args);
        }
    }

    /**
     * 处理mapper中的修改方法
     * @param conn
     * @param method
     * @param args
     * @return
     * @throws SQLException
     */
    protected int processUpdate(Connection conn, Method method, Object[] args) throws SQLException{
        return excuteUpdate(conn, method, args);
    }

    protected static boolean isPrimitive(Class<?> clazz){
        try {
            return ((Class<?>)clazz.getField("TYPE").get(null)).isPrimitive();
        } catch (Exception e) {
            return false;
        }
    }

    protected abstract Object excuteOne(Connection conn, Method method, Object[] args) throws SQLException, IntrospectionException, IllegalAccessException, InstantiationException, InvocationTargetException;

    protected abstract Collection<?> excuteMany(Connection conn, Method method, Object[] args) throws SQLException, IllegalAccessException, InstantiationException, InvocationTargetException, IntrospectionException;

    protected abstract int excuteUpdate(Connection conn, Method method, Object[] args) throws SQLException;

    /**
     * 取得该bean类的字段和属性描述器的映射
     * @param clazz bean类
     * @return
     * @throws IntrospectionException
     */
    protected Map<String, PropertyDescriptor> getPropertyDescriptor(Class<?> clazz) throws IntrospectionException {
        //能从缓冲中取就直接返回
        Map<String, PropertyDescriptor> descriptors = this.propertyDescriptors.get(clazz);
        if(descriptors == null){
            descriptors = new HashMap<>();
            Field[] fields = clazz.getFields();
            for (Field field : fields) {
                //优先尝试获得Column注解的值作为key，没有就是用字段名作为key
                Column column = field.getAnnotation(Column.class);
                String name = column != null ? column.value() : field.getName();
                descriptors.put(name, new PropertyDescriptor(name, clazz));
            }
            propertyDescriptors.put(clazz, descriptors);
        }
        return descriptors;
    }
}
