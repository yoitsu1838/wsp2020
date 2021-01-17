package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

public class UserManager {

    public boolean login(HttpServletRequest request, String dbInfoPath) {
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
        if (result) {
            session.setAttribute("member", user);
        }

        return result;
    }

    public boolean register(HttpServletRequest request, String dbInfoPath) {
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

    public boolean cancellation(HttpServletRequest request, String dbInfoPath) {
        User user ;
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();

        user = (User) session.getAttribute("member");

        boolean result = false;
        try {
            result = dao.cancellation(user, dbInfoPath);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    public void getUserAddUrl(HttpServletRequest request) {
        String libId;
        HttpSession session = request.getSession();
        libId = ((User) session.getAttribute("member")).getLibraryId();
        String addUrl;
        System.out.println(request.getServerName());
        if (!(request.getServerName().equals("localhost"))) {
            addUrl = "https://wsp2020.yoitsu.dev" + request.getRequestURI() + "?method=fad&uid=" + libId;
        } else {
            addUrl = request.getRequestURL() + "?method=fad&uid=" + libId;
        }
        System.out.println(addUrl);

        session.setAttribute("userAddUrl", addUrl);

    }


}
