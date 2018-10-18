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
var dxForm;
function join(){
	var forms = [
		{type:'fieldset', name:'join',label:'회원가입',inputWidth:'auto',list:[
			{type:'input',name:'id',label:'아이디',required:true},
			{type:'password',name:'pwd',label:'비밀번호',required:true},
			{type:'password',name:'pwdcheck',label:'비밀번호확인',required:true},
			{type:'input',name:'name',label:'이름',required:true},
			{type:'input',name:'address',label:'주소',required:true},
			{type:'calendar',name:'birthday',label:'생년월일',weekStart:'7',serverDateFormat:'yyyy-mm-dd',required:true},
			{type:'label',label:'성별',list:[
				{type:'radio',name:'gender',value:'1',label:'남자',checked:true,required:true},
				{type:'radio',name:'gender',value:'2',label:'여자',required:true}]},
			{type:'input',name:'hobby',label:'취미'},
			{type:'input',name:'Recommender',label:'추천인',},
			{type:'input',name:'desc',label:'비고',},
			{type:'button',value:'가입',name:'btn'}   
		]}]
	var dxForm = new dhtmlXForm('dxForm',forms);
	dxForm.attachEvent('onButtonClick',function(name){
			alert(name);
			 var id = dxForm.getItemValue('id');
			 var pwd = dxForm.getItemValue('pwd');
			 var pwdcheck =  dxForm.getItemValue('pwdcheck');
			 var name = dxForm.getItemValue('name');
			 var address = dxForm.getItemValue('address');
			 var birthday = dxForm.getItemValue('birthday');
			 var gender = dxForm.getItemValue('gender');
			 var hobby = dxForm.getItemValue('hobby');
			 var Recommender = dxForm.getItemValue('Recommender');
			 var desc = dxForm.getItemValue('desc');
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

	});
	
}
window.addEventListener('load',join);
</script>
<body>
<div id="dxForm" style="width:70%;height:70%"></div>
</body>
</html>