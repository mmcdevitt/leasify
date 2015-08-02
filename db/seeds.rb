# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'mmcdevi1', email: 'mmcdevi1@gmail.com', password: 'koplop', first_name: 'Michael', last_name: 'McDevitt', admin: true, unlimited_sites: true)

ThemeName.create(name: 'Avaya',      description: 'A beautiful, full-width image template with a unique slider.', published: true,  user_id: 1)
ThemeName.create(name: 'Sunnyside',  description: 'A beautiful, full-width image template with a unique slider.', published: true,  user_id: 1)
ThemeName.create(name: 'Skyline',    description: 'A beautiful, full-width image template with a unique slider.', published: true,  user_id: 1)
ThemeName.create(name: 'Livingston', description: 'A beautiful, full-width image template with a unique slider.', published: false, user_id: 1)

SidebarLink.create(name: 'Site Overview',        link_to: 'dashboard_path',                   icon: 'statistics')
SidebarLink.create(name: 'Availabilities',       link_to: 'availabilities_path',              icon: 'stack')
SidebarLink.create(name: 'Pages',                link_to: 'pages_path',                       icon: 'docs')
SidebarLink.create(name: 'Contacts',             link_to: 'contacts_path',                    icon: 'users2')
SidebarLink.create(name: 'Templates',            link_to: 'template_path',                    icon: 'browser')
SidebarLink.create(name: 'Property Information', link_to: 'property_path',                    icon: 'pin')
SidebarLink.create(name: 'Theme Options',        link_to: 'logo_path',                        icon: 'phone-portrait')
SidebarLink.create(name: 'Site Wizard',          link_to: 'wizard_property_information_path', icon: 'pencil2')