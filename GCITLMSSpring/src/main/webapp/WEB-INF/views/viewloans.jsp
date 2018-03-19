<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script>
function searchLoans(){
	$.ajax({
		url: "loanpagination",
		data:{
			searchString: $('#searchString').val(),
			pageNo: $('#pageNumber').val()
		}
	}).done(function (data){
		$('#loansTable').html(data)
	})
}

function pagination(page){
	$('#pageNumber').val(page)
	$.ajax({
		url: "loanpagination",
		data:{
			pageNo: page,
			searchString: $('#searchString').val()
		}
	}).done(function (data){
		$('#loansTable').html(data)
	})
}

function extendLoan(borrowerId, bookId, branchId, dateOut){
	$.ajax({
		url: "extendloan",
		data:{
			borrowerId: borrowerId,
			bookId: bookId,
			branchId: branchId,
			dateOut: dateOut,
			pageNo: $('#pageNumber').val()
		}
	}).done(function (data){
		$('#loansTable').html(data)
	})
}

</script>


<%@include file="header.jsp" %>
<div class="container">
	<div class ="box">
		<h1>Book Loans</h1>
		<div class="row">
			<div class="col-lg-6">
	    		<div class="input-group">
	      			<input type="text" id ="searchString" name="searchString" class="form-control" placeholder="Card No" oninput="searchLoans()">
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
		<table class="table" id ="loansTable">
			<tr>
				<th>Card No</th>
				<th>Borrower Name</th>
				<th>Book Title</th>
				<th>Library Branch</th>
				<th>Date Out</th>
				<th>Date In</th>
				<th>Due Date</th>
				<th>Override Due Date</th>
			</tr>
			<gcit:forEach var="l" items="${loans}">
			<tr>
				<td>${l.borrower.cardNo}</td>
				<td>${l.borrower.name}</td>
				<td>${l.book.title}</td>
				<td>${l.branch.branchName}</td>
				<td>${l.dateOut}</td>
				<td>
				<gcit:if test="${l.dateIn != null}">
					${l.dateIn}
				</gcit:if>
				</td>
				<td>${l.dateOut}</td>
				<gcit:if test="${l.dateIn == null}">
					<td><button class="btn btn-primary" type="button" onclick="extendLoan(${l.borrower.cardNo},${l.book.bookId},${l.branch.branchId},'${l.dateOut}')">Add Days</button></td>
				</gcit:if>
			</tr>
			</gcit:forEach>
		</table>
	</div>
</div>
<input type="hidden" id="pageNumber" name="pageNumber" value="1">
<%@include file="footer.jsp" %>