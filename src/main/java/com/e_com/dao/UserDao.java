/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.e_com.dao;

import com.e_com.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            String query = "from User where user_email=:e and user_Password=:p";
            Session session = this.factory.openSession();

            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);

            user = (User) q.uniqueResult();

            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
