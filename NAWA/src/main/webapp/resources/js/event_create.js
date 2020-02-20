// 대표이미지 미리보기
function showPreview(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#preview").attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	
}

// 대표이미지 리셋(기본이미지로 변경)
function resetPreview(){
	var el = $('#basicfile');
    el.wrap('<form>').closest('form').get(0).reset();
    el.unwrap();
    $("#preview").attr("src","../resources/img/listing/listing-4.jpg");
}

var $j = jQuery.noConflict();

$j(function(){
	// sumbit 버튼 클릭시 editor내용을 hidden ef_con에 담김
	  $j("#eventcreate").click(function(){
		var div = document.getElementsByTagName("DIV")[30].innerHTML;
		 
    	document.getElementById('ef_con').setAttribute("value", div);
	  });
	
	  //use jQuery MultiFile Plugin 
	    $j('#createForm input[name=file]').MultiFile({
	    	max: 5, 
	        accept: 'jpg|png|gif',
	        maxfile: 1024, //각 파일 최대 업로드 크기
	        maxsize: 3024,  //전체 파일 최대 업로드 크기
	        STRING: {
	            remove : "x", 
	            duplicate : "$file 은 이미 선택된 파일입니다.", 
	            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
	            selected:'$file 을 선택했습니다.', 
	            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
	            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
	            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
	        },
	        list:"#filelist" 
	    });
	    
	    $j('#createForm').ajaxForm({
	        dataType:"json",
	        success: function(data){
	            // eventDetail로 화면 넘기기 
	            alert(data);
	          location.href="../event/detail?ef_id="+data;
	        },
	        //ajax error
	        error: function(e){
	            alert("이벤트 개설 실패");
	            console.log(e);
	        }                               
	     });

});

var toolbarOptions = [
	  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
	  ['blockquote', 'code-block'],
	  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
	  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
	  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

	  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
	  [{ 'font': [] }],
	  [{ 'align': [] }],
	  ['clean']                                         // remove formatting button
	];

	var quill = new Quill('#editor', {
	  modules: {
	    toolbar:  toolbarOptions 
	  },
	theme: 'snow'
	});