<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>
<o:header title="Login"/>
<o:topbar />
<div class="container-fluid main">

    <div class="col-md-6 col-md-offset-5 column">
        <form action="openid_connect_login" method="get">
            <div>
                <input type="text" class="input" name="identifier" id="identifier" />
            </div>
            <div>
                <input class="ardeco_connect" type="submit" value="Log In" />
            </div>
        </form>
    </div>


</div>

<script type="text/javascript">
    var url = '${ serverUrl }';
	$(document).ready(function () {
	$('#identifier').val(url);
	$('#identifier').hide();
		$('#ardeco').on('click', function() {
			$('#identifier').val(url);
		});
		$('#mitreidorg').on('click', function() {
			$('#identifier').val('user@mitreid.org');
		});
		
	});
</script>
<o:footer />