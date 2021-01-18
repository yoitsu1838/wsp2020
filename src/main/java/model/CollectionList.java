package model;

import java.util.ArrayList;
import java.util.List;

public class CollectionList {
    private List<Collection> list = new ArrayList<>();

    public void addCollectionForList(Collection collection) {
        list.add(collection);
    }

    public List<Collection> getList() {
        return list;
    }

    public int size() {
        return list.size();
    }
}
