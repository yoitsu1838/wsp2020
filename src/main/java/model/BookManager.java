package model;

import org.json.JSONObject;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.Properties;

public class BookManager {
    final private static Properties prop = new Properties();
    private String rakutenAPIapplicationId = null;

    public BookManager(String file) {
        try {
            InputStream is = new FileInputStream(file);
            prop.load(is);
            is.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        rakutenAPIapplicationId = prop.getProperty("rakutenAPIapplicationId ");
    }

    //BookInfo取得
    public Book getBookInfoFromRakutenAPI(String isbn) throws IOException {
        Book book = null;
        String url = "https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404" +
                "?isbn=" + isbn + "&format=json&applicationId=" + rakutenAPIapplicationId;

        //JOSNの生データを取得(connectAPIメソッド)して、オブジェクトに加工する
        JSONObject jsonObject = new JSONObject(connectApi(url));
        JSONObject bookJsonObject = jsonObject
                .getJSONArray("Items")
                .getJSONObject(0)
                .getJSONObject("Item");

        String title = bookJsonObject.getString("title");
        String titleKana = bookJsonObject.getString("titleKana");
        String author = bookJsonObject.getString("author");
        String publisherName = bookJsonObject.getString("publisherName");
        String salesDate = bookJsonObject.getString("salesDate");
        String largeImageUrl = bookJsonObject.getString("largeImageUrl");

        //オブジェクト化
        book.setTitle(title);
        book.setTitleKana(titleKana);
        book.setAuthor(author);
        book.setPublisherName(publisherName);
        book.setSalesDate(salesDate);
        book.setPic_path(largeImageUrl);

        return book;
    }

    //jsonを取得してStringで返す
    private String connectApi(String requestUrl) throws IOException {
        // InputStreamの用意
        URL url = new URL(requestUrl);
        URLConnection connection = url.openConnection();
        // 接続
        connection.connect();
        // サーバからやってくるデータをInputStreamとして取得
        InputStream inputStream = connection.getInputStream();
        // 次に inputStream を読み込む InputStreamReader のインスタンス inputStreamReader を生成
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
        // さらに inputStreamReader をラップする BufferedReader のインスタンス reader を生成
        BufferedReader reader = new BufferedReader(inputStreamReader);
        String json = reader.readLine();
        //System.out.println(json);

        return json;
    }
}
