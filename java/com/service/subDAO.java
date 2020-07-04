package com.service;
import com.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class subDAO {
	static Connection currentCon = null;
	   static ResultSet rs = null;  
	   PreparedStatement preparedStatement;
	   public boolean subVideo(String vId,String user,String plan) {
		   int i=0;
			   
		      try {
		 	     currentCon = ConnectionManager.getConnection();
		 	    PreparedStatement ps=currentCon.prepareStatement("insert into subscribed(vidId,user,subPlan) values(?,?,?)");
		 			
		 			ps.setString(1,vId);
		 			ps.setString(2,user);
		 			ps.setString(3,plan);
		 			
		 			i=ps.executeUpdate();
		 	      }catch(Exception e) {
		 	    	  System.out.println(e);
		 	      }
		      if(i==0) {
		    	  return false;
		      }else {
		    	  
		    	  return true;
		      }
			

		
			
		   }
	   public Boolean deleteSubscription(String vidId,String user) {
			
		    
		    try {
			     currentCon = ConnectionManager.getConnection();
			    PreparedStatement ps=currentCon.prepareStatement("delete from subscribed where vidId=? and user=?");
					
					ps.setString(1,vidId);
					ps.setString(2,user);
					
					int i=ps.executeUpdate();
			      }catch(Exception e) {
			    	  System.out.println(e);
			      }

		return true;
			
		 }
}
