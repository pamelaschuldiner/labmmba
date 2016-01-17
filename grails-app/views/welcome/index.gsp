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
        <g:external dir="assets" file="jquery-1.10.2.min.js" />
        <g:external dir="assets" file="bootstrap.min.js" />
        <g:external dir="assets" file="wow.min.js" />

        <!-- Favicon and touch icons -->
        <g:external dir="assets" file="apple-touch-icon-144-precomposed.png" />
        <g:external dir="assets" file="apple-touch-icon-114-precomposed.png" />
        <g:external dir="assets" file="apple-touch-icon-72-precomposed.png" />
        <g:external dir="assets" file="apple-touch-icon-57-precomposed.png" />
        <g:external dir="assets" file="icon.ico" />
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
                    <li class="active">
                        <g:link controller="welcome" action="index">Home</g:link>
                    </li>
                    <li>
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
                        <li> <g:link url="j_spring_security_logout">Logout</g:link> </li>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
<<<<<<< HEAD
                        <li><div id="wrap">
                            <div id="regbar">
                                <div id="navthing">
                                    <a href="#" id="loginform">Ingresar</a> | <g:link controller="user" action="create">Registrarse</g:link>
                                    <div class="login">
                                        <div class="arrow-up"></div>
                                        <div class="formholder">
                                            <div class="randompad">
                                                <form action="/j_spring_security_check" method="POST" id="loginForm" class="cssform" autocomplete="off">
                                                    <p>
                                                        <label for="username">Nombre de usuario:</label>
                                                        <input type="text" class="text_" name="j_username" id="username">
                                                    </p>
=======
                    <li><div id="wrap">
                      <div id="regbar">
                        <div id="navthing">
                          <a href="#" id="loginform">Ingresar</a> | <g:link controller="welcome" action="loginreg">Registrarse</g:link>
                        <div class="login">
                          <div class="arrow-up"></div>
                          <div class="formholder">
                            <div class="randompad">
                               <form action="/j_spring_security_check" method="POST" id="loginForm" class="cssform" autocomplete="off">
                                    <p>
                                        <label for="username">Nombre de usuario:</label>
                                        <input type="text" class="text_" name="j_username" id="username">
                                    </p>
