<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <body>
  <div id="notice_div">
    <div id="app" class="container">
    	<notice-component></notice-component>
    </div>
    

    <a id="write_btn" class="btn btn-default">글쓰기</a>
    
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></ii>
		</ul>
	</div>
</div>
    <script>
	$(document).ready(function(){
		$('a#write_btn').on('click', function(){
			$.ajax({
                url:'/ajax/notice_write_ajax.jsp',
                type:'POST',
                error:function(xhr,status,e){
                       alert('Error' + e);
                },
                success: function(xml){
                    $("#notice_div").html(xml);
                }
         });
		});
	})

    var noticeComponent = {
    		template : '<table :class="tableClass"><thead>\
    						<tr>\
    							<th>번호</th>\
    							<th>제목</th>\
    							<th>작성자</th>\
    							<th>날짜</th>\
    							<th>조회수</th>\
    						</tr>\
    						</thead>\
							<tbody>\
    						<template v-for="(item, index) in items">\
    								<tr>\
    								<td>{{ item.IDX }}</td>\
    								<td>{{ item.TITLE }}</td>\
    								<td>{{ item.ID }}</td>\
    								<td>{{ item.CREA_DTM }}</td>\
    								<td>{{ item.HIT_CNT }}</td>\
    								</tr>\
    						</template>\
    						</tbody>\
    						</table>\
    				        <hr/>\
    						',
    		data: function() {
    			return {
    				items : ${noticeList},
    	        	tableClass : 'table table-striped table-hover'
    			}
    		}
    }
        
    var vm = new Vue({
        el: '#app',
        components : {
        	'notice-component' : noticeComponent
        },
    	data: {
    		tableClass:"abd"
    	}
      });
    </script>
  </body>