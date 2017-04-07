<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="../css/bootstrap.css" rel="stylesheet">
<script src="../jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!--<script src="jquery3.1.1.js"></script>-->
<script type="text/javascript">
	var xhttp = new XMLHttpRequest()
	checkpwd = function() {
		$('#password2').blur(function() {
			var pwd = $('#password').val()
			var pwd2 = $('#password2').val()
			if (pwd != pwd2) {
				alert('密碼不同');
			}
		})
	}

	checklong = function() {
		$('#password').blur(function() {
			var pwd = $('#password').val()
			if (pwd.length < 10) {
				alert('長度不足');
			}
		}

		)
	}

	checkProd = function() {
		$('#prod_name')
		.blur(
			function() {
				var newid = document.getElementById('prod_name').value;

				$
						.ajax({
							url : 'http://localhost:8080/RedLine/pages/CheckId.jsp?txtProdText='
									+ newid,
							type : 'get',
							success : doSuccess,
							error : doError
						});

			});
	}
	function doSuccess(json) {
		$('#here4').html(json);
	}

	function doError(json) {
		$('#here4').html(json);
	}

	$(document).ready(function() {
		//checklong();
		checkpwd();
		checkProd();
	}

	);//end of ready

	function checkId() {
		var newid = document.getElementById('user_Name').value;
		var here = document.getElementById('here')

		xhttp.open('GET', 'CheckId.jsp?txtNameText=' + newid, true); //true 為非同步
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var here = document.getElementById('here')
				here.innerHTML = this.responseText;
			}
		}

		xhttp.send();
	}

	var pwd = $('#txtPwdText').value;

	function clearForm() {
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "text") {
				inputs[i].value = "";
			}
		}
	}
</script>

<title>Jacky Big Company</title>

</head>
<body>
<div style="width: 400px; margin: 20px auto;" data-role="page">
    <div data-role="content">
        <form action='<c:url value="/pages/customer.controller" />' method='get'>
            <div data-role="fieldcontain" class="form-group">
                <label for="id">Id</label>
                <input class="form-control input-sm" type="text" name="id" id="id" value="${param.id}" />
            </div>
            <div data-role="fieldcontain" class="form-group" >
                <label for="txtNameText">請輸入帳號資料</label>
                <input class="form-control input-sm" type="text" name="user_Name" id="user_Name"  
                value="${param.user_Name}" placeholder="請輸入帳號" onblur="checkId()" required/>
                <div id='here' float="left"></div>
            </div>

            <div data-role="fieldcontain" class="form-group">
                <label for="txtPwdText"> 請輸入帳號密碼 </label>
                <input class="form-control input-sm" type="password" name="password" id="password" value="${param.password}" placeholder="請輸入密碼" />
            </div>
            <div data-role="fieldcontain" class="form-group">
                <label for="txtPwdText2">請再輸入帳號密碼</label>
                <input class="form-control input-sm" type="password" name="password2" id="password2" value="${param.password}" placeholder="請再輸入密碼" />
            </div>

            <div data-role="fieldcontain" class="form-group">
                <label for="txtEmailText"> email: </label>
                <input class="form-control input-sm" type="text" name="email" id="email" value="${param.email}" placeholder="email" />
            </div>

            <div data-role="fieldcontain" class="form-group">
                <label for="txtAddressText"> 地址:</label>
                <input class="form-control input-sm" type="text" name="address" id="address" value="${param.address}" placeholder="Address" />
            </div>

            <div data-role="fieldcontain" class="form-group">
                <label for="txtBirthText"> birthday : </label>
                <input class="form-control input-sm" type="date" name="birthday" id="birthday" value="${param.birthday}" placeholder="Address" />
            </div>
            <div data-role="fieldcontain" class="form-group">
                <label for="txtProdText"> Product Name :</label>
                <input class="form-control input-sm" type="text" name="prod_name" id="prod_name" value="${param.prod_name}" placeholder="產品名稱" required />
            <div id='here4' hidden="true" >...</div>
            </div>
            <div data-role="fieldcontain" class="form-group">
                <label for="txtTelText"> 電話 : </label>
                <input class="form-control input-sm" type="text" name="tel" id="tel" value="${param.tel}" placeholder=" (02) 123456789" />
            </div>
            <div data-role="fieldcontain" class="form-group">
                <label for="txtMobileText">行動電話：</label>
                <input class="form-control input-sm" type="text" name="mobile" id="mobile" value="${param.mobile}" placeholder=" (09XX) 123456789" />
            </div>
            <div class="form-group">
                <label for="rdoStyle">選擇版型：</label>
            	<div class="btn-group" data-toggle="buttons">
	                <label class="btn btn-default"><input type="radio" name="style" id="rdoPet1" value="1">標準版</label>
	                <label class="btn btn-default"><input type="radio" name="style" id="rdoPet2" value="2">四分格</label>
	                <label class="btn btn-default"><input type="radio" name="style" id="rdoPet3" value="3">9宮格</label>
                </div>
            </div>
            <div data-role="fieldcontain" class="form-group">
                <label for="brand_desc"> 品牌故事 :</label>
                <textarea rows="10" wrap="Soft" name="brand_desc" id="brand_desc" data-mini="true" class="form-control">${param.brand_desc}</textarea> 
            </div>
            <div class="form-group">
                <div class="btn-group btn-group-sm">
                    <input type="submit" name="prodaction" value="Insert" class="btn btn-danger">
                    <input type="button" value="清除" onClick="clearForm()" class="btn btn-danger">
                </div>
            </div>
        </form>
    </div>
    <!-- page content -->
</div>
<!-- page -->
<script src="../jquery.js"></script>
</body>
</html>