<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>View Course Details</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
 width="899"><br><br><br><br><br><br><br><br><br><br></div>
</div>

<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
	ResultSet rs = null;
	PreparedStatement ps = null;
	try
	{
		String CourseId=request.getParameter("CourseId");
		String LoginId = session.getAttribute("AdminLoginId").toString();
		String ToCheckLogin = "select LoginId from AdminLogin";
		ps = con.prepareStatement(ToCheckLogin);
		rs = ps.executeQuery();
		if(rs.next())
		{
			if( rs.getString(1).equals(LoginId) && CourseId !="" && CourseId != null )
			{
				String StudentCourseQuery="select CourseDetails.CourseName , CourseDetails.CourseId ,CourseDetails.Credit, InstructorName , RollNumber , FirstName, LastName, EmailId from CourseDetails, StudentCourseDetails, StudentLogin where CourseDetails.CourseId = StudentCourseDetails.CourseId  and StudentCourseDetails.RollNumber = StudentLogin.LoginId and CourseDetails.CourseId = '"+CourseId+"' order by RollNumber;";
				ps = con.prepareStatement(StudentCourseQuery);
				rs = ps.executeQuery();
				%>
				
				<br><br>
				<table border="">
				<tr>
				<th>No</th>
				<th>Roll No</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email Id</th>
				</tr>
				
				<%
				int i=1;
				boolean test = true;
				
				while(rs.next())
				{
					if(test)
					{
						out.println("<b>Course Information<br>");
						out.println("<br>CourseName: "+rs.getString(1));
						out.println("<br>Course Id: "+rs.getString(2));
						out.println("<br>Credit: "+rs.getString(3));
						out.println("<br>Instructor Name: "+rs.getString(4));
						test = false;
					}
					out.println("<tr><td>"+i+"</td>");
					out.println("<td>"+rs.getString(5)+"</td>");
					out.println("<td>"+rs.getString(6)+"</td>");
					out.println("<td>"+rs.getString(7)+"</td>");
					out.println("<td>"+rs.getString(8)+"</td></tr>");
					i++;
				}
				%>
				</table>
				<%

			}
			else
			{
				out.println("Course not found in database");
			}
		}
		else
		{
			out.println("You can't use database");
		}
	}
	
	catch(Exception e)
	{
		out.println("you are not logged in");
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


<br><br><br><br><br><br><br>
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