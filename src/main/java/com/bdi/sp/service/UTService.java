package com.bdi.sp.service;

import java.util.List;
import java.util.Map;

import com.bdi.sp.vo.UT;

public interface UTService {

	public List<UT> getUTList(UT ut);
	public UT getUT(Integer utid);
	public Map<String,String> insertUT(UT ut);
	public Map<String,String> updateUT(UT ut);
	public Map<String,String> deleteUT(int utnum);
	public Map<String,String> login(Map<String,String> ut);
}
