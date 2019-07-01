package com.hdq.dao;

import java.util.List;

import com.hdq.entity.Option;

public interface OptionInterface {
	public int addOpt(String[] list,int id);
	public List<Option> listOpt(Option opt);
}
