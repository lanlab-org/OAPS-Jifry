package com.database.connection;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * 提供一个线程本地的{@link Connection}的connection，
 * 用于保证每个事务都能使用同一个{@link Connection}
 * @author wisecoach
 */
public interface LocalConnectionHolder {
    Connection openConnection() throws SQLException;
    Connection getCurrentConnection();
    void closeConnection() throws SQLException;
}
