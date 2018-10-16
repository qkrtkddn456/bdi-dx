package com.bdi.sp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.service.DIService;
import com.bdi.sp.vo.DI;

@Controller
public class DIController {

	private static final Logger logger = LoggerFactory.getLogger(DIController.class);
	
	@Autowired
	private DIService ds;
	
	
	@RequestMapping(value="/dis",method=RequestMethod.GET)
	public @ResponseBody List<DI> diList(@ModelAttribute DI d){
		return ds.getDIList(d);
	}
	
	@RequestMapping(value="/dis/{dino}",method=RequestMethod.GET)
	public  @ResponseBody DI di(@PathVariable int dino){
		return ds.getDI(dino);
	}
	
	@RequestMapping(value="/dis/{dino}",method=RequestMethod.POST)
	public @ResponseBody int insertDI(@ModelAttribute DI d ,@PathVariable Integer dino){
		logger.debug("di->{}",d);
		return ds.insertDI(d);
	}
	
	@RequestMapping(value="/dis/{dino}",method=RequestMethod.PUT)
	public @ResponseBody int updateDI(@RequestBody DI d,@PathVariable Integer dino){
		logger.debug("japan->{}",d);
		return ds.updateDI(d); 
	}
	
	@RequestMapping(value="/dis/{dino}",method=RequestMethod.DELETE)
	public @ResponseBody int deleteDI(@PathVariable int dino){
		return ds.deleteDI(dino);
	}
}
