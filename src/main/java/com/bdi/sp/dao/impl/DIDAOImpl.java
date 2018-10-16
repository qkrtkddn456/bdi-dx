package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.DIDAO;
import com.bdi.sp.vo.DI;

@Repository
public class DIDAOImpl implements DIDAO {

	@Autowired
	private SqlSession ss;
	
	
	@Override
	public List<DI> getDIList(DI d) {
		// TODO Auto-generated method stub
		return ss.selectList("com.bdi.sp.DIMapper.selectDIList",d);
	}

	@Override
	public DI getDI(int dino) {
		// TODO Auto-generated method stub
		return ss.selectOne("com.bdi.sp.DIMapper.selectDI",dino);
	}

	@Override
	public int insertDI(DI d) {
		// TODO Auto-generated method stub
		return ss.insert("com.bdi.sp.DIMapper.insertDI",d);
	}

	@Override
	public int updateDI(DI d) {
		// TODO Auto-generated method stub
		return ss.update("com.bdi.sp.DIMapper.updateDI",d);
	}

	@Override
	public int deleteDI(int dino) {
		// TODO Auto-generated method stub
		return ss.delete("com.bdi.sp.DIMapper.deleteDI",dino);
	}

}
