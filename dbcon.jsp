<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
   String t1=request.getParameter("name");
  int no=Integer.parseInt(request.getParameter("no"));
  String dt= request.getParameter("dt");
  String co= request.getParameter("checkout");
  int t2=Integer.parseInt(request.getParameter("adults"));
  int r=Integer.parseInt(request.getParameter("rooms"));
  String rt=request.getParameter("rt");
  String hid=request.getParameter("hid");

     
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/places?&useSSL=false&allowPublicKeyRetrieval=true","root","Thasbee@1307");
    Statement st=con.createStatement();
    st.executeUpdate("insert into customers_details (name,PersonID,checkin,checkout,room_type,no_of_rooms,no_of_persons,h_id) values('"+t1+"','"+no+"','"+dt+"','"+co+"','"+rt+"','"+r+"','"+t2+"','"+hid+"')");
   response.sendRedirect("save.html");
    
}
catch(Exception e)
{
    out.println(e);
}

%>