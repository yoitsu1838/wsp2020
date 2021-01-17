package servlet;

import model.Friend;
import model.FriendList;
import model.FriendManager;
import model.UserManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({""})
public class Toppage extends HttpServlet {

    public Toppage() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");
        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }

        FriendManager fm = new FriendManager();
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

        getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        boolean result = false;
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);

    }
}