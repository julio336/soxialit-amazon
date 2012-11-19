Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '301274136640053', '3414055f9f710a5bd6b602c5d6f2dee8' #funciona para localhost y facebook
  #provider :facebook, '163655183779733', '7db1f691e6ca3a7f9ebbf0366662be8e' #funciona para heroku-app y amazon
  		 #	:scope => 'email,user_birthday,read_stream, publish_stream'
  #provider :twitter, "bh0NqOQkC1Hi1M8ib37jQ", "yEZGPrpWeXzRdYeqLuxsNs2IwkW961Lc6f32HQFKU"
  
 # provider :facebook, '163655183779733', '7db1f691e6ca3a7f9ebbf0366662be8e', #funciona para heroku-app y amazon
  
end