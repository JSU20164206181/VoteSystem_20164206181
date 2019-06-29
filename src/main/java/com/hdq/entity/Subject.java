package com.hdq.entity;

public class Subject {
private int vs_id;
private String vs_title;//主题
private int vs_type;//单选，多选
public int getVs_id() {
	return vs_id;
}
public void setVs_id(int vs_id) {
	this.vs_id = vs_id;
}
public String getVs_title() {
	return vs_title;
}
public void setVs_title(String vs_title) {
	this.vs_title = vs_title;
}
public int getVs_type() {
	return vs_type;
}
public void setVs_type(int vs_type) {
	this.vs_type = vs_type;
}
}
