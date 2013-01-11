import hss.service.catalog.Team

class   UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/" (controller: 'Team', action: 'index')
		"500"(view:'/error')

	}
}
