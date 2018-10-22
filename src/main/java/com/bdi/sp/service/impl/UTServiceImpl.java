package com.bdi.sp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdi.sp.dao.UTDAO;
import com.bdi.sp.service.UTService;
import com.bdi.sp.vo.UT;

@Service
public class UTServiceImpl implements UTService {

	@Autowired
	private UTDAO udao;
	
	@Override
	public List<UT> getUTList(UT ut) {
		// TODO Auto-generated method stub
		return udao.getUTList(ut);
	}

	@Override
	public UT getUT(Integer utnum) {
		// TODO Auto-generated method stub
		return udao.getUT(utnum);
	}

	@Override
	public Map<String,String> insertUT(UT ut) {
		// TODO Auto-generated method stub
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("insert", "fail");
		rMap.put("msg", "아이디가 중복되었습니다");
		if(udao.idcheck(ut.getUtid()) == null) {
			udao.insertUT(ut);
			rMap.put("insert", "success");
			rMap.put("msg", "회원가입이 완료되었습니다");
		}
		return rMap;
	}

	@Override
	public Map<String,String> updateUT(UT ut) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("update", "fail");
		rMap.put("msg", "업데이트 실패");
		if(udao.updateUT(ut)==1) {
			rMap.put("update", "success");
			rMap.put("msg", "업데이트 성공");
		}
		return rMap;
	}

	@Override
	public Map<String,String> deleteUT(int utnum) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("delete", "fail");
		rMap.put("msg", "삭제 실패");
		if(udao.deleteUT(utnum) == 1) {
			rMap.put("delete", "success");
			rMap.put("msg", "삭제성공");
		}
		return rMap;
	}
	
	@Override
	public Map<String, String> login(Map<String, String> ut) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("login", "fail");
		rMap.put("msg", "아이디및 비밀번호를 확인하세요");
		if(ut.get("utid")==null) {
			return rMap;
		}
		if(udao.loginUT(ut)!=null) {
			rMap.put("login", "success");
			rMap.put("msg", "로그인 되었습니다");
			rMap.put("utnum", udao.loginUT(ut).getUtnum()+"");
		}
		return rMap;
	}

}
