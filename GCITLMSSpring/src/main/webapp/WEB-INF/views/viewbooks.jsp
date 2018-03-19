<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="header.jsp" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script>
function searchBooks(){
	$.ajax({
		url: "bookPagination",
		data:{
			searchString: $('#searchString').val(),
			pageNo: $('#pageNumber').val()
		}
	}).done(function (data){
		$('#booksTable').html(data)
	})
}
function pagination(page){
	console.log(page)
	$('#pageNumber').val(page)
	$.ajax({
		url: "bookPagination",
		data:{
			pageNo: page,
			searchString: $('#searchString').val()
		}
	}).done(function (data){
		$('#booksTable').html(data)
	})
}
function deleteBook(bookId){
	console.log(bookId)
	$.ajax({
		url: "deletebook",
		type:'POST',
		data:{
			bookId: bookId,
			pageNo:$('#pageNumber').val(),
			searchString: $('#searchString').val()
		}
	}).success(function(data){
		$('#booksTable').html(data)
		alert("Book Deleted")
	})
}
</script>




<div class="container">
	<div class ="box">
		<h1>Books</h1>
		<div class="row">
			<div class="col-lg-6">
	    		<div class="input-group">
	      			<input type="text" id ="searchString" name="searchString" class="form-control" placeholder="Search for..." oninput="searchBooks()">
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
			<a data-toggle="modal" data-target="#createBookModal"
					href="createbook">New Book</a>
		</div>
		
		<table class="table" id="booksTable">
				<tr>
					<th>Book ID</th>
					<th>Title</th>
					<th>Author(s)</th>
					<th>Publisher</th>
					<th>Genre(s)</th>
				</tr>
				<gcit:forEach var="b" items="${books}">
					<tr>
						<td>${b.bookId}</td>
						<td>${b.title}</td>
						<td>
							<gcit:forEach var="a" items="${b.authors}">
								'${a.authorName}'
							</gcit:forEach>
						</td>
						<td>${b.publisher.publisherName}</td>
						<td>
							<gcit:forEach var="g" items="${b.genres}">
								'${g.genreName}'
							</gcit:forEach>
						</td>
						<td><button type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#editBookModal"
					href="editbook?bookId=${b.bookId}">Edit</button></td>
					<td><button class="btn btn-danger" type="button" onclick= "deleteBook(${b.bookId})">Delete</button></td>
					</tr>
				</gcit:forEach>
		</table>
	</div>
</div>
<input type="hidden" id="pageNumber" name="pageNumber" value="1">

<div class="modal fade bs-example-modal-lg" tabindex="-1"
	id="createBookModal" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content"></div>
	</div>
</div>

<div class="modal fade bs-example-modal-lg" tabindex="-1"
	id="editBookModal" role="dialog" aria-labelledby="myLargeModalLabel">
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