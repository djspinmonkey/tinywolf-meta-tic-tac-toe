models_dir = File.join(File.dirname(__FILE__), '..', 'app', 'models')
Dir["#{models_dir}/**/*.rb"].each { |file| require file }
