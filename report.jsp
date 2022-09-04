<%@page import="java.sql.*"%> 

<%
    String c=request.getParameter("c");
    String uname=(String)session.getAttribute("Name");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/places?&useSSL=false&allowPublicKeyRetrieval=true","root","Thasbee@1307");
    Statement st=con.createStatement();
    ResultSet r2=st.executeQuery("select name,PersonID,checkin,checkout,room_type,no_of_rooms,no_of_persons from customers_details where h_id='"+uname+"'and checkout='"+c+"'");
    out.println("<p style='text-align:center;font-size:46px;color:chocolate'>Date Query</p><table border='2' align='center'><tr style='background-color:#87CEFA'><th>Name</th><th>Mobile no</th><th>Check-In</th><th>Check-Out</th><th>Room Type</th><th>No of rooms</th><th>No of persons</th></tr>");
    while(r2.next())
{
out.println("<tr><td style='background-color:#FFB6C1'>"+r2.getString("name")+"</td>");
out.println("<td style='background-color:#D3D3D3'>"+r2.getInt("PersonID")+"</td>");
out.println("<td style='background-color:#FFB6C1'>"+r2.getString("checkin")+"</td>");
out.println("<td style='background-color:#D3D3D3'>"+r2.getString("checkout")+"</td>");
out.println("<td style='background-color:#FFB6C1'>"+r2.getString("room_type")+"</td>");
out.println("<td style='background-color:#D3D3D3'>"+r2.getInt("no_of_rooms")+"</td>");
out.println("<td style='background-color:#FFB6C1'>"+r2.getInt("no_of_persons")+"</td></tr>");
}
    out.println("</table>");
    r2.close();
%>