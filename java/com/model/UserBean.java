package com.model;



	   public class UserBean {
			
		      private String username;
		      private String password;
		      private String firstName;
		      private String lastName;
		      private String accImg;
		      
		      public String getAccImg() {
				return accImg;
			}

			public void setAccImg(String accImg) {
				this.accImg = accImg;
			}
			public boolean valid;
			
			
		      public String getFirstName() {
		         return firstName;
			}

		      public void setFirstName(String newFirstName) {
		         firstName = newFirstName;
			}

			
		      public String getLastName() {
		         return lastName;
					}

		      public void setLastName(String newLname) {
		         lastName = newLname;
					}
					

		      public String getPassword() {
		         return password;
			}

		      public void setPassword(String newPassword) {
		         password = newPassword;
			}
			
					
		      public String getUsername() {
		         return username;
					}

		      public void setUserName(String newUsername) {
		         username = newUsername;
					}

						
		      public boolean isValid() {
		         return valid;
			}

		      public void setValid(boolean newValid) {
		         valid = newValid;
			}	
		      public String toString() {
		   	   return firstName;
		      }
		}

