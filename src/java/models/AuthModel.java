package models;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author zidane mardico1178
 */
import java.sql.ResultSet;

/**
 *
 * @author fadhlan
 */
public class AuthModel extends dbConnect<Object>{
    
    private String id;
    private String username;
    private String password;

    public AuthModel() {
    }

    public AuthModel(String id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }
    
    
    
    

    @Override
    Object toModel(ResultSet rs) {
        try {
            return new AuthModel(
                    rs.getString("id"),
                    rs.getString("username"),
                    rs.getString("password")
            );
        } catch (Exception e) {
            setMessage(e.getMessage());
        }
        return null;}

    
}