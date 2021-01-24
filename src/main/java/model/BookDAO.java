package model;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;

public class BookDAO {
    final private static String driverClassName = "org.postgresql.Driver";
    final private static Properties prop = new Properties();
    private String usr;
    private String password;
    private String url;

    public BookDAO(String file) {
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


    public void addBookToDb(Book book, String libraryId) throws SQLException {
        Connection connection;
        String sql = "INSERT INTO books(book_id,title,author,volume,pic_path,remarks,library_id) VALUES (?,?,?,?,?,?,?)";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);

            String book_id = book.getIsbn();
            String title = book.getTitle();
            String author = book.getAuthor();
            String volume;
            if (book.getVolume() != null) {
                volume = book.getVolume();
            } else {
                volume = "巻数情報はありません";
            }
            String picPath = book.getPic_path();
            String remarks;
            if (book.getRemarks() != null) {
                remarks = book.getRemarks();
            } else {
                remarks = " ";
            }


            pstmt.setString(1, book_id);
            pstmt.setString(2, title);
            pstmt.setString(3, author);
            pstmt.setString(4, volume);
            pstmt.setString(5, picPath);
            pstmt.setString(6, remarks);
            pstmt.setString(7, libraryId);

            int num = pstmt.executeUpdate();
            System.out.println(num);

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();


        }

    }


    //bookの重複チェック・ISBNベース
    public boolean checkExsistingBook(Book book) throws SQLException {
        boolean result = false;

        Connection connection;
        String sql = "SELECT * FROM books WHERE book_id=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);


            pstmt.setString(1, book.getIsbn());

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

    //bookIdから本情報を取得
    public Book getBookInfo(String bookId) {
        Book book = new Book();

        Connection connection;
        String sql = "SELECT * FROM books WHERE book_id=?";

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, usr, password);
            PreparedStatement pstmt = connection.prepareStatement(sql);


            pstmt.setString(1, bookId);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                book.setIsbn(resultSet.getString("book_id"));
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setVolume(resultSet.getString("volume"));
                book.setPic_path(resultSet.getString("pic_path"));
                book.setRemarks(resultSet.getString("remarks"));
            }

            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }

    //


}
