<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
<link rel="stylesheet" type="text/css" href="${resPath}/dhtmlx/skins/skyblue/dhtmlx.css"/>
</head>

<body>
<script>
	var dxGrid;
	function doInit(){
		dxGrid = new dhtmlXGridObject('dxGrid');	
		dxGrid.setImagePath('${gridPath}');
		dxGrid.setHeader('번호,아이디,비밀번호,이름,주소,성별,취미,생년월일,추천인,내용');
		dxGrid.setColumnIds('utnum,utid,utpwd,utname,utadd,utgd,uthb,utbd,utrd,utdesc');
		dxGrid.setColTypes('ro,ed,ed,ed,ed,ed,ed,ed,ro,ed');
		dxGrid.init();
		au.send({url:'/uts',success:function(res){
			res = JSON.parse(res);
			dxGrid.parse(res,'js');
		}});

		

	}
	window.addEventListener('load',doInit);
</script>
<body>

	<div id="dxGrid" style="width:70%;height:70%"></div>
	<button id="update">수정</button>
	<button id="del">삭제</button>
	<button id="join">회원가입</button>
	<button id="login">로그인</button>
	<div id="loginForm" style="width:200px;height:200px"></div>
	<div id="joinForm" style="width:400px;height:500px"></div>
</body>
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
var joinFormData = [
	{type:'fieldset', name:'join',label:'회원가입',inputWidth:'auto',list:[
		{type:'input',name:'id',label:'아이디',required:true},
		{type:'password',name:'pwd',label:'비밀번호',required:true},
		{type:'password',name:'pwdcheck',label:'비밀번호확인',required:true},
		{type:'input',name:'name',label:'이름',required:true},
		{type:'input',name:'address',label:'주소',required:true},
		{type:'calendar',name:'birthday',label:'생년월일',weekStart:'7',calendarDateFormat:'%Y%m%d',required:true},
		{type:'label',label:'성별',list:[
			{type:'radio',name:'gender',value:'1',label:'남자',checked:true},
			{type:'radio',name:'gender',value:'2',label:'여자'}]},
		{type:'input',name:'hobby',label:'취미'},
		{type:'input',name:'Recommender',label:'추천인',},
		{type:'input',name:'desc',label:'비고',},
		{type:'button',value:'가입',name:'joinbtn'}   
	]}];
document.querySelector("#update").addEventListener("click", update);
document.querySelector("#del").addEventListener("click", del);
document.querySelector("#login").addEventListener("click", login);
document.querySelector("#join").addEventListener("click", join);
var dxWin;
function login(){
	 if(!dxWin){
		 dxWin = new dhtmlXWindows();
		 dxWin.createWindow('w1',0,10,250,230);
		 dxWin.window('w1').centerOnScreen();
		 var loginForm = new dhtmlXForm('loginForm',loginFormData);
		 dxWin.window('w1').attachObject('loginForm');
		 loginForm.attachEvent('onButtonClick',function(name){
			 if(name=='loginbtn'){
				if(loginForm.validate()){
					 var id = loginForm.getItemValue('utid');
					 var pwd = loginForm.getItemValue('utpwd');
					 var conf = {
							 url:'/login',
							 method:'POST',
							 param : JSON.stringify({utid:id,utpwd:pwd}),
							 success : function(res){
								 res = JSON.parse(res);
								 alert(res.msg);
								 lo
							 }
					 }
					 au.send(conf);
				 }
			 }
		 });
	 }
 }
function join(){
	 if(!dxWin){
		 dxWin = new dhtmlXWindows();
		 dxWin.createWindow('w1',0,10,300,480);
		 dxWin.window('w1').centerOnScreen();
		 var joinForm = new dhtmlXForm('joinForm',joinFormData);
		 dxWin.window('w1').attachObject('joinForm');
		 joinForm.attachEvent('onButtonClick',function(name){
			 if(name=='joinbtn'){
				if(joinForm.validate()){
					 var id = joinForm.getItemValue('id');
					 var pwd = joinForm.getItemValue('pwd');
					 var pwdcheck =  joinForm.getItemValue('pwdcheck');
					 var name = joinForm.getItemValue('name');
					 var address = joinForm.getItemValue('address');
					 var birthday = joinForm.getCalendar('birthday').getFormatedDate('%Y%m%d');
					 var gender = joinForm.getItemValue('gender');
					 var hobby = joinForm.getItemValue('hobby');
					 var Recommender = joinForm.getItemValue('Recommender');
					 var desc = joinForm.getItemValue('desc');
					 if(pwd==pwdcheck){
					 	var conf = {
							url:'/uts',
							 method:'POST',
							 param : JSON.stringify({utid:id,utpwd:pwd,utname:name,utadd:address,utbd:birthday,utgd:gender,uthb:hobby,utre:Recommender,utdesc:desc}),
							 success : function(res){
								 res = JSON.parse(res);
								 alert(res.msg);
							}
					 	} 
					 	au.send(conf);
					}else{
						alert("비밀번호 체크를 확인해주세요");
					}
				 }
			 }
		 })
	 }
}
 
function getuser(){
	location.href='list';
}
function update(){
	au.send({url:'/uts',success:function(res){
		res = JSON.parse(res);
		dxGrid.parse(res,'js');
	}});
}
function del(){
	var selectedId = dxGrid.getSelectedRowId();
	var ind=dxGrid.getSelectedCellIndex();
	alert(ind);
	
}

</script>
</html>