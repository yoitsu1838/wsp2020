package model;

import java.io.Serializable;

public class User implements Serializable {
    private String libraryId;
    private String userId;
    private String password;
    private String libraryName;

    public User() {
        libraryId = "";
        userId = "";
        password = "";
        libraryName ="";
    }

    public String getLibraryId() {
        return libraryId;
    }

    public void setLibraryId(String libraryId) {
        this.libraryId = libraryId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLibraryName() {
        return libraryName;
    }

    public void setLibraryName(String libraryName) {
        this.libraryName = libraryName;
    }
}