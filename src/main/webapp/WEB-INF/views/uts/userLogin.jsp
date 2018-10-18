<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
<script>
	
	var loginFormData = [
		 {type:'fieldset',name:'login',label:'login',inputWidth:'auto',
			list:[
				{type:'input',name:'id',label:'ID',validate:'ValidAplhaNumeric',required:true},
				{type:'password',name:'pwd',label:'PWD',validate:'ValidAplhaNumeric',required:true},
				{type:'button',name:'loginbtn',value:'LOGIN'}
			]
		 }
	 ];
	
	function utsWd(){
	var utsWin = new dhtmlXWindows();
	
	utsWin.createWindow('w1',0,10,300,300);
	utsWin.window('w1').centerOnScreen();
	
	 var loginForm = new dhtmlXForm('loginForm',loginFormData);
	 utsWin.window('w1').attachObject('loginForm');
	 loginForm.attachEvent('onButtonClick',function(name){
		 if(name=='loginbtn'){
			if(loginForm.validate()){
				 var id = loginForm.getItemValue('id');
				 var pwd = loginForm.getItemValue('pwd');
				 var conf = {
						 url:'/uts',
						 method:'POST',
						 param : JSON.stringify({id:id,pwd:pwd}),
						 success : function(res){
							 res = JSON.parse(res);
							 alert(res.msg);
						 }
				 }
				 au.send(conf);
				 
			}
		 }
	 });
	}
	 window.addEventListener('load',utsWd);
</script>
<body>
<div id="loginForm" style="width:240px; height:200px;"></div>
</body>

</html>