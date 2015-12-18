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
        <g:external dir="assets" file="login.css" />
        <g:external dir="assets" file="style-projects.css" />
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <g:external dir="assets" file="jquery.cookie.js" />
        <g:external dir="assets" file="jquery.hoverIntent.minified.js" />
        <g:external dir="assets" file="jquery.dcjqaccordion.2.7.min.js" />
        <g:external dir="assets" file="jquery-2.1.3.js" />
        

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

                <a class="navbar-brand wow fadeInDownBig" href="${createLink(action: 'index')}"> <g:img dir="assets/slider" file="office.jpg" width="341" alt="Labmmba"/></a> 
            </div>
        
            <div id="navbar-spy" class="collapse navbar-collapse navbar-responsive-collapse">
                <ul class="nav navbar-nav pull-right">
                    <li>
                        <g:link controller="welcome" action="index">Home</g:link>
                    </li>
                    <li class="active">
                        <g:link controller="welcome" action="about">Sobre Nosotros</g:link>
                    </li>
                    <li>
                        <g:link controller="welcome" action="news">Noticias</g:link>
                    </li>
                    <li>
                        <g:link controller="welcome" action="team">Nuestro Equipo</g:link>
                    </li>
                    <li>
                        <g:link controller="welcome" action="contact">Contacto</g:link>
                    </li>
                    <sec:ifLoggedIn>
                    <li><a href='<c:url value='j_spring_security_logout'/>'> Logout</a></li>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                    <li><div id="wrap">
                      <div id="regbar">
                        <div id="navthing">
                          <a href="#" id="loginform">Ingresar</a> | <a href="#">Registrarse</a>
                        <div class="login">
                          <div class="arrow-up"></div>
                          <div class="formholder">
                            <div class="randompad">
                               <fieldset>
                                 <p>Usuario</p>
                                 <input type="email" value="example@example.com" />
                                 <p>Contraseña</p>
                                 <input type="password" />
                                 <input type="submit" value="Ingresar" />
                               </fieldset>
                            </div>
                          </div>
                        </div>

                        </div>
                      </div>
                    </div></li>
                    </sec:ifNotLoggedIn>

                </ul>         
            </div>
        </div>
    </nav>

    <!-- End Header -->


      <!-- Main Container -->

    <div class="row container-kamn">
        <g:img dir="assets/" file="team.jpg" class="blog-post" alt="Feature-img" align="right" width="100%"/>
    </div>

    <div id="banners"></div>
    <div class="container">   
        <div class="row">
            <div class="side-left col-sm-4 col-md-4">

               <h3 class="lead">  Sobre nuestro laboratorio: </h3><hr>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;En 1997 se crea el primer laboratorio del área biológica de la Universidad Técnica Federico Santa María: El laboratorio de Microbiología Molecular y Biotecnología Ambiental (MMBA). En Octubre de ese año, este laboratorio cuenta con dos investigadores (Michael Seeger y Myriam Gonzalez), dos proyectos interinstitucionales y un espacio físico de 36 [m2].</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Se comenzó con una línea de investigación muy relevante para la región y el país en el campo de la Biotecnología Ambiental: La degradación Bacteriana (biorremediación) de contaminantes orgánicos persistentes (COPs), una temática de escaso desarrollo en el país. La importancia de esta investigación está dada por el impacto ambiental que generan estos contaminantes a lo largo del territorio nacional.</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;El Laboratorio MMBA participó activamente en la formación del Centro de Biotecnología de la UTFSM, creado oficialmente en enero del 2000 (aunque las gestiones se iniciaron en 1997), y en la creación del Programa de Doctorado de Biotecnología (UTFSM – PUCV) cuyas gestiones iniciaron en 1998 y tuvo inicio en Marzo del 2002.</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Para Octubre del año 2001, el grupo de trabajo incluía 4 investigadores, 1 estudiante de Doctorado, 4 estudiantes de pregrado y una persona de apoyo técnico. Se ejecutaban 6 proyectos de investigación propios, disponiendo de dos laboratorios con una superficie de 80 [m2] y un moderno equipamiento.</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;El año 2009 el laboratorio está conformado por dos investigadores senior, dos investigadores post-doctorales,  dos investigadores asociados, un técnico de química analítica, cinco estudiantes de Doctorado, dos estudiantes de Magister, dos estudiantes de pre-grado y estudiantes en pasantía.</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Se dispone de dos laboratorios de investigación de 80 [m2] ubicados en el Departamento de Química de la Casa Central. Además se dispone de un laboratorio de preparación de muestras y 3 cámaras termorreguladas de 25°C, 5°C y -20 °C ubicados en la edificación de calle General Bari.</p>
                    <p><b>El laboratorio tiene las siguientes áreas de investigación:</b></p>
                    <p style="text-indent: 5em;">&#9658;           Biodegradación y biorremediación de COPs</p>
                    <p style="text-indent: 5em;">&#9658;           Proteómica y Genómica funcional de bacterias</p>
                    <p style="text-indent: 5em;">&#9658;           Química Ambiental de COPs</p>
                    <p style="text-indent: 5em;">&#9658;           Biotransformaciones y Síntesis Orgánica</p>
                    <p style="text-indent: 5em;">&#9658;           Ecología Microbiana</p>
                    <p style="text-indent: 5em;">&#9658;           Resistencia de bacterias a metales pesados</p>
                    <p style="text-indent: 5em;">&#9658;           Biorremediación de Suelos Contaminados con Metales Pesados</p>
                     
                    <p><b>El laboratorio MMBA ha colaborado con diversas instituciones como son:</b></p>

                    <p>Instituciones Nacionales</p>
                     <br>
                    <p style="text-indent: 5em;">&#9658;          Pontificia Universidad Católica de Valparaíso</p>
                    <p style="text-indent: 5em;">&#9658;          Universidad Austral</p>
                    <p style="text-indent: 5em;">&#9658;          Universidad de Chile</p>
                    <p style="text-indent: 5em;">&#9658;          Universidad de Santiago</p>
                    <p style="text-indent: 5em;">&#9658;          Universidad de Valparaíso</p>
                    <p style="text-indent: 5em;">&#9658;          Pontificia Universidad Católica de Chile</p>
                    <p style="text-indent: 5em;">&#9658;          Universidad de Magallanes</p>
                    <p style="text-indent: 5em;">&#9658;          Universidad de la Frontera</p>
                     <br>
                    <p>Instituciones Internacionales</p>
                     <br> 
                    <p style="text-indent: 5em;">&#9658;            Helmholzt Centre for Infection Research (Braunschweig, Alemania)</p>
                    <p style="text-indent: 5em;">&#9658;            Max Planck Institute for Terrestrial Microbiology (Marburg, Alemania)</p>
                    <p style="text-indent: 5em;">&#9658;            Julius Kühn-Institute, Federal Research Center for Cultivated plants (Braunschweig, Alemania)</p>
                    <p style="text-indent: 5em;">&#9658;            Helmholtz Centre for Environmental Research – UFZ (Leipzig, Alemania)</p>
                    <p style="text-indent: 5em;">&#9658;            Universidad de Buenos Aires (Argentina)</p>
                    <p style="text-indent: 5em;">&#9658;            Universidad Campinas (Sao Paolo, Brasil)</p>
                    <p style="text-indent: 5em;">&#9658;            Centro Nacional de Biotecnología (Madrid, España)</p>
                    <p style="text-indent: 5em;">&#9658;            Centro de Investigaciones Biológicas (Madrid, España)</p>
                    <p style="text-indent: 5em;">&#9658;            Universidad Pablo de Olavide (Sevilla, España)</p>
                    <p style="text-indent: 5em;">&#9658;            The Macaulay Land use Research Institute (Aberdine, Escocia)</p>
                    <p style="text-indent: 5em;">&#9658;            Texas A&M University (College Station, Estados Unidos)</p>
                    <p style="text-indent: 5em;">&#9658;            University Southern California (Los Angeles, Estados Unidos)</p>
                    <p style="text-indent: 5em;">&#9658;            Center for Microbial Ecology (East Lansing, Estados Unidos)</p>
                    <p style="text-indent: 5em;">&#9658;            CCUG, University of Göteborg (Göteborg,  Suecia)</p>
                     <br>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Las investigaciones del laboratorio han sido financiadas con el apoyo de diversas instituciones tales como Fondecyt, Fundación Andes, Conicyt – BMBF, European Union (INCO), Mineduc, Núcleo Milenio EMBA, PBCT, UTFSM, Texas A&M University, U. Austral, Instituto Milenio (CBB) y Perkin Elmer Chile.</p>
            </div>
            <div class="col-sm-8 col-md-8">
                <g:img dir="assets" file="adn.jpg" alt="" height="100%"/>
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
                    <p> <g:link controller="welcome" action="about"> Sobre Nosotros ( Quiénes somos )</g:link></p>
                    <p> <g:link controller="welcome" action="team"> Nuestro Equipo ( Conócenos )</g:link></p>
                    <p> <g:link controller="welcome" action="news"> Noticias ( Infórmate )</g:link></p>
                    <p> <g:link controller="welcome" action="contact"> Contacto ( Escríbenos )</g:link></p>
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
<script type="text/javascript">
$('input[type="submit"]').mousedown(function(){
  $(this).css('background', '#2ecc71');
});
$('input[type="submit"]').mouseup(function(){
  $(this).css('background', '#1abc9c');
});

$('#loginform').click(function(){
  $('.login').fadeToggle('slow');
  $(this).toggleClass('green');
});



$(document).mouseup(function (e)
{
    var container = $(".login");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
        $('#loginform').removeClass('green');
    }
});
</script>
  </body>
</html>
