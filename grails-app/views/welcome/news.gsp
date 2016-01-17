<!doctype html>

<html lang="en">
    <head>
        
        <meta charset="utf-8">
        <title>Lammba - Laboratorio de Microbiología Molecular y Biotecnología Ambiental</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js" type="text/javascript"></script>
        <g:external base="http://fonts.googleapis.com/css?family=Open+Sans:400,300" type="css"/>
        <g:external base="http://fonts.googleapis.com/css?family=PT+Sans" type="css"/>
        <g:external base="http://fonts.googleapis.com/css?family=Raleway" type="css"/>
        <g:external dir="assets" file="bootstrap.css" />
        <g:external dir="assets" file="font-awesome.min.css" />
        <g:external dir="assets" file="style.css" />
        <g:external dir="assets" file="animate.min.css" />
        <g:external dir="assets" file="login.css" />
        <g:external dir="assets" file="style-projects.css" />
        <g:external dir="assets" file="RegalCalendar.css" />
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <g:external dir="assets" file="jquery.cookie.js" />
        <g:external dir="assets" file="jquery.hoverIntent.minified.js" />
        <g:external dir="assets" file="jquery.dcjqaccordion.2.7.min.js" />
        <g:external dir="assets" file="jquery-2.1.3.js" />
        <g:external dir="assets" file="RegalCalendar.js" />
        <g:external dir="assets" file="jquery-1.9.1.min.js" />

        

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
                    <li class="active">
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

    <!-- End Header -->

    <!-- Main Container -->

    <div class="row container-kamn">
        <g:img dir="assets/" file="bact.jpg" class="blog-post" alt="Feature-img" align="right" width="100%" />
    </div>
    <div id="banners"></div>
        <div class="container">
            <div class="row">
                <br>
                <br>
                    <div class="blog-post">
                        <h1 class="blog-title">
                            <i class="fa fa-file-text"></i>
                            Somos simplemente 30 billones de células
                        </h1>
                        <br>

                        <br>

                        <p>
                            Tres científicos del Instituto Weizmann de Ciencias, en Rejovot (Israel), enfadarán ahora a los poetas que piensen como el amigo de Feynman. Los investigadores, armados con los últimos datos disponibles, han recalculado el número de células de las que está compuesto un ser humano. Y somos simplemente 30 millones de millones de células, el 84% de ellas glóbulos rojos, los responsables de transportar el oxígeno en la sangre. Con esos 30 billones de células, David Bowie fue capaz de componer Space Oddity, Alice Munro escribió Demasiada felicidad y Adolf Hitler mandó asesinar a millones de personas.</p>
                        <p>
                            El cálculo, que hay que tomar con cautela porque todavía no se ha publicado en ninguna revista científica, se ha colgado en la web bioRxiv del Laboratorio Cold Spring Harbor de EE UU. El estudio tumba un mantra instalado en la comunidad científica desde la década de 1970: que en nuestro cuerpo hay muchísimas más bacterias que células humanas, en una proporción de 10 a 1. El nuevo trabajo calcula 39 billones de bacterias en nuestro organismo, la mayor parte en el colon del intestino grueso, frente a los 30 billones de células humanas. La proporción es de 1,3 a 1.</p>
                        <p>
                            “Las cifras son lo suficientemente similares como para que cada defecación pueda voltear la proporción en favor de las células humanas”, explican los autores en su estudio, en una frase con implicaciones filosóficas. Cada vez que una persona acude al váter a evacuar el vientre, expulsa un tercio de las bacterias de su colon. En ese acto íntimo, el sujeto deja de ser numéricamente bacteriano para convertirse en plenamente humano. El trabajo está firmado por los investigadores Ron Sender, Shai Fuchs y Ron Milo.</p>
                        <p>
                            La proporción de 10 bacterias por cada célula humana se arrastra desde 1972, cuando el microbiólogo estadounidense Thomas Donnell Luckey publicó una primera estimación de la fauna bacteriana en el aparato digestivo humano. Luckey calculó 100 billones de bacterias, asumiendo una densidad constante de 100.000 millones de bacterias por gramo de contenido a lo largo del tracto digestivo. Pero Luckey se equivocó, según los científicos del Instituto Weizmann de Ciencias, que subrayan que esa elevada densidad bacteriana solo aparece en el colon del intestino grueso.</p>
                        <p>
                            El trabajo de Sender, Fuchs y Milo basa sus cálculos en el llamado “hombre de referencia”, un varón teórico de entre 20 y 30 años de edad, con un peso de 70 kilogramos y 170 centímetros de altura. Los autores recuerdan que la concentración de glóbulos rojos es un 10% menor en las mujeres, y su volumen sanguíneo también es alrededor de un 25% menor al de los hombres. Sin embargo, el volumen de su colon y su densidad bacteriana es similar. “Por lo tanto, creemos que la proporción de bacterias frente a células humanas se incrementará un tercio en las mujeres”, señalan los científicos.</p>
                        <p>
                            Nuestros 30 billones de células solo pesan 47 kilogramos, el resto son líquidos y sólidos extracelulares</p>
                        <p>
                            De los 70 kilogramos de la persona de referencia no todo corresponde al peso de sus células. El 25% procede del líquido extracelular y otro 7% son sólidos extracelulares. Nuestros 30 billones de células solo pesan 47 kilogramos. El 75% de esta masa se debe a solo dos tipos de células: los adipocitos que forman la grasa y las células musculares. Ambos tipos suponen menos del 0,2% del número total de células de una persona, pero su gran tamaño (10.000 micrómetros cúbicos) hace que representen la mayor parte del peso de un individuo. Los glóbulos rojos, las células más abundantes, tienen un volumen de apenas 100 micrómetros cúbicos y pesan en total dos kilogramos y medio.</p>
                        <p>
                            El equipo de Ron Milo defiende la utilidad de su trabajo, más allá de ser un pasatiempo intelectual. "Un reciente estudio muestra que conocer el número de células en diferentes tejidos puede ser un indicador importante para entender las variaciones del riesgo de cáncer entre esos tejidos", apuntan los autores. Y, por supuesto, lo que ha conseguido el trío de científicos es sepultar una estimación errónea que nos hacía más bacterianos que humanos.</p>
                        

                        <div>

                            <span class="badge">Posted 2012-08-02 20:47:04</span>
                            <div class="pull-right">
                                <span class="label label-default">alice</span> 
                                <span class="label label-primary">story</span> 
                                <span class="label label-success">blog</span> 
                                <span class="label label-info">personal</span> 
                                <span class="label label-warning">Warning</span>
                                <span class="label label-danger">Danger</span>
                            </div>         
                        </div>
                    </div>
                    <hr>

                    <div class="blog-post">
                        <h1 class="blog-title">
                            <i class="fa fa-file"></i>
                            Así son los gérmenes en el espacio
                        </h1>
                        <img src="assets/img/slider/blog2.jpg" alt="Feature-img" align="right" width="100%" class="blog-image"> 
                        <br>
                        <p>                            
                            Cuando la tripulación del Ares III se ve obligada a evacuar Marte ante una peligrosa tormenta de arena, el astronauta Mark Watney queda atrapado y sus compañeros le dan por muerto. Pero, sorprendentemente, este ingeniero mecánico de la NASA sobrevive y debe ingeniárselas con astucia para subsistir en el planeta rojo hasta que consiguen rescatarle. Es el argumento de la última producción norteamericana de ciencia ficción espacial, Marte. Lo que probablemente desconoce su director, Ridley Scott, es que si la historia fuese real el protagonista también se habría tenido que enfrentar a peligros inusuales a bordo de la nave en que viajaba. Concretamente, a inusuales infecciones. "La salud de las tripulaciones de los vuelos espaciales presentes y futuros es de máxima importancia, y sobre todo en lo que se refiere a la infección por microbios", explica a Materia Kasthuri Venkaterswaran, investigador del Laboratorio de Propulsión a Chorro de la NASA.</p>
                        <p>
                            Decididos a averiguar con qué gérmenes conviven los astronautas, Venkaterswaran y sus colegas han analizado a conciencia unas muestras de polvo obtenidas en la Estación Espacial Internacional (ISS, por sus siglas en inglés), que es el mejor campo de experimentación para estudiar posibles bioamenazas. Y han descubierto importantes diferencias, incluyendo unas bacterias oportunistas, en su mayoría inocuas en la Tierra, que en el espacio podrían causar inflamación e irritación de la piel, tal y como publica la revista Microbiome. Es la primera vez que, en lugar de usar los tradicionales cultivos de bacterias y hongos, se aplican tecnologías de secuenciación molecular del ADN para identificar gérmenes en el espacio, una técnica mucho más precisa y completa, que en principio no deja ningún microbio sin identificar.</p>
                        <p>
                            Para el estudio los científicos tomaron muestras de polvo de los filtros de aire y las aspiradoras a bordo de la ISS. Y compararon las muestras con el polvo obtenido de las habitaciones limpias de la NASA, unos espacios confinados y controlados que la agencia ha construido en Pasadena (California). Los experimentos revelaron que la población de actinobacterias, un tipo de bacteria asociada a la piel humana, parece ser mucho mayor en la ISS, algo que según sugieren los autores del estudio podría solventarse con una limpieza más rigurosa.</p>
                        <p>
                            La salud de las tripulaciones de los vuelos espaciales presentes y futuros es de máxima importancia"</p>
                        <p>
                            Asimismo se han detectado más Bacillus y Staphylococcus en este centro de investigación en órbita que en tierra firme. Otra familia de microbios a las que habrá que estar atentos son las corinebacterias, especies comensales de piel y mucosas que cuando se vuelven oportunistas pueden causar linfadenitis, endocarditis, neumonías, meningitis y otras infecciones. En cuanto a los hongos, en la ISS predominaba Aspergillus niger, relacionado con infecciones de oído y pulmonares, aunque con escaso potencial para causar enfermedades. Que el aire de la ISS recircule y no se renueve podría explicar algunas de estas diferencias. Y los efectos de la microgravedad sobre los gérmenes también podrían resultar claves.</p>
                        <p>
                            La investigación no terminará aquí. "El Consejo de Investigación Nacional recomienda averiguar si las especies que viven largo tiempo aisladas en la ISS sufren cambios genéticos permanentes, ven aumentada su virulencia o desarrollan resistencia a antibióticos como consecuencia de las condiciones de microgravedad", explica Venkaterswaran.</p>
                        <p>
                            Pero no basta con conocer a qué microorganismos se enfrentan los astronautas para preparar su futuro arsenal farmacéutico. También es fundamental averiguar si pierden alguno "propio" cuando salen al espacio. A ras de suelo, cada ser humano lleva a cuestas diez veces más microbios que células propias. Pertenecen a centenares de especies distintas, y muchos de ellos nos protegen compitiendo con otros organismos y manteniendo a raya a los patógenos, a la vez que colaboran en la digestión y la absorción de nutrientes, e incluso regulan los estados mentales y el ánimo. En otras palabras, que estemos sanos y felices depende en gran medida de ellos.</p>
                        <p>
                            Si merman o desaparecen, aseguran los científicos, las consecuencias para la salud física y mental pueden ser desastrosas. Y la mala noticia para los futuros viajeros espaciales es que normalmente esta microbiota se renueva gracias a la ingesta de frutas, verduras y yogures, tres tipos de alimentos que no están incluidos en la limitada despensa de los astronautas.</p>
                        <p>
                            Por eso en el Centro Espacial Johnson de la NASA han decidido investigar con ahínco en qué estado se encuentra la comunidad de microorganismos en el cuerpo de los astronautas nada más poner los pies en la Tierra tras unos meses en la ISS. El fin es dilucidar hasta qué punto puede verse modificada por la microgravedad, el cambio de ambiente, la dieta espacial y el estrés. Muestras gastrointestionales, de saliva, sangre, transpiración y todo tipo de secreciones corporales aportarán los datos necesarios. Y es que, si de verdad queremos mandar humanos a Marte, no queda otra que conocer antes cómo cambia el complejo ecosistema de microbios que vive en nuestros cuerpos cuando salimos al espacio exterior.

                        </p>
                        <div>
                            <span class="badge">Posted 2012-08-02 20:47:04</span>
                            <div class="pull-right"><span class="label label-default">alice</span>
                                <span class="label label-primary">story</span> 
                                <span class="label label-success">blog</span> 
                                <span class="label label-info">personal</span> 
                                <span class="label label-warning">Warning</span>
                                <span class="label label-danger">Danger</span>
                            </div>
                        </div>  
                    </div>   
                    <hr>

                    <div class="blog-post">
                        <h1 class="blog-title">
                            <i class="fa fa-cloud"></i>
                            Descubierta una sexta ‘letra genética’ en células de animales y plantas
                        </h1>
                        <img src="assets/img/slider/blog1.jpg" alt="Feature-img" align="right" width="100%" class="blog-image">
                        <p>


                            El alfabeto clave de la vida, los nucleótidos adenina (A), citosina (C), guanina (G) y timina (T) no son las únicas letras en la naturaleza. De sobra es conocido la existencia del uracilo (U) en las cadenas de ARN (la copia que sale del núcleo celular del ADN). Pero un reciente descubrimiento, según explican Holger Heyn y Manel Esteller, del Institut d’Investigació Biomèdica de Bellvitge (Idibell), ha añadido otro carácter a este abecedario. Sumado a otra letra minoritaria descubierta en los ochenta, eso eleva a seis las bases en células eucariotas (las que forman los animales y plantas superiores, humanos incluidos). </p>
                        <p>
                            Las dos nuevas letras son la metil-citosina y la última encontrada, la metil-adenina. Su hallazgo en algas, moscas (la famosa del vinagre, Drosophila melanogaster) y gusanos (el no menos conocido en el mundo de la genética Caenorhabditis elegans) es el primero en estos seres ya superiores -aunque aún no se haya encontrado en mamíferos, explica Esteller-. El comentario del investigador y los hallazgos se publican en cuatro artículos en Cell.</p>
                        <p>
                            La metilación de las bases es un proceso vital en la biología molecular. Ese paso, la unión de un grupo metilo CH3- a las bases, actúa como una señal para activar y desactivar genes (lo que se denomina epigenética), pero Esteller explica que en este caso no se tata de una marca temporal. "La metil-cisteína es muy estable, se transmite a la descendencia y está relacionada con la diferenciación sexual y la configuración del cerebro", dice el investigador. También intervienen en la diferenciación celular, que hace que una se convierta en corazón o en vesícula, por ejemplo".Este carácter de estabilidad y transmisibilidad es fundamental para considerarlo una letra genética aparte, y no solo una variedad de las ya conocidas.</p>
                        <p>
                            La nueva base no ha sido encontrada -aún- en mamíferos</p>
                        <p>
                            La nueva descubierta, la metil-adenina, "ya existe en bacterias, donde las defiende contra los virus. De alguna manera diferencia el ADN propio del ajeno", dice Esteller. Con ello se sabe dónde dirigir las defensas. En las especies donde se ha descubierto, "actuaría para regular la expresión de determinados genes, constituyendo por tanto una nueva marca epigenética", explica.</p>
                        <p>
                            El hallazgo se ha debido al uso de técnicas "de gran sensibilidad debido a que los niveles de mA en los genomas descritos son bajos". Además,  parece ser que la metil-adenina "tendría un papel específico en las células madre y en etapas tempranas del desarrollo", afirma.</p>
                        <p>
                            El reto ahora es intentar encontrarla en mamíferos, y ver qué papel desempeñaría.</p>

                        </p>
                        <div>
                            <span class="badge">Posted 2012-08-02 20:47:04</span>
                            <div class="pull-right">
                                <span class="label label-default">alice</span> 
                                <span class="label label-primary">story</span> 
                                <span class="label label-success">blog</span> 
                                <span class="label label-info">personal</span> 
                                <span class="label label-warning">Warning</span>
                                <span class="label label-danger">Danger</span>
                            </div>         
                        </div>
                    </div>
                    <hr>

                    <ul class="pagination">
                        <li class="disabled"><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">2 <span class="sr-only"></span></a></li>
                        <li><a href="#">3 <span class="sr-only"></span></a></li>
                        <li><a href="#">4 <span class="sr-only"></span></a></li>
                        <li><a href="#">5 <span class="sr-only"></span></a></li>
                    </ul>
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

    

    <script type="text/javascript">
      new WOW().init();
    </script>
<script type="text/javascript">
    $(document).ready(function(){
      $('#rCalendar').RegalCalendar({
        theme: 'cyan',
        base: 'white',
        modal: false,
        minDate: new Date(2016, 1 - 1, 1),
        maxDate: new Date(2014, 12 - 1, 31),
        tooltip: 'bootstrap',
        twitter: '@yourusername'
       });
    });
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