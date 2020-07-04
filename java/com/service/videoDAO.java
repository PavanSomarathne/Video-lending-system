package com.service;
import com.util.*;
import com.model.*;
import java.sql.*;
import java.util.ArrayList;

public class videoDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;  
   private PreparedStatement preparedStatement;
	
	
   public static videoBean insertVideo(videoBean bean) {
	
      //preparing some objects for connection 
         
	
      String name = bean.getName();    
      String year = bean.getYear();
      String description=bean.getDescription();
      String category=bean.getCategory();
      String thumbUrl=bean.getThumbUrl();
      String vidUrl=bean.getVidUrl();
      String trailUrl=bean.getTrailUrl();
      String user=bean.getUser();
      String upload=bean.getQulity();
      //String user=bean.getUser();
      
	    
      try {
 	     currentCon = ConnectionManager.getConnection();
 	    PreparedStatement ps=currentCon.prepareStatement("insert into videos(name, year, description,category,thumbUrl,vidUrl,trailUrl,upBy,quality) values(?,?,?,?,?,?,?,?,?)");
 			
 			ps.setString(1,name);
 			ps.setString(2,year);
 			ps.setString(3,description);
 			ps.setString(4,category);
 			ps.setString(5,thumbUrl);
 			ps.setString(6,vidUrl);
 			ps.setString(7,trailUrl);
 			ps.setString(8,user);
 			ps.setString(9,upload);
 			int i=ps.executeUpdate();
 	      }catch(Exception e) {
 	    	  System.out.println(e);
 	      }

return bean;
	
   }
   public static int getVidId(String u1,String year)  throws SQLException {
	   Statement stmt = null;  
	   int vidId = 0 ;
	   String getUNQuery="select VidId from videos where name='"+u1+"' and year='"+year+"'" ;
	   currentCon = ConnectionManager.getConnection();
	      stmt=currentCon.createStatement();
	      rs = stmt.executeQuery(getUNQuery);	
	      while (rs.next()) {
	            vidId = rs.getInt(1);
	      }    
	        
	     
	      return vidId;     
	   
   }

public ArrayList<videoBean> getvideoBean() {
	
	return actionOnVideo(null);
}

private ArrayList<videoBean> actionOnVideo(String vidID) {

	ArrayList<videoBean> vidList = new ArrayList<videoBean>();
	try {
		currentCon = ConnectionManager.getConnection();
		  
		/*
		 * Before fetching employee it checks whether employee ID is
		 * available
		 */
		if (vidID != null && !vidID.isEmpty()) {
			/*
			 * Get employee by ID query will be retrieved from
			 * EmployeeQuery.xml
			 */
			preparedStatement =currentCon.prepareStatement("select * from videos where videos.vidId=? order by rand()");
			preparedStatement.setString(1, vidID);
		}
		/*
		 * If employee ID is not provided for get employee option it display
		 * all employees
		 */
		else {
			preparedStatement=currentCon.prepareStatement("select * from videos order by vidId desc");
		}
		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			videoBean vid = new videoBean();
			vid.setVidId(resultSet.getInt(1));
			vid .setName( resultSet.getString(2));
			vid .setYear(resultSet.getString(3));
			vid .setDescription(resultSet.getString(4));
			vid .setCategory(resultSet.getString(5));
			vid .setThumbUrl(resultSet.getString(6));
			vid .setVidUrl(resultSet.getString(7));
			vid .setTrailUrl(resultSet.getString(8));
			vid .setUser(resultSet.getString(9));
			vid .setDate(resultSet.getString(10));
			vid .setQulity(resultSet.getString(11));
			vidList.add(vid);
		}

	} catch (Exception e) {
		
	} finally {
		/*
		 * Close prepared statement and database connectivity at the end of
		 * transaction
		 */
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (currentCon != null) {
				currentCon.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	return vidList;
}
public ArrayList<videoBean> getVideoByUser(String userName) {

	ArrayList<videoBean> vidList = new ArrayList<videoBean>();
	try {
		currentCon = ConnectionManager.getConnection();
		  
		/*
		 * Before fetching employee it checks whether employee ID is
		 * available
		 */
		if (userName != null && !userName.isEmpty()) {
			/*
			 * Get employee by ID query will be retrieved from
			 * EmployeeQuery.xml
			 */
			preparedStatement =currentCon.prepareStatement("select * from videos where videos.upBy = ?");
			preparedStatement.setString(1, userName);
		}
		
		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			videoBean vid = new videoBean();
			vid.setVidId(resultSet.getInt(1));
			vid .setName( resultSet.getString(2));
			vid .setYear(resultSet.getString(3));
			vid .setDescription(resultSet.getString(4));
			vid .setCategory(resultSet.getString(5));
			vid .setThumbUrl(resultSet.getString(6));
			vid .setVidUrl(resultSet.getString(7));
			vid .setTrailUrl(resultSet.getString(8));
			vid .setUser(resultSet.getString(9));
			vid .setDate(resultSet.getString(10));
			vid .setQulity(resultSet.getString(11));
			vidList.add(vid);
		}

	} catch (Exception e) {
		
	} finally {
		/*
		 * Close prepared statement and database connectivity at the end of
		 * transaction
		 */
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (currentCon != null) {
				currentCon.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	return vidList;
}
public Boolean deleteVideos(String vidId) {
	
    
    try {
	     currentCon = ConnectionManager.getConnection();
	    PreparedStatement ps=currentCon.prepareStatement("delete from videos where vidId=?");
			
			ps.setString(1,vidId);
			
			int i=ps.executeUpdate();
	      }catch(Exception e) {
	    	  System.out.println(e);
	      }

return true;
	
 }

}


