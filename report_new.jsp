<%@page import="java.sql.*"%>

<%
   String uname=request.getParameter("uname");
   String p=request.getParameter("password");
   session.setAttribute("Name",uname);
   int rcount=0;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/places?&useSSL=false&allowPublicKeyRetrieval=true","root","Thasbee@1307");
    Statement st=con.createStatement();
    ResultSet r1=st.executeQuery("select  COUNT(*) AS COUNT  from user where user_id='"+uname+"' and password='"+p+"'");
    //int rowCount = r1.last() ? r1.getRow() : 0;
    while(r1.next()) {
         rcount= r1.getInt("COUNT");
    }
    
    if(rcount==1){
        
    ResultSet rs=st.executeQuery("select name,PersonID,checkin,checkout,room_type,no_of_rooms,no_of_persons from customers_details where h_id='"+uname+"'");
    out.println("<p style='text-align:center;font-size:46px;color:chocolate'>Hotel Booked status</p>");
    out.println("<table border='2' align='center'><tr style='background-color:#87CEFA'><th>Name</th><th>Mobile no</th><th>Check-In</th><th>Check-Out</th><th>Room Type</th><th>No of rooms</th><th>No of persons</th></tr>");
    while(rs.next())
{
out.println("<tr><td style='background-color:#FFB6C1'>"+rs.getString("name")+"</td>");
out.println("<td style='background-color:#D3D3D3'>"+rs.getInt("PersonID")+"</td>");
out.println("<td style='background-color:#FFB6C1'>"+rs.getString("checkin")+"</td>");
out.println("<td style='background-color:#D3D3D3'>"+rs.getString("checkout")+"</td>");
out.println("<td style='background-color:#FFB6C1'>"+rs.getString("room_type")+"</td>");
out.println("<td style='background-color:#D3D3D3'>"+rs.getInt("no_of_rooms")+"</td>");
out.println("<td style='background-color:#FFB6C1'>"+rs.getInt("no_of_persons")+"</td></tr>");
}
    out.println("</table>");
    out.println("<p style='text-align:center;font-size:46px;color:chocolate'>Date Query</p>");
    out.println("<span style='position:absolute;left:550px;bottm:10%;'><form action='report.jsp' method='post'>Date: <br><input type='date' name='c'><br><br><input type='submit' value='Submit'></form></span>");
rs.close();
    }
    else
    {
        response.sendRedirect("login.html");
    }
st.close();
 %>