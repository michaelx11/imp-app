Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '487990114557099', '44f781e738bfac5c4bbc0a017581d31b'
end
