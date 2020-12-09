package com.database.connection;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author wisecoach
 */
public class DefaultLocalConnectionHolder implements LocalConnectionHolder{
    private DataSource dataSource;
    private ThreadLocal<Connection> currentConnection = new ThreadLocal<>();

    public DefaultLocalConnectionHolder(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    /**
     * 开启一个全新的连接
     * @return
     * @throws SQLException
     */
    @Override
    public Connection openConnection() throws SQLException {
        Connection connection = dataSource.getConnection();
        currentConnection.set(connection);
        return connection;
    }

    /**
     * 取得当前的连接
     * @return 当前连接
     */
    @Override
    public Connection getCurrentConnection() {
        return currentConnection.get();
    }

    /**
     * 关闭正在使用的连接
     * @throws SQLException
     */
    @Override
    public void closeConnection() throws SQLException {
        Connection connection = currentConnection.get();
        currentConnection.set(null);
        connection.close();
    }

    @Override
    public void rollback() throws SQLException {
        Connection currentConnection = getCurrentConnection();
        if (currentConnection == null || currentConnection.getAutoCommit()){
            return;
        }
        currentConnection.rollback();
    }

    @Override
    public void commit() throws SQLException {
        Connection currentConnection = getCurrentConnection();
        if (currentConnection == null || currentConnection.getAutoCommit()){
            return;
        }
        currentConnection.commit();
    }
}
