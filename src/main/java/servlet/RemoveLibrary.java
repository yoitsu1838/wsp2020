package servlet;

import model.UserManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RemoveLibrary extends HttpServlet {
    public RemoveLibrary() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/WEB-INF/views/removeLibrary.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        boolean result = false;
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        UserManager um = new UserManager();

        if (request.getParameter("method").equals("executeDel")) {
            result = um.cancellation(request, dbInfoPath);
            if (result) {

                session.invalidate();
                getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
        }
        getServletContext().getRequestDispatcher("/WEB-INF/views/removeLibrary.jsp").forward(request, response);
    }
}