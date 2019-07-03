package com.hdq.entity;

public class Option {
private int option_id;
private int object_id;
private String option_name;
private int option_order ;

public String getOption_name() {
	return option_name;
}
public void setOption_name(String option_name) {
	this.option_name = option_name;
}
public int getOption_order() {
	return option_order;
}
public void setOption_order(int option_order) {
	this.option_order = option_order;
}
public int getOption_id() {
	return option_id;
}
public void setOption_id(int option_id) {
	this.option_id = option_id;
}
public int getObject_id() {
	return object_id;
}
public void setObject_id(int object_id) {
	this.object_id = object_id;
}

}
