package com.action;

import com.util.DbConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "loginValidation", urlPatterns = {"/loginValidation"})
public class loginValidation extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
             
            HttpSession session=request.getSession(); 
            
            String id=request.getParameter("id");
            String pass=request.getParameter("password");
            String credential;
            String student="Student";
            
            Connection con;
            ResultSet rs;
            PreparedStatement ps;
            String select="select * from users where id='"+id+"' AND password='"+pass+"'";
            try
            {
                con=DbConnector.getConnection();
                
                ps=con.prepareStatement(select);
                rs=ps.executeQuery();
                if(rs.next())
                {
                    credential=rs.getString("credential");
                    if(credential.equals(student))
                    {
                        ps=con.prepareStatement("select status from personal_details where id='"+id+"'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                            if(rs.getInt("status") == 0)
                            {
                                response.sendRedirect("Student/academic_details.jsp"); 
                                session.setAttribute("email",id);  
                            }
                            else 
                            {
                                response.sendRedirect("Student/student_homepage.jsp");
                                session.setAttribute("email",id);  
                            }
                        }
                    }
                    else
                    {
                        response.sendRedirect("Admin/admin_homepage.jsp");
                    }
                }
                else
                {
                    out.print("<script>alert('Invalid ID or Password !');window.location='index.html';</script>");
                }
            }
            catch(Exception e)
            {
                System.err.println(e.toString());
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
