



{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">编辑公告 #{$ann->id}</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-lg-push-0 col-sm-10 col-sm-push-1">
				<section class="content-inner margin-top-no">
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="content">内容</label>
									<input class="form-control" id="content" type="text" value="{$ann->content}">
								</div>
								
								
								
								
							</div>
						</div>
					</div>
					
					
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								
								<div class="form-group">
									<div class="row">
										<div class="col-md-10 col-md-push-1">
											<button id="submit" type="submit" class="btn btn-block btn-brand waves-attach waves-light">修改</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}

			</div>
			
			
			
		</div>
	</main>

	
	
	
	






{include file='admin/footer.tpl'}


<script>
    $(document).ready(function () {
        function submit() {
            $.ajax({
                type: "PUT",
                url: "/admin/announcement/{$ann->id}",
                dataType: "json",
                data: {
                    content: $("#content").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg+"  五秒后跳转。");
                        window.setTimeout("location.href='/admin/announcement'", 5000);
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误：" + jqXHR.status);
                }
            });
        }

        $("html").keydown(function (event) {
            if (event.keyCode == 13) {
                login();
            }
        });
        $("#submit").click(function () {
            submit();
        });

    })
</script>