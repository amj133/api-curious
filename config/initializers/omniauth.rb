Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['dde64d29825d135eca78'], ENV['733c1883f40f53aadfd48b2e3b35eab5a1ea514b']
end