>>>>>>> origin/master

                                                    <p>
                                                        <label for="password">Contraseña:</label>
                                                        <input type="password" class="text_" name="j_password" id="password">
                                                    </p>

                                                    <p id="remember_me_holder">
                                                        <input type="checkbox" class="chk" name="_spring_security_remember_me" id="remember_me">
                                                        <label for="remember_me">Recuérdame</label>
                                                    </p>

                                                    <p>
                                                        <input type="submit" id="submit" value="Identifícate">
                                                    </p>
                                                </form>
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


    <!-- Begin #carousel-section -->
    <section id="carousel-section" class="section-global-wrapper"> 
        <div class="container-fluid-kamn">
            <div class="row">
                <div id="carousel-1" class="carousel slide">

                    <!-- Indicators -->
                    <ol class="carousel-indicators visible-lg">
                        <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-1" data-slide-to="1"></li>
                        <li data-target="#carousel-1" data-slide-to="2"></li>
                    </ol>
        
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <!-- Begin Slide 1 -->
                        <div class="item active">
                            <g:img dir="assets/slider" file="slide2.jpg" alt="" height="400" widgth="100%"/>
                            <div class="carousel-caption">
                                <h3 class="carousel-title hidden-xs">Office BOOTSTRAP TEMPLATE</h3>
                                <p class="carousel-body">RESPONSIVE \ MULTI PAGE</p>
                            </div>
                        </div>
                        <!-- End Slide 1 -->
                        <!-- Begin Slide 2 -->
                        <div class="item">
                            <g:img dir="assets/slider" file="slide4.jpg" alt="" height="400" widgth="100%"/>
                            <div class="carousel-caption">
                                <h3 class="carousel-title hidden-xs">EASY TO CUSTOMIZE</h3>
                                <p class="carousel-body">BEAUTIFUL \ CLEAN \ MINIMAL</p>
                            </div>
                        </div>
                        <!-- End Slide 2 -->

                        <!-- Begin Slide 3 -->
                        <div class="item">
                            <g:img dir="assets/slider" file="slide21.jpg" alt="" height="400" widgth="100%"/>
                            <div class="carousel-caption">
                                <h3 class="carousel-title hidden-xs">MULTI-PURPOSE TEMPLATE</h3>
                                <p class="carousel-body">PORTFOLIO \ CORPORATE \ CREATIVE</p>
                            </div>
                        </div>
                        <!-- End Slide 3 -->
                    </div>
        
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-1" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-1" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- End #carousel-section -->


    <!-- Begin #services-section -->
    <section id="services" class="services-section section-global-wrapper">
        <div class="container">
            <div class="row">
                <div class="services-header">
                    <h3 class="services-header-title">El laboratorio MMBA de la Universidad Técnica Federico Santa María</h3>
                    <p class="services-header-body"> estudia la degradación bacteriana de contaminantes orgánicos persistentes, química ambiental, genómica y proteómica funcional.   </p><hr>
                </div>
            </div>
      
            <!-- Begin Services Row 1 -->
            <div class="row services-row services-row-head services-row-1">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="services-group wow animated fadeInLeft" data-wow-offset="40">
                        <p class="services-icon"><g:img dir="assets/icons" file="micros.png"/></p>
                        <h4 class="services-title">Bionanotecnología</h4>
                        <p class="services-body">Síntesis química y biogénica de nanopartículas metálicas.</p>
                        <p class="services-more"><a href="#">Averigua más</a></p>
                    </div>
                </div>
        
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="services-group wow animated zoomIn" data-wow-offset="40">
                        <p class="services-icon"><g:img dir="assets/icons" file="comp.png"/></p>
                        <h4 class="services-title">Biorremediación de Ambientes Contaminados</h4>
                        <p class="services-body">Reconstrucción del metabolismo de bacterias a partir de sus genomas.</p>
                        <p class="services-more"><a href="#">Averigua más</a></p>
                    </div>
                </div>
        
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="services-group wow animated fadeInRight" data-wow-offset="40">
                        <p class="services-icon"><g:img dir="assets/icons" file="mues.png"/></i></p>
                        <h4 class="services-title">Genómica Funcional y Proteómica</h4>
                        <p class="services-body">Respuesta molecular de bacterias frente a compuestos orgánicos y a cambios en su entorno.</p>
                        <p class="services-more"><a href="#">Averigua más</a></p>
                    </div>        
                </div>
            </div>
            <!-- End Serivces Row 1 -->
      
            <!-- Begin Services Row 2 -->
            <div class="row services-row services-row-tail services-row-2">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="services-group wow animated fadeInLeft" data-wow-offset="40">
                        <p class="services-icon"><g:img dir="assets/icons" file="cel.png"/></span></p>
                        <h4 class="services-title">Síntesis de compuestos bioactivos y de interés biotecnológico</h4>
                        <p class="services-body">Hidroxilaciones y Glicosilaciones de compuestos aromáticos mediante enzimas microbianas.</p>
                        <p class="services-more"><a href="#">Averigua más</a></p>
                    </div>
                </div>
        
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="services-group wow animated zoomIn" data-wow-offset="40">
                        <p class="services-icon"><g:img dir="assets/icons" file="crom.png"/></i></p>
                        <h4 class="services-title">Bionanotecnología</h4>
                        <p class="services-body">Desarrollo de nanopartículas metálicas como sistemas de liberación de fármacos.</p>
                        <p class="services-more"><a href="#">Averigua más</a></p>
                    </div>
                </div>
        
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="services-group wow animated fadeInRight" data-wow-offset="40">
                        <p class="services-icon"><g:img dir="assets/icons" file="adn.png"/></p>
                        <h4 class="services-title">Biorremediación de Ambientes Contaminados</h4>
                        <p class="services-body">Biorremediación de metales pesados.</p>
                        <p class="services-more"><a href="#">Averigua más</a></p>
                    </div>
                </div>
            </div>
            <!-- End Serivces Row 2 -->
    
        </div>      
    </section>
    <!-- End #services-section -->


    <!-- Footer -->
    <footer> 
        <div class="container">
            <div class="row">
                <div class="col-md-0">
                    <h3><i class="fa fa-map-marker"></i> Contacto:</h3>
                    <p class="footer-contact">
                        Universidad Técnica Federico Santa María<br>

                        Av. España 1680, Edificio B, 3° piso, Valparaíso, Chile<br>
                        Phone: +56 32 7777777<br>
                        Email: labmmba@usm.cl<br>
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
                <h3><i class="fa fa-heart"></i> Redes Sociales</h3>
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
        <p>&copy; Copyright 2016, <a href="Http://www.labmmba.utfsm.cl/">LABMMBA</a>. Creado por Grupo 13 FISW</p>
    </div>

    

    <script type="text/javascript">
      new WOW().init();
    </script>

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
