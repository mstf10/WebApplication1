/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaPackage;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mergu
 */
public class DbConnect {

    Connection connection;

    public DbConnect() {

        try {
            connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/bash?user=root&password=1234");
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
