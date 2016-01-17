<!doctype html>
<html lang="en">
    <head>
        
        <meta charset="utf-8">
        <title>Lammba - Laboratorio de Microbiología Molecular y Biotecnología Ambiental</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <g:external dir="assets" file="jquery-2.1.3.js" />
        <g:external base="http://fonts.googleapis.com/css?family=Open+Sans:400,300" type="css"/>
        <g:external base="http://fonts.googleapis.com/css?family=PT+Sans" type="css"/>
        <g:external base="http://fonts.googleapis.com/css?family=Raleway" type="css"/>
        <g:external dir="assets" file="bootstrap.css" />
        <g:external dir="assets" file="font-awesome.min.css" />
        <g:external dir="assets" file="style.css" />
        <g:external dir="assets" file="animate.min.css" />
        <g:external dir="assets" file="login.css" />
        <g:external dir="assets" file="style-projects.css" />
        <g:external dir="assets" file="jquery.cookie.js" />
        <g:external dir="assets" file="jquery.hoverIntent.minified.js" />
        <g:external dir="assets" file="jquery.dcjqaccordion.2.9.js" />
        <g:external dir="assets" file="index.js" />


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

                <h3 class="lead"> Resumen de perfil </h3><hr>
                <ul class="input-list style-2 clearfix">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                        <!--Username y nombre -->
                        <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:user.ident())}"  width="108"/>

                        <sec:access url='/welcome/resumenperfil'>

                            <p><g:submitButton name="show_edit" value="Editar" onclick="for (var i = 0; i < document.getElementsByClassName('edit').length; i++){document.getElementsByClassName('edit')[i].style.visibility = 'visible'}" ></g:submitButton></p>


                        </sec:access>
                        <tr><p>
                            <td align="left">Username:     </td>
                            <td align="left"><f:display bean="user" property="username"/> </td>
                        </p></tr>

                        <tr><p>
                            <td align="left">Nombres:     </td>
                            <td align="left"><f:display bean="user" property="firstname"/> </td>
                        </p></tr>
                        <tr><p>
                            <td align="left">Apellidos:     </td>
                            <td align="left"><f:display bean="user" property="lastname"/> </td>
                        </p></tr>
                        <!--Roles y areas -->
                        <g:if test="${user.labrol}">
                             <tr><p>
                                <td align="left">Cargo Laboratorio: </td>
                                <td align="left">${user.labrol.labrol_name}  </td>
                             </p></tr>
                        </g:if>
                        <tr><p>
                            <table>
                                <td align="left">Areas:     </td>
                                <g:each in="${user.fields.sort({it.id})}">
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left">${it.field_name}  </td>
                                        <td align="left" class="edit" style="visibility:hidden" >
                                            <g:form controller="user" action="eliminar_area" params="[area_id: it.id]" method="DELETE">
                                                <g:submitButton name="Eliminar" value="Eliminar" onclick="return confirm('¿Está usted seguro?');">Eliminar</g:submitButton>
                                            </g:form>
                                        </td>
                                    </tr>
                                </g:each>
                           </table>
                        </p></tr>
                        <!--Estudios,universidades y thesis -->
                        <tr><p>
                            <td align="left">Estudios:     </td>
                                <g:each in="${user.studys.sort({it.id})}">
                                    <table>
                                    <tr><p>
                                        <td align="left">${it.study_type}: </td>
                                        <td align="left">${it.study_name}  </td>
                                        <td align="left" class="edit" style="visibility:hidden" >
                                            <g:form controller="study" action="delete" resource="${it}"  method="delete">
                                                <g:submitButton name="Eliminar" value="Eliminar" onclick="return confirm('¿Está usted seguro?');">Eliminar</g:submitButton>
                                            </g:form>
                                        </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Universidad: </td>
                                        <td align="left">${it.university.uni_name}  </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Pais: </td>
                                        <td align="left"><g:country code="${it.university.uni_count}"/>  </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Ciudad: </td>
                                        <td align="left">${it.university.uni_city}  </td>
                                    </p></tr>

                                        <g:each in="${it.thesis}">
                                            <tr><p>
                                                <td align="left">Thesis: </td>
                                                <sec:ifLoggedIn>
                                                    <td align="left"><g:link controller="thesi" action="download" resource="${it}">${it.thesis_name}</g:link> </td>
                                                </sec:ifLoggedIn>
                                                <sec:ifNotLoggedIn>
                                                    <td align="left">${it.thesis_name} </td>
                                                </sec:ifNotLoggedIn>
                                            </p></tr>
                                            <tr><p>
                                                <td align="left">Tutor: </td>
                                                <td align="left">${it.thesis_tutor}  </td>
                                            </p></tr>
                                            <g:if test="${it.thesis_cotutor}">
                                                <tr><p>
                                                   <td align="left">Cotutor: </td>
                                                   <td align="left">${it.thesis_cotutor}  </td>
                                                </p></tr>
                                            </g:if>

                                        </g:each>
                                    </table>
                                </g:each>
                        </p></tr>
                        <!--Libros y revistas -->
                        <tr><p>
                            <td align="left">Publicaciones:</td>
                            <g:each in="${user.magazines.sort({it.id})}">
                                <table>
                                    <tr><p>
                                        <td align="left">Revista: </td>
                                        <sec:ifLoggedIn>
                                            <td align="left"><g:link controller="magazine" action="download" resource="${it}">${it.mag_name}</g:link></td>
                                            <td align="left" class="edit" style="visibility:hidden" >
                                                <g:form controller="magazine" action="delete" resource="${it}"  method="delete">
                                                    <g:actionSubmit value="Eliminar" action="Delete" onclick="return confirm('¿Está usted seguro?');">Eliminar</g:actionSubmit>
                                                </g:form>
                                            </td>
                                        </sec:ifLoggedIn>
                                        <sec:ifNotLoggedIn>
                                            <td align="left">${it.mag_name} </td>
                                        </sec:ifNotLoggedIn>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Campo: </td>
                                        <td align="left">${it.field.field_name}  </td>
                                    </p></tr>
                                </table>
                            </g:each>

                            <g:each in="${user.books.sort({it.id})}">
                                <table>
                                    <tr><p>
                                        <td align="left">Libro: </td>
                                        <sec:ifLoggedIn>
                                            <td align="left"><g:link controller="books" action="download" resource="${it}">${it.book_name}</g:link></td>
                                            <td align="left" class="edit" style="visibility:hidden" >
                                                <g:form controller="book" action="delete" resource="${it}"  method="delete">
                                                    <g:actionSubmit value="Eliminar" action="Delete" onclick="return confirm('¿Está usted seguro?');">Eliminar</g:actionSubmit>
                                                </g:form>
                                            </td>
                                        </sec:ifLoggedIn>
                                        <sec:ifNotLoggedIn>
                                            <td align="left">${it.book_name}  </td>
                                        </sec:ifNotLoggedIn>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Edicion: </td>
                                        <td align="left">${it.book_ed}  </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Año: </td>
                                        <td align="left"><g:formatDate format="yyyy" date="${it.book_year}" /></td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">ISBN: </td>
                                        <td align="left">${it.book_isbn}  </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Autores: </td>
                                        <td align="left">${it.book_authors}  </td>
                                    </p></tr>
                                </table>
                            </g:each>
                        </p></tr>
                        <!-- Proyectos  -->
                        <tr><p>
                            <td align="left">Proyectos:</td>
                            <g:each in="${user.proyects.sort({it.id})}">
                                <table>
                                    <tr><p>
                                        <td align="left">Proyecto: </td>
                                        <td align="left">${it.proy_name}  </td>
                                        <td align="left" class="edit" style="visibility:hidden" >
                                            <g:form controller="proyect" action="delete" resource="${it}"  method="delete">
                                                <g:actionSubmit value="Eliminar" action="Delete" onclick="return confirm('¿Está usted seguro?');">Eliminar</g:actionSubmit>
                                            </g:form>
                                        </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Año Inicio: </td>
                                        <td align="left"><g:formatDate format="yyyy" date="${it.proy_start}" /></td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Año Fin: </td>
                                        <td align="left"><g:formatDate format="yyyy" date="${it.proy_end}" /></td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Rol: </td>
                                        <td align="left">${it.proy_role}  </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Observacion: </td>
                                        <td align="left">${it.proy_obs}  </td>
                                    </p></tr>
                                </table>
                            </g:each>
                        </p></tr>
                        <!-- Congresos  -->
                        <tr><p>
                            <td align="left">Congresos:</td>
                            <g:each in="${user.events.sort({it.id})}">
                                <table>
                                    <tr><p>
                                        <td align="left">Congreso: </td>
                                        <td align="left">${it.event_name}  </td>
                                        <td align="left" class="edit" style="visibility:hidden" >
                                            <g:form controller="proyect" action="delete" resource="${it}"  method="delete">
                                                <g:actionSubmit value="Eliminar" action="Delete" onclick="return confirm('¿Está usted seguro?');">Eliminar</g:actionSubmit>
                                            </g:form>
                                        </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Ciudad: </td>
                                        <td align="left">${it.event_city}  </td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Pais: </td>
                                        <td align="left"><g:country code="${it.event_count}"/></td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Fecha Inicio: </td>
                                        <td align="left"><g:formatDate format="yyyy-MM-dd" date="${it.event_datei}" /></td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Fecha Fin: </td>
                                        <td align="left"><g:formatDate format="yyyy-MM-dd" date="${it.event_datef}" /></td>
                                    </p></tr>
                                    <tr><p>
                                        <td align="left">Nombre Presentacion: </td>
                                        <sec:ifLoggedIn>
                                            <td align="left"><g:link controller="event" action="download" resource="${it}">${it.event_pname}</g:link> </td>
                                        </sec:ifLoggedIn>
                                        <sec:ifNotLoggedIn>
                                            <td align="left">${it.event_pname}  </td>
                                        </sec:ifNotLoggedIn>
                                    </p></tr>
                                </table>
                            </g:each>
                        </p></tr>
                </ul>

                <ul class="input-list style-2 clearfix">
                        <!-- Begin #carousel-section -->
                        <g:if test="${images.length>0||videos.length>0||private_images.length>0||private_videos.length>0}" >
                            <h3 class="lead"> Galeria </h3><hr>
                            <tr><p>
                                <section id="carousel-section" class="section-global-wrapper">
                                    <div class="container-fluid-kamn">
                                        <div class="row">
                                            <div id="carousel-1" class="carousel slide">

                                                <!-- Indicators -->
                                                <ol class="carousel-indicators visible-lg">
                                                    <g:each in="${images}" status="i" var="image">
                                                        <g:if test="${i==0}">
                                                            <li data-target="#carousel-1" data-slide-to="${i}" class="active"></li>
                                                        </g:if>
                                                        <g:else>
                                                            <li data-target="#carousel-1" data-slide-to="${i}"></li>
                                                        </g:else>
                                                    </g:each>

                                                    <g:each in="${videos}" status="i" var="video">
                                                        <g:if test="${images.length==0}">
                                                            <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                                                        </g:if>
                                                        <g:else>
                                                            <li data-target="#carousel-1" data-slide-to="${i+images.length}"></li>
                                                        </g:else>
                                                    </g:each>

                                                    <g:each in="${private_images}" status="i" var="imagen">
                                                        <g:if test="${images.length+videos.length==0}">
                                                            <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                                                        </g:if>
                                                        <g:else>
                                                            <li data-target="#carousel-1" data-slide-to="${i+images.length}"></li>
                                                        </g:else>
                                                    </g:each>

                                                    <g:each in="${private_videos}" status="i" var="video">
                                                        <g:if test="${images.length+videos.length+private_images.length==0}">
                                                            <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                                                        </g:if>
                                                        <g:else>
                                                            <li data-target="#carousel-1" data-slide-to="${i+images.length}"></li>
                                                        </g:else>
                                                    </g:each>
                                                </ol>

                                                <!-- Wrapper for slides -->
                                                <div class="carousel-inner">
                                                    <g:each in="${images}" status="i" var="image">
                                                        <g:if test="${i==0}">
                                                            <div class="item active">
                                                                <img class="slide" src="${createLink(controller:'user', action:'media', resource: user, params:[tipo: "imagen", name: image.name])}"  height="400" width="100%"/>
                                                            </div>
                                                        </g:if>
                                                        <g:else>
                                                            <div class="item">
                                                                <img class="slide" src="${createLink(controller:'user', action:'media', resource: user, params:[tipo: "imagen",name: image.name])}" height="400" width="100%"/>
                                                            </div>
                                                        </g:else>
                                                    </g:each>

                                                    <g:each in="${videos}" status="i" var="video">
                                                        <g:if test="${images.length==0&&i==0}">
                                                            <div class="item active">
                                                                <video class="slide" src="${createLink(controller:'user', action:'media', resource: user, params:[tipo: "video",name: video.name])}" height="400" width="100%" controls/>
                                                            </div>
                                                        </g:if>
                                                        <g:else>
                                                            <div class="item">
                                                                <video class="slide" src="${createLink(controller:'user', action:'media', resource: user, params:[tipo: "video",name: video.name])}" height="400" width="100%" controls/>
                                                            </div>
                                                        </g:else>
                                                    </g:each>

                                                    <g:each in="${private_images}" status="i" var="image">
                                                        <g:if test="${images.length+videos.length==0}">
                                                            <div class="item active">
                                                                <img class="slide" src="${createLink(controller:'user', action:'media', resource: user, params:[tipo: "imagen_privada", name: image.name])}"  height="400" width="100%"/>
                                                            </div>
                                                        </g:if>
                                                        <g:else>
                                                            <div class="item">
                                                                <img class="slide" src="${createLink(controller:'user', action:'media', resource: user, params:[tipo: "imagen_privada",name: image.name])}" height="400" width="100%"/>
                                                            </div>
                                                        </g:else>
                                                    </g:each>

                                                    <g:each in="${private_videos}" status="i" var="video">
                                                        <g:if test="${images.length+videos.length+private_images.length==0}">
                                                            <div class="item active">
                                                                <video class="slide" src="${createLink(controller:'user', action:'media', resource: user, params:[tipo: "video_privado",name: video.name])}" height="400" width="100%" controls/>
                                                            </div>
                                                        </g:if>
                                                        <g:else>
                                                            <div class="item">
                                                                <video class="slide" src="${createLink(controller:'user', action:'media', resource: user, params:[tipo: "video_privado",name: video.name])}" height="400" width="100%" controls/>
                                                            </div>
                                                        </g:else>
                                                    </g:each>
                                                </div>

                                                <!-- Controls -->
                                                <a class="left  carousel-control" href="#carousel-1" data-slide="prev" style="background-image: none;height: 90%;" onclick="$('#carousel-1').carousel('prev')">
                                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                                </a>
                                                <a class="right carousel-control" href="#carousel-1" data-slide="next" style="background-image: none;height: 90%;" onclick="$('#carousel-1').carousel('next')">
                                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </p></tr>
                        </g:if>

                        <!-- End #carousel-section -->
                    </table>

                </ul>
            </div>

            <div class="col-sm-8 col-md-8">

                <sec:access url='/welcome/resumenperfil'>
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
                            <li><g:link controller="welcome" action="cuenta">Cuenta</g:link></li>
                        </ul>
                    </div>
                </sec:access>
                <sec:noAccess url='/welcome/resumenperfil'>
                    <div id='cssmenu'>
                        <ul>

                        </ul>
                    </div>
                </sec:noAccess>

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
  <script>
 
        function addInput(divName){
                  var newdiv = document.createElement('div');
                  newdiv.innerHTML = "<p>Tipo de Estudio: <select> <option value='Pregrado' name='myInputs[]'>Pregrado</option> <option value='Postgrado' name='myInputs[]'>Postgrado</option> </select></p> <p>Universidad: <input type='text' name='myInputs[]'></p> <p>Universidad: <input type='text' name='myInputs[]'></p> <p>País: <input type='text' name='myInputs[]'></p> <p>Tesis: <input type='text' name='myInputs[]'></p> <p>Profesor Tutor: <input type='text' name='myInputs[]'></p> <p>Profesor Cotutor: <input type='text' name='myInputs[]'></p> <p>PDF Tesis: <input type='text' name='myInputs[]'></p>";
                  document.getElementById(divName).appendChild(newdiv);
        }


        

    </script>
</html>
