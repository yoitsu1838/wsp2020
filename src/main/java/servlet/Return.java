package servlet;

import model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Return extends HttpServlet {

    public Return() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        //一覧表示の本を取得
        CollectionManager cm = new CollectionManager(dbInfoPath);
        User user = (User) session.getAttribute("member");
        CollectionList cList = cm.getCollections(user.getLibraryId());
        //collectionListからBookInfoを取得
        BookManager bm = new BookManager(dbInfoPath);
        BookList bList = new BookList();
        for (int i = 0; i < cList.size(); i++) {
            Book book = bm.getBookInfoFromDb(cList.getList().get(i).getBookId());
            bList.addBookForList(book);
        }

        //set
        request.setAttribute("collectionlist", cList);
        request.setAttribute("booklist", bList);

        getServletContext().getRequestDispatcher("/WEB-INF/views/return.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String dbInfoPath = getServletContext().getRealPath("WEB-INF/config.properties");

        HttpSession session = request.getSession();
        if ((session.getAttribute("member")) == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }

        String bookId = request.getParameter("bookId");
        String appluingLibraryId = ((User) session.getAttribute("member")).getLibraryId();

        CollectionManager cm = new CollectionManager(dbInfoPath);
        cm.returnBookReflect(appluingLibraryId, bookId);


        this.doGet(request, response);
    }
}