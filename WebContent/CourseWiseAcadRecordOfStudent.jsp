<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Course wise Record</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Wise Acad Record</title>
</head>
<body>
<div class="main">
<div class="page-out">
<div class="page">
<div class="header">
<div class="header-top">
<h1>Grading Portal</h1>
<ul>
  <li><a href="index.html"><span>Home</span></a></li>
  
  <li><a href="#"><span>About</span></a></li>

  <li><a href="#"><span>Contact</span></a></li>
</ul>
</div>
<div class="header-img"><img src="images/header.jpg" alt="" height="225"
 width="899"><br><br><br><br><br><br><br><br><br><br><br><br></div>
</div>

<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
	ResultSet rs = null;
	PreparedStatement ps = null;
	try
	{
		String LoginId = session.getAttribute("AdminLoginId").toString();
		String ToCheckLogin = "select LoginId from AdminLogin";
		ps = con.prepareStatement(ToCheckLogin);
		rs = ps.executeQuery();
		if(rs.next())
		{
			if(rs.getString(1).equals(LoginId) )
			{
				String Query="select CourseName, Credit, RollNumber, FirstName, LastName , Quiz1, Quiz2, Quiz3, MidSemMarks, EndSemMarks,Total, Grade from CourseDetails,StudentPerformance , StudentLogin where StudentPerformance.RollNumber = StudentLogin.LoginId and StudentPerformance.CourseId = CourseDetails.CourseId order by CourseName;";
				ps = con.prepareStatement(Query);
				rs = ps.executeQuery();
				%>
				<b>Course Wise Academic Record Of Student</b>
				<br><br>
				<table border="">
				<tr>
				<th>No</th>
				<th>Course Name</th>
				<th>Credit</th>
				<th>Roll Number</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Quiz 1</th>
				<th>Quiz 2</th>
				<th>Quiz 3</th>
				<th>Mid Sem Marks</th>
				<th>End Sem Marks</th>
				<th>Total</th>
				<th>Grade</th>
				</tr>
				
				<%
				int i=1;
				while(rs.next())
				{
					out.println("<tr><td>"+i+"</td>");
					out.println("<td>"+rs.getString(1)+"</td>");
					out.println("<td>"+rs.getString(2)+"</td>");
					out.println("<td>"+rs.getString(3)+"</td>");
					out.println("<td>"+rs.getString(4)+"</td>");
					out.println("<td>"+rs.getString(5)+"</td>");
					out.println("<td>"+rs.getString(6)+"</td>");
					out.println("<td>"+rs.getString(7)+"</td>");
					out.println("<td>"+rs.getString(8)+"</td>");
					out.println("<td>"+rs.getString(9)+"</td>");
					out.println("<td>"+rs.getString(10)+"</td>");
					out.println("<td>"+rs.getString(11)+"</td>");
					out.println("<td>"+rs.getString(12)+"</td></tr>");
					i++;
				}
				%>
				</table>
				<%

			}
			else
			{
				out.println("your Login Id don't matched to databases");
			}
		}
		else
		{
			out.println("You can't use database");
		}
	}
	
	catch(Exception e)
	{
		out.println("You are not Login");
	}
	
	
	try
    {
         
         if(con!=null)
         {
        	 con.close();
         }
    }
catch(Exception e)
	{
		e.printStackTrace();
	}
	
%>


<br><br><br><br><br>
<div class="footer">
<div class="footer-left">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>Contact info</strong></p>
<p>&nbsp;</p>
<p>Rajat Vyas,
Nishant Bansal
<br>
Ravi Prakash,
Itar Mehak<br>
LNMIIT, JAIPUR</p>
</div>
<div class="footer-right">
<ul>
  <li><a href="index.html">Home</a>/</li>

  <li><a href="#">About</a>/</li>

  <li><a href="#">Contact</a></li>
</ul>
<!--DO NOT Remove The Footer Links-->
<p>&copy; Copyright 2013. Designed by Y10@SWE-13
<a href="http://www.htmltemplates.net"></a>
<a href="http://www.onlinecasino.im"></a></p>
</div>
</div>
</div>
</div>
</div>

</body>
</html>