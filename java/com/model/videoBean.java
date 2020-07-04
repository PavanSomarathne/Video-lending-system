package com.model;

import java.sql.Date;

public class videoBean {
	public int vidId;
	public String name;
	public String year;
	public String Description;
	public String category;
	public String qulity;
	public String thumbUrl;
	public String vidUrl;
	public String trailUrl;
	public String user;	
	public String date;	
	
	
	public int getVidId() {
		return vidId;
	}
	public void setVidId(int vidId) {
		this.vidId = vidId;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getThumbUrl() {
		return thumbUrl;
	}
	public void setThumbUrl(String thumbUrl) {
		this.thumbUrl = thumbUrl;
	}
	public String getVidUrl() {
		return vidUrl;
	}
	public void setVidUrl(String vidUrl) {
		this.vidUrl = vidUrl;
	}
	public String getTrailUrl() {
		return trailUrl;
	}
	public void setTrailUrl(String trailUrl) {
		this.trailUrl = trailUrl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String email) {
		this.year = email;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getQulity() {
		return qulity;
	}
	public void setQulity(String qulity) {
		this.qulity = qulity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String currentTime) {
		this.date = currentTime;
	}
	
	
}
