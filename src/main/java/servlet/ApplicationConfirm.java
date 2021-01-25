package servlet;

import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class ApplicationConfirm extends HttpServlet {

    public ApplicationConfirm() {
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
        request.setAttribute("applyBook", book);


        getServletContext().getRequestDispatcher("/WEB-INF/views/applicationConfirm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        String bookId = (String) request.getParameter("bookId");
        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
        String appluingName = ((User) session.getAttribute("member")).getLibraryName();
        //String appluingLibraryId = ((User) session.getAttribute("member")).getLibraryId();
        String appluingLibraryId = (String) session.getAttribute("nowFriendId");
        LocalDateTime nowDateTime = LocalDateTime.now();
        DateTimeFormatter java8Format = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

        CollectionManager cm = new CollectionManager(dbInfoPath);
        cm.applyBook(appluingLibraryId, bookId, appluingName, nowDateTime.format(java8Format));
        request.setAttribute("message", "貸出申請を実行しました。");

        //申請内容の本を非表示に
        request.removeAttribute("applyBook");
        getServletContext().getRequestDispatcher("/WEB-INF/views/applicationConfirm.jsp").forward(request, response);
    }
}