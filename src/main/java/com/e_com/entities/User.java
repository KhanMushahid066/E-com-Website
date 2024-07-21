package com.e_com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "user_Id")
    private int userId;

    @Column(length = 100, name = "user_Name")
    private String userName;

    @Column(length = 100, name = "user_email", unique = true)
    private String userEmail;
    
     @Column(length = 100, name = "user_Password")
    private String userPassword;

    //if we don't use @column annotation which map our fields with database table column 
    //then the field we use set automatically column name in the database table 
    //or we can also say that by defult value of our table column is our entity class fields name 
   @Column(length = 1500)
    private String userPhone;
   
   @Column(length = 100, name = "user_Pic")
    private String userPic;

    //with the help of @column name we can set length or specific column name in the database taable
    @Column(length = 1500, name = "user_Address")
    private String userAddress;
    
    @Column(name="user_type")
    private String usertype;
    public User() {
    }

    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress,String usertype) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.usertype = usertype;
    }

    public User(String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress,String usertype) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.usertype = usertype;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }

    
    

}
