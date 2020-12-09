package com.database.invocationhandler;

import com.database.connection.LocalConnectionHolder;
import com.database.interceptor.MapperInterceptor;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 实现了{@link InvocationHandler}，用于加强Mapper的方法
 * @author wisecoach
 */
public abstract class AbstractMapperInvocationHandler implements InvocationHandler {
    /**用于提供数据库连接*/
    private LocalConnectionHolder localConnectionHolder;
    /**mapper方法拦截器*/
    private MapperInterceptor mapperInterceptor;

    public AbstractMapperInvocationHandler(LocalConnectionHolder localConnectionHolder, MapperInterceptor mapperInterceptor) {
        this.localConnectionHolder = localConnectionHolder;
        this.mapperInterceptor = mapperInterceptor;
    }

    /**
     * 整个代理流程为
     * -》取得数据库连接
     * -》mapperInterceptor处理被调用的方法
     * -》如果正确处理，提交操作结果
     * -》如果处理过程出错进行错误处理
     * -》在处理后之后后置操作
     * -》返回处理结果
     * @param proxy
     * @param method
     * @param args
     * @return
     * @throws Throwable
     */
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Connection conn = getConnection();
        Object retVal = null;
        try {
            retVal = mapperInterceptor.process(conn, method, args);
            processPost();
        }catch (Throwable e){
            processException(e);
        }finally {
            processFinally();
        }
        return retVal;
    }

    protected abstract Connection getConnection() throws SQLException;

    protected abstract void processPost() throws SQLException;

    protected abstract void processFinally() throws SQLException;

    protected abstract void processException(Throwable e) throws SQLException;

    protected LocalConnectionHolder getConnectionLocalHolder(){
        return localConnectionHolder;
    }
}
