<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">Add a Branch</h4>
</div> 

<div class="box">
	<form action="createbranch" method="post">
		<div class="row"><label>Branch Name: </label><input type="text" name="branchName"></div> <br>
		<div class="row"><label>Branch Address: </label><input type="text" name="branchAddress"></div>	<br>		 
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="submit" class="btn btn-primary">Add Book</button>
		</div>
	</form>
</div>

