<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>
<%@ page session="false" %>
<o:header title="Home"/>
<o:topbar pageName="Home"/>
<div class="container-fluid main">
	<div class="row-fluid">
		<div class="span10 offset1">


		<div class-"image">
            <center><img src="resources/images/Bonneville-Color.png"
                     alt="Bonneville"
                     height="100px"
                     width="150px"
                     sizes="(min-width: 600px) 200px, 50vw"><center>
        </div>


        <table class="table table-striped table-hover span4">
            <tr>
                <th>Issuer</th>
                <th>Subject</th>
            </tr>
            <c:forEach items="${ admins }" var="admin">
                <tr>
                    <td>${ admin.issuer }</td>
                    <td>${ admin.subject }</td>
                </tr>
            </c:forEach>
        </table>
		</div>
	</div>
</div>


<o:footer />