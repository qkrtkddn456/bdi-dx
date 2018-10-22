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
		dxGrid.setColumnIds('utnum,utid,utpwd,utname,utadd,utgd,uthb,utbd,utre,utdesc');
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
	<button id="deleteData">삭제</button>
	<button id="join">회원가입</button>
	<button id="login">로그인</button>
	<div id="loginForm" style="width:200px;height:200px"></div>
	<div id="joinForm" style="width:400px;height:500px"></div>
</body>
<script>

window.onload = function(){
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
	
	document.querySelector("#login").addEventListener("click", login);
	document.querySelector("#join").addEventListener("click", join);
	var dxWin,jWin,loginForm;
	function login(){ 
		 if(!dxWin || !dxWin.window('w1')){
			 dxWin = new dhtmlXWindows();
			 dxWin.createWindow('w1',0,10,250,230);
			 dxWin.window('w1').centerOnScreen();
			 loginForm = new dhtmlXForm('loginForm',loginFormData);
			 dxWin.window('w1').attachObject('loginForm');
			 dxWin.window('w1').attachEvent("onClose", function(win){
				 win.hide();
				 return;
			 });
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
									 if(res.login=='fail'){
										 alert(res.msg);
									 }else{
										 alert(res.msg);
										 
										 dxWin.window('w1').close();
										 
									 }
								 }
						 }
						 au.send(conf);
					 }
				 }
			 });
		 }else{
			 loginForm.clear();
			 dxWin.window('w1').show();
		 }
	 }
	function join(){
		 if(!jWin){
			 jWin = new dhtmlXWindows();
			 jWin.createWindow('w2',0,10,300,480);
			 jWin.window('w2').centerOnScreen();
			 var joinForm = new dhtmlXForm('joinForm',joinFormData);
			 jWin.window('w2').attachObject('joinForm');
			 jWin.window('w2').attachEvent("onClose", function(win){
				 win.hide();
				 return;
			 });
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
									 doInit();
									 if(res.insert=='fail'){
										 alert(res.msg);
									 }else{
										 alert(res.msg);
										 jWin.window('w2').close();
									 }
								}
						 	} 
						 	au.send(conf);
						}else{
							alert("비밀번호 체크를 확인해주세요");
						}
					 }
				 }
			 })
		 }else{
			 jWin.window('w2').show();
		 }
	}
	 
	
	
	
		
		dxGrid.attachEvent('onEditCell',function(stage,rId,cInd,nValue,oValue){
			var utnum =dxGrid.cells(rId,0).getValue();
			
			var keys =  ['utnum','utid','utpwd','utname','utadd','utgd','uthb','utbd','utre','utdesc'];
			var data={};
			data[keys[cInd]]=nValue;
			data[keys[0]]=utnum;
			if(stage==2){		
				conf={url:'/uts',
				method:'PUT',
				param :JSON.stringify(data),
				success:function(res){
					res=JSON.parse(res);
					alert(res.msg);
				location.href="/uri/uts/userList";} //이쪽은 주소확인할 것 //이쪽은 확인할 것//이쪽은 확인할 것//이쪽은 확인할 것
				};
				au.send(conf)
				return true; //트루면 바뀐 것이 들어가고  false면 안바뀌고 고대로 있음.
			};
							
		});
		dxGrid.attachEvent("onRowSelect",function(rId,cInd){
			var utnum =dxGrid.cells(rId,0).getValue();
			//alert('row번호는'+rId+'uinum은'+uinum+'입니다.');
			conf={url:'/uts/'+utnum,
				method:'DELETE',
				success:function(res){
				res=JSON.parse(res);
				alert(res.msg);
				location.href="/uri/uts/userList";} //이쪽은 주소확인할 것 //이쪽은 확인할 것//이쪽은 확인할 것//이쪽은 확인할 것
				};
			
			document.querySelector("#deleteData").addEventListener("click", deleteData);
		});
		
		
	
		function deleteData(){
			if(confirm('선택하신 회원을 삭제하시겠습니까?')){
		    	au.send(conf);	
		   	 };
		};
}
</script>
</html>