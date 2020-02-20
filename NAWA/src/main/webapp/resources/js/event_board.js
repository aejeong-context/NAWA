
		$(document).ready(function(){
			//alert("작동");
			getReviewList();
			getInquiryList();
		});
		var ef_id = document.getElementById("ef_id").value;
		var ep_auth = document.getElementById("ep_auth").value;
		var mi_nck = document.getElementById("mi_nck").value;


		// 문의 ------------------------------------
		// 문의 리스트
		 function getInquiryList(){


          $.ajax({
              type:'get',
              url : "../ask/list",
              data : {"ef_id":ef_id},
              success : function(data){
                 var html = "";

                 $.each(data, function(key,value) {
                 
                    if(data.dto.length> 0){
                         
                         for(i=0; i<data.dto.length; i++){
                            var content=data.dto[i].eb_con;
                            var nck = data.dto[i].mi_nck;
                            var seq = data.dto[i].eb_seq;
                            var profile = data.dto[i].fi_storedname;
                            
                            
                            if (data.dto[i].eb_step==0) {
                             html +="<div class='media media-comment' id='inquiry1"+seq+"'>";
                             html +="<div class='media-left'>"; 
                             html +="<img src='../upload/"+profile+"' class='media-object img-circle'>";
                             html +="</div>";
                            html +="<div class='media-body'>";
                            html +="<h4 class='media-heading'>"+data.dto[i].mi_nck+"</h4>";
                            html +=   "<p>"+data.dto[i].eb_con+"</p>";
                     if(mi_nck==nck){
                    	 	
                            html += "<a onclick='upInquiry(\""+seq+"\",\""+nck+"\",\""+content+"\")' class='modify"+seq+"' style='margin-right:5px;'>수정</a>&nbsp;";
                            html += "<a onclick='delInquiry("+data.dto[i].eb_seq+","+data.dto[i].eb_step+","+data.dto[i].eb_refer+")' class='delete"+seq+"'>삭제</a>&nbsp;";
                           
                     }else if (ep_auth=='F') {
                               html += "<a onclick='replyInquiry("+seq+")' class='reply"+seq+"'>답변</a>&nbsp;";
                            }
                            html +=   "</div>";
                            html += "<div id='replyForm"+seq+"' style='margin-left:20px;'></div>";
                            html += "</div>";
                         }else if(data.dto[i].eb_step=="1"){
                            html += "<div class='media media-comment' style='margin-left:20px;' id='inquiry1"+seq+"'>";
                            html +="<div class='media-left'>"; 
                            html +="<img src='../upload/"+profile+"' class='media-object img-circle'>";
                            html +="</div>";
                            html += "<div class='media-body'>";
                           html += "<h4 class='media-heading'>"+data.dto[i].mi_nck+"</h4>";
                             html += "<p>"+data.dto[i].eb_con+"</p>";
                        if (mi_nck==nck) {
                        html += "<a class='modify"+seq+"' onclick='upInquiry(\""+seq+"\",\""+nck+"\",\""+content+"\")' style='margin-right:5px;'>수정</a>&nbsp;";
                        html += "<a onclick='delInquiry("+data.dto[i].eb_seq+","+data.dto[i].eb_step+","+data.dto[i].eb_refer+")'>삭제</a>&nbsp;";
                        }
                        html += "</div>";
                        html += "<div id='replyForm"+seq+"' style='margin-left:20px;'></div>";
                         html += "</div>";
                      }
                         }
                     } else {
                         html += "<div style='padding-top: 20px;'>"; 
                         html += "<div><h6>등록된 문의가 없습니다.</h6>";
                         html += "</div>";
                         html += "</div>";
                         
                     }

                 }); 
                  

                 $("#insertquiryList").html(html);
                  
              },
              error:function(request,status,error){
                  
             }
              
          });
      }

		//문의 작성 
		function inQuiry(){
			if (mi_nck!="") {
				
		    $.ajax({
		        type:'post',
		        url : "../ask/write",
		        data:$("#insertInquiry").serialize(),
		        success : function(data){
		                $("#inquiry").val("");
		                getInquiryList();
		            
		        },
		        error:function(request,status,error){
		           alert("문의작성에 실패하였습니다.");
		       }
		        
		    });
		    
			}else{
				alert("문의 작성은 로그인 후 작성 가능합니다.");
				location.href="../form/login";
			}
			
			
		}

		//문의 답변 버튼 
		function replyInquiry(seq){
		   //alert(seq);
		   $('.reply'+seq).remove();
		   $('.modify'+seq).remove();
		   $('.delete'+seq).remove();
		   
		   var html ="";
		   
		   
		    html +=  "<textarea style='width: 700px' class='form-control' id='replyreview' name='eb_con' placeholder='답변을 입력하세요'></textarea><br>";
		    html += "<a onclick='replyReview(\""+seq+"\")'>등록</a>&nbsp;";
		    html += "<a onclick='inquirycancel()'>취소</a>&nbsp;";
		   
		   $('#replyForm'+seq).append(html);
		   
		}

		//문의 답변 취소 
		function inquirycancel(){
		   if (!confirm("취소 하시겠습니까?")) {
		        return;
		    }
		   alert("취소되었습니다");
		   getInquiryList();
		   
		}

		//문의 답변 
		function replyReview(seq){
		   var con = $('#replyreview').val();

		   
		   $.ajax({
		      url : "../ask/reply",
		      data :{"mi_nck":mi_nck,"eb_con":con, "eb_seq":seq,"ef_id":ef_id},
		      type : 'get',
		      dataType : 'text',
		      success : function(msg){
		         alert("답변이 등록되었습니다");
		         getInquiryList();
		         
		      },
		      error:function(){
		         alert("에러");
		      }
		   });
		   
		}

		//문의 수정 버튼
	      function upInquiry(seq,nck,content) {
	         
	         var html = "";
	         html += "<div id='replyForm"+seq+"'>";
	          html += "<div class='formSection formSpace'>";
	          html += "<div class='form-group'>";
	          html += "<textarea class='form-control' placeholder='Comment' id='inquiry'>"+content+"</textarea>";
	          html += "</div>";
	          html += "</div>";
	          html += "</div>";
	          html += "<div style='float:right;'>";
	          html += "<a onclick='modifyInquiry(\""+seq+"\")' style='margin-right:5px;'>수정</a>&nbsp;";
	          html += "<a onclick='modifyx()'>취소</a>&nbsp;";
	          html += "</div>";
	         $('#inquiry1'+seq).replaceWith(html);

	      }

		//문의 수정
		function modifyInquiry(seq){
		   var con = document.getElementById("inquiry").value;
		 
		   
		   $.ajax({
		      url: "../ask/modify",
		      data : {"eb_seq":seq,"eb_con":con}, 
		      type : 'get', 
		      dataType : 'text',
		      success: function(msg){
		         alert("문의가 수정되었습니다");
		         getInquiryList();
		         
		         }, 
		      error: function(){
		            alert("에러");
		         }
		   });

		}

		//문의 수정 취소
		function modifyx(){
		   if (!confirm("취소 하시겠습니까?")) {
		     return;
		 }
		   alert("취소되었습니다");
		   getInquiryList();
		   
		}
		//문의 삭제
		function delInquiry(seq,step,refer){
		   if (!confirm("삭제하시겠습니까?")) {
		        return;
		    }
		   $.ajax({
		      url: "../ask/delete",
		      data : {"eb_seq":seq,"eb_step":step,"eb_refer":refer}, 
		      type : 'get', 
		      dataType : 'text',
		      success: function(msg){
		      //   alert(msg);
		         getInquiryList();
		         alert("삭제되었습니다");

		         }, 
		      error: function(){
		            alert("에러");
		         }
		   });
		} 
		// 후기 ------------------------------------


		//후기 리스트
		function getReviewList(){

		    $.ajax({
		        type:'get',
		        url : "../review/list",
		        data : {"ef_id":ef_id},
		        success : function(data){
		           var html = "";
		            $.each(data, function(key,value) {
		                   //   alert(data.dto[0].ef_id);
		                    //  alert(data.dto.length);
		                    //  alert('key:' + key + ':' + 'value:' + value);
		                    //  alert(data.dto[0].mi_nck);
		                      if(data.rdto.length> 0){
		                    	  
		                           for(i=0; i<data.rdto.length; i++){
		                              var content=data.rdto[i].eb_con;
		                              var nck = data.rdto[i].mi_nck;
		                              var seq = data.rdto[i].eb_seq;
		                              
		                              html += "<li id='review1"+seq+"'>";
		                              html += "<p><strong>"+nck+"</strong></p>";
		                              html += "<span class='pull-left'>"+content+"</span>";
		                              if (mi_nck==nck) {
		                              html += "<span class='pull-right'><a onclick='delReview("+seq+")' style='text-decoration: none;'>삭제</a></span> ";
		                              
		                              html += "<span class='pull-right'><a onclick='upReview(\""+seq+"\",\""+nck+"\",\""+content+"\")' style='text-decoration: none;'>수정</a>&nbsp;&nbsp;</span>";
		                              }                              
		                              html += "</li>";
		                           }
		                       } else {
		                          html += "<li>";
		                          html += "<span class='pull-left'><h6>등록된 후기가 없습니다.</h6></span>";
		                          html += "</li>";
		                       }

		                   });
		            
		                   $("#insertreviewList").html(html);
		                   
		                },
		                error:function(request,status,error){
		                    
		               }
		    });
		}


		//후기 작성 
		function inReview(){
		    
		    $.ajax({
		        type:'post',
		        url : "../review/write",
		        data:$("#insertReview").serialize(),
		        success : function(data){
		                $("#review").val("");
		                getReviewList();
		            
		        },
		        error:function(request,status,error){
		           alert("에러");
		       }
		        
		    });
		}

		//후기 삭제
		function delReview(seq){
		    if (!confirm("삭제하시겠습니까?")) {
		      return;
		  }
		    $.ajax({
		       url: "../review/delete",
		       data : {"eb_seq":seq}, 
		       type : 'POST', 
		       dataType : 'text',
		       success: function(seq){
		          getReviewList();
		          alert("후기가 삭제되었습니다");

		          }, 
		       error: function(){
		             alert("후기 삭제를 하지 못했습니다.");
		          }
		    });
		    
		 }
		 
		//후기 수정 버튼 
		function upReview(seq,nck,content){
		   
		   var html = "";
		   html += "<li id='reviewForm"+seq+"'>";
		   html += "<textarea class='form-control' style='margin-bottom: 10px; width: 261px; height: 74px;' id='upreview'>"+content+"</textarea>";
		   html += "<span class='pull-right'><a onclick='updatecancel()'>취소</a></span> ";
		   html += "<span class='pull-right'><a onclick='modifyReview(\""+seq+"\")'>수정</a>&nbsp;&nbsp;</span>";
		   
		   $('#review1'+seq).replaceWith(html);
		   
		}

		//후기 수정 취소
		function updatecancel(){
		   if (!confirm("취소 하시겠습니까?")) {
		     return;
		 }
		   alert("취소되었습니다");
		   getReviewList();
		   
		}


		//후기 수정
		function modifyReview(seq){
		   //alert(seq);
		   var con =document.getElementById("upreview").value;
		   //alert(con);
		   
		   $.ajax({
		      url: "../review/modify",
		      data : {"eb_seq":seq,"eb_con":con}, 
		      type : 'get', 
		      dataType : 'text',
		      success: function(msg){
		         alert("후기가 수정되었습니다");
		         getReviewList();
		         }, 
		      error: function(){
		            alert("에러");

		            
		         }
		      
		   });
		}