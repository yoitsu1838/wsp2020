package model;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class CollectionDAO {
    final private static String driverClassName = "org.postgresql.Driver";
    final private static Properties prop = new Properties();
    private String usr;
    private String password;
    private String url;

    public CollectionDAO(String file) {
        try {
            InputStream is = new FileInputStream(file);
            prop.load(is);
            is.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        usr = prop.getProperty("usr");     // Postgre SQL user name
        password = prop.getProperty("pass"); // Postgre SQL password
        url = prop.getProperty("dbName");
    }

    //所有書物を追加
    public void addMyBook(Book book, String libraryId) {
        Connection connection;
        String sql = "INSERT INTO collection(library_id,book_id,is_lending) VALUES (?,?,? )";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            String book_id = book.getIsbn();

            System.out.println(libraryId);
            System.out.println(book_id);
            pstmt.setString(1, libraryId);
            pstmt.setString(2, book_id);
            pstmt.setBoolean(3, false);

            int num = pstmt.executeUpdate();

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();


        }

    }

    //重複チェック
    public boolean checkExsistingMyBook(Book book, String libraryId) throws SQLException {
        boolean result = false;

        Connection connection;
        String sql = "SELECT * FROM collection WHERE library_id=? AND book_id=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);


            pstmt.setString(1, libraryId);
            pstmt.setString(2, book.getIsbn());

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

    //Collectionを取得
    public CollectionList getMyBooks(String libraryId) throws SQLException {
        CollectionList collectionList = new CollectionList();

        Connection connection;
        String sql = "SELECT * FROM collection WHERE library_id=? ";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);


            pstmt.setString(1, libraryId);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                Collection collection = new Collection();
                collection.setBookId(resultSet.getString("book_id"));
                collection.setLibraryId(libraryId);//引数のlibraryId
                collection.setIsLending(resultSet.getBoolean("is_lending"));
                collection.setLendingReceptionDate(resultSet.getString("lending_reception_date"));
                collection.setLendingApprovalDate(resultSet.getString("lending_approval_date"));

                collectionList.addCollectionForList(collection);
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return collectionList;
    }


    //所有書物を削除


}