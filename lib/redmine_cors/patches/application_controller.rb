module RedmineCors
  module Patches
    module ApplicationController
      def self.included(base) # :nodoc:
        base.class_eval do
          after_filter :cors_set_access_control_headers
        end

        base.send(:include, InstanceMethods)
      end

      module InstanceMethods
        def cors_set_access_control_headers
          headers['Access-Control-Allow-Origin'] = Setting.plugin_redmine_cors["cors_domain"].to_s
          headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT'
          headers['Access-Control-Allow-Headers'] = 'accept, content-type, origin, authorization, X-Redmine-API-Key'
          headers['Access-Control-Max-Age'] = "1728000"
        end
      end
    end
  end
end
