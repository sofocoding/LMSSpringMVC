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
	<h4 class="modal-title" id="myModalLabel">Add Copies of ${book.title} to ${branch.branchName})</h4>
</div> 
<form action="addbookcopies" method="post">
<div class="box">
<label>Number of Copies: </label><input type="number" value="0" min="0" max="3" name="copies" id="copies" class="input-sm">
<input type="hidden" id="bookId" name="bookId" value="${book.bookId}">
<input type="hidden" id="branchId" name="branchId" value="${branch.branchId}">
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Add Copies</button>
	</div>
</form>
