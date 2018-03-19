<%@include file="header.jsp" %>
<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script>
function searchPublishers(){
	$.ajax({
		url: "publisherPagination",
		data:{
			searchString: $('#searchString').val(),
			pageNo: $('#pageNumber').val()
		}
	}).done(function (data){
		$('#publishersTable').html(data)
	})
}

function pagination(page){
	$('#pageNumber').val(page)
	$.ajax({
		url: "publisherPagination",
		data:{
			pageNo: page,
			searchString: $('#searchString').val()
		}
	}).done(function (data){
		$('#publishersTable').html(data)
	})
}

function deletePublisher(pubId){
	$.ajax({
		url: "deletepublisher",
		type:'POST',
		data:{
			publisherId: pubId,
			pageNo:$('#pageNumber').val(),
			searchString: $('#searchString').val()
		}
	}).success(function(data){
		$('#publishersTable').html(data)
		alert("Publisher Deleted")
	})
}
</script>

<div class="container">
	<div class ="box">
		<h1>Publishers</h1>
		<div class="row">
			<div class="col-lg-6">
	    		<div class="input-group">
	      			<input type="text" id ="searchString" name="searchString" class="form-control" placeholder="Search for..." oninput="searchPublishers()">
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
			<a data-toggle="modal" data-target="#createPublisherModal"
					href="createpublisher">New Publisher</a>
		</div>
		
		<table id="publishersTable" class ="table">
			<tr>
				<th>Publisher ID</th>
				<th>Publisher Name</th>
				<th>Publisher Address</th>
				<th>Publisher Phone</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<gcit:forEach var="p" items="${publishers}">
				<tr>
					<td>${p.publisherId}</td>
					<td>${p.publisherName}</td>	
					<td>${p.publisherAddress}</td>
					<td>${p.publisherPhone }</td>	
					<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#editPublisherModal"
						href="editpublisher?publisherId=${p.publisherId}">Edit</button></td>
					<td><button class="btn btn-danger" type="button" onclick= "deletePublisher(${p.publisherId})">Delete</button></td>	
				</tr>
			</gcit:forEach>
		</table>
	</div>
</div>
<input type="hidden" id="pageNumber" name="pageNumber" value="1">

<div class="modal fade bs-example-modal-lg" tabindex="-1"
	id="createPublisherModal" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content"></div>
	</div>
</div>

<div class="modal fade bs-example-modal-lg" tabindex="-1"
	id="editPublisherModal" role="dialog" aria-labelledby="myLargeModalLabel">
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