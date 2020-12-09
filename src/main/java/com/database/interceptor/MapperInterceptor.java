package com.database.interceptor;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Mapper方法拦截器，实现了InvocationHandler，
 * 其方法为处理查询和修改，在其父类的invoke中被调用
 * @author wisecoach
 */
public interface MapperInterceptor {
    Object process(Connection conn, Method method, Object[] args) throws Throwable;
}
