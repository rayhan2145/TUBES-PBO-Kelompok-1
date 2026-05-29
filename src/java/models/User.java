package models;

import java.sql.ResultSet;

public class User extends dbConnect<User> {

    private String idUser;
    private String username;
    private String password;
    private String role;

    public User() {
        this.table = "users";
        this.primaryKey = "idUser";
    }

    public User(String idUser, String username, String password) {
        this.table = "users";
        this.primaryKey = "idUser";
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.role = "staff";
    }

    @Override
    User toModel(ResultSet rs) {
        try {
            User u = new User();
            u.idUser = rs.getString("idUser");
            u.username = rs.getString("username");
            u.password = rs.getString("password");
            u.role = rs.getString("role");
            return u;
        } catch (Exception e) {
            return null;
        }
    }

    public void registrasi() {
        this.role = "staff";
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
    
    public String getMessage(){
        return super.getMessage();
    }
}