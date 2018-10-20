<%-- 
    Document   : stud_info
    Created on : Jan 18, 2018, 8:56:58 PM
    Author     : asd
--%>

<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Info</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="../css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css"/>
        <!-- Compiled and minified JavaScript -->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/materialize.min.js"></script>
    </head>
    <body>
        <div id="personal_details">
                <div class="card horizontal">
                <div class="card-stacked">
                <div class="card-content">
            <%
                    Connection con;
                    ResultSet rs;
                    PreparedStatement ps;
                    try{
                        con=DbConnector.getConnection();
                        ps=con.prepareStatement("select * from personal_details where id='"+request.getParameter("id")+"'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                %>
                <div class="row">
                    <div class="col s12"><span style="font-size: 36px;"><%=rs.getString(2)%> <%=rs.getString(3)%> <%=rs.getString(4)%></span></div>
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Name of father/husband</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(5)%> <%=rs.getString(6)%> <%=rs.getString(7)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Date of Birth</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(8)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Address</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(9)%> <%=rs.getString(10)%>, <%=rs.getString(11)%> <%=rs.getString(12)%> <%=rs.getString(13)%> <%=rs.getString(14)%> <%=rs.getInt(15)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Mobile</span></div>
                    <div class="col s3"><span style="font-size: 16px;">Self :  <%=rs.getString(16)%></span></div>
                    <div class="col s3"><span style="font-size: 16px;">Parent :  <%=rs.getString(17)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Email</span></div>
                    <div class="col s3"><span style="font-size: 16px;"> <%=rs.getString(18)%></span></div>
                </div>
                <%
                        }
                        
                        ps=con.prepareStatement("select * from academic_details where id='"+request.getParameter("id")+"'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                            
                %>
                <hr>
                <!-- Academic_details -->
                <div class="row">
                    <div class="col s12"><span style="font-size: 24px;">Academic Details</span></div>
                    <br>
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Exam</span></div>
                    <div class="col s4"><span style="font-size: 16px; font-weight: bold;">Board</span></div>
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Year of passing</span></div>
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Marks obtained/Out of</span></div>
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Result</span></div>
                </div>          
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">SSC</span></div>
                    <div class="col s4"><span style="font-size: 16px;"><%=rs.getString(2)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(3)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(4)%>/<%=rs.getString(5)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(6)%>%</span></div>
                </div>  
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">HSC</span></div>
                    <div class="col s4"><span style="font-size: 16px;"><%=rs.getString(7)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(8)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(9)%>/<%=rs.getString(10)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(11)%>%</span></div>
                </div>  
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Diploma</span></div>
                    <div class="col s4"><span style="font-size: 16px;"><%=rs.getString(12)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(13)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(14)%>/<%=rs.getString(15)%></span></div>
                    <div class="col s2"><span style="font-size: 16px;"><%=rs.getString(16)%>%</span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Engineering Branch</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(24)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Engineering Year</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(25)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Admitted through CAP ?</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(17)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Diploma Holder ?</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(18)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">CET Score</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(19)%></span></div>
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">PCM Score</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(20)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Diploma Branch</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(21)%></span></div>
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Diploma College</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(22)%></span></div>
                </div>
                <div class="row">
                    <div class="col s2"><span style="font-size: 16px; font-weight: bold;">Any education gap?</span></div>
                    <div class="col s3"><span style="font-size: 16px;"><%=rs.getString(23)%></span></div>
                </div>
                </div>
                </div></div>
                    <div class="card horizontal">
                        <div class="card-stacked">
                            <div class="card-content">
                                <span style="font-size: 28px;">Engineering Details</span><br/>
                                <table>
                                    <thead style="border-bottom: none;">
                                        <th>Class</th>
                                        <th>Admitted in<br>(academic year)</th>
                                        <th>Passed on<br>(academic year)</th>
                                        <th>Total Marks</th><th></th>
                                        <th>Pointer</th>
                                        <th>Result</th>
                                    </thead>
                                    <thead>
                                        <td></td><td></td><td></td><td><b>Sem-I</b></td><td><b>Sem-II</b></td>
                                    </thead>
                                    <%
                                        ps=con.prepareStatement("select * from engineering_fe_details where id='"+request.getParameter("id")+"'");
                                        rs=ps.executeQuery();
                                        while(rs.next())
                                        {
                                    %>
                                    <tr>
                                        <td><b>FE</b></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td><%=rs.getString(7)%></td>
                                    </tr>
                                    <%
                                        }
                                        ps=con.prepareStatement("select * from engineering_se_details where id='"+request.getParameter("id")+"'");
                                        rs=ps.executeQuery();
                                        while(rs.next())
                                        {
                                    %>
                                    <tr>
                                        <td><b>SE</b></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td><%=rs.getString(7)%></td>
                                    </tr>
                                    <%
                                        }
                                        ps=con.prepareStatement("select * from engineering_te_details where id='"+request.getParameter("id")+"'");
                                        rs=ps.executeQuery();
                                        while(rs.next())
                                        {
                                    %>
                                    <tr>
                                        <td><b>TE</b></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td><%=rs.getString(7)%></td>
                                    </tr>
                                    <%
                                        }
                                        ps=con.prepareStatement("select * from engineering_be_details where id='"+request.getParameter("id")+"'");
                                        rs=ps.executeQuery();
                                        while(rs.next())
                                        {
                                    %>
                                    <tr>
                                        <td><b>BE</b></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td><%=rs.getString(7)%></td>
                                    </tr>
                                    <%
                                        }
                                            %>
                                </table>
                            </div>
                        </div>
                    </div>
                <%
                        }
                    }
                    catch(Exception e){out.print(e.toString());}
                %>                
            </div>
    </body>
</html>
