package com.bdi.sp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.UTDAO;
import com.bdi.sp.vo.UT;

@Repository
public class UTDAOImpl implements UTDAO {

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<UT> getUTList(UT ut) {
		// TODO Auto-generated method stub
		return ss.selectList("com.bdi.sp.UTMapper.selectUTList",ut);
	}

	@Override
	public UT getUT(int utnum) {
		// TODO Auto-generated method stub
		return ss.selectOne("com.bdi.sp.UTMapper.selectUT",utnum);
	}

	@Override
	public int insertUT(UT ut) {
		// TODO Auto-generated method stub
		return ss.insert("com.bdi.sp.UTMapper.insertUT",ut);
	}

	@Override
	public int updateUT(UT ut) {
		// TODO Auto-generated method stub
		return ss.update("com.bdi.sp.UTMapper.updateUT",ut);
	}

	@Override
	public int deleteUT(int utnum) {
		// TODO Auto-generated method stub
		return ss.delete("com.bdi.sp.UTMapper.deleteUT",utnum);
	}

	@Override
	public UT loginUT(Map<String, String> ut) {
		// TODO Auto-generated method stub
		return ss.selectOne("com.bdi.sp.UTMapper.loginUT", ut);
	}

}
