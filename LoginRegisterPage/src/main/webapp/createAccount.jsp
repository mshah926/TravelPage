<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="resources.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
</head>
<body>
	<%
	try {


		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();


		Statement stmt = con.createStatement();


		String input_username = request.getParameter("username");
		String input_password = request.getParameter("password");
		
		String insert = "insert into users(username, password)"
				+ " VALUES ('" + input_username + "', '" + input_password + "' )" +
				" ON DUPLICATE KEY UPDATE password = "+input_password+";";

		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert); 
				

		ps.executeUpdate();

		con.close();
		out.print("Your new account has successfully been created");
		out.println("<a href='logout.jsp'>   click here to log in </a>");
		
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>