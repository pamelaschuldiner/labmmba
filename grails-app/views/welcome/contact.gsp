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
                    <li>
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
                    <li class="active">
                        <g:link controller="welcome" action="contact">Contacto</g:link>
                    </li>
                    <sec:ifLoggedIn>
                        <li> <g:link url="j_spring_security_logout">Logout</g:link> </li>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
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
                                                        <input type="username" class="text_" name="j_username" id="username">
                                                    </p>

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


        <!-- Main Container -->

        <div class="container-fluid-kamn">
            <div class="row">
                <div>
                    <iframe width="100%" height="450px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3344.820903760036!2d-71.59652598510536!3d-33.034848583687975!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9689e08fd59cf72f%3A0xd4edb558ea6e3929!2sUniversidad+T%C3%A9cnica+Federico+Santa+Mar%C3%ADa!5e0!3m2!1ses!2scl!4v1450333627163"></iframe>
                    <br />
                </div>
                <div class="col-lg-4 col-lg-offset-1">
                    <h4>Encuéntranos en:</h4>
                    <p class="block-author"> Laboratorio de Microbiología Molecular y Biotecnología Ambiental (LABMMBA)</p>
                    <p>Universidad Técnica Federico Santa María</p>
                    <p>Av. España 1680, Edificio B, 3° piso, Valparaíso, Chile</p>
                    <p>Phone: +56 32 7777777</p>
                    <em class="block-author">Email: labmmba@usm.cl </em> <br>
                    <br>
                    <p>
                        <g:img dir="assets" file="ubicacion.jpg" alt=""/>
                    </p>
                    <p class="lead">Redes Sociales</p><hr>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <g:img dir="assets/social-icons" file="btn_skype.png" alt=""/>
                        Llámanos
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <g:img dir="assets/social-icons" file="btn_facebook.png" alt=""/>
                        Apóyanos
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-3 col-xs-12">
                        <g:img dir="assets/social-icons" file="btn_twitter.png" alt=""/>
                        Síguenos
                    </div>
                    <br>
                </div>
                <div class="col-lg-5">
                    <div class="feedback-form">
          
                        <div id="contact-response"></div>
            
                        <form action="http://templates.designorbital.com/baleen/contact.php" method="post" id="contact-form">
                            <fieldset>
                                <div class="form-group form-group-fullname">
                                    <label class="control-label" for="fullname">Nombre: *</label>
                                    <input type="text" class="form-control" name="fullname" id="fullname" placeholder="Enter Your Name">
                                </div>
                                <div class="form-group form-group-email">
                                    <label class="control-label" for="email">Correo Electrónico: *</label>
                                    <input type="text" class="form-control" name="email" id="email" placeholder="Enter Your E-Mail">
                                </div>
                                <div class="form-group form-group-message">
                                    <label class="control-label" for="message">Mensaje: *</label>
                                    <textarea class="form-control" name="message" id="message" rows="3"></textarea>
                                </div>           
                                <button type="submit" class="btn btn-primary">Enviar</button>
                            </fieldset>
                        </form>
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