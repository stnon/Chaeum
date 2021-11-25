<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script
  src="https://code.jquery.com/jquery-1.11.0.min.js"
  integrity="sha256-spTpc4lvj4dOkKjrGokIrHkJgNA0xMS98Pw9N7ir9oI="
  crossorigin="anonymous"></script>


<script>
			$(function(){
				$("#dosi").change(function(){
					var value =$("#dosi option:selected").attr("data");

					$.ajax({
						type:"post",
						url:"gu_select.php",
						data:"seq="+value,
						success:function(data){
							data=decodeURIComponent(data);
							//alert(data);
							$("#select_gu").html(data);
						},
						error: function(e){
							alert('데이터오류! 시스템 관리자에게 문의하세요');
						}
					});
				});
			});
		</script>

<script>
$(function(){
	$("#height_chk").click(function(){
		
		var chk=$(this).children().eq(1).attr("class");
		
		if(chk=="in")
		{	
			//접을 때
			$("#height_chk2").css("height","calc(100vh - 230px)");
		}
		else
		{
			//펼칠 때
			$("#height_chk2").css("height","calc(100vh - 550px)");
		}
	});
});
</script>

<div class="content-wrapper">


	<div class="col-md-5 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">To Do Lists</h4>
				<div class="list-wrapper pt-2">
					<ul class="d-flex flex-column-reverse todo-list todo-list-custom">
						<li>
							<div class="form-check form-check-flat">
								<label class="form-check-label"> <input class="checkbox"
									type="checkbox"> Meeting with Urban Team
								</label>
							</div> <i class="remove ti-close"></i>
						</li>
						<li class="completed">
							<div class="form-check form-check-flat">
								<label class="form-check-label"> <input class="checkbox"
									type="checkbox" checked> Duplicate a project for new
									customer
								</label>
							</div> <i class="remove ti-close"></i>
						</li>
						<li>
							<div class="form-check form-check-flat">
								<label class="form-check-label"> <input class="checkbox"
									type="checkbox"> Project meeting with CEO
								</label>
							</div> <i class="remove ti-close"></i>
						</li>
						<li class="completed">
							<div class="form-check form-check-flat">
								<label class="form-check-label"> <input class="checkbox"
									type="checkbox" checked> Follow up of team zilla
								</label>
							</div> <i class="remove ti-close"></i>
						</li>
						<li>
							<div class="form-check form-check-flat">
								<label class="form-check-label"> <input class="checkbox"
									type="checkbox"> Level up for Antony
								</label>
							</div> <i class="remove ti-close"></i>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>