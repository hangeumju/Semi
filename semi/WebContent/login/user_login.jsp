<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 유져 로그인/회원가입 모달화면 구현 -->
			<form class="userform" autocomplete="off"
			action="<%=request.getContextPath() %>/login/users_login.do" 
			method="post">
				<div class="modal" onclick="closeLoginModal();">
					<!-- 모달내부 화면 -->
					<div class="modal-view" onclick="event.stopPropagation();">
						<div style="position: relative; width: 100%; height: 100%;">
							<div style="position: absolute; top: 20px; right: 20px;">
								<span class="closebtn" onclick="closeLoginModal()">&times;</span>
							</div>
							<div
								style="position: absolute; top: 50%; left: 50%; width: 300px; height: 400px; margin-left: -150px; margin-top: -200px;">
								<div style="height: 30px;"></div>
								<div style="margin: 10px 0px; color: white;">
									<p>Username</p>
									<input class="id-modal" type="text" name="id"
										style="border-bottom: 2px white solid; width: 100%;">
								</div>
								<div style="height: 5px;"></div>
								<div style="margin: 10px 0px; color: white;">
									<p>Password</p>
									<input class="pw-modal" type="password" name="pw"
										style="border-bottom: 2px white solid; width: 100%;">
								</div>
								<div style="height: 90px;"></div>
								<button class="modalbtn">로그인</button>
								<div style="height: 20px;"></div>
								<button class="modalbtn" onclick="userRegistModal()">회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			




