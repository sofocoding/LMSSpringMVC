<%@ taglib prefix="gcit" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script>
function getBranchCopies(){
	changeHref()
	$.ajax({
		url: "branchcopies",
		type: "POST",
		data:{
			branchId: $(branchList).val()
		}
	}).done(function (data){
		$('#bookCopiesTable').html(data)
	})
}

function changeHref(){
	var selectedBranch = $("#branchList").val();
	if (selectedBranch !== "0"){
		$("#editBranchBtn").attr("data-toggle", "modal");
		$("#editBranchBtn").attr("data-target", "#editBranchModal");
		var newHref = "editbranch?branchId=" + selectedBranch;
		$("#editBranchBtn").attr("href", newHref);
	}	
}
</script>

<%@include file="header.jsp" %>

<div class="container">
	<div class = "box">
		<h2>Welcome Librarian</h2>
		<label> Select your branch: </label>
		<select onchange="getBranchCopies()" name="branchList" id="branchList">
			<option value="0">Select Branch</option>
			<gcit:forEach var="b" items="${branches}">
				<gcit:if test="${b.branchId == selectedBranch}">
					<option value="${b.branchId}" selected>${b.branchName}</option>
				</gcit:if>
				<gcit:if test="${b.branchId != selectedBranch}">
					<option value="${b.branchId}">${b.branchName}</option>
				</gcit:if>
			</gcit:forEach>
		</select>
		<button class="btn btn-xs btn-default" id="editBranchBtn" name="editBranchBtn" type="button">Edit Branch</button>

		<table class="table" id="bookCopiesTable">
		
		</table>
	</div>
	
	<div class="modal fade add-copies-modal" id="addCopiesModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	  	<div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content"></div>
	  	</div>
	</div>
	
	<div class="modal fade edit-branch-modal" id="editBranchModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	  	<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content"></div>
	  	</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		// codes works on all bootstrap modal windows in application
		$('.modal').on('hidden.bs.modal', function(e) {
			$(this).removeData();
		});
	});
	$(document).ready(function() { 
		if ($("#branchList").val() !== "0"){
		 getBranchCopies()
		}
	});
	
</script>
	
<%@include file="footer.jsp" %>