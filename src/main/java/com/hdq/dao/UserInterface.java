package com.hdq.dao;

import com.hdq.entity.User;

public interface UserInterface {
public void addUser(User user);
	public void update(User user);
	public void delete(User user);
	public void findUser(User user);
	
}
