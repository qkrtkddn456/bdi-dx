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
			{type:'input',name:'birthday',label:'생년월일',required:true},
			{type:'label',label:'성별',list:[
				{type:'radio',name:'gender',value:'남자',label:'남자',checked:true,required:true},
				{type:'radio',name:'gender',value:'여자',label:'여자',required:true}]},
			{type:'label',label:'취미',list:[
				{type:'checkbox',name:'hobby',value:'게임',label:'게임'},
				{type:'checkbox',name:'hobby',value:'독서',label:'독서'},
				{type:'checkbox',name:'hobby',value:'쇼핑',label:'쇼핑'},
				{type:'checkbox',name:'hobby',value:'영화감상',label:'영화감상'}
				]},
			{type:'input',name:'Recommender',label:'추천인',},
			{type:'input',name:'desc',label:'비고',},
			{type:'button',value:'가입',name:'btn'}   
		]}]
	var dxForm = new dhtmlXForm('dxForm',forms);
	var hb;
	dxForm.attachEvent('onButtonClick',function(){
			for(var i=0;i<4;i++){
				if(dxForm.hobby[i].checked==true){
					hb += dxForm.hobby[i].value;
				}
				
			}

			 var id = dxForm.getItemValue('id');
			 var pwd = dxForm.getItemValue('pwd');
			 var name = dxForm.getItemValue('name');
			 var address = dxForm.getItemValue('address');
			 var birthday = dxForm.getItemValue('birthday');
			 var gender = dxForm.getItemValue('gender');
			 var hobby = dxForm.getItemValue('hobby');
			 var Recommender = dxForm.getItemValue('Recommender');
			 var desc = dxForm.getItemValue('desc');
			 var conf = JSON.stringify({id:id,pwd:pwd,name:name,address:address,birthday:birthday,gender:gender,hobby:hobby,Recommender:Recommender,desc:desc});
			/* var conf = {
					url:'/uts',
					 method:'POST',
					 param : JSON.stringify({id:id,pwd:pwd,name:name,address:address,birthday:birthday,gender:gender,hobby:hobby,Recommender:Recommender,desc:desc}),
					 success : function(res){
						 res = JSON.parse(res);
						 alert(res.msg);
						}
			} */
			 alert(conf);
		  

	});
	
}
window.addEventListener('load',join);
</script>
<body>
<div id="dxForm"></div>
</body>
</html>