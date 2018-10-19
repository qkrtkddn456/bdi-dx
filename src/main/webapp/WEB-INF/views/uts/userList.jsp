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
	<button name="update">수정</button>
	<button name="del">삭제</button>
	<button name="join">회원가입</button>
	<button name="login">로그인</button>
	
</body>
<script>
document.getElementByName("update").addEventListener("click", update);
document.getElementByName("delete").addEventListener("click", del);

function update(){
	au.send({url:'/uts',success:function(res){
		res = JSON.parse(res); 
		dxGrid.parse(res,'js');
	}});
}
function del(){
	var ind1=window.prompt('Row[index] to delete','0');
	if (ind1 === null) return;
	dxGrid.deleteRow(dxGrid.getRowId(ind1))
}

</script>
</html>