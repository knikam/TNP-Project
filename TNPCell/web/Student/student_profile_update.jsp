<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    String email=(String)session.getAttribute("email");
    if(request.getSession() == null || email.equals(""))
        response.sendRedirect("../index.html");
%>
<html>
    <head>
        <title>RCPIT : Personal Details</title>        
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
            <nav class="nav-extended">
                <div class="nav-content">
                    <ul class="tabs tabs-transparent">
                        <li class="tab"><a class="active" href="#details">Update Profile</a></li>
                        <li class="tab right"><a onclick="window.location='student_homepage.jsp';">Go Back</a></li>
                    </ul>
                </div>
            </nav>
            <div id="personal_details">
                <div class="form-panel" style="text-align: left;">
                <form method="POST" action="../update_student_details">
                    <span style="font-size: 28px;">Personal Details</span><br/>
                    <table>
                    <%
                    Connection con;
                    ResultSet rs=null;
                    PreparedStatement ps;
                    try{
                        con=DbConnector.getConnection();
                        ps=con.prepareStatement("select * from personal_details where id='"+email+"'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                            %>
                        <tr>
                            <td><span style="font-size: 18px;">Name of Student &nbsp;&nbsp;&nbsp;</span></td><td><input type="text" class="validate" placeholder="First Name" value="<%=rs.getString(2)%>" id="input-text" name="s_first_name" required></td>
                            <td><input type="text" class="validate" placeholder="Middle Name" id="input-text" name="s_middle_name" value="<%=rs.getString(3)%>" required></td>
                            <td><input type="text" class="validate" placeholder="last Name" id="input-text" name="s_last_name" value="<%=rs.getString(4)%>" required><br/></td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 18px;">Name of<br>Father/Husband &nbsp;&nbsp;&nbsp;</span></td><td><input type="text" class="validate" placeholder="First Name" value="<%=rs.getString(5)%>" id="input-text" name="f_first_name" required></td>
                            <td><input type="text" class="validate" placeholder="Middle Name" id="input-text" name="f_middle_name" value="<%=rs.getString(6)%>" required></td>
                            <td><input type="text" class="validate" placeholder="last Name" id="input-text" name="f_last_name" value="<%=rs.getString(7)%>" required><br/></td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 18px;">Date of Birth &nbsp;&nbsp;&nbsp;</span></td><td><input type="text" class="datepicker" placeholder="DD/MM/YYYY" value="<%=rs.getString(8)%>" name="dob" required></td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 18px;">Address &nbsp;&nbsp;&nbsp;</span></td><td><input type="text" class="validate" placeholder="Line 1" value="<%=rs.getString(9)%>" id="input-text" name="line1" required></td>
                            <td><input type="text" class="validate" placeholder="Line 2" id="input-text" name="line2" value="<%=rs.getString(10)%>"></td>
                            <td><input type="text" class="validate" placeholder="City/Village" id="input-text" name="city" value="<%=rs.getString(11)%>" required></td>
                        </tr>
                        <tr>
                            <td></td><td><input type="text" class="validate" placeholder="Taluka" id="input-text" name="taluka" value="<%=rs.getString(12)%>" required></td>
                            <td><input type="text" class="validate" placeholder="District" id="input-text" name="district" value="<%=rs.getString(13)%>" required></td>
                            <td><input type="text" class="validate" placeholder="State" id="input-text" name="state" value="<%=rs.getString(14)%>" required></td>
                        </tr>
                        <tr>
                            <td></td><td><input type="text" class="validate" placeholder="Pin Code" id="input-text" name="pin" value="<%=rs.getInt(15)%>" required></td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 18px;">Mobile &nbsp;&nbsp;&nbsp;</span></td>
                            <td><input type="tel" class="validate" placeholder="Self Mobile" id="input-text" name="s_mobile" value="<%=rs.getString(16)%>" required></td>
                            <td><input type="tel" class="validate" placeholder="Parent Mobile" id="input-text" name="p_mobile" value="<%=rs.getString(17)%>" required></td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 18px;">Email &nbsp;&nbsp;&nbsp;</span></td>
                            <td><input type="email" class="validate email" placeholder="Email Address" id="input-text" name="email" value="<%=rs.getString(18)%>" required></td>
                        </tr>
                        <%
                        }
                            %>
                    </table>
                    
                    <br>
                    <!-- academic details -->
                    <span style="font-size: 28px;">Academic Details</span><br/>
                    <table>
                        <thead>
                            <th>Exam</th>
                            <th>Board</th>
                            <th>Year of Passing</th>
                            <th>Marks obtained / out of</th>
                            <th>Result</th>
                        </thead>
                        <%
                        ps=con.prepareStatement("select * from academic_details where id='"+email+"'");
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                        %>
                        <tr>
                            <td><b>SSC</b></td>
                            <td><input type="text" class="validate" placeholder="Board Name" id="input-text" name="ssc_bname" value="<%=rs.getString(2)%>" required></td>
                            <td><input type="text" class="validate" placeholder="Year" name="ssc_year" value="<%=rs.getString(3)%>" required style="width: 80px;"></td>
                            <td><input type="text" class="validate" placeholder="Marks" id="STMarks" name="ssc_marks" value="<%=rs.getString(4)%>" required style="width: 60px;"> / 
                            <input type="text" class="validate" placeholder="Out of"  id="SOMarks" name="ssc_outof" value="<%=rs.getString(5)%>" required style="width: 60px;"></td>
                            <td><input type="text" class="validate" placeholder="00.00" id="SMarks" name="ssc_per" value="<%=rs.getString(6)%>" required style="width: 53px;">%</td>
                        </tr>
                        <tr>
                            <td><b>HSC</b></td>
                            <td><input type="text" class="validate" placeholder="Board Name" value="<%=rs.getString(7)%>" id="input-text" name="hsc_bname"></td>
                            <td><input type="text" class="validate" placeholder="Year" name="hsc_year" value="<%=rs.getString(8)%>"  style="width: 80px;"></td>
                            <td><input type="text" class="validate" placeholder="Marks" name="hsc_marks" value="<%=rs.getString(9)%>"  style="width: 60px;"> / 
                            <input type="text" class="validate" placeholder="Out of" name="hsc_outof" value="<%=rs.getString(10)%>"  style="width: 60px;"></td>
                            <td><input type="text" class="validate" placeholder="00.00" id="HMarks" name="hsc_per" value="<%=rs.getString(11)%>"  style="width: 53px;">%</td>
                        </tr>
                        <tr>
                            <td><b>Diploma</b></td>
                            <td><input type="text" class="validate" placeholder="Board Name" id="input-text" name="d_bname" value="<%=rs.getString(12)%>"></td>
                            <td><input type="text" class="validate" placeholder="Year" name="d_year"  value="<%=rs.getString(13)%>" style="width: 80px;"></td>
                            <td><input type="text" class="validate" placeholder="Marks" name="d_marks"  value="<%=rs.getString(14)%>" style="width: 60px;"> /
                                 <input type="text" class="validate" placeholder="Out of" name="d_outof" value="<%=rs.getString(15)%>"  style="width: 60px;"></td>
                            <td><input type="text" class="validate" placeholder="00.00" id="DMarks" name="d_per"  value="<%=rs.getString(16)%>" style="width: 53px;">%</td>
                        </tr>
                        <tr>
                            <td><b>Engineering Branch</b></td>
                            <td>
                                <select name="ebranch" required>
                                    <option  value="<%=rs.getString(24)%>" selected><%=rs.getString(24)%></option>
                                    <option value="MECHANICAL">MECHANICAL</option>
                                    <option value="ELECTRICAL">ELECTRICAL</option>
                                    <option value="COMPUTER">COMPUTER</option>
                                    <option value="CIVIL">CIVIL</option>
                                    <option value="E&TC">E&TC</option>
                                    <option value="IT">IT</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Engineering Year</b></td>
                            <td>
                                <select name="eyear" required>
                                    <option value="<%=rs.getString(25)%>" selected><%=rs.getString(25)%></option>
                                    <option value="FE">FE</option>
                                    <option value="SE">SE</option>
                                    <option value="TE">TE</option>
                                    <option value="BE">BE</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Admitted through<br>CAP ?</b></td>
                            <td>
                                <p>
                                    <%
                                        if(rs.getString(17).equals("Yes"))
                                        {
                                    %>
                                    <input name="cap" value="Yes" type="radio" id="Yes" checked/>
                                    <label for="Yes">Yes</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input name="cap" value="No" type="radio" id="No" />
                                    <label for="No">No</label>
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                    <input name="cap" value="Yes" type="radio" id="Yes"/>
                                    <label for="Yes">Yes</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input name="cap" value="No" type="radio" id="No"  checked/>
                                    <label for="No">No</label>
                                    <%
                                        }
                                    %>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Diploma Holder ?</b></td>
                            <td>
                                <p>
                                    <%
                                        if(rs.getString(18).equals("Yes"))
                                        {
                                    %>
                                    <input name="dholder" value="Yes" type="radio" id="DYes" checked/>
                                    <label for="DYes">Yes</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input name="dholder" value="No" type="radio" id="DNo" />
                                    <label for="DNo">No</label>
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                    <input name="dholder" value="Yes" type="radio" id="DYes"/>
                                    <label for="DYes">Yes</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input name="dholder" value="No" type="radio" id="DNo"  checked/>
                                    <label for="DNo">No</label>
                                    <%
                                        }
                                    %>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><b>CET Score</b></td>
                            <td><input type="text" class="validate" value="<%=rs.getString(19)%>" placeholder="CET Score" id="input-text" name="cet_score"></td>
                            <td><b>PCM Score</b></td>
                            <td><input type="text" class="validate" value="<%=rs.getString(20)%>" placeholder="PCM Score" id="input-text" name="pcm_score"></td>
                        </tr>
                        <tr>
                            <td><b>Diploma Branch</b></td>
                            <td><input type="text" class="validate" value="<%=rs.getString(21)%>" placeholder="Diploma Branch" id="input-text" name="d_branch"></td>
                            <td><b>Diploma College</b></td>
                            <td><input type="text" class="validate" value="<%=rs.getString(22)%>" placeholder="Diploma College" id="input-text" name="d_college"></td>
                        </tr>
                        <tr>
                            <td><b>Any Education Gap ?</b></td>
                            <td><input type="text" class="validate" value="<%=rs.getString(23)%>" placeholder="Number of years, if not leave empty" id="input-text" name="gap"></td>
                        </tr>
                        <tr>
                            <td></td><td></td><td></td>
                        </tr>
                        <%
                        }
                        %>
                    </table>
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
                                        <td><input type="text" class="validate" placeholder="Academic Year" id="input-text" name="fe_admitted_year" value="<%=rs.getString(2)%>"></td>
                                        <td><input type="text" class="validate" placeholder="Year" name="fe_passed_year" value="<%=rs.getString(3)%>" style="width: 80px;"></td>
                                        <td><input type="text" class="validate" placeholder="SGPA-I" id="STMarks" name="fe_sem_i_sgpa" value="<%=rs.getString(4)%>" style="width: 60px;"></td>
                                        <td><input type="text" class="validate" placeholder="SGPA-II" id="STMarks" name="fe_sem_ii_sgpa" value="<%=rs.getString(5)%>" style="width: 60px;"></td>
                                        <td><input type="text" class="validate" placeholder="CGPA" id="SMarks" name="fe_cgpa" value="<%=rs.getString(6)%>" style="width: 53px;"></td>
                                        <td><input type="text" class="validate" placeholder="Result" id="SMarks" name="fe_result" value="<%=rs.getString(7)%>" style="width: 53px;"></td>
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
                                        <td><input type="text" class="validate" placeholder="Academic Year" id="input-text" name="se_admitted_year" value="<%=rs.getString(2)%>"></td>
                                        <td><input type="text" class="validate" placeholder="Year" name="se_passed_year" value="<%=rs.getString(3)%>" style="width: 80px;"></td>
                                        <td><input type="text" class="validate" placeholder="SGPA-I" id="STMarks" name="se_sem_i_sgpa" value="<%=rs.getString(4)%>" style="width: 60px;"></td>
                                        <td><input type="text" class="validate" placeholder="SGPA-II" id="STMarks" name="se_sem_ii_sgpa" value="<%=rs.getString(5)%>" style="width: 60px;"></td>
                                        <td><input type="text" class="validate" placeholder="CGPA" id="SMarks" name="se_cgpa" value="<%=rs.getString(6)%>" style="width: 53px;"></td>
                                        <td><input type="text" class="validate" placeholder="Result" id="SMarks" name="se_result" value="<%=rs.getString(7)%>" style="width: 53px;"></td>
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
                                        <td><input type="text" class="validate" placeholder="Academic Year" id="input-text" name="te_admitted_year" value="<%=rs.getString(2)%>"></td>
                                        <td><input type="text" class="validate" placeholder="Year" name="te_passed_year" value="<%=rs.getString(3)%>" style="width: 80px;"></td>
                                        <td><input type="text" class="validate" placeholder="SGPA-I" id="STMarks" name="te_sem_i_sgpa" value="<%=rs.getString(4)%>" style="width: 60px;"></td>
                                        <td><input type="text" class="validate" placeholder="SGPA-II" id="STMarks" name="te_sem_ii_sgpa" value="<%=rs.getString(5)%>" style="width: 60px;"></td>
                                        <td><input type="text" class="validate" placeholder="CGPA" id="SMarks" name="te_cgpa" value="<%=rs.getString(6)%>" style="width: 53px;"></td>
                                        <td><input type="text" class="validate" placeholder="Result" id="SMarks" name="te_result" value="<%=rs.getString(7)%>" style="width: 53px;"></td>
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
                                        <td><input type="text" class="validate" placeholder="Academic Year" id="input-text" name="be_admitted_year" value="<%=rs.getString(2)%>"></td>
                                        <td><input type="text" class="validate" placeholder="Year" name="be_passed_year" value="<%=rs.getString(3)%>" style="width: 80px;"></td>
                                        <td><input type="text" class="validate" placeholder="SGPA-I" id="STMarks" name="be_sem_i_sgpa" value="<%=rs.getString(4)%>" style="width: 60px;"></td>
                                        <td><input type="text" class="validate" placeholder="SGPA-II" id="STMarks" name="be_sem_ii_sgpa" value="<%=rs.getString(5)%>" style="width: 60px;"></td>
                                        <td><input type="text" class="validate" placeholder="CGPA" id="SMarks" name="be_cgpa" value="<%=rs.getString(6)%>" style="width: 53px;"></td>
                                        <td><input type="text" class="validate" placeholder="Result" id="SMarks" name="be_result" value="<%=rs.getString(7)%>" style="width: 53px;"></td>
                                    </tr>
                                    <%
                                        }
                                            %>
                                </table>
                            </div>
                        </div>
                    </div>
                    <center><input type="submit" value="Update" id="sub-btn"/></center>
                </form>
                </div>
            </div>
        </div>
                    <%
                    }
                    catch(Exception e)
                    {
                        out.print(e.toString());
                    }
                %>
    </body>
</html>

<script>
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 50
  });
  $(document).ready(function() {
    $('select').material_select();
  });
</script>