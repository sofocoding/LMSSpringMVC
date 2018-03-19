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
	<form action="editbranch" method="post">
		<input type="hidden" name="branchId" id="branchId" value="${branch.branchId}">
		<label>Branch Name: </label><input id="branchName" name="branchName" class="input-sm" value="${branch.branchName}"></br>
		<label>Branch Address: </label><input id="branchAddress" name="branchAddress" class="input-sm" value="${branch.branchAddress}">
		<br>
		<div>
			<label>Add Books to Branch</label>
			<br>
			<select class="input-lg" name="addBooks[]" multiple="multiple">
				<gcit:forEach var="b" items="${books}">
					<option value="${b.bookId}">${b.title}</option>
				</gcit:forEach>
			</select>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="submit" class="btn btn-primary">Edit Branch</button>
		</div>
	</form>
</div>

