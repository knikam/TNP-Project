<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="java.util.Properties"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String email=request.getParameter("email");
    String dob=request.getParameter("dob");
    String mobile=request.getParameter("mobile");
    Connection con;
    ResultSet rs;
    PreparedStatement ps;
    try{
        con=DbConnector.getConnection();
        ps=con.prepareStatement("select password from personal_details where id='"+email+"' AND dob='"+dob+"' AND s_mobile='"+mobile+"'");
        rs=ps.executeQuery();
        if(rs.next())
        {
            final String from ="_GMAIL_ADDRESS_HERE_";
            final  String password ="_PASSWORD_HERE_";

            try{
                Properties props = new Properties();  
                props.setProperty("mail.transport.protocol", "smtp");     
                props.setProperty("mail.host", "smtp.gmail.com");  
                props.put("mail.smtp.auth", "true");  
                props.put("mail.smtp.port", "465");  
                props.put("mail.debug", "true");  
                props.put("mail.smtp.socketFactory.port", "465");  
                props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
                props.put("mail.smtp.socketFactory.fallback", "false");  
                Session sessions = Session.getInstance(props,  
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {  
                        return new PasswordAuthentication(from,password);  
                    }  
                });   
                
                Transport transport = sessions.getTransport();  
                InternetAddress addressFrom = new InternetAddress(from);  
                String to = email;
                String subject = "TNP CELL LOGIN CREDENTIALS";
                String msg ="User ID\t\t\t   : "+email+"\nPassword\t\t: "+rs.getString("password");
                
                MimeMessage message = new MimeMessage(sessions);  
                message.setSender(addressFrom);  
                message.setSubject(subject);  
                message.setContent(msg, "text/plain");  
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));  

                transport.connect();  
                Transport.send(message);  
                transport.close(); 
                
                response.sendRedirect("forgot_password.html?response=Mail_Sent!");
            }
            catch(Exception e)
            {
                response.sendRedirect("forgot_password.html?response=Failed!");
            }
        }
        else
        {
            response.sendRedirect("forgot_password.html?response=No_Records_Found!");
        }
    }
    catch(Exception e){out.print(e.toString());}
%>