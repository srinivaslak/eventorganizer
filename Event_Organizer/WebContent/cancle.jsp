<!DOCTYPE html>
<%@page import="com.keyupdate.conn.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

   <%  
        String email=(String)session.getAttribute("loggedusrname");
   HttpSession user=request.getSession(true);
	String eid=request.getParameter("id");
	System.out.println(eid);
	int id=Integer.parseInt(eid);
	String cs="YES";
   String message = null;
Connection connection=null;
Statement statement=null;
PreparedStatement pstmt=null;
//ResultSet rs=null;
try{
connection=DBConnection.getDbConnection();
int userid = (Integer) session.getAttribute("ownerid");
//String query = "select * from registration where email="+em1;
//String query = "select * from registration where usertype=`host`";

      pstmt = connection.prepareStatement("update userrequest SET cancel_status=? where req_id=?");
      pstmt.setString(1, cs);
      pstmt.setInt(2, id);
		int row = pstmt.executeUpdate();
	if (row > 0) {
    
               request.setAttribute("success", "Event Cancled successfully");
      
             
                RequestDispatcher rd1 = request.getRequestDispatcher("/User-bookingstatus.jsp");
                rd1.forward(request, response); 
              }
              
               
            //   rd.forward(request, response); 
    

} catch (Exception ex) {
message = "ERROR: " + ex.getMessage();
ex.printStackTrace();
} finally {
if (connection != null) {
    // closes the database connection
    try {
    	connection.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
}
   }


	
%>
  
 
