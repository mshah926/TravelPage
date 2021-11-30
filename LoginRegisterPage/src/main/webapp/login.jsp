<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Login Form</title>
   </head>
   <body>
   Login:
     <form action="checkLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
    Create An Account/Update Password:
     <form action="createAccount.jsp" method="POST">
       <table>
       <tr>
       <td>Username</td>
       <td><input type="text" name="username"></td>
       </tr>
       <tr>
       <td>Password</td>
       <td><input type="text" name="password"></td>
       </tr>
       </table>
       <input type="submit" value="Submit" />
     </form>
   </body>
</html>
