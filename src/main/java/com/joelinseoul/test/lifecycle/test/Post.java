package com.joelinseoul.test.lifecycle.test;

public class Post {

	private String title;
	private String user;
	private String content;
	
	public Post(String title, String user, String content) {
		this.title = title;
		this.user = user;
		this.content = content;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
}
