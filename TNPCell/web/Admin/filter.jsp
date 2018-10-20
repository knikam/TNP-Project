<%-- 
    Document   : filter
    Created on : Jan 18, 2018, 2:40:20 PM
    Author     : asd
--%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    String dept = request.getParameter("dept");
    String compare =  request.getParameter("compare");
    float ssc = Float.parseFloat(request.getParameter("ssc"));
    float hsc = Float.parseFloat(request.getParameter("hsc"));
    float dip = Float.parseFloat(request.getParameter("dip"));
    float be = Float.parseFloat(request.getParameter("be"));
    int back = Integer.parseInt(request.getParameter("back"));
    int gap = Integer.parseInt(request.getParameter("gap"));
    String year = request.getParameter("year");
%>                
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
        out.print("<div>"
            +"<table width=\"100%\" style=\"text-align: left;\" id='StudentList'>"
                +"<thead style=\"text-transform: uppercase;\">"
                    +"<th>Name</th>"
                    +"<th>Email</th>"
                    +"<th>SSC %</th>"
                    +"<th>HSC %</th>"
                    +"<th>Diploma %</th>"
                    +"<th>Current CGPA</th>"
                    +"<th>Result</th>"
                +"</thead>"
                +"<tbody>");
                    //out.print("select * from academic_details where s_per"+compare+"'"+ssc+"' AND h_per"+compare+"'"+hsc+"' AND d_per"+compare+"'"+dip+"' AND e_branch='"+dept+"' AND gap="+gap+" AND e_year='BE'");
                    Connection con;
                    ResultSet rs,rs1,rs2,rs3;
                    PreparedStatement ps,ps1,ps2,ps3;
                    try{
                        con=DbConnector.getConnection();
                        
                        /*** for HSC ***/
                        ps=con.prepareStatement("select * from academic_details where s_per"+compare+"'"+ssc+"' AND h_per"+compare+"'"+hsc+"' AND d_per=0 AND e_branch='"+dept+"' AND gap<="+gap+" AND e_year='BE'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                            ps3 = con.prepareStatement("select admitted_year from engineering_be_details where id='"+rs.getString("id")+"' AND admitted_year='"+year+"' AND cgpa>='"+be+"'");
                            rs3 = ps3.executeQuery();
                            if(rs3.next())
                            {
                                ps1 = con.prepareStatement("select * from personal_details where id='"+rs.getString("id")+"' order by s_last_name");
                                rs1 = ps1.executeQuery();
                                while(rs1.next())
                                {
                                        out.print("<tr>");
                                            out.print("<td style='font-weight: bold;'>"+rs1.getString("s_first_name")+" "+rs1.getString("s_middle_name")+" "+rs1.getString("s_last_name")+"</td>");
                                            
                                            out.print("<td style='font-weight: bold;'>"+rs1.getString("email")+"</td>");
                                            out.print("<td>"+rs.getString("s_per")+"</td>");
                                            out.print("<td>"+rs.getString("h_per")+"</td>");
                                            out.print("<td>"+rs.getString("d_per")+"</td>");                            
                                ps2 = con.prepareStatement("select * from engineering_be_details where id='"+rs.getString("id")+"'");
                                rs2 = ps2.executeQuery();
                                while(rs2.next())
                                {
                                            out.print("<td>"+rs2.getString("cgpa")+"</td>");
                                            out.print("<td>"+rs2.getString("result")+"</td>");
                                        out.print("</tr>");
                                }
                                }
                            }
                        }
                        
                        /*** for Diploma ***/
                        ps=con.prepareStatement("select * from academic_details where s_per"+compare+"'"+ssc+"' AND h_per=0 AND d_per"+compare+"'"+dip+"' AND e_branch='"+dept+"' AND gap<="+gap+" AND e_year='BE'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                            ps3 = con.prepareStatement("select admitted_year from engineering_be_details where id='"+rs.getString("id")+"' AND admitted_year='"+year+"' AND cgpa>='"+be+"'");
                            rs3 = ps3.executeQuery();
                            if(rs3.next())
                            {
                                ps1 = con.prepareStatement("select * from personal_details where id='"+rs.getString("id")+"' order by s_last_name");
                                rs1 = ps1.executeQuery();
                                while(rs1.next())
                                {
                                        out.print("<tr>");
                                            out.print("<td style='font-weight: bold;'>"+rs1.getString("s_first_name")+" "+rs1.getString("s_middle_name")+" "+rs1.getString("s_last_name")+"</td>");
                                            
                                            out.print("<td style='font-weight: bold;'>"+rs1.getString("email")+"</td>");
                                            out.print("<td>"+rs.getString("s_per")+"</td>");
                                            out.print("<td>"+rs.getString("h_per")+"</td>");
                                            out.print("<td>"+rs.getString("d_per")+"</td>");                            
                                ps2 = con.prepareStatement("select * from engineering_be_details where id='"+rs.getString("id")+"'");
                                rs2 = ps2.executeQuery();
                                while(rs2.next())
                                {
                                            out.print("<td>"+rs2.getString("cgpa")+"</td>");
                                            out.print("<td>"+rs2.getString("result")+"</td>");
                                        out.print("</tr>");
                                }
                                }
                            }
                        }
                    }
                    catch(Exception e){out.print(e.toString());}
                out.print("</tbody>"
            +"</table>"
            +"<button id=\"btnExport\" onclick=\"javascript:xport.toCSV('StudentList');\" "
                        + "style='font-size: 16px;"
                +"background: #009966;"
                +"border: none;"
                +"outline: none;"
                +"color: #fff;"
                +"padding: 3px;"
                +"padding-left: 10px;"
                +"padding-right: 10px;"
                //border-radius: 3px;
                +"box-shadow: 1px 1px 1px #000;'>Download Excel Sheet</button>"
        +"</div>");
                %>