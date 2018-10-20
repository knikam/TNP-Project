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
import javax.servlet.http.HttpSession;

@WebServlet(name = "save_academic_details", urlPatterns = {"/save_academic_details"})
public class save_academic_details extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            HttpSession session=request.getSession(); 
            
            String ssc_bname=request.getParameter("ssc_bname");
            String ssc_year=request.getParameter("ssc_year");
            
            int ssc_marks=0;
            int ssc_outof=0;
            float ssc_per=0;
            if(!"".equals(request.getParameter("ssc_marks")))
                ssc_marks=Integer.parseInt(request.getParameter("ssc_marks"));
            if(!"".equals(request.getParameter("ssc_outof")))
                ssc_outof=Integer.parseInt(request.getParameter("ssc_outof"));
            if(!"".equals(request.getParameter("ssc_per")))
                ssc_per=Float.valueOf(request.getParameter("ssc_per"));
            
            String hsc_bname=request.getParameter("hsc_bname");
            String hsc_year=request.getParameter("hsc_year");
            int hsc_marks=0;
            int hsc_outof=0;
            float hsc_per=0;
            if(!"".equals(request.getParameter("hsc_marks")))
                hsc_marks=Integer.parseInt(request.getParameter("hsc_marks"));
            if(!"".equals(request.getParameter("hsc_outof")))
                hsc_outof=Integer.parseInt(request.getParameter("hsc_outof"));
            if(!"".equals(request.getParameter("hsc_per")))
                hsc_per=Float.valueOf(request.getParameter("hsc_per"));
            
            String d_bname=request.getParameter("d_bname");
            String d_year=request.getParameter("d_year");
            int d_marks=0;
            int d_outof=0;
            float d_per=0;
            if(!"".equals(request.getParameter("d_marks")))
                d_marks=Integer.parseInt(request.getParameter("d_marks"));
            if(!"".equals(request.getParameter("d_outof")))
                d_outof=Integer.parseInt(request.getParameter("d_outof"));
            if(!"".equals(request.getParameter("d_per")))
                d_per=Float.valueOf(request.getParameter("d_per"));
            
            String cap=request.getParameter("cap");
            String dholder=request.getParameter("dholder");
            int cet_score=0;
            int pcm_score=0;
            int gap=0;
            
            if(!"".equals(request.getParameter("cet_score")))
                cet_score=Integer.parseInt(request.getParameter("cet_score"));
            if(!"".equals(request.getParameter("pcm_score")))
                pcm_score=Integer.parseInt(request.getParameter("pcm_score"));
            
            String d_branch=request.getParameter("d_branch");
            String d_college=request.getParameter("d_college");
            
            if(!"".equals(request.getParameter("gap")))
                gap=Integer.parseInt(request.getParameter("gap"));
            
            String email=request.getParameter("email");
            
            String ebranch=request.getParameter("ebranch");
            String eyear=request.getParameter("eyear");
                        
            Connection con;
            PreparedStatement ps;
            String query="insert into academic_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try
            {
                con=DbConnector.getConnection();
                ps=con.prepareStatement(query);
                
                ps.setString(1, email);
                
                ps.setString(2, ssc_bname);
                ps.setString(3, ssc_year);
                ps.setInt(4, ssc_marks);
                ps.setInt(5, ssc_outof);
                ps.setFloat(6, ssc_per);
                
                ps.setString(7, hsc_bname);
                ps.setString(8, hsc_year);
                ps.setInt(9, hsc_marks);
                ps.setInt(10, hsc_outof);
                ps.setFloat(11, hsc_per);
                
                ps.setString(12, d_bname);
                ps.setString(13, d_year);
                ps.setInt(14, d_marks);
                ps.setInt(15, d_outof);
                ps.setFloat(16, d_per);
                
                ps.setString(17, cap);
                ps.setString(18, dholder);
                ps.setInt(19, cet_score);
                ps.setInt(20, pcm_score);
                ps.setString(21, d_branch);
                ps.setString(22, d_college);
                ps.setInt(23, gap);
                ps.setString(24, ebranch);
                ps.setString(25, eyear);
                
                ps.executeUpdate();
                
                ps=con.prepareStatement("insert into engineering_fe_details values(?,?,?,?,?,?,?)");
                ps.setString(1, email);
                ps.setString(2, "");
                ps.setString(3, "");
                ps.setString(4, "");
                ps.setString(5, "");
                ps.setString(6, "");
                ps.setString(7, "");
                ps.executeUpdate();
                
                ps=con.prepareStatement("insert into engineering_se_details values(?,?,?,?,?,?,?)");
                ps.setString(1, email);
                ps.setString(2, "");
                ps.setString(3, "");
                ps.setString(4, "");
                ps.setString(5, "");
                ps.setString(6, "");
                ps.setString(7, "");
                ps.executeUpdate();
                
                ps=con.prepareStatement("insert into engineering_te_details values(?,?,?,?,?,?,?)");
                ps.setString(1, email);
                ps.setString(2, "");
                ps.setString(3, "");
                ps.setString(4, "");
                ps.setString(5, "");
                ps.setString(6, "");
                ps.setString(7, "");
                ps.executeUpdate();
                
                ps=con.prepareStatement("insert into engineering_be_details values(?,?,?,?,?,?,?)");
                ps.setString(1, email);
                ps.setString(2, "");
                ps.setString(3, "");
                ps.setFloat(4, 0);
                ps.setFloat(5, 0);
                ps.setFloat(6, 0);
                ps.setString(7, "");
                ps.executeUpdate();
                
                ps=con.prepareStatement("update personal_details set status=1 where id='"+email+"'");
                ps.executeUpdate();
                
                session.setAttribute("email", email);
                
                response.sendRedirect("Student/student_homepage.jsp");
            }
            catch(SQLException e)
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
