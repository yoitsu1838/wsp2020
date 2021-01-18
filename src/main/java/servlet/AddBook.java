package servlet;

import model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class AddBook extends HttpServlet {

    public AddBook() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }


        getServletContext().getRequestDispatcher("/WEB-INF/views/addBook.jsp").forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");
        Book book;


        HttpSession session = request.getSession();
        String libraryId = ((User) session.getAttribute("member")).getLibraryId();
        String libraryIdForBooktable = libraryId;

        if (session.getAttribute("foundBook") != null) { //from楽天API
            book = ((Book) session.getAttribute("foundBook"));
            libraryIdForBooktable = null;
        } else {//fromPOST
            book = new Book();

            String bookId = UUID.randomUUID().toString();
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String remark = request.getParameter("remark");

            book.setIsbn(bookId);
            book.setTitle(title);
            book.setAuthor(author);
            book.setRemarks(remark);

        }

        BookManager bm = new BookManager(dbInfoPath);
        CollectionManager cm = new CollectionManager(dbInfoPath);
        int resultCode = 0;
        try {
            bm.addBookToDb(book, libraryIdForBooktable);
            resultCode = cm.addMyBook(book, libraryId);
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>個人図書館システム</title></head><body>");
            if (resultCode == 1) {
                out.println("すでに登録済みです。<br><br><a href=\"AddBook\">追加画面へ戻る</a> ");
            } else if (resultCode == 2) {
                out.println("本を追加しました。<br><br><a href=\"AddBook\">更に追加する</a> ");
            }

            out.println("</body></html>");
            out.close();

        } catch (SQLException throwables) {
            printError(response, throwables);
            throwables.printStackTrace();

        }


    }

    public void printError(HttpServletResponse response, Exception e) {
        try {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>DB ERROR</title></head><body>");
            out.println(e.getMessage() + "<br>");
            out.println("</body></html>");
            out.close();
        } catch (Exception er) {
            er.printStackTrace();
        }
    }
}