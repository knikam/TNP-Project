<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%
    String email=(String)session.getAttribute("email");
    if(request.getSession() == null || email.equals(""))
        response.sendRedirect("../index.html");
                    Connection con;
                    ResultSet rs;
                    PreparedStatement ps;
%>
<html>
    <head>
        <title>RCPIT : Student Homepage</title>        
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="../css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css"/>
        <!-- Compiled and minified JavaScript -->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/materialize.min.js"></script>
      
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container" style="text-align: left;">
            <span><b>R. C. Patel Institute of Technology, Shirpur</b></span><br/>
            <%
                    try{
                        con=DbConnector.getConnection();
                        
                        ps=con.prepareStatement("select s_first_name,s_last_name from personal_details where id='"+email+"'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
            %>
                <div class="chip" style="background: #009966; color: #fff;">
                    <img src="../images/user.png" alt="Contact Person">
                    <%=rs.getString(1)%> <%=rs.getString(2)%>
                </div>
            <%}}catch(Exception e){}%>
            <nav class="nav-extended">
                <div class="nav-content">
                    <ul class="tabs tabs-transparent">
                        <li class="tab"><a  class="active" href="#home">Home</a></li>
                        <li class="tab"><a href="#personal_details">Profile</a></li>
                        <li class="tab right"><a onclick="window.location='../Logout/logoutValidation.jsp';">Logout</a></li>
                    </ul>
                </div>
            </nav>
            <div id="home">
                    <div class="col s12" style="font-size: 24px; margin-bottom: 15px; margin-top: 15px;">
                        Placement Records !
                    </div>
                <div class="card horizontal">
                <div class="card-stacked">
                <div class="card-content">
                <div class="row" style="font-size: 14px;">
                    <div class="col s3" style="font-weight: bold;">
                        Name of Company
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        COMP
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        IT
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        MECH
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        CIVIL
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        ELEC
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        E&TC
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        Total Selected
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        Package PA
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        Date
                    </div>
                </div>
                <hr style="border: 1px solid #009966;">
                <%
                    
                    int comp=0,it=0,mech=0,civil=0,elec=0,etc=0,total=0,flag=0;
                    try{
                        con=DbConnector.getConnection();
                        
                        ps=con.prepareStatement("select * from placement_records where status='new'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
    %>
                <div class="row" style="font-size: 14px;">
                    <div class="col s3">
                        <%=rs.getString(1)%>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(2)%>
                        <% comp=comp+rs.getInt(2); %>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(3)%>
                        <% it=it+rs.getInt(3); %>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(4)%>
                        <% mech=mech+rs.getInt(4); %>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(5)%>
                        <% civil=civil+rs.getInt(5);%>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(6)%>
                        <% elec=elec+rs.getInt(6);%>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(7)%>
                        <% etc=etc+rs.getInt(7);%>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(8)%>
                        <% total=total+rs.getInt(8);%>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(9)%>
                    </div>
                    <div class="col s1">
                        <%=rs.getString(10)%>
                    </div>
                </div>
                <%
                        flag=1;
                 }
                 if(flag==1)
                 {
                %>
                <hr style="border: 1px solid rgba(0,0,0,0.2);">
                <div class="row" style="font-size: 14px;">
                    <div class="col s3" style="font-weight: bold;">
                        Total
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        <%=comp%>
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        <%=it%>
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        <%=mech%>
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        <%=civil%>
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        <%=elec%>
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        <%=etc%>
                    </div>
                    <div class="col s1" style="font-weight: bold;">
                        <%=total%>
                    </div>
                </div>
                    <%}
                    
                    else
                 {%>
                 <span style="font-size: 14px;">No records found !</span>
                 <%}%>
            </div></div></div>
                <div class="row">
                    <br/>
                    <div class="col s12" style="font-size: 24px; margin-bottom: 15px;">
                        Recently Updated News !
                    </div>
                <div class="col s12">
                    <%
                        flag=0;
                        ps=con.prepareStatement("select * from recent_news");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                    %>
                    <div class="card horizontal">
                        <div class="card-stacked">
                            <div class="card-content">
                                <p style="font-size: 24px;"><%=rs.getString(2)%></p>
                                <p style="font-size: 14px; text-align: justify;"><%=rs.getString(3)%></p>
                            </div>
                        <div class="card-action">
                            <a href="<%=rs.getString(4)%>" style="font-size: 12px; text-transform: none; color: blue;" target="_blank"><i class="material-icons" style="padding-top: 0px;">open_in_new</i></a>
                        </div>
                        </div>
                    </div>
                    <%
                            flag=1;
                        }
                        if(flag == 0)
                        {
                        %>
                            <div class="grey-text" style="font-size: 14px; margin-bottom: 15px; margin-top: 15px;">
                                no recent news found ...
                            </div>
                        <%
                        }
                    %>
                </div>
                </div>
            </div>
            <div id="personal_details">
                <div class="card horizontal">
                <div class="card-stacked">
                <div class="card-content">
                <%
                        ps=con.prepareStatement("select * from personal_details where id='"+email+"'");
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
                        
                        ps=con.prepareStatement("select * from academic_details where id='"+email+"'");
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
                                        ps=con.prepareStatement("select * from engineering_fe_details where id='"+email+"'");
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
                                        ps=con.prepareStatement("select * from engineering_se_details where id='"+email+"'");
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
                                        ps=con.prepareStatement("select * from engineering_te_details where id='"+email+"'");
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
                                        ps=con.prepareStatement("select * from engineering_be_details where id='"+email+"'");
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
                <center><input type="submit" value="Edit Profile" onclick="window.location='student_profile_update.jsp';" id="sub-btn" style="margin-bottom: 15px;"/></center>
                
            </div>
        </div>
    </body>
</html>

<script>
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 50
  });
  $(document).ready(function(){
      $('.carousel').carousel();
    });
</script>