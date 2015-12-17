// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'labmmba.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'labmmba.UserRole'
grails.plugin.springsecurity.authority.className = 'labmmba.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                ['permitAll'],
	'/error':           ['permitAll'],
	'/index':           ['permitAll'],
	'/index.gsp':       ['permitAll'],
	'/shutdown':        ['permitAll'],
	'/assets/**':       ['permitAll'],
	'/**/javascripts/**':        ['permitAll'],
	'/**/css/**':       ['permitAll'],
	'/**/images/**':    ['permitAll'],
	'/**/favicon.ico':  ['permitAll'],
<<<<<<< HEAD
=======
	'/**/index.gsp':    ['permitAll'],
	'/**/about.gsp':    ['permitAll'],
	'/**/estudios.gsp':     ['permitAll'],
	'/**/publicaciones.gsp':['permitAll'],
	'/**/experimentos.gsp': ['permitAll'],
	'/**/mensajes.gsp':     ['permitAll'],
	'/**/cuenta.gsp':     ['permitAll'],
	'/**/proyectos.gsp':     ['permitAll'],
	'/**/avancetesis.gps':     ['permitAll'],
	'/**/personal.gsp':     ['permitAll'],
	'/**/resumenperfil.gsp':     ['permitAll'],
	'/**/congresos.gsp':     ['permitAll'],
	'/**/team':     ['permitAll'],
	'/**/contact':  ['permitAll'],
	'/**/index':    ['permitAll'],
	'/**/about':    ['permitAll'],
	'/**/blog':     ['permitAll'],
	'/**/estudios':     ['permitAll'],
	'/**/publicaciones':['permitAll'],
	'/**/experimentos': ['permitAll'],
	'/**/mensajes':     ['permitAll'],
	'/**/cuenta':     ['permitAll'],
	'/**/proyectos':     ['permitAll'],
	'/**/avancetesis':     ['permitAll'],
	'/**/personal':     ['permitAll'],
	'/**/resumenperfil':     ['permitAll'],
	'/**/congresos':     ['permitAll'],
	'/**/create':     ['permitAll'],
	'/**/create.gsp':     ['permitAll'],
			'/**/loginreg':     ['permitAll'],
	'/**/loginreg.gsp':     ['permitAll']

>>>>>>> origin/master

]


<<<<<<< HEAD
=======

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'labmmba.Administrator'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'labmmba.AdministratorRole'
grails.plugin.springsecurity.authority.className = 'labmmba.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                ['permitAll'],
	'/error':           ['permitAll'],
	'/index':           ['permitAll'],
	'/index.gsp':       ['permitAll'],
	'/about.gsp':       ['permitAll'],
	'/shutdown':        ['permitAll'],
	'/assets/**':       ['permitAll'],
	'/**/javascripts/**':        ['permitAll'],
	'/**/css/**':       ['permitAll'],
	'/**/images/**':    ['permitAll'],
	'/**/favicon.ico':  ['permitAll'],
	'/**/index.gsp':    ['permitAll'],
	'/**/index':        ['permitAll'],
	'/**/about.gsp':    ['permitAll'],
	'/**/estudios.gsp':     ['permitAll'],
	'/**/publicaciones.gsp':['permitAll'],
	'/**/experimentos.gsp': ['permitAll'],
	'/**/mensajes.gsp':     ['permitAll'],
	'/**/cuenta.gsp':     ['permitAll'],
	'/**/proyectos.gsp':     ['permitAll'],
	'/**/avancetesis.gsp':     ['permitAll'],
	'/**/personal.gsp':     ['permitAll'],
	'/**/resumenperfil.gsp':     ['permitAll'],
	'/**/congresos.gsp':     ['permitAll'],
	'/**/about':        ['permitAll'],
	'/**/team':     ['permitAll'],
	'/**/contact':  ['permitAll'],
	'/**/blog':     ['permitAll'],
	'/**/estudios':     ['permitAll'],
	'/**/publicaciones':['permitAll'],
	'/**/experimentos': ['permitAll'],
	'/**/mensajes':     ['permitAll'],
	'/**/cuenta':     ['permitAll'],
	'/**/proyectos':     ['permitAll'],
	'/**/avancetesis':     ['permitAll'],
	'/**/personal':     ['permitAll'],
	'/**/resumenperfil':     ['permitAll'],
	'/**/congresos':     ['permitAll'],
	'/**/create':     ['permitAll'],
	'/**/create.gsp':     ['permitAll'],
		'/**/loginreg':     ['permitAll'],
	'/**/loginreg.gsp':     ['permitAll']
]

>>>>>>> origin/master
grails.assets.bundle=true