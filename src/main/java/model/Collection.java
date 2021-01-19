package model;

public class Collection {
    private String libraryId;
    private String bookId;
    private Boolean isLending;
    private String lendingReceptionDate;
    private String lendingApprovalDate;
    private String fromUser;

    public String getLibraryId() {
        return libraryId;
    }

    public void setLibraryId(String libraryId) {
        this.libraryId = libraryId;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public boolean getIsLending() {
        return isLending;
    }

    public void setIsLending(Boolean isLending) {
        this.isLending = isLending;
    }

    public String getLendingReceptionDate() {
        return lendingReceptionDate;
    }

    public void setLendingReceptionDate(String lendingReceptionDate) {
        this.lendingReceptionDate = lendingReceptionDate;
    }

    public String getLendingApprovalDate() {
        return lendingApprovalDate;
    }

    public void setLendingApprovalDate(String lendingApprovalDate) {
        this.lendingApprovalDate = lendingApprovalDate;
    }

    public String getFromUser() {
        return fromUser;
    }

    public void setFromUser(String fromUser) {
        this.fromUser = fromUser;
    }
}
