<%@attribute name="pageName" required="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>
<c:choose>
	<c:when test="${ not empty userInfo.preferredUsername }">
		<c:set var="shortName" value="${ userInfo.preferredUsername }" />
	</c:when>
	<c:otherwise>
		<c:set var="shortName" value="${ userInfo.sub }" />
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${ not empty userInfo.name }">
		<c:set var="longName" value="${ userInfo.name }" />
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${ not empty userInfo.givenName || not empty userInfo.familyName }">
				<c:set var="longName" value="${ userInfo.givenName } {$ userInfo.familyName }" />
			</c:when>
			<c:otherwise>
				<c:set var="longName" value="${ shortName }" />
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Enrollement Bonneville ARDECO</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <c:choose>
        							<c:when test="${pageName == 'Home'}">
        								<li class="active"><a href="#">Home</a></li>
        							</c:when>
        							<c:otherwise>
        								<li><a href=".">Home</a></li>
        							</c:otherwise>
        						</c:choose>
        <security:authorize access="hasRole('ROLE_USER')">
        						<c:choose>
        							<c:when test="${pageName == 'User'}">
        								<li class="active"><a href="#">User</a></li>
        							</c:when>
        							<c:otherwise>
        								<li><a href="user">User</a></li>
        							</c:otherwise>
        						</c:choose>
        						</security:authorize>
        <security:authorize access="hasRole('ROLE_ADMIN')">
        						<c:choose>
        							<c:when test="${pageName == 'Admin'}">
        								<li class="active"><a href="#">Admin</a></li>
        							</c:when>
        							<c:otherwise>
        								<li><a href="admin">Admin</a></li>
        							</c:otherwise>
        						</c:choose>
        						</security:authorize>
      </ul>

      <ul class="nav navbar-nav navbar-right">
      <p class="navbar-text">
      					<security:authorize access="hasRole('ROLE_USER')">
      						<b><span class="text-success">You are currently logged in. ${ userInfo.name }</span></b>
      					</security:authorize>
      					<security:authorize access="!hasRole('ROLE_USER')">
      						<b><span class="text-error">You are <em>NOT</em> currently logged in.</span></b>
      					</security:authorize>
      				</p>

      <security:authorize access="!hasRole('ROLE_USER')">
      	                    <li>
      	                    	<a id="loginButton" href="login" data-toggle="collapse" data-target=".nav-collapse"><i class="icon-lock icon-white"></i> Log in</a>
      	                    </li>
      	                    </security:authorize>
        <c:choose>
        							<c:when test="${pageName == 'Logout'}">
        								<li class="active"><a href="#">Logout</a></li>
        							</c:when>
        							<c:otherwise>
        								<li><a href="j_spring_security_logout">Logout</a></li>
        							</c:otherwise>
        						</c:choose>

      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

