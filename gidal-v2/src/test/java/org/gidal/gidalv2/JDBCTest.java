package org.gidal.gidalv2;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Connection;
import java.sql.DriverManager;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JDBCTest {

    private static final String Drive = "org.mariadb.jdbc.Driver";
    private static final String URL = "jdbc:mariadb://localhost:3307/gidal?useSSL=false&amp;serverTimezone=UTC";
    private static final String USER = "gidal";
    private static final String PASSWORD = "gidal";

    @Test
    public void testConnect() throws Exception {
        Class.forName(Drive);
        try(Connection connection  = DriverManager.getConnection(URL,USER,PASSWORD)) {
            System.out.println(connection);
        }
    }
}
