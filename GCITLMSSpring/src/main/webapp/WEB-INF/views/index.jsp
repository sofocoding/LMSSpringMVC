<%@include file="header.jsp"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="container">
	<div class="row">
		<div class="box">
			<div class="col-lg-12 text-center">
				<h2 class="brand-before">
					<small>Welcome to</small>
				</h2>
				<h1 class="brand-name">GCIT Library Management System</h1>
				<hr class="tagline-divider">
				<h2>
					<small>By <strong>GCIT</strong>
					</small>
				</h2>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="box">
			<div class="col-lg-12">
				<hr>
				<h2 class="intro-text text-center">
					Choose a <strong>User Type</strong>
				</h2>
				<hr>
			</div>
			<div class="col-sm-4 text-center">
				<img class="img-responsive" src="resources/img/admin.jpg"
					alt="Administrator">
				<h3>
					<a href="admin">Administrator</a>
				</h3>
			</div>
			<div class="col-sm-4 text-center">
				<img class="img-responsive" src="resources/img/librarian.jpg"
					alt="Librarian">
				<h3>
					<a href="librarianbranch">Librarian</a>
				</h3>
			</div>
			<div class="col-sm-4 text-center">
				<img class="img-responsive" src="resources/img/borrower.jpg"
					alt="Borrower">
				<h3>
					<a href="borrower">Borrower</a>
				</h3>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>



<%@include file="footer.jsp"%>