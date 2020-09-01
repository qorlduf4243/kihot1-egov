<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
    function onloading() {
        if ("<c:out value='${msg}'/>" != "") {
            alert("<c:out value='${msg}'/>");
        }
    }
    
    function fn_egov_select_noticeList(pageNo) {
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/admin/board/selectBoard.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_delete_notice() {
        if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
            alert('등록시 사용한 패스워드를 입력해 주세요.');
            document.frm.password.focus();
            return;
        }
        
        if (confirm('<spring:message code="common.delete.msg" />')) {
            document.frm.action = "<c:url value='/admin/board/deleteBoard.do'/>";
            document.frm.submit();
        }   
    }
    
    function fn_egov_moveUpdt_notice() {
        if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
            alert('등록시 사용한 패스워드를 입력해 주세요.');
            document.frm.password.focus();
            return;
        }

        document.frm.action = "<c:url value='/admin/board/UpdateBoard.do'/>";
        document.frm.submit();          
    }
    
    function fn_egov_addReply() {
        document.frm.action = "<c:url value='/admin/board/insertReply.do'/>";
        document.frm.submit();          
    }   
</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-12">
					<h1 class="m-0 text-dark">DashBoard Management</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-12">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Starter Page</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
		<div class="col-md-12">
			<!-- general form elements disabled -->
			<div class="card card-warning">
				<div class="card-header">
					<h3 class="card-title">READ BOARD</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form name="frm" method="post" action="<c:url value='/admin/board/selectBoard.do'/>">
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
					<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
					<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
					<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
					<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
					<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
					<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
					<input type="submit" id="invisible" class="invisible"/>
						<div class="row">
							<div class="col-sm-12">
								<!-- text input -->
								<div class="form-group">
									<label>제목</label>
									<input value="${result.nttSj}" type="text" class="form-control"
										placeholder="" readonly="">
								</div>
							</div>

							<div class="col-sm-12">
								<!-- text input -->
								<div class="form-group">
									<label>글내용</label>
									<textarea class="form-control" rows="3"
										placeholder="" readonly="">${result.nttCn}</textarea>
								</div>
							</div>

							<div class="col-sm-4">
								<!-- text input -->
								<div class="form-group">
									<label>작성자</label> 
									<input value="${result.frstRegisterId}" type="text" class="form-control"
										placeholder="" readonly="">
								</div>
							</div>
							<div class="col-sm-4">
								<!-- text input -->
								<div class="form-group">
									<label>작성시간</label> 
									<input value="${result.frstRegisterPnttm}" type="text" class="form-control"
										placeholder="" readonly="">
								</div>
							</div>
							<div class="col-sm-4">
								<!-- text input -->
								<div class="form-group">
									<label>조회수</label> 
									<input value="${result.inqireCo}" type="text" class="form-control"
										placeholder="" readonly="">
								</div>
							</div>
							<div class="buttons">
								<button type="button" onclick="javascript:fn_egov_moveUpdt_notice(); return false;" class="btn btn-warning">수정</button>
								<button type="submit" onclick="javascript:fn_egov_delete_notice(); return false;" class="btn btn-danger">삭제</button>
								<button type="button" onclick="javascript:fn_egov_select_noticeList('1'); return false;" class="btn btn-primary">목록</button>	
								<button type="button" onclick="javascript:fn_egov_addReply(); return false;" class="btn btn-info">답변</button>
							</div>
						</div>

					</form>
				</div>
				<!-- /.content-header -->


				
			</div>
		</div>
	</div>
</div>
<!-- //Content Wrapper -->

<%@ include file="../include/footer.jsp"%>
<script>
$(document).ready(function(){
	onloading();//함수명만 있으면 실행 가능.
});
</script>