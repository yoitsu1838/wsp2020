package model;

import java.util.ArrayList;
import java.util.List;

public class BookList {

    List<Book> list = new ArrayList<>();

    public void addBookForList(Book book){
        list.add(book);
    }

    public List<Book> getList() {
        return list;
    }

    public int size(){
        return list.size();
    }
}
