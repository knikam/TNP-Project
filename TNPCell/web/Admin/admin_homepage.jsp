<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
                <%
                    Connection con;
                    ResultSet rs;
                    PreparedStatement ps;
                    
                    int comp=0,it=0,mech=0,civil=0,elec=0,etc=0,total=0;
                    try{
                        con=DbConnector.getConnection();
                %>
<html>
    <head>
        <title>RCPIT : Admin Homepage</title>        
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="../css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="../Student/css/style.css"/>
        <!-- Compiled and minified JavaScript -->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/materialize.min.js"></script>
      
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            var xport = {
  _fallbacktoCSV: true,  
  toXLS: function(tableId, filename) {   
    this._filename = (typeof filename == 'undefined') ? tableId : filename;
    
    //var ieVersion = this._getMsieVersion();
    //Fallback to CSV for IE & Edge
    if ((this._getMsieVersion() || this._isFirefox()) && this._fallbacktoCSV) {
      return this.toCSV(tableId);
    } else if (this._getMsieVersion() || this._isFirefox()) {
      alert("Not supported browser");
    }

    //Other Browser can download xls
    var htmltable = document.getElementById(tableId);
    var html = htmltable.outerHTML;

    this._downloadAnchor("data:application/vnd.ms-excel" + encodeURIComponent(html), 'xls'); 
  },
  toCSV: function(tableId, filename) {
    this._filename = (typeof filename === 'undefined') ? tableId : filename;
    // Generate our CSV string from out HTML Table
    var csv = this._tableToCSV(document.getElementById(tableId));
    // Create a CSV Blob
    var blob = new Blob([csv], { type: "text/csv" });

    // Determine which approach to take for the download
    if (navigator.msSaveOrOpenBlob) {
      // Works for Internet Explorer and Microsoft Edge
      navigator.msSaveOrOpenBlob(blob, this._filename + ".csv");
    } else {      
      this._downloadAnchor(URL.createObjectURL(blob), 'csv');      
    }
  },
  _getMsieVersion: function() {
    var ua = window.navigator.userAgent;

    var msie = ua.indexOf("MSIE ");
    if (msie > 0) {
      // IE 10 or older => return version number
      return parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)), 10);
    }

    var trident = ua.indexOf("Trident/");
    if (trident > 0) {
      // IE 11 => return version number
      var rv = ua.indexOf("rv:");
      return parseInt(ua.substring(rv + 3, ua.indexOf(".", rv)), 10);
    }

    var edge = ua.indexOf("Edge/");
    if (edge > 0) {
      // Edge (IE 12+) => return version number
      return parseInt(ua.substring(edge + 5, ua.indexOf(".", edge)), 10);
    }

    // other browser
    return false;
  },
  _isFirefox: function(){
    if (navigator.userAgent.indexOf("Firefox") > 0) {
      return 1;
    }
    
    return 0;
  },
  _downloadAnchor: function(content, ext) {
      var anchor = document.createElement("a");
      anchor.style = "display:none !important";
      anchor.id = "downloadanchor";
      document.body.appendChild(anchor);

      // If the [download] attribute is supported, try to use it
      
      if ("download" in anchor) {
        anchor.download = this._filename + "." + ext;
      }
      anchor.href = content;
      anchor.click();
      anchor.remove();
  },
  _tableToCSV: function(table) {
    // We'll be co-opting `slice` to create arrays
    var slice = Array.prototype.slice;

    return slice
      .call(table.rows)
      .map(function(row) {
        return slice
          .call(row.cells)
          .map(function(cell) {
            return '"t"'.replace("t", cell.textContent);
          })
          .join(",");
      })
      .join("\r\n");
  }
};
        </script>
        
        <style>
            select{
                display: block;
                border: 1px solid gray;
            }
            #sbm,#sub-search,btnExport
            {
                font-size: 16px;
                background: #009966;
                border: none;
                outline: none;
                color: #fff;
                padding: 3px;
                padding-left: 10px;
                padding-right: 10px;
                box-shadow: 1px 1px 1px #000;
            }
        </style>
    </head>
    <body>
        <div class="container" style="text-align: left;">
            <span><b>R. C. Patel Institute of Technology, Shirpur</b></span><br/>
            <div class="chip" style="background: #009966; color: #fff;">
                <img src="../images/user.png" alt="Contact Person">
                RCPIT Admin
            </div>
            <nav class="nav-extended">
                <div class="nav-content">
                    <ul class="tabs tabs-transparent">
                        <li class="tab"><a  class="active" href="#home">Home</a></li>
                        <li class="tab"><a href="#recent-news">Recent News</a></li>
                        <li class="tab"><a href="#placement-record">Placement Records</a></li>
                        <li class="tab right"><a onclick="window.location='../Logout/logoutValidation.jsp';">Logout</a></li>
                    </ul>
                </div>
            </nav>
            
            <div id="home">
                <div id="search-panel">             
                    <div class="card horizontal" style="text-align: center;">
                        <div class="card-stacked">
                            <div class="card-content">
                                <input type="search" placeholder="Search Here..." id="query" class="validate" required/>
                                <input type="submit" value="Search" id="sub-search"/>
                                
                                
                                <div class="card horizontal">
                                    <div class="card-stacked">
                                        <div class="card-content" id="s-panel" style="text-align: left;">
                                            <span style="font-size: 14px;">Result's can be appeared here.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            <script>
                $(document).ready(function (){
                    $('#sub-search').click(function (){
                        var query = $('#query').val();
                        
                        $.ajax({
                            url:"search.jsp",
                            method:"POST",
                            data:{query:query},
                            success: function (data) 
                            {
                                $('#s-panel').html(data);
                            }
                        });
                    });
                });
            </script>
                
                <div>        
                    <div class="card horizontal">
                        <div class="card-stacked">
                            <div class="card-content">
                                <table>
                                    <tr>
                                        <td>Filter by Criteria</td>
                                    </tr>
                                    <tr>
                                    <tr>
                                        <td>
                                            <select id="dept" required style="width: 130px;">
                                                <option value="MECHANICAL">MECHANICAL</option>
                                                <option value="ELECTRICAL">ELECTRICAL</option>
                                                <option value="COMPUTER">COMPUTER</option>
                                                <option value="CIVIL">CIVIL</option>
                                                <option value="E&TC">E&TC</option>
                                                <option value="IT">IT</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select id="compare" required style="width: 50px;">
                                                <option value=">=">>=</option>
                                                <!--<option value="<="><=</option>-->
                                            </select>
                                        </td>
                                        <td><input type="text" class="validate" required placeholder="10th%" id="ssc"></td>
                                        <td><input type="text" class="validate" required placeholder="12th%" id="hsc"></td>
                                        <td><input type="text" class="validate" required placeholder="Diploma%" id="dip"></td>
                                        <td><input type="text" class="validate" required placeholder="BE CGPA" id="be"></td>
                                        <td><input type="number" class="validate" required placeholder="Backlog" id="back"></td>
                                        <td><input type="number" class="validate" required placeholder="Year Gap" id="gap"></td>
                                        <td>
                                            <select id="year" required style="width: 90px;">
                                                <option value="2012-13">2012-13</option>
                                                <option value="2013-14">2013-14</option>
                                                <option value="2014-15">2014-15</option>
                                                <option value="2015-16">2015-16</option>
                                                <option value="2016-17">2016-17</option>
                                                <option value="2017-18">2017-18</option>
                                                <option value="2018-19">2018-19</option>
                                            </select>
                                        </td>
                                        <td><input type="submit" value="Filter" id="sbm"/></td>
                                    </tr>
                                </table>
                                
                                <div class="card horizontal">
                                    <div class="card-stacked">
                                        <div class="card-content" id="filter-panel">
                                            <span style="font-size: 14px;">Result's can be appeared here.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
            
            <script>
                $(document).ready(function (){
                    $('#sbm').click(function (){
                        var dept = $('#dept').val();
                        var compare = $('#compare').val();
                        var ssc = $('#ssc').val();
                        var hsc = $('#hsc').val();
                        var dip = $('#dip').val();
                        var be = $('#be').val();
                        var back = $('#back').val();
                        var gap = $('#gap').val();
                        var year = $('#year').val();
                        
                        $.ajax({
                            url:"filter.jsp",
                            method:"POST",
                            data:{dept:dept,compare:compare,ssc:ssc,hsc:hsc,dip:dip,be:be,back:back,gap:gap,year:year},
                            success: function (data) 
                            {
                                $('#filter-panel').html(data);
                            }
                        });
                    });
                });
            </script>

            <div id="recent-news">
                <form method="POST" action="../add_news">
                    <span style="font-size: 24px; margin-top: 15px; margin-bottom: 15px;">Add Recent News !</span><br/>
                    <input type="text" class="validate" placeholder="News Title" name="title" id="input-text" style="padding-left: 0;" required><br/>
                    <textarea id="input-text" class="materialize-textarea" name="description" placeholder="Some description here ..."></textarea><br/>
                    <input type="text" class="validate" placeholder="Web Address Link" name="link" id="input-text" style="padding-left: 0;"><br/>
                    <input type="submit" value="Add News" id="sub-btn"/>
                </form>
                
                <div class="row">
                    <div class="col s12" style="font-size: 24px; margin-bottom: 15px;">
                        Recently Updated News !
                    </div>
                <div class="col s12">
                    <%
                        int flag=0;
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
                            <a href="<%=rs.getString(4)%>" style="font-size: 12px; text-transform: none; color: blue;" target="_blank"><i class="material-icons" style="padding-top: 0px;">open_in_new</i></a><a href="../del_news?news_id=<%=rs.getString(1)%>" style="font-size: 12px; text-transform: none; color: red;" id="del-news"><i class="material-icons" style="padding-top: 0px;">delete</i></a>
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
                    }
                    catch(Exception e){out.print(e.toString());}%>
                </div>
                </div>
            </div>
            <div id="placement-record">
                <span style="font-size: 24px; margin-top: 15px; margin-bottom: 15px;">Placement Records !</span><br/>
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
                    try{
                        con=DbConnector.getConnection();
                        int flag=0;
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
                    <form action="../mark_old" method="POST">
                        <table width='100%'>
                            <tr>
                                <td>
                                    <select name="cyear" style="display: block; width: 200px; font-size: 14px;" required>
                                        <option value="" disabled selected>Select Year</option>
                                        <option value="2010">2010</option>
                                        <option value="2011">2011</option>
                                        <option value="2012">2012</option>
                                        <option value="2013">2013</option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="submit" style="font-size: 14px;" class="right btn" value="Mark as old">
                                </td>
                        </tr>
                        </table>
                    </form>
                    <%}
                    
                    else
                 {%>
                 <span style="font-size: 14px;">No records found !</span>
                 <%}%>
            </div>
                    </div>
                </div>
                        <form method="POST" action="../add_placement_record">
                            <span style="font-size: 24px; margin-top: 15px; margin-bottom: 15px;">Add Placement Records !</span><br/>
                            <div class="row">
                            <div class="col s3"><input type="text" style="width: auto;" class="validate" placeholder="Company Name" name="c_name" id="input-text" style="padding-left: 0;" required></div>
                            <div class="col s1"><input type="text" style="width: 50px;" class="validate" placeholder="COMP" name="comp" id="input-text" style="padding-left: 0;" required></div>
                            <div class="col s1"><input type="text" style="width: 50px;" class="validate" placeholder="IT" name="it" id="input-text" style="padding-left: 0;" required></div>
                            <div class="col s1"><input type="text" style="width: 50px;" class="validate" placeholder="MECH" name="mech" id="input-text" style="padding-left: 0;" required></div>
                            <div class="col s1"><input type="text" style="width: 50px;" class="validate" placeholder="CIVIL" name="civil" id="input-text" style="padding-left: 0;" required></div>
                            <div class="col s1"><input type="text" style="width: 50px;" class="validate" placeholder="ELECT" name="elect" id="input-text" style="padding-left: 0;" required></div>
                            <div class="col s1"><input type="text" style="width: 50px;" class="validate" placeholder="E&TC" name="etc" id="input-text" style="padding-left: 0;" required></div>
                            <div class="col s1"><input type="text" style="width: 70px;" class="validate" placeholder="Pckg PA" name="pa" id="input-text" style="padding-left: 0;"></div>
                            <div class="col s1"><input type="text" style="width: 65px;"  class="datepicker" placeholder="Date" name="date" id="input-text" style="padding-left: 0;"></div>
                            <div class="col s1"><input type="text" style="width: 65px;" class="validate" placeholder="Year" name="year" id="input-text" style="padding-left: 0;"></div>
                            </div>
                            <input type="submit" value="Add Record" id="sub-btn"/>
                            <input type="reset" value="Reset" id="sub-btn"/>
                        </form>
            </div>
                    <%
                        }
                    catch(Exception e){}
                    %>
        </div>
    </body>
</html>

<script>
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 50
  });       
</script>
