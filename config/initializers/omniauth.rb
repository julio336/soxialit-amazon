Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '163655183779733', '7db1f691e6ca3a7f9ebbf0366662be8e',
  		 	:scope => 'email,user_birthday,read_stream, publish_stream'
  #provider :twitter, "bh0NqOQkC1Hi1M8ib37jQ", "yEZGPrpWeXzRdYeqLuxsNs2IwkW961Lc6f32HQFKU"
end