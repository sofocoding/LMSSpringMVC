<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">Add a Publisher</h4>
</div> 


<div class="box">
	<form action="createpublisher" method="post">
			<label>Publisher Name:</label> <input type="text" name="publisherName"><br />
			<label>Publisher Address:</label> <input type="text" name="publisherAddress"><br />
			<label>Publisher Phone:</label> <input type="text" name="publisherPhone"><br />
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Add Publisher</button>
			</div>
	</form>
</div>

