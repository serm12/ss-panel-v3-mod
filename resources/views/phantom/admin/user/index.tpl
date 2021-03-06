{include file='admin/main.tpl'}




<div id="main">
	<div class="inner">
		<!-- Content Header (Page header) -->
		<section>
			<h1>
				用户列表
			</h1>
		</section>
		
		<div class="12u 12u$(xsmall)">
			{$users->render()}
		</div>
		
		<div class="12u 12u$(xsmall)">
			<div class="table-wrapper">
				<table>
					<tr>
						<th>ID</th>
						<th>用户名</th> 
					   <th>邮箱</th>
						<th>端口</th>
						<th>状态</th>
						<th>加密方式</th>
						<th>已用流量/总流量</th>
						<th>今日流量</th>
						<th>最后在线时间</th>
						<th>最后签到时间</th>
						<th>在线 IP 数</th>
						<th>微信号</th>
						<th>注册时间</th>
						<th>邀请者</th>
						<th>操作</th>
					</tr>
					{foreach $users as $user}
					<tr>
						<td>#{$user->id}</td>
						<td>{$user->user_name}</td>
						<td>{$user->email}</td>
						<td>{$user->port}</td>
						<td>{$user->enable}</td>
						<td>{$user->method}</td>
						<td>{$user->usedTraffic()}/{$user->enableTraffic()}</td>
						<td>{(($user->u+$user->d)-$user->last_day_t)/1024/1024}MB</td>
						<td>{$user->lastSsTime()}</td>
						<td>{$user->lastCheckInTime()}</td>
						<td><div data-trigger="hover" data-toggle="ippopover" data-placement="left" data-content="{foreach $userip[$user->id] as $singleip => $location}{$singleip} {$location}<br>{/foreach}">{$useripcount[$user->id]}</div></td>
						<th>{$user->wechat}</th>
						<th><div data-trigger="hover" data-toggle="regpopover" data-placement="left" data-content="注册IP：{$user->reg_ip}　{$regloc[$user->id]}">{$user->reg_date}</div></td></th>
						<th>{$user->ref_by}</th>
						<td>
							<a class="btn btn-info btn-sm" href="/admin/user/{$user->id}/edit">编辑</a>
							<a class="btn btn-danger btn-sm" id="delete" value="{$user->id}" href="/admin/user/{$user->id}/delete">删除</a>
						</td>
					</tr>
					{/foreach}
				</table>
			</div>
		</div>
		
		<div class="12u 12u$(xsmall)">
			{$users->render()}
		</div>
		
	</div>
</div>



<script>

    $(function() {  
		$("[data-toggle='ippopover']").popover({  
			html : true,       
			delay:{
			show:500, hide:1500
			}
		});  
    }); 

	$(function() {  
        $("[data-toggle='regpopover']").popover({  
            html : true,       
            delay:{
			show:500, hide:1500
			}
        });  
    }); 	
</script>

{include file='admin/footer.tpl'}
