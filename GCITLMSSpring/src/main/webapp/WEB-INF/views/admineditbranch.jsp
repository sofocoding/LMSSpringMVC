<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">Edit Branch Details</h4>
</div> 
<div class="box">
	<form action="admineditbranch" method="post">
		<div class="row"> 
			<input type="hidden" name="branchId" value="${branch.branchId}">
			<label>Branch Name </label><input class="input-sm" type="text" name="branchName" value="${branch.branchName}">
			<br>
			<label>Branch Address </label><input class="input-sm" type="text" name="branchAddress" value="${branch.branchAddress}">
		</div><br> 
		<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Edit Branch</button>
	</div>
	</form>
</div>