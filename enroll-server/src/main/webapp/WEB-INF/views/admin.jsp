<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>
<o:header title="Admin"/>
<o:topbar pageName="Admin"/>
<div class="container-fluid main">
	<div class="row-fluid">
		<div class="span10 offset1">

			<div>
			<nav class="navbar navbar-primary" role="navigation">
              <div class="container-fluid">
                <div class="navbar-header">

                </div>
                <!--div class="collapse navbar-collapse navbar-ex2-collapse">
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="index.html">Accueil</a></li>
                    <li class="active"><a href="Justif_User.html">Mes justificatifs</a></li>
                     <li class="active"><a href="container_User.html">Mes conteneurs</a></li>
                  </ul-->
                </div>
              </div>
            </nav>
            <body>

                <ul class="nav nav-tabs" id="myTab">
            <!-- <ul class="nav nav-pills" id="myTab"> -->
            	<li class="active"><a data-toggle="tab" href="#menu01">Profil</a></li>
              <!-- <li class="active"><a data-toggle="pill" href="#menu01">Accueil</a></li> -->
            	<li><a data-toggle="tab" href="#menu02">Justificatifs</a></li>
              <!-- <li><a data-toggle="pill" href="#menu02">Messages</a></li> -->
            	<li><a data-toggle="tab" href="#menu03">Conteneurs</a></li>
            	</ul>
            	 <div class-"image">
            		<center><img src="resources/images/Bonneville-Color.png"
                  			 alt="Bonneville"
                  			 height="100px"
                  			 width="150px"
                  			 sizes="(min-width: 600px) 200px, 50vw"><center>
                </div>
            	<div class="tab-content" id="myTabContent">
            		 <div id="menu01" class="tab-pane fade active in">
            		  	 <div class="container">
            				<form class="form-horizontal" id="form_members" role="form" action="/appServlet/addUser">
            				<div class="row">
            				    <div class="col-md-6">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <div class="panel-title">
                                                <h3>Profile</h3>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label for="firstname" class="col-sm-2" >Prénoms</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" name="firstname" id="firstname" placeholder="1er prénom; 2ème prénom; 3ème prénom" required>
                                                </div>
                                                <label for="lastname" class="col-sm-2">Nom</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" name="lastname" id="lastname" onkeyup='this.value=this.value.toUpperCase()' placeholder="NOM" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="gender" class="col-sm-2">Genre</label>
                                                <div class="col-sm-4">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="gender" id="male" value="M"> M
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="gender" id="female" value="F"> F
                                                    </label>
                                                </div>
                                                <label for="dob" class="col-sm-2">Date de naissance</label>
                                                <div class="col-sm-4">
                                                    <input type="date" class="form-control" name="dob" id="dob" placeholder="mm/dd/yyyy" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                    			        <div class="panel-title">
                                    			            <h3>Adresse</h3>
                                    			        </div>
                                    </div>
                                    <div class="panel-body">
                                            <div class="form-group">
                                                <label for="address" class="col-sm-2">Adresse</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" name="address" id="address" placeholder="N° + adresse" required>
                                                </div>
                                                <label for="city" class="col-sm-2">ville</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" list="cities" name="city" id="city" onkeyup='this.value=this.value.toUpperCase()' placeholder="VILLE" required>
                                                    <datalist id="Villes">
                                                        <option value="Aquila">
                                                        <option value="Aosta">
                                                        <option value="Bari">
                                                        <option value="Venezia">
                                                    </datalist>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="zipcode" class="col-sm-2">Code Postal</label>
                                                <div class="col-sm-4">
                                                    <input type="number" class="form-control" name="zipcode" id="zipcode" placeholder="12345" pattern="[0-9]{5}" title="Saisir 5 chiffres du code postal" required>
                                                </div>
                                                <label for="country" class="col-sm-2">Pays</label>
                                                <div class="col-sm-4">
                                                    <select class="form-control" name="country" id="country" onkeyup='this.value=this.value.toUpperCase()'>
                                                        <option>Sélectionner le pays</option>
                                                        <option>France</option>
                                                        <!--option>Aosta</option>
                                                        <option>Apulia</option>
                                                        <option>Veneto</option-->
                                                    </select>
                                                </div>
                                            </div>
                                    </div>
                                </div>
            				    </div>
            				    <div class="col-md-6">
            				    <div class="panel panel-info">
                                        <div class="panel-heading">
                                                            <div class="panel-title">
                                                                <h3>Attributs France Connect</h3>
                                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label for="birthcity" class="col-sm-4">Ville de naissance</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" list="cities" name="birthcity" id="birthcity" onkeyup='this.value=this.value.toUpperCase()' placeholder="VILLE" required>
                                                    <datalist id="Villes">
                                                        <option value="Aquila">
                                                        <option value="Aosta">
                                                        <option value="Bari">
                                                        <option value="Venezia">
                                                    </datalist>
                                                </div>
                                                <label for="birthcountry" class="col-sm-4">Pays de naissance</label>
                                                <div class="col-sm-6">
                                                    <select class="form-control" name="birthcountry" id="birthcountry" onkeyup='this.value=this.value.toUpperCase()'>
                                                        <option>Sélectionner le pays</option>
                                                        <option>France</option>
                                                        <!--option>Aosta</option>
                                                        <option>Apulia</option>
                                                        <option>Veneto</option-->
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                                <div class="panel-title">
                                                    <h3>Contact Info</h3>
                                                </div>
                                        </div>
                                        <div class="panel-body">
                                        <div class="form-group">
                                            <label for="phone" class="col-sm-4">Téléphone</label>
                                            <div class="col-sm-6">
                                                <input type="tel" class="form-control" name="phone" id="phone" placeholder="N° téléphone mobile" required>
                                            </div>
                                            <label for="email" class="col-sm-4">Adresse mail</label>
                                            <div class="col-sm-6">
                                                <input type="email" class="form-control" name="email" id="email" placeholder="Adresse mail" required>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
            				</div>


            					<div class="form-group">
            					    <div>
            					        <button type="submit" class="btn btn-primary btn-lg btn-block" name="submit" id="submit">Enregistrer</button>
            					    </div>
            					</div>
            				</form>
            			</div>
            	 	</div>
            	  	<div id="menu02" class="tab-pane fade">
            		  	<div class="container">
            		  		<h2>Justificatifs</h2>
            				<div class="input-group">
            				 	<span class="input-group-btn">
            			   		 	 <span class="btn btn-primary" onclick="$(this).parent().find('input[type=file]').click();">Parcourir</span>
            				    		<input name="uploaded_file" onchange="$(this).parent().parent().find('.form-control').html($(this).val().split(/[\\|/]/).pop());" style="display: none;" type="file">
            						</span>
            				  	<div class="form-control"></div>
            				</div>
            				<p> </p>
            				<table class="table" border="2">
            					<thead>
            						<tr class="primary">
            							<th></th>
            							<th>Documents</th>
            							<th>Statuts</th>
            						</tr>
            					</thead>
            					<tbody>
            						<!-- sélectionner à un fichier à l'aide de l'outil "Parcourir, ajouter le justificatif (bouton Ajouter), ajout d'une nouvelle ligne avec la case "attente de validation" en rouge -->
            						<!-- sélectionner à l'aide du bouton radio, valider le justificatif (bouton Valider) la case statuts "Attente de validation" en rouge, doit passer en "Validé"" en vert-->
            						<!-- sélectionner à l'aide du bouton radio, supprimer le justificatif (bouton Supprimer) supprime le justificatif-->
            						<tr>
            							<td width="5" align="center" > <input type="radio" id="select1"  value="1" /></td>
            							<td width="20">Carte d'identité</td>
            							<td class="danger" width="10">Attente de validation</td>
            						</tr>
            						<tr>
            							<td width="5" align="center" > <input type="radio" id="select2"  value="1" /></td>
            							<td width="20">Facture électricité</td>
            							<td class="danger" width="10">Attente de validation</td>
            						</tr>
            						<tr>
            							<td width="5" align="center" > <input type="radio" id="select3"  value="1" /></td>
            							<td width="20">Livret de famille</td>
            							<td class="danger" width="10">Attente de validation</td>
            						</tr>
            					</tbody>
            				</table>
            						<button class="btn btn-success">Ajouter</button>
            						<button class="btn btn-danger">Supprimer</button>
            						<button class="btn btn-primary">Valider</button>
            			</div>
            	  	</div>
            	  	<div id="menu03" class="tab-pane fade">
            			<div class="container">
            				<h2>Conteneurs</h2>
            				<table class="table" border="2">
            					<thead>
            						<tr class="primary">
            							<th></th>
            							<th>Conteneurs</th>
            							<th>N° identification</th>
            							<th>Statuts</th>
            						</tr>
            					</thead>
            					<tbody>
            						<!-- sélectionner à l'aide du bouton radio, en appuyant sur la touche Supprimer, la case statuts doit passer en "Supprimé"" en rouge-->
            						<tr>
            							<td width="5" align="center" > <input type="radio" id="select1"  value="1" /></td>
            							<td width="20">Carte à puce</td>
            							<td width="20">234578895</td>
            							<td class="success" width="10">Actif</td>
            						</tr>
            						<tr>
            							<td width="5" align="center"><input type="radio" id="select2" value="1" /> </td>
            							<td width="20">Mobile</td>
            							<td width="20">2398038895</td>
            							<td class="success" width="10">Actif</td>
            						</tr>
            					</tbody>
            				</table>
            					<button class="btn btn-primary">Ajouter</button> <!--le bouton Ajouter lance dle processus de personnalisation d'un conteneur-->
            					<button class="btn btn-danger">Supprimer</button><!--le bouton supprimer lance dle processus de suppression d'un conteneur et de diffusion vers les services -->
            			</div>
            		</div>
            	</div>
			</div>

		</div>
	</div>
</div>


<o:footer />
