<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script>
function searchGenres(){
	$.ajax({
		url: "genrePagination",
		data:{
			searchString: $('#searchString').val(),
			pageNo: $('#pageNumber').val()
		}
	}).done(function (data){
		$('#genresTable').html(data)
	})
}

function pagination(page){
	$('#pageNumber').val(page)
	$.ajax({
		url: "genrePagination",
		data:{
			pageNo: page,
			searchString: $('#searchString').val()
		}
	}).done(function (data){
		$('#genresTable').html(data)
	})
}

function deleteGenre(genreId){
	$.ajax({
		url: "deletegenre",
		type:'POST',
		data:{
			genreId: genreId,
			pageNo:$('#pageNumber').val(),
			searchString: $('#searchString').val()
		}
	}).success(function(data){
		$('#genresTable').html(data)
		alert("Genre Deleted")
	})
}

</script>

<%@include file="header.jsp" %>
<div class="container">
	<div class ="box">
		<h1>Genres</h1>
		<div class="row">
			<div class="col-lg-6">
	    		<div class="input-group">
	      			<input type="text" id ="searchString" name="searchString" class="form-control" placeholder="Search for..." oninput="searchGenres()">
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
			<a data-toggle="modal" data-target="#createGenreModal"
					href="creategenre">New Genre</a>
		</div>
		
		<table id="genresTable" class ="table">
				<tr>
					<th>Genre ID</th>
					<th>Genre Name</th>
					<th>Edit Genre</th>
					<th>Delete Genre</th>
				</tr>
				<gcit:forEach var="g" items="${genres}">
				<tr>
					<td>${g.genreId}</td>
					<td>${g.genreName}</td>
					<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#editGenreModal"
						href="editgenre?genreId=${g.genreId}">Edit</button></td>
						<td><button id="deleteButton" class="btn btn-danger" type="button" onclick= "deleteGenre(${g.genreId})">Delete</button></td>
				</tr>
			</gcit:forEach>
		</table>
	</div>
</div>
<input type="hidden" id="pageNumber" name="pageNumber" value="1">

<div class="modal fade bs-example-modal-lg" tabindex="-1"
	id="createGenreModal" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content"></div>
	</div>
</div>

<div class="modal fade bs-example-modal-lg" tabindex="-1"
	id="editGenreModal" role="dialog" aria-labelledby="myLargeModalLabel">
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