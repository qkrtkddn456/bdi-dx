package com.bdi.sp.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.service.UTService;
import com.bdi.sp.vo.UT;

@Controller
public class UTController {

	private static final Logger logger = LoggerFactory.getLogger(UTController.class);
	
	@Autowired
	private UTService us;
	
	@RequestMapping(value="/uts",method=RequestMethod.GET)
	public @ResponseBody List<UT> utList(@ModelAttribute UT ut){
		return us.getUTList(ut);
	}
	@RequestMapping(value="/userGET/{utnum}",method=RequestMethod.GET)
	public @ResponseBody UT ut(@PathVariable Integer utnum) {
		return us.getUT(utnum);
	}
	@RequestMapping(value="/uts",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> insertUT(@RequestBody UT ut) {
		return us.insertUT(ut);
	}
	@RequestMapping(value="/uts/{utnum}",method=RequestMethod.PUT)
	public @ResponseBody int updateUT(@ModelAttribute UT ut, @PathVariable int utnum) {
		return us.updateUT(ut, utnum);
	}
	@RequestMapping(value="/uts/{utnum}",method=RequestMethod.DELETE)
	public @ResponseBody int deleteUT(@PathVariable int utnum) {
		return us.delete(utnum);
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> login(@RequestBody Map<String,String> ut){
		return us.login(ut);
	}
	
}
