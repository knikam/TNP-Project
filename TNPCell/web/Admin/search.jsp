<%-- 
    Document   : search
    Created on : Jan 18, 2018, 8:01:32 PM
    Author     : asd
--%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    String name = request.getParameter("query");
%>                
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
    if(!name.equals(""))
    {
        out.print("<div>"
            +"<table width=\"100%\" style=\"text-align: left;\">"
                +"<thead style=\"text-transform: uppercase;\">"
                    +"<th>Name</th>"
                    +"<th>Department</th>"
                    +"<th>Email</th>"
                    +"<th>Mobile</th>"
                    +"<th>View Details</th>"
                +"</thead>"
                +"<tbody>");
                    //out.print("select * from academic_details where s_per"+compare+"'"+ssc+"' AND h_per"+compare+"'"+hsc+"' AND d_per"+compare+"'"+dip+"' AND e_branch='"+dept+"' AND gap="+gap+" AND e_year='BE'");
                    Connection con;
                    ResultSet rs,rs1,rs2,rs3;
                    PreparedStatement ps,ps1,ps2,ps3;
                    try{
                        con=DbConnector.getConnection();
                                ps1 = con.prepareStatement("select * from personal_details where s_first_name LIKE '%"+name+"' OR s_first_name LIKE '"+name+"%' OR s_first_name LIKE '%"+name+"%'"
                                        + " OR s_middle_name LIKE '%"+name+"' OR s_middle_name LIKE '"+name+"%' OR s_middle_name LIKE '%"+name+"%'"
                                        + " OR s_last_name LIKE '%"+name+"' OR s_last_name LIKE '"+name+"%' OR s_last_name LIKE '%"+name+"%'");
                                rs1 = ps1.executeQuery();
                                while(rs1.next())
                                {
                                        out.print("<tr>");
                                            out.print("<td>"+rs1.getString("s_first_name")+" "+rs1.getString("s_middle_name")+" "+rs1.getString("s_last_name")+"</td>");
                                            
                                        ps=con.prepareStatement("select e_branch from academic_details where id='"+rs1.getString("id")+"'");
                                        rs=ps.executeQuery();
                                        while(rs.next())
                                        {
                                            out.print("<td>"+rs.getString("e_branch")+"</td>");
                                        }
                                            out.print("<td>"+rs1.getString("email")+"</td>");
                                            out.print("<td>"+rs1.getString("s_mobile")+"</td>"); 
                                            out.print("<td><a href='stud_info.jsp?id="+rs1.getString("id")+"' target='_blank'>Click Here</a></td>"); 
                                }   
                    }
                    catch(Exception e){out.print(e.toString());}
                out.print("</tbody>"
            +"</table>"
        +"</div>");
    }
    else{
        out.print("<span style='color: red; font-size: 14px;'>Please enter any keyword?</a>");
    }
                %>