package com.bdi.sp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdi.sp.dao.DIDAO;
import com.bdi.sp.service.DIService;
import com.bdi.sp.vo.DI;

@Service
public class DIServiceImpl implements DIService {

	@Autowired
	private DIDAO dd;
	@Override
	public List<DI> getDIList(DI d) {
		// TODO Auto-generated method stub
		return dd.getDIList(d);
	}

	@Override
	public DI getDI(int dino) {
		// TODO Auto-generated method stub
		return dd.getDI(dino);
	}

	@Override
	public int insertDI(DI d) {
		// TODO Auto-generated method stub
		return dd.insertDI(d);
	}

	@Override
	public int updateDI(DI d) {
		// TODO Auto-generated method stub
		return dd.updateDI(d);
	}

	@Override
	public int deleteDI(int dino) {
		// TODO Auto-generated method stub
		return dd.deleteDI(dino);
	}

}
