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
@WebServlet(name = "update_student_details", urlPatterns = {"/update_student_details"})
public class update_student_details extends HttpServlet {
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
            //String password=request.getParameter("password");
            
            Connection con;
            ResultSet rs;
            PreparedStatement ps;
            String query="update personal_details set s_first_name=?,s_middle_name=?,s_last_name=?,f_first_name=?,f_middle_name=?,f_last_name=?,"
                    + "dob=?,line1=?,line2=?,city=?,taluka=?,district=?,state=?,pin=?,s_mobile=?,p_mobile=?,email=? where id='"+(String)session.getAttribute("email")+"'";
            
            /*** academic details ***/
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
                        
            String ebranch=request.getParameter("ebranch");
            String eyear=request.getParameter("eyear");
            
            /*** Engineering Details ***/
            //FE
            String fe_a_year=request.getParameter("fe_admitted_year");
            String fe_p_year=request.getParameter("fe_passed_year");
            String fe_sem_i=request.getParameter("fe_sem_i_sgpa");
            String fe_sem_ii=request.getParameter("fe_sem_ii_sgpa");
            String fe_cgpa=request.getParameter("fe_cgpa");
            String fe_result=request.getParameter("fe_result");
            
            //SE
            String se_a_year=request.getParameter("se_admitted_year");
            String se_p_year=request.getParameter("se_passed_year");
            String se_sem_i=request.getParameter("se_sem_i_sgpa");
            String se_sem_ii=request.getParameter("se_sem_ii_sgpa");
            String se_cgpa=request.getParameter("se_cgpa");
            String se_result=request.getParameter("se_result");
            
            //TE
            String te_a_year=request.getParameter("te_admitted_year");
            String te_p_year=request.getParameter("te_passed_year");
            String te_sem_i=request.getParameter("te_sem_i_sgpa");
            String te_sem_ii=request.getParameter("te_sem_ii_sgpa");
            String te_cgpa=request.getParameter("te_cgpa");
            String te_result=request.getParameter("te_result");
            
            //BE
            String be_a_year=request.getParameter("be_admitted_year");
            String be_p_year=request.getParameter("be_passed_year");
            String be_sem_i=request.getParameter("be_sem_i_sgpa");
            String be_sem_ii=request.getParameter("be_sem_ii_sgpa");
            String be_cgpa=request.getParameter("be_cgpa");
            String be_result=request.getParameter("be_result");
            
            String query1="update academic_details set s_bname=?,s_year=?,s_marks=?,s_outof=?,s_per=?,h_bname=?,h_year=?,h_marks=?,"
                    + "h_outof=?,h_per=?,d_bname=?,d_year=?,d_marks=?,d_outof=?,d_per=?,cap=?,d_holder=?,CET=?,pcm=?,d_branch=?,"
                    + "d_college=?,gap=?,e_branch=?,e_year=? where id='"+email+"'";
            
            String feSql="update engineering_fe_details set admitted_year=?,passed_year=?,sem1=?,sem2=?,cgpa=?,result=? where id='"+email+"'";
            String seSql="update engineering_se_details set admitted_year=?,passed_year=?,sem1=?,sem2=?,cgpa=?,result=? where id='"+email+"'";
            String teSql="update engineering_te_details set admitted_year=?,passed_year=?,sem1=?,sem2=?,cgpa=?,result=? where id='"+email+"'";
            String beSql="update engineering_be_details set admitted_year=?,passed_year=?,sem1=?,sem2=?,cgpa=?,result=? where id='"+email+"'";
            try
            {
                    con=DbConnector.getConnection();
                
                    ps=con.prepareStatement(query);
                
                    ps.setString(1, s_first_name);
                    ps.setString(2, s_middle_name);
                    ps.setString(3, s_last_name);
                    ps.setString(4, f_first_name);
                    ps.setString(5, f_middle_name);
                    ps.setString(6, f_last_name);
                    ps.setString(7, dob);
                    ps.setString(8, line1);
                    ps.setString(9, line2);
                    ps.setString(10, city);
                    ps.setString(11, taluka);
                    ps.setString(12, district);
                    ps.setString(13, state);
                    ps.setInt(14, pin);
                    ps.setString(15, smobile);
                    ps.setString(16, pmobile);
                    ps.setString(17, email);
                
                    ps.executeUpdate();
                    
                    ps=con.prepareStatement(query1);
                
                ps.setString(1, ssc_bname);
                ps.setString(2, ssc_year);
                ps.setInt(3, ssc_marks);
                ps.setInt(4, ssc_outof);
                ps.setFloat(5, ssc_per);
                
                ps.setString(6, hsc_bname);
                ps.setString(7, hsc_year);
                ps.setInt(8, hsc_marks);
                ps.setInt(9, hsc_outof);
                ps.setFloat(10, hsc_per);
                
                ps.setString(11, d_bname);
                ps.setString(12, d_year);
                ps.setInt(13, d_marks);
                ps.setInt(14, d_outof);
                ps.setFloat(15, d_per);
                
                ps.setString(16, cap);
                ps.setString(17, dholder);
                ps.setInt(18, cet_score);
                ps.setInt(19, pcm_score);
                ps.setString(20, d_branch);
                ps.setString(21, d_college);
                ps.setInt(22, gap);
                ps.setString(23, ebranch);
                ps.setString(24, eyear);
                
                ps.executeUpdate();
                
                //FE
                ps=con.prepareStatement(feSql);
                ps.setString(1, fe_a_year);
                ps.setString(2, fe_p_year);
                ps.setString(3, fe_sem_i);
                ps.setString(4, fe_sem_ii);
                ps.setString(5, fe_cgpa);
                ps.setString(6, fe_result);
                ps.executeUpdate();
                
                //SE
                ps=con.prepareStatement(seSql);
                ps.setString(1, se_a_year);
                ps.setString(2, se_p_year);
                ps.setString(3, se_sem_i);
                ps.setString(4, se_sem_ii);
                ps.setString(5, se_cgpa);
                ps.setString(6, se_result);
                ps.executeUpdate();
                
                //TE
                ps=con.prepareStatement(teSql);
                ps.setString(1, te_a_year);
                ps.setString(2, te_p_year);
                ps.setString(3, te_sem_i);
                ps.setString(4, te_sem_ii);
                ps.setString(5, te_cgpa);
                ps.setString(6, te_result);
                ps.executeUpdate();
                
                //BE
                ps=con.prepareStatement(beSql);
                ps.setString(1, be_a_year);
                ps.setString(2, be_p_year);
                ps.setFloat(3, Float.parseFloat(be_sem_i));
                ps.setFloat(4, Float.parseFloat(be_sem_ii));
                ps.setFloat(5, Float.parseFloat(be_cgpa));
                ps.setString(6, be_result);
                ps.executeUpdate();
                
                response.sendRedirect("Student/student_homepage.jsp");
            }
            catch(Exception e)
            {
                out.print(e.toString());
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
