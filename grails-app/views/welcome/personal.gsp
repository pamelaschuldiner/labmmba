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



    <!--End Header -->
    <!-- Main Container -->

    <div class="row container-kamn">
        <g:img dir="assets/slider" file="Imagen12.jpg" class="blog-post" alt="Feature-img" align="right" width="100%"/>
    </div>

    <div id="banners"></div>
    <div class="container">   
        <div class="row">
            <div class="side-left col-sm-4 col-md-4">

                <h3 class="lead"> Área Personal </h3><hr>
                <ul class="input-list style-2 clearfix">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:form controller="user" action="update_personal_data" enctype="multipart/form-data">
                    <table>
                        <p>Datos Personales</p>
                        <tr><p>
                          <td align="left">Nombres:     </td>
                          <td align="left"><g:textField name="firstname" class="others" size="40"/></td>
                        </tr></p>
                        <tr><p>
                          <td align="left">Apellidos:     </td>
                          <td align="left"><g:textField name="lastname" class="others" size="40"/></td>
                        </tr></p>
                                            <p>          </p>
                        <tr><p>
                          <td align="left">Foto de perfil:     </td>
                          <td align="left"><input type="file" name="avatar" size="40" accept="image/*"></td>
                        </tr></p>
                    </table>
                    <p>          </p>

                <tr><p>
                    <td align="left">Cargo en Laboratorio: </td>
                        <td align="left">
                            <select class="others" size="8" name="labrol">
                            <option selected="selected" required="true">Seleccione cargo en laboratorio...</option>
                            <option name="choice" id="choice1" type="radio" value="Estudiante Pregrado" onclick="hideTextBox()" class="others"/><label for="choice1">Estudiante Pregrado</label>
                            <option name="choice" id="choice2" type="radio" value="Estudiante Postgrado" onclick="hideTextBox()" class="others"/><label for="choice2">Estudiante Postgrado</label>
                            <option name="choice" id="choice3" type="radio" value="Trabajador" onclick="hideTextBox()" class="others"/><label for="choice3">Trabajador</label>
                            <option name="choice" id="choice4" type="radio" value="Jefe de Laboratorio" onclick="hideTextBox()" class="others"/><label for="choice4">Jefe de Laboratorio</label>
                            <option name="choice" id="choice5" type="radio" value="Colaborador Nacional" onclick="hideTextBox()" class="others"/><label for="choice5">Colaborador Nacional</label>
                            <option name="choice" id="choice6" type="radio" value="Colaborador Internacional" onclick="hideTextBox()" class="others"/><label for="choice6">Coladorador Internacional</label>
                            <option name="choice" id="choice7" type="radio" value="Otro" onclick="displayTextBox()" class="others"/><label for="choice7">Otro</label>
                        </select></p>
                                <p>
                                    <div id="otherTextBox" style="display:none;visibility:hidden;">
                                        <input type="text" placeholder=":focus" class="others" name="labrol" id="othertext">
                                    </div>
                                </p></td>
                    </tr></p>
                                        <p>          </p>
                    <tr><p>
                    <td align="left">Área de Investigación</td>
                        <td align="left">
                            <select class="others" size="6" name="campo">
                            <option selected="selected">Seleccione área de investigación...</option>
                            <option name="choice" id="choice1" type="radio" value="Biotecnología Vegetal" onclick="hideTextBox2()" class="others"/><label for="choice1">Biotecnología Vegetal</label>
                            <option name="choice" id="choice1" type="radio" value="Compuestos Bioactivos" onclick="hideTextBox2()" class="others"/><label for="choice2">Compuestos Bioactivos</label>
                            <option name="choice" id="choice1" type="radio" value="Microbiología" onclick="hideTextBox2()" class="others"/><label for="choice3">Microbiología</option>
                            <option name="choice" id="choice1" type="radio" value="Biotecnología" onclick="hideTextBox2()" class="others"/><label for="choice4">Biotecnología Ambiental</label>
                            <option name="choice" id="choice5" type="radio" value="Otro" onclick="displayTextBox2()" class="others"/><label for="choice5">Otro</label>
                        </select>
                            <p>
                                <div id="otherTextBox2" style="display:none;visibility:hidden;">
                                    <input type="text" placeholder=":focus" class="others" name="campo" id="othertext2">
                                </div>
                            </p></td>
                    </tr></p>
                    </table>
                    <g:actionSubmitImage value="update_personal_data" src="${resource(dir: 'assets/images', file: 'agregar.png')}"/>
                </g:form>
                </ul>
            </div>

            <div class="col-sm-8 col-md-8">
               <div id='cssmenu'>
                    <ul>
                        <li><g:link controller="welcome" action="resumenperfil">Resumen de Perfil</g:link></li>
                        <li><g:link controller="welcome" action="personal">Personal</g:link></li>
                        <li><g:link controller="welcome" action="estudios">Estudios</g:link></li>
                        <li><g:link controller="welcome" action="publicaciones">Publicaciones</g:link></li>
                        <li><g:link controller="welcome" action="editarGaleria">Galeria</g:link></li>
                        <li><g:link controller="welcome" action="proyectos">Proyectos</g:link></li>
                        <li><g:link controller="welcome" action="congresos">Congresos</g:link></li>
                        <li><g:link controller="welcome" action="avancetesis">Avance de Tesis</g:link></li>
                        <li><g:link controller="welcome" action="mensajes">Mensajes</g:link></li>
                        <li><g:link controller="welcome" action="busqueda">Buscador</g:link></li>
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

  </body>
  <script>
 
    
        function displayTextBox()
        {
            var objElement = document.getElementById('otherTextBox');
            otherTextBox.style.display = 'block';
            otherTextBox.style.visibility = 'visible';
        }
        function displayTextBox2()
        {
            var objElement2 = document.getElementById('otherTextBox2');
            otherTextBox2.style.display = 'block';
            otherTextBox2.style.visibility = 'visible';
        }

        function hideTextBox2()
        {
            var objElement2 = document.getElementById('otherTextBox2');
            otherTextBox2.style.display = 'none';
            otherTextBox2.style.visibility = 'hidden';
        }

        function hideTextBox()
        {
            var objElement = document.getElementById('otherTextBox');
            otherTextBox.style.display = 'none';
            otherTextBox.style.visibility = 'hidden';
        }

        function validate()
        {
            var arrElements = document.getElementsByName('choice');
            var objElement;
            var objElement2;
            var boolContinue = false;
            var objOtherText;

            for(var i=0, _length=arrElements.length; i<_length; i++)
            {
                objElement = arrElements[i];

                if(objElement.checked)
                {
                    if(objElement.id == 'choice7')
                    {
                        objOtherText = document.getElementById('othertext');

                        if(strTrim(objOtherText.value).length>0)
                        {
                            boolContinue = true;
                            break;
                        }
                    }
                    else
                    {
                        boolContinue = true;
                        break;
                    }
                }
            }
            for(var i=0, _length=arrElements.length; i<_length; i++)
            {
                objElement2 = arrElements[i];

                if(objElement1.checked)
                {
                    if(objElement2.id == 'choice5')
                    {
                        objOtherText = document.getElementById('othertext2');

                        if(strTrim(objOtherText.value).length>0)
                        {
                            boolContinue = true;
                            break;
                        }
                    }
                    else
                    {
                        boolContinue = true;
                        break;
                    }
                }
            }
            if(boolContinue)
            {
                alert('Continue, user completed the information.')
            }
            else
            {
                alert('Ask user to complete the data.')
            }
        }

       
    </script>
</html>
