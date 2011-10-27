if File.exists?("#{::Rails.root.to_s}/config/mailer.yml") || ::Rails.env == "test" || ::Rails.env == "cucumber"
  require "action_mailer"
  if ::Rails.env == "test" || ::Rails.env == "cucumber"
    puts "Overriding ActionMailer config and setting test mode"
    ActionMailer::Base.delivery_method = :test
  else
    c = YAML::load(File.open("#{::Rails.root.to_s}/config/mailer.yml"))
    c.each do |key,val|
      begin
        ActionMailer::Base.send("#{key}=".to_sym, val)
      rescue Exception => e
        $stderr.puts "Problem processing key '#{key}' in config/mailer.yml"
        $stderr.puts "#{e}"
      end
    end
  end
end
