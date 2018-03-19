<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script>
	function borrowerLogin(){
		$.ajax({
			url: "borrowerlogin",
			type: "POST",
			data:{
				cardNo: $(cardNo).val()
			}
		}).done(function (data){
			if (data !== 'failed'){
				var borrowerDetails = data.split("//", 2);
				$(userLogin).hide()
				$(selectBranch).show()
				$(welcomeUser).show()
				$("label[for='borrowerName']").text("Welcome " + borrowerDetails[1]);
				$('input[name="savedCardNo"]').val(borrowerDetails[0]);
				fetchLoans(borrowerDetails[0])
			} else{
				alert("Invalid Card Number");
			}
		})	
	}
	
	function fetchBooks(){
		$.ajax({
			url: "fetchbooks",
			type: "POST",
			data:{
				branchId: $(branchList).val()
			}
		}).done(function (data){
			$('#bookTable').html(data)
		})
	}
	
	function fetchLoans(cardNo){
		$.ajax({
			url: "fetchloans",
			type: "POST",
			data:{
				cardNo: cardNo
			}
		}).done(function (data){
			$('#loansTable').html(data)
			$(bookLoans).show()
		})
	}
	
	function checkOutBook(bookId, branchId){
		$.ajax({
			url: "checkoutbook",
			type: "POST",
			data:{
				bookId: bookId,
				branchId: branchId,
				cardNo: $('#savedCardNo').val()
			}
		}).done(function (data){
			if (data !== null){
				var updatedTables = data.split("//", 2);
				$('#loansTable').html(updatedTables[0])
				$('#bookTable').html(updatedTables[1])
			}
		})
	}
	

	function returnBook(bookId, branchId, cardNo, dateOut){
		$.ajax({
			url: "returnbook",
			type: "POST",
			data:{
				bookId: bookId,
				branchId: branchId,
				cardNo: cardNo,
				dateOut: dateOut
			}
		}).done(function (data){
			if (data !== null){
				var updatedTables = data.split("//", 3);
				$('#loansTable').html(updatedTables[0])
 				$('#bookTable').html(updatedTables[1])
				$(branchList).val(updatedTables[2])
			}
		})
	}
</script>

<%@include file="header.jsp" %>

<div class="container">
	<div id="userLogin" class ="row">
		<div class="box">
			<label>Enter Card Number </label> <input class="input-sm" id="cardNo" name="cardNo" type=number min=0 >
			<button class="btn btn-default btn-xs" onclick="borrowerLogin()">Login</button>
		</div> <%--Box--%>
 	</div> <%--Row--%>
	
	<div id="welcomeUser" class ="row" style="display:none;">
		<div class="box">
			<label for="borrowerName"></label>
		</div>
	</div>
 	
 	<div id="bookLoans" class ="row" style="display:none;">
	 	<div class="box">
	 	<h2>Book Loans</h2>
		 	<table class="table" id="loansTable">
			
			</table>
	 	</div> <%--Box--%>
 	</div> <%--Row--%>
 	
 	<div id="selectBranch" class ="row" style="display:none;">
		<div class="box">
			<h2>Search for a Book: </h2>
			<label>Select a branch: </label>
			<select onchange="fetchBooks()" name="branchList" id="branchList">
				<option value="0">Select Your Desired Branch</option>
				<gcit:forEach var="b" items="${branches}">
					<option value="${b.branchId}">${b.branchName}</option>
				</gcit:forEach>
			</select>
			<table class="table" id="bookTable">
			
			</table>
		</div> <%--Box--%>
 	</div> <%--Row--%>
 	
</div> <%--Container--%>

<input type="hidden" id="savedCardNo" name="savedCardNo" >

<%@include file="footer.jsp" %>