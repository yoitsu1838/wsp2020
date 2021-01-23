package model;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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


    /* escape処理　参考：https://www.atmarkit.co.jp/ait/articles/0202/16/news002.html */
    /**
     * <p>[概 要] HTMLエスケープ処理</p>
     * <p>[詳 細] </p>
     * <p>[備 考] </p>
     * @param  str 文字列
     * @return HTMLエスケープ後の文字列
     */
    public static String htmlEscape(String str){
        StringBuffer result = new StringBuffer();
        for(char c : str.toCharArray()) {
            switch (c) {
                case '&' :
                    result.append("&amp;");
                    break;
                case '<' :
                    result.append("&lt;");
                    break;
                case '>' :
                    result.append("&gt;");
                    break;
                case '"' :
                    result.append("&quot;");
                    break;
                case '\'' :
                    result.append("&#39;");
                    break;
                case ' ' :
                    result.append("&nbsp;");
                    break;
                default :
                    result.append(c);
                    break;
            }
        }
        return result.toString();
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
    public void deleteCollection(String libraryId, String bookId) {
        CollectionDAO dao = new CollectionDAO(dbfilePath);
        dao.deleteCollection(libraryId, bookId);
    }


    //貸出申請を実行
    public void applyBook(String libraryId, String bookId, String fromUser, String date) {
        CollectionDAO dao = new CollectionDAO(dbfilePath);
        dao.applyBook(libraryId, bookId, fromUser, date);
    }

    //貸出申請を承認
    public void approveBook(String libraryId, String bookId, String date) {
        CollectionDAO dao = new CollectionDAO(dbfilePath);
        dao.approveBook(libraryId, bookId, date);
    }

    //貸出申請を拒否
    public void rejectBook(String libraryId, String bookId) {
        CollectionDAO dao = new CollectionDAO(dbfilePath);
        dao.rejectBook(libraryId, bookId);

    }

    //返却反映を行う
    public void returnBookReflect(String libraryId, String bookId) {
        CollectionDAO dao = new CollectionDAO(dbfilePath);
        dao.returnBookReflect(libraryId, bookId);
    }


}
