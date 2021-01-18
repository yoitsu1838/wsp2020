package servlet;

import model.Book;
import model.BookManager;
import model.FriendManager;
import model.UserManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class SearchBook extends HttpServlet {

    public SearchBook() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }

        if (!(request.getParameter("method") == null) && request.getParameter("method").equals("isbn") && !(request.getParameter("isbn") == null)) {

            BookManager bm = new BookManager(dbInfoPath);
            Book foundBook = bm.getBookInfoFromRakutenAPI(request.getParameter("isbn"));
            request.setAttribute("foundBook", foundBook);
            session.setAttribute("foundBook", foundBook);

            getServletContext().getRequestDispatcher("/WEB-INF/views/searchBook.jsp").forward(request, response);


        } else {

            getServletContext().getRequestDispatcher("/WEB-INF/views/searchBook.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
        if (!(request.getParameter("method") == null) && request.getParameter("method").equals("nowBookAdd")) {
            //AddBookへもどる　
            String disp = "AddBook";
            RequestDispatcher dispatch = request.getRequestDispatcher(disp);
            dispatch.forward(request, response);
        } else {
            this.doGet(request, response);
        }

    }

}