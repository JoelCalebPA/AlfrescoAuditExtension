package com.domain.audit.model;

import java.io.Serializable;
import java.util.Date;

public class Record implements Serializable {

	private static final long serialVersionUID = 1L;

	private String user;
	private Date date;
	private String action;
	private String document;
	private String path;

	public Record() {
	}

	public Record(String user, Date date, String action, String document, String path) {
		super();
		this.user = user;
		this.date = date;
		this.action = action;
		this.document = document;
		this.path = path;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	};
	
}
