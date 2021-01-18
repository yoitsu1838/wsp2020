package servlet;

import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

        if (!(request.getParameter("method") == null) && request.getParameter("method").equals("fad")) {
            System.out.println("fad");
            FriendManager fm = new FriendManager();
            if (!fm.exsistingCheck(request, dbInfoPath)) {
                //重複がない時
                fm.addFriend(request, dbInfoPath);
                request.setAttribute("message", "友人追加しました。");
            } else {
                //重複がある時
                request.setAttribute("errMsg", "この図書館は、すでに友人に追加済みです。");

            }
            /* toppage 友人データ取得*/
            UserManager um = new UserManager();
            FriendList friendList = fm.loadFriends(request, dbInfoPath);
            List<Friend> list;
            List<String> friendLibNames = new ArrayList<String>();
            List<String> friendLibIds = new ArrayList<String>();
            list = friendList.getList();
            for (Friend friend : list) {
                String libId = friend.getFriendLibraryId();
                String libName = um.getLibraryName(libId, dbInfoPath);
                friendLibNames.add(libName);
                friendLibIds.add(libId);
            }

            request.setAttribute("friendNameList", friendLibNames);
            request.setAttribute("friendlist", friendLibIds);
            /* // */

            //AddBookへもどる　
            String disp = "/";
            RequestDispatcher dispatch = request.getRequestDispatcher(disp);
            dispatch.forward(request, response);

        } else {

            UserManager um = new UserManager();
            um.getUserAddUrl(request);

            getServletContext().getRequestDispatcher("/WEB-INF/views/addFriend.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


        getServletContext().getRequestDispatcher("/WEB-INF/views/addFriend.jsp").forward(request, response);

    }
}