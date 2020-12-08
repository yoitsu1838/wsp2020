package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.UserDAO;

@WebServlet({"/login", "/"})
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       // getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
        this.doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        User user = new User();
        UserDAO dao = new UserDAO();

        user.setUserId(request.getParameter("id"));
        user.setPassword(request.getParameter("password"));

        boolean result = false;
        try {
            result = dao.check(user,getServletContext());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        System.out.println(result);
        session.setAttribute("login", result); // セッションにログイン状態（true または false）を保存．
        if (result) {
            // ログインに成功している場合は member.jsp へ
            session.setAttribute("member", user);
            getServletContext().getRequestDispatcher("/WEB-INF/views/member.jsp").forward(request, response);
        } else {
            // ログインに失敗している場合は login.jsp へ
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}