package com.database.datasource;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.Properties;
import java.util.logging.Logger;

/**
 * 自定义数据源，本质上就是用DriverManager来获取连接，主要就是给接口一个实现罢了，完全可以换成其他数据源
 * @author wisecoach
 */
public class MyDataSource implements DataSource {
    private static String driver;
    private static String username;
    private static String url;
    private static String password;
    private static boolean autoCommit;

    /*
     * 初始化DB的属性
     */
    static {
        Properties properties = new Properties();
        try {
            InputStreamReader reader = new InputStreamReader(Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties"));
            properties.load(reader);
            String username = properties.getProperty("username");
            if(username != null){
                MyDataSource.username = username;
            }
            String password = properties.getProperty("password");
            if(password != null){
                MyDataSource.password = password;
            }
            String driver = properties.getProperty("driver");
            if(driver != null){
                MyDataSource.driver = driver;
            }
            String url = properties.getProperty("url");
            if(url != null){
                MyDataSource.url = url;
            }
            String autoCommit = properties.getProperty("autoCommit", "true");
            if(autoCommit != null){
                MyDataSource.autoCommit = Boolean.parseBoolean(autoCommit);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public Connection getConnection() throws SQLException {
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Connection getConnection(String username, String password) throws SQLException {
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public <T> T unwrap(Class<T> iface) throws SQLException {
        return null;
    }

    @Override
    public boolean isWrapperFor(Class<?> iface) throws SQLException {
        return false;
    }

    @Override
    public PrintWriter getLogWriter() throws SQLException {
        return null;
    }

    @Override
    public void setLogWriter(PrintWriter out) throws SQLException {

    }

    @Override
    public void setLoginTimeout(int seconds) throws SQLException {

    }

    @Override
    public int getLoginTimeout() throws SQLException {
        return 0;
    }

    @Override
    public Logger getParentLogger() throws SQLFeatureNotSupportedException {
        return null;
    }
}
