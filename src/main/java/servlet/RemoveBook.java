package servlet;

import model.UserManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RemoveBook extends HttpServlet {

    public RemoveBook() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        getServletContext().getRequestDispatcher("/WEB-INF/views/removeBook.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        boolean result = false;
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        UserManager um = new UserManager();
        result = um.register(request, dbInfoPath);

        if (result) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/removeBook.jsp").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/WEB-INF/views/removeBook.jsp").forward(request, response);
        }
    }
}