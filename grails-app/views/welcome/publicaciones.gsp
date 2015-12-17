<!doctype html>
<html lang="en">
    <head>
        
        <meta charset="utf-8">
        <title>Lammba - Laboratorio de Microbiología Molecular y Biotecnología Ambiental</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <g:external base="http://fonts.googleapis.com/css?family=Open+Sans:400,300" type="css"/>
        <g:external base="http://fonts.googleapis.com/css?family=PT+Sans" type="css"/>
        <g:external base="http://fonts.googleapis.com/css?family=Raleway" type="css"/>
        <g:external dir="assets" file="bootstrap.css" />
        <g:external dir="assets" file="font-awesome.min.css" />
        <g:external dir="assets" file="style.css" />
        <g:external dir="assets" file="animate.min.css" />
        <!--<link rel="stylesheet" type="text/css" media="all" href="assets/style-projects.css">-->
        <g:external file="style-projects.css" />
        <g:external dir="assets" file="jquery.cookie.js" />
        <g:external dir="assets" file="jquery.hoverIntent.minified.js" />
        <g:external dir="assets" file="jquery.dcjqaccordion.2.7.min.js" />
        

        <!-- Favicon and touch icons -->
        <g:external dir="assets" file="apple-touch-icon-144-precomposed.png" />
        <g:external dir="assets" file="apple-touch-icon-114-precomposed.png" />
        <g:external dir="assets" file="apple-touch-icon-72-precomposed.png" />
        <g:external dir="assets" file="apple-touch-icon-57-precomposed.png" />
        <g:external dir="assets" file="favicon.ico" />

