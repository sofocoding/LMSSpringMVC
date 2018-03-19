<%@include file="header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<div class="container">
	<div class ="row">
		<div class = "box">
		<h2 class="text-center">Welcome Administrator</h2>
	</div>
	</div>
	   <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Choose an
                        <strong>Option</strong>
                    </h2>
                    <hr>
                </div>
                <div class="col-sm-4 text-center">
                    <h4><a href="adminbookservices">Books Services</a></h4>
                 <!--    <img style="display:block;margin:auto" class="img-responsive" src="resources/img/books.png" alt="Books">-->
                </div>
                <div class="col-sm-4 text-center">
                	<h4><a href="viewbranches">Library Branches</a></h4>
                  <!--    <img style="display:block;margin:auto"  class="img-responsive" src="resources/img/branches.png" alt="Branches">-->
                </div>
                <div class="col-sm-4 text-center">
                 	<h4><a href="viewloans">Loan A Book</a></h4>
                 <!--   <img style="display:block;margin:auto" class="img-responsive" src="resources/img/loans.png" alt="Loans">-->
                </div>
                <div class="clearfix"></div>
            </div>
 	</div>
</div>
	

<%@include file="footer.jsp" %>