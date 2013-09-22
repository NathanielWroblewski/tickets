Prop::Application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  
  config.paperclip_defaults = {
    :storage => :s3,
    :s3_protocol => 'http',
    :s3_credentials => {
      :bucket => "emirateshackathon.tckts",
      :access_key_id => "AKIAITHRDZ2EDCI4M2ZA",
      :secret_access_key => "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"
    }
  }
end
