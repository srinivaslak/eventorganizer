package curd;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyupdate.conn.DBConnection;
@WebServlet("/EditServlet3")
public class EditServlet3 extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		 HttpSession user=request.getSession(true);
		String eid=request.getParameter("eid");
		int id=Integer.parseInt(eid);
		String ename=request.getParameter("ename");
		String etype=request.getParameter("etype");
		String eplace=request.getParameter("eplace");
		String hid=request.getParameter("hid");
		int id1=Integer.parseInt(hid);
		String uid=request.getParameter("uid");
		int id2=Integer.parseInt(uid);
		String uname=request.getParameter("uname");
		String npep=request.getParameter("npep");
		String apaid1=request.getParameter("apaid");
		int apaid=Integer.parseInt(apaid1);
		String tprice1=request.getParameter("tprice");
		int tprice=Integer.parseInt(tprice1);
		 Connection conn = null; // connection to the database
	        String message = null;  // message will be sent back to client
	         
	        try {
	            // connects to the database
	            
	         conn= DBConnection.getDbConnection();
	           // DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	          //  conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	 
	            // constructs SQL statement
	           
	         
	         
	         
	         String sql = "INSERT INTO userrequest(reg_eventid,req_event,event_type,event_place,host_id,req_by,no_ofpeople,aprice,tprice)  values (?,?,?,?,?,?,?,?,?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setInt(1, id);
	            statement.setString(2, ename);
	            statement.setString(3, etype);
	            statement.setString(4, eplace);
	            statement.setInt(5, id1);	   
	            statement.setInt(6, id2);
	            statement.setString(7, npep);
	            statement.setInt(8, apaid);
	            statement.setInt(9, tprice);
	            //statement.setInt(10, tprice);
	            
	            
	           
	             
	            

	            
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) {
	                
	                           request.setAttribute("success", "Event Booking Done successfully");
	                  
	                         
	                            RequestDispatcher rd1 = request.getRequestDispatcher("/User-Eventbookings.jsp");
	                            rd1.forward(request, response); 
	                          }
	                          
	                           
	                        //   rd.forward(request, response); 
	                
	            
	        } catch (SQLException ex) {
	            message = "ERROR: " + ex.getMessage();
	            ex.printStackTrace();
	        } finally {
	            if (conn != null) {
	                // closes the database connection
	                try {
	                    conn.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }
	               }
	    }
	}