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

@WebServlet(name = "save_personal_details", urlPatterns = {"/save_personal_details"})
public class save_personal_details extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            HttpSession session=request.getSession(); 
            
            String s_first_name=request.getParameter("s_first_name");
            String s_middle_name=request.getParameter("s_middle_name");
            String s_last_name=request.getParameter("s_last_name");
            
            String f_first_name=request.getParameter("f_first_name");
            String f_middle_name=request.getParameter("f_middle_name");
            String f_last_name=request.getParameter("f_last_name");
            
            String dob=request.getParameter("dob");
            
            String line1=request.getParameter("line1");
            String line2=request.getParameter("line2");
            String city=request.getParameter("city");
            String taluka=request.getParameter("taluka");
            String district=request.getParameter("district");
            String state=request.getParameter("state");
            int pin=Integer.parseInt(request.getParameter("pin"));
            
            String smobile=request.getParameter("s_mobile");
            String pmobile=request.getParameter("p_mobile");
            
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            
            Connection con;
            ResultSet rs;
            PreparedStatement ps;
            String query="insert into personal_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            String select="select id from personal_details where id='"+email+"'";
            try
            {
                con=DbConnector.getConnection();
                
                ps=con.prepareStatement(select);
                rs=ps.executeQuery();
                if(rs.next())
                {
                    out.print("<script>alert(\"This email is allready registered\");window.location='Student/student_signup.html';</script>");
                }
                else
                {
                    ps=con.prepareStatement(query);
                
                    ps.setString(1, email);
                    ps.setString(2, s_first_name);
                    ps.setString(3, s_middle_name);
                    ps.setString(4, s_last_name);
                    ps.setString(5, f_first_name);
                    ps.setString(6, f_middle_name);
                    ps.setString(7, f_last_name);
                    ps.setString(8, dob);
                    ps.setString(9, line1);
                    ps.setString(10, line2);
                    ps.setString(11, city);
                    ps.setString(12, taluka);
                    ps.setString(13, district);
                    ps.setString(14, state);
                    ps.setInt(15, pin);
                    ps.setString(16, smobile);
                    ps.setString(17, pmobile);
                    ps.setString(18, email);
                    ps.setInt(19, 0);
                    ps.setString(20, password);
                
                    ps.executeUpdate();
                    
                    ps=con.prepareStatement("insert into users values(?,?,?)");
                
                    ps.setString(1, email);
                    ps.setString(2, password);
                    ps.setString(3, "Student");
                
                    ps.executeUpdate();
                
                    session.setAttribute("email", email);
                    response.sendRedirect("Student/academic_details.jsp");
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
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
