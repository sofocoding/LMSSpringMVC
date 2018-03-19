<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/custom-functions" prefix="cg" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">Edit Book Details</h4>
</div> 
<div class="box">
	<form action="editbook" method="post">
		<div class="row"> <label>Title: </label><input class="input-sm" type="text" name="bookName" value="${book.title}">
		<input type="hidden" name="bookId" value="${book.bookId}"></div></br>
		 <div class="row"><label>Book Publisher: </label>
			<select name="publisherId">
				<option value="0">Select a Publisher</option>
				<gcit:forEach var="p" items="${publishers}">
					<gcit:if test="${p.publisherId == book.publisher.publisherId}">
						<option value="${p.publisherId}" selected>${p.publisherName}</option>
					</gcit:if>
					<gcit:if test="${p.publisherId != book.publisher.publisherId}">
						<option value="${p.publisherId}">${p.publisherName}</option>
					</gcit:if>
				</gcit:forEach>
			</select>
		</div><br>
		<div class="row"><label>Book Author(s): </label><br>
			<select class="input-sm" name="authorId[]" multiple="multiple">
				<gcit:forEach var="a" items="${authors}">
					<gcit:if test="${cg:contains(book.authors, a)}">
						<option value="${a.authorId}" selected>${a.authorName}</option>
					</gcit:if>
					<gcit:if test="${!cg:contains(book.authors, a)}">
						<option value="${a.authorId}">${a.authorName}</option>
					</gcit:if>	
				</gcit:forEach>
			</select>
		</div></br>
		<div class="row"><label>Book Genre(s): </label></br>
			<select class="input-sm" name="genreId[]" multiple="multiple">
				<gcit:forEach var="g" items="${genres}">
					<gcit:if test="${cg:contains(book.genres, g)}">
						<option value="${g.genreId}" selected>${g.genreName}</option>
					</gcit:if>
					<gcit:if test="${!cg:contains(book.genres, g)}">
						<option value="${g.genreId}">${g.genreName}</option>
					</gcit:if>
				</gcit:forEach>
			</select>
		</div></br>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Edit Book</button>
	</div>
	</form>
</div>