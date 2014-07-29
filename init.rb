require 'redmine'

if Rails::VERSION::MAJOR < 3
  require 'dispatcher'
  object_to_prepare = Dispatcher
else
  object_to_prepare = Rails.configuration
  # if redmine plugins were railties:
  # object_to_prepare = config
end

object_to_prepare.to_prepare do
  ApplicationController.send(:include, RedmineCors::Patches::ApplicationController)
end

Redmine::Plugin.register :redmine_cors do
  name 'Redmine CORS'
  author 'Marco Vito Moscaritolo && Jonathan Robic'
  description 'This is a plugin for Redmine that make possible CORS request.'
  url 'https://github.com/jrobic/redmine_cors'
  author_url 'http://jonathanrobic.fr/'
 
  version '0.0.1'
  requires_redmine :version_or_higher => '2.0.0'

  settings :partial => 'settings/cors_settings',
    :default => {
      "cors_domain" => "*",
    }
end
