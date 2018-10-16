<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
<style>
#layDiv{
	margin : auto 0px;
	width:100%;
	height:100%;
}
</style>
<script>
	var dxLayDiv;
	function doInit(){
		dxLayDiv = new dhtmlXLayoutObject('layDiv','3L');
		dxLayDiv.cells('a').setText('<button>Menu</button>');
		dxLayDiv.cells('b').setText('Header Grid');
		dxLayDiv.cells('c').setText('Item Grid');
	}
	window.addEventListener('load',doInit);
</script>
</head>
<body>
	<div id="layDiv"></div>
</body>
</html>