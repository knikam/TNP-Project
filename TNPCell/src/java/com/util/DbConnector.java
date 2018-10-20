package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnector 
{
    public static Connection getConnection()
    {
        Connection con=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_tnp_database?zeroDateTimeBehavior=convertToNull","root","root");
            System.out.println("Successfully Connected !");
        }
        catch(Exception e)
        {
            System.err.println(e.toString());
        }
        return con;
    }
    public static void main(String[] args) {
        DbConnector.getConnection();
    }
}
