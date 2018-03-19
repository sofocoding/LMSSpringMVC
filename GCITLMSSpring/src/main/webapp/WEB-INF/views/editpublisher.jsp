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
	<h4 class="modal-title" id="myModalLabel">Edit Publisher Details</h4>
</div> 
<div class="box">
	<form action="editpublisher" method="post">
		<div class="row"> 
			<input type="hidden" name="publisherId" value="${publisher.publisherId}">
			<label>Publisher Name </label><input class="input-sm" type="text" name="publisherName" value="${publisher.publisherName}"><br>
			<label>Publisher Address </label><input class="input-sm" type="text" name="publisherAddress" value="${publisher.publisherAddress}"><br>
			<label>Publisher Phone </label><input class="input-sm" type="text" name="publisherPhone" value="${publisher.publisherPhone}">
		</div></br> 
		<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Edit Publisher</button>
	</div>
	</form>
</div>