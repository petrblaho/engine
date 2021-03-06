module Locomotive
  class SessionsController < ::Devise::SessionsController

    include Locomotive::Concerns::SiteDispatcherController

    layout '/locomotive/layouts/not_logged_in'

    before_filter :require_site

    before_filter :set_locale

    helper 'locomotive/base'

    private

    def after_sign_in_path_for(resource)
      dashboard_path
    end

    def after_sign_out_path_for(resource)
      request.protocol + request.host_with_port
    end

    def set_locale
      I18n.locale = current_site.accounts.first.locale
    end

  end
end
