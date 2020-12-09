package com.database.invocationhandler;

import com.database.connection.LocalConnectionHolder;
import com.database.interceptor.MapperInterceptor;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * 对于自动提交，不支持复杂事务的实现
 * @author wisecoach
 */
public class AutoCommitMapperInvocationHandler extends AbstractMapperInvocationHandler{

    public AutoCommitMapperInvocationHandler(LocalConnectionHolder connectionLocalHolder, MapperInterceptor mapperInterceptor) {
        super(connectionLocalHolder, mapperInterceptor);
    }

    /**
     * 由于自动提交，每次都开启全新的连接
     * @return 全新的链接
     * @throws SQLException
     */
    @Override
    protected Connection getConnection() throws SQLException {
        Connection connection = getConnectionLocalHolder().openConnection();
        return connection;
    }

    /**
     * 正确处理后直接提交
     * @throws SQLException
     */
    @Override
    protected void processPost() throws SQLException {
        getConnectionLocalHolder().commit();
    }

    /**
     * 由于自动提交，最后直接释放连接即可
     * @throws SQLException
     */
    @Override
    protected void processFinally() throws SQLException {
        getConnectionLocalHolder().closeConnection();
    }

    /**
     * 处理出现异常，就需要rollback了
     * @param e
     * @throws SQLException
     */
    @Override
    protected void processException(Throwable e) throws SQLException {
        getConnectionLocalHolder().rollback();
    }
}
