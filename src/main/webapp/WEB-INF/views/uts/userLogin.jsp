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
				{type:'input',name:'utid',label:'ID',validate:'ValidAplhaNumeric',required:true},
				{type:'password',name:'utpwd',label:'PWD',validate:'ValidAplhaNumeric',required:true},
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

				 var utid = loginForm.getItemValue('utid');
				 var utpwd = loginForm.getItemValue('utpwd');
				 var conf = {
						 url:'http://192.168.0.25:3000/user/login',
						 method:'POST',
						 param : JSON.stringify({uiEmail:utid,uiPwd:utpwd}),
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