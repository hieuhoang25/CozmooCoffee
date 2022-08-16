<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
                        <!-- Mini Modal -->
                        <div class="modal fade modal-mini modal-primary" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header justify-content-center">
                                        <div class="modal-profile">
                                            <i class="nc-icon nc-bulb-63"></i>
                                        </div>
                                    </div>
                                    <div class="modal-body text-center">
                                        <p id="delete-mess"></p>
                                    </div>
                                    <div class="modal-footer">
                                    	<form name="delete-f" method="post" action="${path}/admin/users/delete">
                                    	<input name="deleted-id" type="hidden" value="" />
                                    	 <button id="delete-accept" type="submit" class="btn btn-simple">Xoá</button>
                                    	</form>      
                                        <button id="closed-pop" type="button" class="btn btn-link btn-simple" data-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script>
                        
                    	let deletef = $("form[name='delete-f']");
                        $('table .delete-btn').on('click',function(e) {
                        		let id = $(this).parent().find('#userid').val();
                        		document.querySelector('input[name="deleted-id"]').value = id;
                        		document.getElementById('delete-mess').innerText = `Xoá User có ID = ` + id ;
                        		
                        	});
                        
                        deletef.submit(function(event) {
                      	  event.preventDefault();
                      	  $.ajax({
                      		  type: "POST",
                	            url: path + '/admin/users/delete',
                	            data:  deletef.serialize(),
                	            dataType: "text",
                	          success: function(data){
                	        	$('#closed-pop').click();   	
            	            	demo.showNotification('top','Xoá thành công','center');
            	            	setTimeout(() => {
            	            		location.reload();
          						}, 2000);
            	            	}
                      	  });
                        });
                        </script>
                        <!--  End Modal -->
</body>
</html>
