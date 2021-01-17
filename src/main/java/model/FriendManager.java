package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

public class FriendManager {
    public void addFriend(HttpServletRequest request, String file) {
        //TODO 自分で自分を追加できなくする
        boolean result = false;
        Friend friend = new Friend();
        FriendDAO friendDAO = new FriendDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("member");
        friend.setLibraryId(user.getLibraryId());
        friend.setFriendLibraryId(request.getParameter("uid"));
        System.out.println("friend.getLibraryId():" + friend.getLibraryId());
        System.out.println("friend.getFriendLibraryId():" + friend.getFriendLibraryId());

        try {
            result = friendDAO.addFriend(friend, file);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (result) {
            System.out.println("フレンド登録成功");
        }

    }

    public boolean exsistingCheck(HttpServletRequest request, String file) {
        boolean result = false;

        Friend friend = new Friend();
        FriendDAO friendDAO = new FriendDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("member");
        friend.setLibraryId(user.getLibraryId());
        friend.setFriendLibraryId(request.getParameter("uid"));

        try {
            result = friendDAO.checkExsistingFriend(friend, file);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return result;
    }


    //TODO deleteFriend

    public boolean checkMutualFriend() {
        boolean trueFriend = false;


        return trueFriend;
    }

    public FriendList loadFriends(HttpServletRequest request, String dbInfoPath) {
        FriendList friendList = null;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("member");

        FriendDAO dao = new FriendDAO();
        try {
            friendList = dao.loadFriends(user.getLibraryId(), dbInfoPath);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return friendList;

    }

    public void deleteFriend(HttpServletRequest request, String dbInfoPath) {
        String targetForDelete = request.getParameter("friendLibId");
        System.out.println("target:" + targetForDelete);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("member");

        FriendDAO dao = new FriendDAO();
        try {
            dao.deleteFriend(user, targetForDelete, dbInfoPath);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }


}
