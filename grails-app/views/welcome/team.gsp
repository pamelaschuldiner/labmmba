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
                    <li class="active">
                        <g:link controller="welcome" action="team">Nuestro Equipo</g:link>
                    </li>
                    <li>
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

    <div class="row container-kamn">
        <g:img dir="assets/" file="team.jpg" class="blog-post" alt="Feature-img" align="right" width="100%"/>
    </div>

   <div id="banners"></div>
    <div class="container">
        <div class="row">
            <g:each in="${users}" status="i" var="user">
                <div class="col-md-6">
                    <g:if test="${i%2}" >
                        <div class="blockquote-box blockquote-info animated wow fadeInRight clearfix">
                    </g:if>
                    <g:else>
                        <div class="blockquote-box blockquote-info animated wow fadeInLeft clearfix">
                    </g:else>
                        <div class="square pull-left">
                            <g:link controller="welcome" action="resumenperfil" id="${user.id}"><img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:user.id)}"  width="108"/></g:link>
                        </div>
                        <h4>
                            ${user.firstname} ${user.lastname}
                        </h4>
                        <g:if test="${user.labrol != null}" >
                            <p>
                                ${user.labrol.labrol_name}
                            </p>
                        </g:if>
                    </div>
                </div>
            </g:each>

            <div class="col-md-6">
                <div class="blockquote-box blockquote-info animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/myriamgonzalez.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Myriam González
                    </h4>
                    <p>
                        Jefe de Laboratorio
                    </p>

                </div>
                <div class="blockquote-box blockquote-primary animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/beatrizcamara.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Beatriz Cámara
                    </h4>
                </div>

                <div class="blockquote-box blockquote-success animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/fabiolaaltamira.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Fabiola Altamira
                    </h4>
                    <p>
                        Tesista de Magíster
                    </p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="blockquote-box blockquote-danger animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/michaelseeger.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Michael Seeger
                    </h4>
                    <p>
                        Director del Laboratorio
                    </p>
                </div>
                <div class="blockquote-box blockquote-warning animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/guillermobravo.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Guillermo Bravo
                    </h4>
                </div>
                <div class="blockquote-box animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/pamelavillegas.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Pamela Villegas
                    </h4>
                </div>

            </div>
            <div class="col-md-6">
                <div class="blockquote-box blockquote-info animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/mariajosevargas.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        María José Vargas
                    </h4>
                </div>
                <div class="blockquote-box blockquote-primary animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/francocardenas.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Franco Cárdenas
                    </h4>
                </div>
                <div class="blockquote-box blockquote-success animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/hyroncanchignia.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Hyron Canchignia
                    </h4>
                </div>
            </div>
            <div class="col-md-6">
                <div class="blockquote-box blockquote-danger animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/patriciaaguila.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Patricia Águila
                    </h4>
                </div>
                <div class="blockquote-box blockquote-warning animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/annaespinoza.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Anna Espinoza
                    </h4>
                </div>
                <div class="blockquote-box animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/mariajosevargas.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Valentina Méndez
                    </h4>
                    <p>
                        Investigador Asociado
                    </p>
                </div>
                
            </div>
               <div class="col-md-6">
                <div class="blockquote-box blockquote-info animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/franciscomontero.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Francisco Montero
                    </h4>
                </div>
                <div class="blockquote-box blockquote-primary animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                         <img src="/assets/team/sebastianfuentes.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Sebastián Fuentes
                    </h4>
                </div>
                <div class="blockquote-box blockquote-success animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/paulinavega.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Paulina Vega
                    </h4>
                </div>
            </div>
            <div class="col-md-6">
                <div class="blockquote-box blockquote-danger animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/barbarabarra.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Bárbara Barra
                    </h4>
                </div>
                <div class="blockquote-box blockquote-warning animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/agustinaundabarrena.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Agustina Undabarrena
                    </h4>
                 </div>
                <div class="blockquote-box animated wow fadeInRight clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/valentinagonzalez.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Valentina González
                    </h4>
                </div>
            </div>
            <div class="col-md-6">
                <div class="blockquote-box blockquote-info animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/pabloalviz.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Pablo Alviz
                    </h4>
                </div>
                <div class="blockquote-box blockquote-primary animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                         <img src="/assets/team/vivianaurtuvia.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Viviana Urtuvia
                    </h4>
                </div>
                <div class="blockquote-box blockquote-success animated wow fadeInLeft clearfix">
                    <div class="square pull-left">
                        <img src="/assets/team/felipeaguilera.jpg" alt="Feature-img" height="100" width="100">
                    </div>
                    <h4>
                        Felipe Aguilera
                    </h4>
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
