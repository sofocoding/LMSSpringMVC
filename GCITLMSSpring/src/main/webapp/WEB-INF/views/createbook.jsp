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
	<h4 class="modal-title" id="myModalLabel"><b>Add a New Book</b></h4>
</div> 
	<div class='box'>
		<form action="createbook" method="post">
			<div class="row"> <label><b>Book Title: </b></label><input class="input-sm" type="text" name="bookName"></div>
			<div class="row"><label>Pick Book Publisher: </label>
				<select name="publisherId">
					<option value="0"><b>Select Your Desired Publisher</b></option>
					<gcit:forEach var="p" items="${publishers}">
						<option value="${p.publisherId}">${p.publisherName}</option>
					</gcit:forEach>
				</select>
			</div>
			<div class="row"><label><b>Select Book Author(s):</b> </label><br>
				<select class="input-sm" name="authorId[]" multiple="multiple">
					<gcit:forEach var="a" items="${authors}">
						<option value="${a.authorId}">${a.authorName}</option>
					</gcit:forEach>
				</select>
			</div><br>	
			<div class="row"><label><b>Select Book Genre(s):</b> </label><br>
				<select class ="input-sm" name="genreId[]" multiple="multiple">
					<gcit:forEach var="g" items="${genres}">
						<option value="${g.genreId}">${g.genreName}</option>
					</gcit:forEach>
				</select>
			</div><br> 
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary"><b>Add Book</b></button>
		</div>
		</form>
	</div>
