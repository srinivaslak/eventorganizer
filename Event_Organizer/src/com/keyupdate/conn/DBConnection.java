/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.keyupdate.conn;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author JavaTL
 */
public class DBConnection {
public static Connection  con=null;
public static Connection getDbConnection(){
try{
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","root");
if(con!=null){
    return con;
}
else{
    System.out.println("Error at");
}
}catch(Exception e){
    System.out.println("DB Error:"+e.getMessage());
}
    return null;
}
}
