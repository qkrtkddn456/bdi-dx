package com.bdi.sp.dao;

import java.util.List;

import com.bdi.sp.vo.UT;

public interface UTDAO {

	public List<UT> getUTList(UT ut);
	public UT getUT(int utnum);
	public int insertUT(UT ut);
	public int updateUT(UT ut,int utnum);
	public int deleteUT(int utnum);
}
