package com.action;

import com.util.DbConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "add_placement_record", urlPatterns = {"/add_placement_record"})
public class add_placement_record extends HttpServlet {
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String c_name=request.getParameter("c_name");
            String comp=request.getParameter("comp");
            String it=request.getParameter("it");
            String mech=request.getParameter("mech");
            String civil=request.getParameter("civil");
            String elect=request.getParameter("elect");
            String etc=request.getParameter("etc");
            String pa=request.getParameter("pa");
            String date=request.getParameter("date");
            String year=request.getParameter("year");
            
            int total=0;
            int a=0,b=0,c=0,d=0,e=0,f=0;
            a=Integer.parseInt(comp);
            b=Integer.parseInt(it);
            c=Integer.parseInt(mech);
            d=Integer.parseInt(civil);
            e=Integer.parseInt(elect);
            f=Integer.parseInt(etc);
            total=a+b+c+d+e+f;
            
            Connection con;
            PreparedStatement ps;
            try
            {
                con=DbConnector.getConnection();
                ps=con.prepareStatement("insert into placement_records values(?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, c_name);
                ps.setInt(2, Integer.parseInt(comp));
                ps.setInt(3, Integer.parseInt(it));
                ps.setInt(4, Integer.parseInt(mech));
                ps.setInt(5, Integer.parseInt(civil));
                ps.setInt(6, Integer.parseInt(elect));
                ps.setInt(7, Integer.parseInt(etc));
                ps.setInt(8, total);
                ps.setString(9, pa);
                ps.setString(10, date);
                ps.setString(11, "new");
                ps.setString(12, year);
                ps.executeUpdate();
                
                response.sendRedirect("Admin/admin_homepage.jsp#placement-record");
            }
            catch(SQLException | NumberFormatException | IOException exc)
            {
                out.print(exc.toString());
            }
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
