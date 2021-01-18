package model;

import java.util.ArrayList;
import java.util.List;

public class FriendList {

    private List<Friend> list = new ArrayList<Friend>();

    public void addFriendForList(Friend friend){
        list.add(friend);
    }

    public List<Friend> getList() {
        return list;
    }

    public int size(){
        return list.size();
    }


}
