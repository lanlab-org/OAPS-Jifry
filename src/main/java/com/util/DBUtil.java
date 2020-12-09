package com.util;

import com.database.connection.LocalConnectionHolder;
import com.database.datasource.MyDataSource;
import com.database.connection.DefaultLocalConnectionHolder;
import com.database.interceptor.AnnotationMapperInterceptor;
import com.database.invocationhandler.AutoCommitMapperInvocationHandler;
import com.sun.media.jfxmedia.locator.ConnectionHolder;

import javax.sql.DataSource;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;

/**
 * DBUtils,用于生成对应Mapper实例
 * @author wisecoach
 */
public final class DBUtil {

    private static DataSource dataSource;

    static {
        dataSource = new MyDataSource();
    }

    public static <T> T getMapper(Class<T> interfaze){
        LocalConnectionHolder holder = new DefaultLocalConnectionHolder(dataSource);
        InvocationHandler handler = new AutoCommitMapperInvocationHandler(holder, new AnnotationMapperInterceptor());
        return (T) Proxy.newProxyInstance(DBUtil.class.getClassLoader(), new Class[]{interfaze}, handler);
    }

}
