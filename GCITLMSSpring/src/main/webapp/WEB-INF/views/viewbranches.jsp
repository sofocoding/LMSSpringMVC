<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script>
function searchBranches(){
	$.ajax({
		url: "branchpagination",
		data:{
			searchString: $('#searchString').val(),
			pageNo: $('#pageNumber').val()
		}
	}).done(function (data){
		$('#branchesTable').html(data)
	})
}

function pagination(page){
	$('#pageNumber').val(page)
	$.ajax({
		url: "branchPagination",
		data:{
			pageNo: page,
			searchString: $('#searchString').val()
		}
	}).done(function (data){
		$('#branchesTable').html(data)
	})
}

function deleteBranch(branchId){
	$.ajax({
		url: "deletebranch",
		type:'POST',
		data:{
			branchId: branchId,
			pageNo:$('#pageNumber').val(),
			searchString: $('#searchString').val()
		}
	}).success(function(data){
		$('#branchesTable').html(data)
		alert("Branch Deleted")
	})
}

</script>

<%@include file= "header.jsp" %>
<div class="container">
	<div class ="box">
		<h1>Branches</h1>
		<div class="row">
			<div class="col-lg-6">
	    		<div class="input-group">
	      			<input type="text" id ="searchString" name="searchString" class="form-control" placeholder="Search for..." oninput="searchBranches()">
	    		</div><!-- /input-group -->
	 		 </div><!-- /.col-lg-6 -->
 		 </div> <!-- /row -->
 		 <nav aria-label="Page navigation">
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<gcit:forEach var="i" begin="1" end="${pages}">
					<li><a onclick="pagination(${i})">${i}</a></li>
				</gcit:forEach>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>

		<div style="padding:10px">
			<a data-toggle="modal" data-target="#createBranchModal"
					href="createbranch">New Branch</a>
		</div>
		
		<table id="branchesTable" class ="table">
			<tr>
				<th>Branch ID</th>
				<th>Branch Name</th>
				<th>Branch Address</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<gcit:forEach var="b" items="${branches}">
				<tr>
					<td>${b.branchId}</td>
					<td>${b.branchName}</td>	
					<td>${b.branchAddress}</td>
					<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#editBranchModal"
						href="admineditbranch?branchId=${b.branchId}">Edit</button></td>
					<td><button class="btn btn-danger" type="button" onclick= "deleteBranch(${b.branchId})">Delete</button></td>	
				</tr>
			</gcit:forEach>
		</table>
	</div>
</div>
<input type="hidden" id="pageNumber" name="pageNumber" value="1">

<div class="modal fade bs-example-modal-lg" tabindex="-1"
	id="createBranchModal" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content"></div>
	</div>
</div>

<div class="modal fade bs-example-modal-lg" tabindex="-1"
	id="editBranchModal" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content"></div>
	</div>
</div>
<script>
	$(document).ready(function() {
		// codes works on all bootstrap modal windows in application
		$('.modal').on('hidden.bs.modal', function(e) {
			$(this).removeData();
		});
	});
</script>
 
<%@include file="footer.jsp" %>