</head>
    <body>

    <!-- Header -->
        
    <nav id="navbar-section" class="navbar navbar-default navbar-static-top navbar-sticky" role="navigation">
        <div class="container">
        
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand wow fadeInDownBig" href="${createLink(action: 'index')}"> <g:img dir="assets/slider" file="Office.jpg" width="341" alt="Labmmba"/></a>    
            </div>
        
            <div id="navbar-spy" class="collapse navbar-collapse navbar-responsive-collapse">
                <ul class="nav navbar-nav pull-right">
                    <li class="active">
                        <g:link controller="welcome" action="index">Home</g:link>
                    </li>
                    <li>
                        <g:link controller="welcome" action="about">About</g:link>
                    </li>
                    <li>
                        <g:link controller="welcome" action="blog">Blog</g:link>
                    </li>
                    <li>
                        <g:link controller="welcome" action="team">Team</g:link>
                    </li>
                    <li>
                        <g:link controller="welcome" action="contact">Contact</g:link>
                    </li>
                </ul>         
            </div>
        </div>
    </nav>


    <!--End Header -->
    <!-- Main Container -->

    <div class="row container-kamn">
        <g:img dir="assets/slider" file="Imagen12.jpg" class="blog-post" alt="Feature-img" align="right" width="100%"/>
    </div>

    <div id="banners"></div>
    <div class="container">   
        <div class="row">
            <div class="side-left col-sm-4 col-md-4">

                <h3 class="lead"> Articulos científicos </h3><hr>
                <ul class="input-list style-2 clearfix">
                <div id='dynamicInput'>
                   Elija el tipo de publicación que desea añadir:</p>
                   <h3 class="lead"> <b>Revista </b></h3>
                   <form>
                    <table> 
                        <tr><p> 
                            <td align='left'><p>PDF Revista:  </td>
                            <td align='left'><input id="file" type="file" name="pic" size="40"></td> 
                        </p></tr> 
                        <tr><p> 
                            <td align='left'>Área de Investigación</td>
                            <td align='left'><select class="others">
                                      <option selected="selected">Seleccione área de investigación...</option>
                                      <option name="choice" id="choice1" type="radio" value="Biotecnología Vegetal" onclick="hideTextBox2()" class="others"/><label for="choice1">Biotecnología Vegetal</label>
                                      <option name="choice" id="choice1" type="radio" value="Compuestos Bioactivos" onclick="hideTextBox2()" class="others"/><label for="choice2">Compuestos Bioactivos</label>
                                      <option name="choice" id="choice1" type="radio" value="Microbiología" onclick="hideTextBox2()" class="others"/><label for="choice3">Microbiología</option>
                                      <option name="choice" id="choice1" type="radio" value="Biotecnología" onclick="hideTextBox2()" class="others"/><label for="choice4">Biotecnología Ambiental</label>
                                      <option name="choice" id="choice5" type="radio" value="Otro" onclick="displayTextBox2()" class="others"/><label for="choice5">Otro</label>
                                </select></td>

                                <div id="otherTextBox2" style="display:none;visibility:hidden;">
                                    <input type="text" placeholder=":focus" class="focus" name="lastname" id="othertext2">
                                </div>
                        </p></tr>
                      </table> 
                            <g:actionSubmitImage value="Save" src="${resource(dir: 'assets/images', file: 'agregar.png')}"/>
 
                    </form>
                    <h3 class="lead"> <b>Libro </b></h3>                   
                    <g:form>
                        <table> 
                            <tr><p> 
                                <td align='left'>Título Libro:</td> 
                                <td align='left'><g:textField name='book_name' class='others' size='40'/></td> 
                            </p></tr> 
                            <tr><p> 
                                <td align='left'>Autores:</td> 
                                <td align='left'><g:textField name='book_authors' class='others' size='40'/></td>
                            </p></tr> 
                            <tr><p> 
                                <td align='left'>Año:</td> 
                                <td align='left'><g:textField name='book_year' class='others' size='40'/></td> 
                            </p></tr> 
                            <tr><p> 
                                <td align='left'>ISBN:</td> 
                                <td align='left'><g:textField name='book_isbn' class='others' size='40'/></td> 
                            </p></tr> 
                            <tr><p> 
                                <td align='left'>Editorial:</td> 
                                <td align='left'><g:textField name='book_ed' class='others' size='40'/></td> 
                            </p></tr> 
                            <tr><p> 
                                <td align='left'>PDF Libro:</td> 
                                <td align='left'><input id="file" type="file" name="pic" size="40"> </td> 
                            </p></tr>
                        </table>
                                <g:actionSubmitImage value="Save" src="${resource(dir: 'assets/images', file: 'agregar.png')}"/>
                    </g:form>


                </div> 
                </ul>
            </div>

            <div class="col-sm-8 col-md-8">
               <div id='cssmenu'>
                    <ul>
                        <li><g:link controller="welcome" action="resumenperfil">Resumen de Perfil</g:link></li>
                        <li><g:link controller="welcome" action="personal">Personal</g:link></li>
                        <li><g:link controller="welcome" action="estudios">Estudios</g:link></li>
                        <li><g:link controller="welcome" action="publicaciones">Publicaciones</g:link></li>
                        <li><g:link controller="welcome" action="experimentos">Experimentos</g:link></li>
                        <li><g:link controller="welcome" action="proyectos">Proyectos</g:link></li>
                        <li><g:link controller="welcome" action="congresos">Congresos</g:link></li>
                        <li><g:link controller="welcome" action="avancetesis">Avance de Tesis</g:link></li>
                        <li><g:link controller="welcome" action="mensajes">Mensajes</g:link></li>
                        <li><g:link controller="welcome" action="cuenta">Cuenta</g:link></li>
                    </ul>
                </div>
            </div>  
        </div>    
    </div>  

    <!--End Main Container -->

    <!-- Footer -->
    <footer> 
        <div class="container">
            <div class="row">
                <div class="col-md-0">
                    <h3><i class="fa fa-map-marker"></i> Contact:</h3>
                    <p class="footer-contact">
                        Via Ludovisi 39-45, Rome, 54267, Italy<br>
                        Phone: 1.800.245.356 Fax: 1.800.245.357<br>
                        Email: hello@LawOffice.org<br>
                    </p>
                </div>
                <div class="col-md-0">
                    <h3><i class="fa fa-external-link"></i> Links</h3>
                    <p> <a href="#"> About ( Who we are )</a></p>
                    <p> <a href="#"> Services ( What we do )</a></p>
                    <p> <a href="#"> Contact ( Feel free to contact )</a></p>
                    <p> <a href="#"> Blog ( Write to us )</a></p>
                    <p> <a href="#"> Team ( Meet the Team )</a></p> 
                </div>
              <div class="col-md-0">
                <h3><i class="fa fa-heart"></i> Socialize</h3>
                <div id="social-icons">
                    <a href="#" class="btn-group google-plus">
                        <i class="fa fa-google-plus"></i>
                    </a>
                      <a href="#" class="btn-group linkedin">
                        <i class="fa fa-linkedin-square"></i>
                    </a>
                      <a href="#" class="btn-group twitter">
                        <i class="fa fa-twitter"></i>
                    </a>
                      <a href="#" class="btn-group facebook">
                        <i class="fa fa-facebook"></i>
                    </a>
                </div>
              </div>    
        </div>
      </div>
    </footer>

    
    <div class="copyright text center">
        <p>&copy; Copyright 2014, <a href="#">Your Website Link</a>. Theme by <a href="https://themewagon.com/" target="_blank">ThemeWagon</a></p>
    </div>


    
    <g:external dir="assets" file="jquery-1.10.2.min.js" />
    <g:external dir="assets" file="bootstrap.min.js" />
    <g:external dir="assets" file="wow.min.js" />
    <script>
      new WOW().init();
    </script>
     <script type="text/javascript">$(function() {
  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});</script>

  </body>
  <script>
         function addInput(){
            var x = document.getElementById("pub").value;
            if(x=="Libro"){
              document.getElementById("demo").innerHTML = "<table> <tr><p> <td align='left'>Título Libro:</td> <td align='left'><g:textField name='book_name' class='others' size='40'/></td> </p></tr> <tr><p> <td align='left'>Autores:</td> <td align='left'><g:textField name='book_authors' class='others' size='40'/></td> </p></tr> <tr><p> <td align='left'>Año:</td> <td align='left'><g:textField name='book_year' class='others' size='40'/></td> </p></tr> <tr><p> <td align='left'>ISBN:</td> <td align='left'><g:textField name='book_isbn' class='others' size='40'/></td> </p></tr> <tr><p> <td align='left'>Editorial:</td> <td align='left'><g:textField name='book_ed' class='others' size='40'/></td> </p></tr> <tr><p> <td align='left'>PDF Libro:</td> <td align='left'><g:textField name='book_url' class='others' size='40'/></td> </p></tr></table>";


            }
            if(x=="Revista"){
              document.getElementById("demo").innerHTML = "<form><p>PDF Revista: <input type='text' name='myInputs[]'></p> <p>Área de Investigación: <select> <option value='Biotecnología Vegetal' class='others'>Biotecnología Vegetal</option> <option value='Compuestos Bioactivos' class='others'>Compuestos Bioactivos</option> <option value='Microbiología' class='others'>Microbiología</option> <option value='Biotecnología Ambiental' class='others'>Biotecnología Ambiental</option> <option name='choice' id='choice7' type='radio' value='Otro' onclick='displayTextBox()' class='others'/><label for='choice7'>Otro</label> </select> <p><div id='otherTextBox' style='display:none;visibility:hidden;'> <input type='text' placeholder=':focus' class='focus' name='lastname' id='othertext'> </div></p> </p></form> <g:actionSubmitImage value='Save' src='${resource(dir: 'assets/images', file: 'agregar.png')}'/>";

          }
      }


       
    </script>
</html>
