package com.service;
import com.util.*;
import com.model.*;
import java.util.*;

import java.sql.*;

public class UserDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;  
   
	
	
   public static UserBean login(UserBean bean) {
	
      //preparing some objects for connection 
      Statement stmt = null;    
	
      String username = bean.getUsername();    
      String password = bean.getPassword();   
	    
      String searchQuery =
            "select * from users where username='"
                     + username
                     + "' AND password='"
                     + password
                     + "'";
	   
   try 
   {
      //connect to DB 
      currentCon = ConnectionManager.getConnection();
      stmt=currentCon.createStatement();
      rs = stmt.executeQuery(searchQuery);	        
      boolean more = rs.next();
	       
      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         System.out.println("Sorry, you are not a registered user! Please sign up first");
         bean.setValid(false);
      } 
	   else if (more) {     
      //if user exists set the isValid variable to true
		   bean.setValid(true);
	   }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
   } 
	    
   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }
	
      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }
	
      if (currentCon != null) {
         try {
            currentCon.close();
         } catch (Exception e) {
         }

         currentCon = null;
      }
   }

return bean;
	
   }
   public static UserBean Register(UserBean bean) {
	     
	   	  String username = bean.getUsername();    
	      String password = bean.getPassword();   
	      String firstName = bean.getFirstName(); 
	      String lastName = bean.getLastName(); 
	      try {
	     currentCon = ConnectionManager.getConnection();
	    PreparedStatement ps=currentCon.prepareStatement("insert into users (FirstName, LastName, username,password) values(?,?,?,?)");
			
			ps.setString(1,firstName);
			ps.setString(2,lastName);
			ps.setString(3,username);
			ps.setString(4,password);
			 
			int i=ps.executeUpdate();
	      }catch(Exception e) {
	    	  System.out.println(e);
	      }
	   return bean;
   }
   public  ArrayList<UserBean> getUser(String u1)  throws SQLException {
	   ArrayList<UserBean> userList = new ArrayList<UserBean>();
	   Statement stmt = null;  
	   String getUNQuery="select * from users where username='"+u1+"'";
	   currentCon = ConnectionManager.getConnection();
	      stmt=currentCon.createStatement();
	      ResultSet rs = stmt.executeQuery(getUNQuery);	
	      while (rs.next()) {
	    	  UserBean user = new UserBean();
	    	  user.setFirstName(rs.getString(1));
	    	  user.setLastName(rs.getString(2));
	    	  user.setUserName(rs.getString(3));
	    	  user.setAccImg(rs.getString(5));
	    	  userList.add(user);
	    	  
	      }      
	   return userList;
   }
   public ArrayList<UserBean> getAllUsers()  throws SQLException {
	   ArrayList<UserBean> userList = new ArrayList<UserBean>();
	   Statement stmt = null;  
	   String getUNQuery="select * from users WHERE NOT (username = 'ADMIN')";
	   currentCon = ConnectionManager.getConnection();
	      stmt=currentCon.createStatement();
	      ResultSet rs = stmt.executeQuery(getUNQuery);	
	      while (rs.next()) {
	    	  UserBean user = new UserBean();
	    	  user.setFirstName(rs.getString(1));
	    	  user.setLastName(rs.getString(2));
	    	  user.setUserName(rs.getString(3));
	    	  user.setAccImg(rs.getString(5));
	    	  userList.add(user);
				
	      }      
	   return userList;
   }
   public Boolean deleteUsers(String user) {
		
		    
	      try {
	 	     currentCon = ConnectionManager.getConnection();
	 	    PreparedStatement ps=currentCon.prepareStatement("delete from users where username=?");
	 			
	 			ps.setString(1,user);
	 			
	 			int i=ps.executeUpdate();
	 	      }catch(Exception e) {
	 	    	  System.out.println(e);
	 	      }

	return true;
		
	   }
   public Boolean updateImg(String name,String userName) {
		
	    
	      try {
	 	     currentCon = ConnectionManager.getConnection();
	 	    PreparedStatement ps=currentCon.prepareStatement("update users set accImg=? where username=?");
	 	    	ps.setString(1,name);
	 			ps.setString(2,userName);
	 			
	 			int i=ps.executeUpdate();
	 	      }catch(Exception e) {
	 	    	  System.out.println(e);
	 	      }

	return true;
		
	   }
  
  
}
