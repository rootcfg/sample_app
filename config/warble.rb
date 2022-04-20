Warbler::Config.new do |config|
  config.features = %w(executable compiled gemjar)

  config.dirs = %w(app config lib log vendor tmp)

  config.includes = FileList[]
  config.excludes = FileList[]

  config.webinf_files = FileList[]

  config.jar_name = "sample_app"
end