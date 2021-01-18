package model;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Properties;

public class CollectionManager {
    final private static Properties prop = new Properties();
    private String dbfilePath;

    public CollectionManager(String file) {
        dbfilePath = file;
        try {
            InputStream is = new FileInputStream(file);
            prop.load(is);
            is.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    //所有書物を追加
    /*
     * [resultCode]
     *
     * 1:すでにDB存在する
     * 2:DBへ追加実行
     *
     * */
    public int addMyBook(Book book, String libraryId) throws SQLException {
        int resultCode;
        CollectionDAO dao = new CollectionDAO(dbfilePath);

        if (dao.checkExsistingMyBook(book, libraryId)) {
            resultCode = 1;

        } else {
            dao.addMyBook(book, libraryId);
            resultCode = 2;
        }

        return resultCode;

    }


    //所有書物を取得
    public CollectionList getCollections(String libraryId) {
        CollectionDAO dao = new CollectionDAO(dbfilePath);
        CollectionList list = null;
        try {
            list = dao.getMyBooks(libraryId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;

    }


    //所有書物を削除

}