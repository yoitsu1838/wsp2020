package model;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletContext;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


public class UserDAO {

    final private static String driverClassName = "org.sqlite.JDBC";

    public boolean check(User user, ServletContext servletContext) throws SQLException {
        Properties prop = new Properties();
        //servletContextをLogin.javaからもらって環境に合わせたdbのPATHを取得
        String file = servletContext.getRealPath("WEB-INF/config.properties");
        try {
            InputStream is = new FileInputStream(file);
            prop.load(is);
            is.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        String usr = prop.getProperty("usr");     // Postgre SQL user name
        String password = prop.getProperty("pass"); // Postgre SQL password
        String url = prop.getProperty("dbName");
        String driverClassName = "org.postgresql.Driver";

        // memberがDBにあるかどうかを調べる
        boolean result = false;
        Connection connection;
        String sql = "select * from users where user_id=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, user.getUserId());
            //pstmt.setString(2, user.getPassword());

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

                String textPassword = user.getPassword();
                //System.out.println("input:"+textPassword);
                String encryptedPassword = resultSet.getString("user_pass");
               // System.out.println("fromdb:+"+resultSet.getString("user_pass"));

                if (encoder.matches(textPassword, encryptedPassword)) {
                    //System.out.println("matched");
                    result = true;
                } else {
                   // System.out.println("mismatched");
                }

            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}