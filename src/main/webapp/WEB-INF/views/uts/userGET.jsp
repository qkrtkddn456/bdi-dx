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
			{type:'input',name:'id',label:'아이디',value:'${utid}',required:true},
			{type:'password',name:'pwd',label:'비밀번호',value:'${utpwd}',required:true},
			{type:'password',name:'pwdcheck',label:'비밀번호확인',value:'${utpwd}',required:true},
			{type:'input',name:'name',label:'이름',value:'${utname}',required:true},
			{type:'input',name:'address',label:'주소',value:'${utadd}',required:true},
			{type:'calendar',name:'birthday',label:'생년월일',weekStart:'7',serverDateFormat:'yyyy-mm-dd',value:'${utbd}',required:true},
			{type:'label',label:'성별',list:[
				{type:'radio',name:'gender',label:'남자',},
				{type:'radio',name:'gender',label:'여자',}]},
			{type:'input',name:'hobby',value:'${hb}',label:'취미'},
			{type:'input',name:'Recommender',value:'${utrd}',label:'추천인'},
			{type:'input',name:'desc',value:'${utdesc}',label:'비고',},
			{type:'button',value:'수정',name:'btnup'},
			{type:'button',value:'삭제',name:'btndel'}
		]}]
	
	var dxForm = new dhtmlXForm('dxForm',forms);
	dxForm.attachEvent('onButtonClick',function(name){
			if(name==btnup){
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
			}else if(name==btndel){
				var conf ={url:'/uts',method:'DELETE',success : function(res){
					 res = JSON.parse(res);
				}}
			}
	});
}
window.addEventListener('load',join);
</script>
<body>
<div id="dxForm" style="width:70%;height:70%"></div>
</body>
</html>