package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

public class UserManager {

    public static boolean login(HttpServletRequest request, String dbInfoPath) {
        User user = new User();
        UserDAO dao = new UserDAO();

        user.setUserId(request.getParameter("id"));
        user.setPassword(request.getParameter("password"));

        boolean result = false;
        try {
            result = dao.check(user, dbInfoPath);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        System.out.println(result);
        session.setAttribute("login", result); // セッションにログイン状態（true または false）を保存．
        if (result){
            session.setAttribute("member", user);
        }

        return result;
    }

    public static boolean register(HttpServletRequest request, String dbInfoPath) {
        User user = new User();
        UserDAO dao = new UserDAO();

        user.setUserId(request.getParameter("userId"));
        user.setLibraryName(request.getParameter("libName"));
        user.setPassword(request.getParameter("password"));

        boolean result = false;
        try {
            result = dao.register(user, dbInfoPath);

        } catch (SQLException e) {
            e.printStackTrace();
        }

       return result;
    }



}
