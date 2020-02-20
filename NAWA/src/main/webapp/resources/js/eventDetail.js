var form = document.getElementById("FT");
//var buttons = document.getElementsByName("button");
var ef_id = document.getElementById("ef_id").value;
var mi_nck = document.getElementById("mi_nck").value;
var ef_status = document.getElementById("ef_status").value;

		function event_Close() {
			var check = confirm("폐쇄하시겠습니까?");
			if(check){
				form.action = "../event/close?ef_id="+ef_id;
				form.method = "post"
				form.submit();
			}else{
				alert("취소하셨습니다.");
			}
		}
		
		function event_Main() {
				form.action = "../event/search";
				form.method = "get";
				form.submit();
		}
		
		function event_Delete() {
			var check = confirm("삭제하시겠습니까?");
			if (check) {
				form.action = "../event/delete?ef_id="+ef_id;
				form.method = "POST"
				form.submit();
			}else{
				alert("삭제 안됨!")
			}
		}
		
		function event_Modify() {
			var check = confirm("수정하시겠습니까?");
			if (check) {
				form.action = "../event/modify?ef_id="+ef_id+"&mi_nck="+mi_nck;
				form.method = "POST"
				form.submit();
			}	
		}
		
		function event_ReCreate() {
			var check = confirm("재개설 하시겠습니까?");
			if(check && ef_status == 'C'){
				form.action = "../event/recreate?ef_id="+ef_id;
				form.method = "POST"
				form.submit();
			}else{
				alert("재개설 안됨.");
			}
			
		}
		
		function event_Enter_Search() {
			var check = confirm("참가자조회 하시겠습니까?");
			if(check){
				form.action = "../event/lineup?ef_id="+ef_id;
				form.method = "POST"
				form.submit();
			}else{
				alert("조회 안됨.");
				return false;
			}
			
		}
		
		function event_Enter_Login() {
			var check = confirm("참가 하시겠습니까?");
			if(check){
				alert("로그인을 먼저 해주세요!");
				form.action = "../form/login";
				form.method = "get";
				form.submit();
				return false;
			}else{
				alert("조회 안됨.");
				return false;
			}
			
		}
		
		//회원참가하기

		function chk() {
			var isc = confirm("이벤트에 참가하실까요?");
			if (isc == true) {
				alert("이벤트에 참가되었습니다.");
				form.action = "../event/enter?ef_id="+ef_id;
				form.method = "POST";
				form.submit();

			}else{
				alert("취소되었습니다.");
				return false;
			}

		}
		//회원 참가취소
		function eventout() {
			var isc = confirm("참가 취소하실레요?");
			if (isc == true) {
				alert("이벤트 참가 취소되었습니다.");
				form.action = "../event/exit?ef_id="+ef_id;
				form.method = "post";
				form.submit();
			}else{
				alert("오류!");
				return false;
			}
		}


		//대기 참가하기

		function echk() {
			var isc = confirm("대기참가하실까요?");
			if (isc == true) {
				alert("대기참가 되었습니다.");
				form.action = "../wait/enter?ef_id="+ef_id;
				form.method = "post";
				form.submit();
			} else {
				alert("취소되었습니다.");
				return false;
			}
		}


		//대기취소하기

		function watingOut() {
			var isc = confirm("이벤트 대기 취소하실레요?");
			if (isc == true) {
				alert("이벤트 대기 취소되었습니다.");
				form.action = "../wait/exit?ef_id="+ef_id;
				form.method = "post";
				form.submit();

			}else{
				alert("취소되었습니다.");
				return false;
			}
		}
		
		
		
		
		
		
