package com.hdq.entity;

public class Subject {
private int vs_id;
private String vs_title;//主题
private int vs_type;//单选，多选
private String vu_id;//发布用户
private int option_num;
private int item_num;
private int chose_num;

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
public String getVu_id() {
	return vu_id;
}
public void setVu_id(String string) {
	this.vu_id = string;
}
public int getOption_num() {
	return option_num;
}
public void setOption_num(int option_num) {
	this.option_num = option_num;
}
public int getItem_num() {
	return item_num;
}
public void setItem_num(int item_num) {
	this.item_num = item_num;
}
public int getChose_num() {
	return chose_num;
}
public void setChose_num(int chose_num) {
	this.chose_num = chose_num;
}
}
