package servlet;

import model.User;
import model.UserManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddFriend extends HttpServlet {

    public AddFriend() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }

        UserManager um = new UserManager();
        um.getUserAddUrl(request);

        getServletContext().getRequestDispatcher("/WEB-INF/views/addFriend.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


    }
}