package servlet;

import model.Friend;
import model.FriendList;
import model.FriendManager;
import model.UserManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

        if (!(request.getParameter("method") == null) && request.getParameter("method").equals("search")) {
            FriendManager fm = new FriendManager();
            if (!fm.exsistingCheck(request, dbInfoPath)) {
                //重複がない時
                fm.addFriend(request, dbInfoPath);
                request.setAttribute("message", "友人追加しました。");
            } else {
                //重複がある時
                request.setAttribute("errMsg", "この図書館は、すでに友人に追加済みです。");

            }


            getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);

        } else {

            UserManager um = new UserManager();
            um.getUserAddUrl(request);

            getServletContext().getRequestDispatcher("/WEB-INF/views/addBook.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


        getServletContext().getRequestDispatcher("/WEB-INF/views/addBook.jsp").forward(request, response);

    }
}