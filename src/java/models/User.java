package models;

import java.sql.ResultSet;

public class User extends dbConnect<User> {

    protected String idUser;
    protected String username;
    protected String password;

    public User() {
        this.table = "user";
        this.primaryKey = "idUser";
    }

    public User(String idUser, String username, String password) {
        this.table = "user";
        this.primaryKey = "idUser";
        this.idUser = idUser;
        this.username = username;
        this.password = password;
    }

    @Override
    User toModel(ResultSet rs) {
        try {
            User u = new User();
            u.idUser = rs.getString("idUser");
            u.username = rs.getString("username");
            u.password = rs.getString("password");
            return u;
        } catch (Exception e) {
            return null;
        }
    }

    public void registrasi() {
        insert();
    }

    public void editUser() {
        update();
    }

    public User login(String username, String password) {
        where("username = '" + username + "' AND password = '" + password + "'");
        if (get().size() > 0) {
            return get().get(0);
        }
        return null;
    }

    public void logout() {
    }

    public String getIdUser() {
        return idUser;
    }

    public String getUsername() {
        return username;
    }
}