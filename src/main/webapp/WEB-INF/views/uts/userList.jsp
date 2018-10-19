<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
<link rel="stylesheet" type="text/css" href="${resPath}/dhtmlx/skins/skyblue/dhtmlx.css"/>
</head>
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
document.querySelector("#update").addEventListener("click", update);
document.querySelector("#del").addEventListener("click", del);
document.querySelector("#login").addEventListener("click", login);
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