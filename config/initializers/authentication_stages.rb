OpenProject::Application.configure do |application|

  # Ensure stage is entered when reloading in dev mode
  application.config.to_prepare do
    OpenProject::Authentication::Stage
      .register(
        :consent,
        active: ->() { Setting.consent_required? }
      ) {
        account_consent_path
      }
  end
end
