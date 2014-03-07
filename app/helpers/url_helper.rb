module UrlHelper
	def with_subdomain(subdomain)
		subdomain = (subdomain || "")
		subdomain += "." unless subdomain.empty?
		[subdomain, request.domain, request.port_string].join
	end
end