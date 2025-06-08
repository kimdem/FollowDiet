<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<script src="/js/valid.js"></script>
<div id="profile-modal" class="profile-modal" style="display:none;">
    <form action="edit_pwd" method="post" class="modal-form">
   	  <h2>비밀번호 변경</h2>
      <label>현재 비밀번호</label>
      <input type="password" id="pwd" name="pwd" required>
      <label>새 비밀번호</label>
      <input type="password" id="newpwd" name="newpwd" required>
      <label>새 비밀번호 확인</label>
      <input type="password" id="confirmpwd" name="confirmpwd" required>
      <div class="modal-btn">
        <button type="submit" class="modal-submit">변경</button>
        <button type="button" class="modal-back" onclick="closemodal()">취소</button>
      </div>
    </form>
</div>