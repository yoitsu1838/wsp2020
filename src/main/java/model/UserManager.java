package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
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
        User user;
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

    public String getLibraryName(String libId, String dbInfoPath) {
        String libName = null;

        UserDAO dao = new UserDAO();
        try {
            libName = dao.getLibraryName(libId, dbInfoPath);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        System.out.println("um:"+libName);
        return libName;
    }



    public static void printError(HttpServletResponse response, Exception e) {
        try {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>DB ERROR</title></head><body>");
            out.println(e.getMessage() + "<br>");
            out.println("</body></html>");
            out.close();
        } catch (Exception er) {
            er.printStackTrace();
        }
    }


}
