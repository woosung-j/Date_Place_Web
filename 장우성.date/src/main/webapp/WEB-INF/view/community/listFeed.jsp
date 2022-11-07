<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
	<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
   	<link rel="stylesheet" href="../../res/mobile.css" />
   	<script>
    	function feedList() {
    		$('#feedList').empty()
    		
    		$.ajax({
    			url: 'getFeeds',
    			method: 'get',
    			contentType: 'application/json',
    			success: (feeds) => {
	    		 	 if(feeds.length) {
	    				const feedList = []
	    				$.each(feeds, (i, item) => {
	    					const tagList = []
	    					
	    					if(!item.hashtag.length == 0) {
		    					$.each(item.hashtag, (i, item) => {
		    						tagList.push(
		    						`<span class="badge badge-secondary badge-pill">\${item.tag}</span>`
		    						)
		    					})
	    					} 
	    					
	    					feedList.unshift(
	    						`<div class="card mb-3">
	    							<div class="card-header row-11">
	                                <div class="text_output">
	                                    <div class="row">
	                                        <span class="col-8"><i class="fas fa-user-circle fa-2x"></i>&nbsp;\${item.nickname}</span>
	                                        <span class="col-4">\${item.createdAt}</span>
	                                    </div>
	                                    <h6 class="card-title"><br/>\${item.title}</h6>
	                                    <p class="card-text">\${item.content}</p>
	                                    \${tagList.join('')}
	                                </div>
	                                <div class="card-footer">
	                                    <p style="text-align: left"><i class="fas fa-heart">&nbsp;0</i>&nbsp;&nbsp;<i class="fas fa-comment">&nbsp;0</i></p>
	                                </div>
	                            </div>
	                          </div>`
	    					) 
	    				})
	    				$('#feedList').append(feedList.join(''));
	    			} else {
	    				$('#feedList').append('<p class="text-center">게시글이 없습니다.</p>')
	    			}   
	    		}
	    	})
	    }
    	$(() => {
    		feedList()
    	})
   		</script>
    	<style>
            #top{
                margin-top: 80px;
            }

            .write {
                position: fixed;
                right: 5%;
                bottom: 15%;
            }

            .badge {
                margin-right: 10px;
            }

            .text_output {
                margin-bottom: 10px;
            }

            .icon.main:hover {
                color: #ff5858;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <header class="row w-auto p-1 bg-light fixed-top shadow">
                <div class="col align-middle">
                    <h4 class="text-center font-gamja-flower">커뮤니티</h4>
                </div>
            </header>
           <a href="detailFeed" style="color: inherit; text-decoration: none">
                <div class="list" id="top">
                    <div class="commmunity row mt-4">
                        <div class="col w-auto" id="feedList">
                        </div>
                    </div>
                </div>
            </a>

            <div class="write">
                <a href="add" class="btn w-auto" type="button">
                    <i class="fas fa-pen-square fa-3x" style="color: #ff5858"></i>
                </a>
            </div>
        </div>
        <div class="pb-5 mb-3"></div>
        <div class="navbar">
            <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
                <li>
                    <a href="/" class="btn w-auto" type="button">
                        <i class="icon main bi-house-door-fill fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="/" class="btn w-auto" type="button">
                        <i class="icon main bi-file-earmark-text fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="place/around" class="btn w-auto" type="button">
                        <i class="icon main bi-map fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="place/myplace" class="btn w-auto" type="button">
                        <i class="icon main bi-heart fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="user/login" class="btn w-auto" type="button">
                        <i class="icon main bi-person-fill fa-3x"></i>
                    </a>
                </li>
            </ul>
        </div>
    </body>
</html>