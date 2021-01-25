package servlet;

import model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class RemoveBook extends HttpServlet {

    public RemoveBook() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }

        String bookId = request.getParameter("bookId");
        BookManager bm = new BookManager(dbInfoPath);
        Book book = bm.getBookInfoFromDb(bookId);
        request.setAttribute("removeBook", book);

        getServletContext().getRequestDispatcher("/WEB-INF/views/removeBook.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        boolean result = false;
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");


        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
        String bookId = (String) request.getParameter("bookId");
        String libraryId = ((User) session.getAttribute("member")).getLibraryId();

        BookManager bm = new BookManager(dbInfoPath);
        bm.removeBook(bookId, libraryId, response);


        request.setAttribute("message", "削除を実行しました。");


        getServletContext().getRequestDispatcher("/WEB-INF/views/removeBook.jsp").forward(request, response);

    }
}