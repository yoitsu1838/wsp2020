package model;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class FriendDAO {

    final private static String driverClassName = "org.postgresql.Driver";
    final private static Properties prop = new Properties();

    public boolean addFriend(Friend friend, String file) throws SQLException {
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
        String sql = "INSERT INTO friends (library_id,friends_library_key) VALUES (?,?)";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            String friendLibraryId = friend.getFriendLibraryId();
            String libraryId = friend.getLibraryId();
            pstmt.setString(1, libraryId);
            pstmt.setString(2, friendLibraryId);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                System.out.println(resultSet);
                result = true;
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


    public boolean checkExsistingFriend(Friend friend, String file) throws SQLException {
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
        String sql = "SELECT * FROM friends WHERE library_id=? AND friends_library_key=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            String friendLibraryId = friend.getFriendLibraryId();
            String libraryId = friend.getLibraryId();
            pstmt.setString(1, libraryId);
            pstmt.setString(2, friendLibraryId);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                result = true;
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public FriendList loadFriends(String libraryId, String file) throws SQLException {
        FriendList friendList = new FriendList();
        Friend tmpFriend;

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
        String sql = "SELECT * FROM friends WHERE library_id=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, libraryId);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                tmpFriend = new Friend();
                tmpFriend.setLibraryId(libraryId);
                tmpFriend.setFriendLibraryId(resultSet.getString("friends_library_key"));
                friendList.addFriendForList(tmpFriend);
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return friendList;
    }


    public boolean deleteFriend(User user, String target, String file) throws SQLException {
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
        String delSql = "DELETE from friends where library_id=? AND friends_library_key=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(delSql);

            String userLibId = user.getLibraryId();
            pstmt.setString(1, userLibId);
            pstmt.setString(2, target);

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {

                result = true;

            }


            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
