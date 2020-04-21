function updateMb(){
		if (confirm("確定更新會員資料 ? ") ) {
			document.forms[1].action="<c:url value='edit.do' />";
			document.forms[1].method="POST";
			document.forms[1].submit();
			return;
		} else {
			return;
		}
	}