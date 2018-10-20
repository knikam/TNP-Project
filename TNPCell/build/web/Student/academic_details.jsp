<%
    String email=(String)session.getAttribute("email");
    if(request.getSession() == null || email.equals(""))
        response.sendRedirect("../index.html");
%>
<html>
    <head>
        <title>RCPIT : Academic Details</title>        
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
                        <li class="tab disabled"><a href="#personal_details">Personal Details</a></li>
                        <li class="tab"><a  class="active" href="#">Acdemic Details</a></li>
                    </ul>
                </div>
            </nav>
            <div id="academic_details">
                <div class="form-panel" style="text-align: left;">
                <form method="POST" action="../save_academic_details?email=<%=(String)session.getAttribute("email")%>">
                    <span style="font-size: 12px;" class="red-text">&nbsp;&nbsp;All fields are compulsary</span><br/>
                    <table>
                        <thead>
                            <th>Exam</th>
                            <th>Board</th>
                            <th>Year of Passing</th>
                            <th>Marks obtained / out of</th>
                            <th>Result</th>
                        </thead>
                        <tr>
                            <td><b>SSC</b></td>
                            <td><input type="text" class="validate" placeholder="Board Name" id="input-text" name="ssc_bname" required></td>
                            <td><input type="text" class="validate" placeholder="Year" name="ssc_year" required style="width: 80px;"></td>
                            <td><input type="text" class="validate" placeholder="Marks" id="STMarks" name="ssc_marks" required style="width: 60px;"> / 
                            <input type="text" class="validate" placeholder="Out of"  id="SOMarks" name="ssc_outof" required style="width: 60px;"></td>
                            <td><input type="text" class="validate" placeholder="00.00" id="SMarks" name="ssc_per" required style="width: 53px;">%</td>
                        </tr>
                        <tr>
                            <td><b>HSC</b></td>
                            <td><input type="text" class="validate" placeholder="Board Name" id="input-text" name="hsc_bname"></td>
                            <td><input type="text" class="validate" placeholder="Year" name="hsc_year"  style="width: 80px;"></td>
                            <td><input type="text" class="validate" placeholder="Marks" name="hsc_marks"  style="width: 60px;"> / 
                            <input type="text" class="validate" placeholder="Out of" name="hsc_outof"  style="width: 60px;"></td>
                            <td><input type="text" class="validate" placeholder="00.00" id="HMarks" name="hsc_per"  style="width: 53px;">%</td>
                        </tr>
                        <tr>
                            <td><b>Diploma</b></td>
                            <td><input type="text" class="validate" placeholder="Board Name" id="input-text" name="d_bname"></td>
                            <td><input type="text" class="validate" placeholder="Year" name="d_year"  style="width: 80px;"></td>
                            <td><input type="text" class="validate" placeholder="Marks" name="d_marks"  style="width: 60px;"> /
                                 <input type="text" class="validate" placeholder="Out of" name="d_outof"  style="width: 60px;"></td>
                            <td><input type="text" class="validate" placeholder="00.00" id="DMarks" name="d_per"  style="width: 53px;">%</td>
                        </tr>
                        <tr>
                            <td><b>Engineering Branch</b></td>
                            <td>
                                <select name="ebranch" required>
                                    <option value="" disabled selected>Choose your branch</option>
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
                                    <option value="" disabled selected>Choose your class</option>
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
                                    <input name="cap" value="Yes" type="radio" id="Yes" checked/>
                                    <label for="Yes">Yes</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input name="cap" value="No" type="radio" id="No" />
                                    <label for="No">No</label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Diploma Holder ?</b></td>
                            <td>
                                <p>
                                    <input name="dholder" value="Yes" type="radio" id="DYes" checked/>
                                    <label for="DYes">Yes</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input name="dholder" value="No" type="radio" id="DNo" />
                                    <label for="DNo">No</label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><b>CET Score</b></td>
                            <td><input type="text" class="validate" placeholder="CET Score" id="input-text" name="cet_score"></td>
                            <td><b>PCM Score</b></td>
                            <td><input type="text" class="validate" placeholder="PCM Score" id="input-text" name="pcm_score"></td>
                        </tr>
                        <tr>
                            <td><b>Diploma Branch</b></td>
                            <td><input type="text" class="validate" placeholder="Diploma Branch" id="input-text" name="d_branch"></td>
                            <td><b>Diploma College</b></td>
                            <td><input type="text" class="validate" placeholder="Diploma College" id="input-text" name="d_college"></td>
                        </tr>
                        <tr>
                            <td><b>Any Education Gap ?</b></td>
                            <td><input type="text" class="validate" placeholder="Number of years, if not leave empty" id="input-text" name="gap"></td>
                        </tr>
                        <tr>
                            <td></td><td></td><td><input type="submit" value="Save" id="sub-btn"/></td>
                        </tr>
                    </table>
                </form>
                </div>
            </div>
        </div>
    </body>
</html>

<script>
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 18
  });
  
  $(document).ready(function() {
    $('select').material_select();
  });
  $(document).ready(function(){
      
      
      
      
    });
</script>