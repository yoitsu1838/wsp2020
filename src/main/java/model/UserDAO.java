package model;

import java.util.*;

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

    final private static String driverClassName = "org.postgresql.Driver";
    final private static Properties prop = new Properties();

    public boolean check(User user, String file) throws SQLException {

        //servletContextをLogin.javaからもらって環境に合わせたdbのPATHを取得

        boolean result = false;

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


        // memberがDBにあるかどうかを調べる

        Connection connection;
        String sql = "select * from users where user_id=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            String userId = user.getUserId();
            if (userId == "") return false;
            System.out.println("UserDAO.java:userId" + userId);
            pstmt.setString(1, userId);

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

                String textPassword = user.getPassword();
                //System.out.println("input:"+textPassword);
                String encryptedPassword = resultSet.getString("user_pass");
                System.out.println("fromdb:+" + resultSet.getString("user_pass"));

                if (encoder.matches(textPassword, encryptedPassword)) {
                    //System.out.println("matched");
                    result = true;
                } else {
                    // System.out.println("mismatched");
                }


                System.out.println("mark");
                user.setLibraryId(resultSet.getString("library_id"));
                user.setLibraryName(resultSet.getString("library_name"));
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    public String getLibraryName(String libId, String file) throws SQLException {
        String libName = null;
        boolean result = false;

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

        Connection connection;
        String sql = "select * from users where library_id=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, libId);

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                libName = resultSet.getString("library_name");
                System.out.println("libname:" + libName);
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return libName;
    }


    public boolean register(User user, String file) throws SQLException {
        boolean result = false;
        boolean exitId = false;
        //servletContextをLogin.javaからもらって環境に合わせたdbのPATHを取得
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


        // DBにユーザ情報を追加する
        Connection connection;
        String sql = "INSERT INTO users (library_id, library_name, user_id, user_pass) VALUES (?,?,?,?)";

        String libraryId = UUID.randomUUID().toString();//UUIDから内部用のユーザ識別IDを生成する
        user.setLibraryId(libraryId);
        String userId = user.getUserId();
        exitId = checkExitId(userId, usr, url, password);//DBに重複するユーザIDがないか
        String libraryName = user.getLibraryName();
        //passwordをハッシュ化
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String userPass = encoder.encode(user.getPassword());

        if (!exitId) {
            try {
                Class.forName(driverClassName);
                connection = DriverManager.getConnection(url, usr, password);

                PreparedStatement pstmt = connection.prepareStatement(sql);

                pstmt.setString(1, libraryId);
                pstmt.setString(2, libraryName);
                pstmt.setString(3, userId);
                pstmt.setString(4, userPass);

                int number = pstmt.executeUpdate();
                System.out.println(number);

                result = true;

                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }


    private boolean checkExitId(String userId, String usr, String url, String password) {
        boolean exitId = false;
        Connection connection;
        String sql = "select * from users where user_id=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, userId);

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                exitId = true;
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return exitId;
    }


    public boolean cancellation(User user, String file) throws SQLException {
        boolean result = false;
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

        // memberがDBにあるかどうかを調べる

        //TODO Exceptionの解決

        Connection connection;
        String sql = "select * from users where user_id=?";
        String delSql = "DELETE from users where user_id=?";
        String ckStatusSql = "SELECT is_lending from users where library_id=? and isbn=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);
            PreparedStatement pstmt2 = connection.prepareStatement(delSql);

            String userId = user.getUserId();
            if (userId == "") return false;
            pstmt.setString(1, userId);
            pstmt2.setString(1, userId);

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

                String textPassword = user.getPassword();
                String encryptedPassword = resultSet.getString("user_pass");
                if (encoder.matches(textPassword, encryptedPassword)) {
                    //System.out.println("matched");
                    result = true;
                } else {
                    // System.out.println("mismatched");
                }
            }

            if (result) {
                System.out.println("mark:" + delSql);
                ResultSet resultSet2 = pstmt2.executeQuery();
                System.out.println(resultSet2);
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


}