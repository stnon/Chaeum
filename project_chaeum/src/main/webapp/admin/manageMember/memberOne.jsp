<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
   .table-vertical {
      text-align: center;
   }
   
   .table-vertical th {
      border-right: 1px solid #CED4DA;
      vertical-align: middle;
      padding-top: 1.125rem;
       padding-right: 1.375rem;
       padding-bottom: 1.125rem;
       padding-left: 1.375rem;
       display: table-cell;
   }
   .table-vertical td {
      border-left: 1px solid #CED4DA;
      vertical-align: middle;
      padding-top: 1.125rem;
       padding-right: 1.375rem;
       padding-bottom: 1.125rem;
       padding-left: 1.375rem;
       line-height: 1;
       white-space: nowrap;
   }
   #admineditbutton {
      width: 100px; 
      height: 30px; 
      border-radius: 10px; 
      box-shadow: none; 
      border: 1px solid #a3a4a5; 
      background-color: transparent;
   }
   #admineditcell {
       border-left: 0px; 
       border-right: 0px; 
       border-top: 1px solid #CED4DA; 
       padding: 0.5rem;
   }
</style>
<div class="content-wrapper"  >
   <div style="text-align: center; width: 100%; margin-bottom: 100px; font-family: MALGUN; ">
      <h1>회원 정보 수정</h1>
   </div>
   <!-- 회원 정보 수정 시작 -->
   <div class="row" align="center" style="display: block">
      <div class="col-lg-3 grid-margin stretch-card" align="center">
         <div class="card position-relative">
            <div class="card-body" align="left">
               <h4 class="card-title" style="margin-bottom: 30px;">회원 정보 수정</h4>
               <form action="updateMember.do" method="get">
                  <table class="table-vertical">
                     <tr>
                           <th>이메일</th>
                           <td colspan="2"><input type="email" name="email"
                              value="${oneMember.email }"></td>
                        </tr>
                        
                        <tr>
                           <th>닉네임</th>
                           <td colspan="2"><input type="text" name="nickname"
                              value="${oneMember.nickname }"></td>
                        </tr>
                        <tr>
                           <th>핸드폰</th>
                           <td colspan="2"><input type="text" name="phone"
                              value="${oneMember.phone }"></td>
                        </tr>
                        <tr>
                           <th>가입날짜</th>
                           <td colspan="2"><input type="date" name="m_regdate"
                              value="${oneMember.m_regdate }" style="float: left"></td>
                        </tr>
                        <tr>
                           <th>등급</th>
                           <td colspan="2"><input type="text" name="rank"
                              value="${oneMember.rank }"></td>
                        </tr>
                        <tr>
                           <th>생일</th>
                           <td colspan="2"><input type="date" name="birth"
                              value="${oneMember.birth }" style="float: left"></td>
                        </tr>
                        <tr>
                           <th>사용여부</th>
                           <td colspan="2"><input type="text" name="m_useable"
                              value="${oneMember.m_useable }"></td>
                        </tr>
                     <tr>
                        <td id="admineditcell"><button id="admineditbutton"
                                 name="doit" value="수정">수정</button></td>
                           <td id="admineditcell"><button type="button"
                                 id="admineditbutton" name="doit" value="목록"
                                 onclick="location.href='memberList.do'">목록</button></td>
                           <td id="admineditcell"><button type="button"
                                 id="admineditbutton" name="doit" value="삭제"
                                 onclick="location.href='deleteMember.do?email=${oneMember.email }'">삭제</button></td>
                     </tr>
                  </table>                  
               </form>
            </div>
         </div>
      </div>
   </div>
</div>