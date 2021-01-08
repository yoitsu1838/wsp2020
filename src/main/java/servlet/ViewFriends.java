package servlet;

import model.UserManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ViewFriends extends HttpServlet {

    public ViewFriends() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        getServletContext().getRequestDispatcher("/WEB-INF/views/friends.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        boolean result = false;
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        UserManager um = new UserManager();
        result = um.register(request, dbInfoPath);

        System.out.println("Register.java:" + result);
        if (result) {
            // 登録成功
            request.setAttribute("message", "登録が完了しました。ログインしてください。");
            getServletContext().getRequestDispatcher("/WEB-INF/views/friends.jsp").forward(request, response);
        } else {
            // 登録失敗
            request.setAttribute("errMsg", "登録できませんでした。すでに使用されているIDである可能性があります。");
            getServletContext().getRequestDispatcher("/WEB-INF/views/friends.jsp").forward(request, response);
        }
    }
}