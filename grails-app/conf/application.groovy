// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'labmmba.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'labmmba.UserRole'
grails.plugin.springsecurity.authority.className = 'labmmba.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                   ['permitAll'],
	'/error':              ['permitAll'],
	'/index':              ['permitAll'],
	'/index.gsp':          ['permitAll'],
	'/shutdown':           ['permitAll'],
	'/assets/**':          ['permitAll'],
	'/**/javascripts/**':  ['permitAll'],
	'/**/css/**':          ['permitAll'],
	'/**/images/**':       ['permitAll'],
	'/**/favicon.ico':     ['permitAll'],
]

grails {
	mail {
		host = "smtp.gmail.com"
		port = 465
		username = "fethrblaka13.testing@gmail.com"
		password = "testing13"
		props = ["mail.smtp.auth"                  : "true",
				 "mail.smtp.socketFactory.port"    : "465",
				 "mail.smtp.socketFactory.class"   : "javax.net.ssl.SSLSocketFactory",
				 "mail.smtp.socketFactory.fallback": "false"]
		grails.mail.disabled=true
	}
}

grails.assets.bundle=true