role :app, "app@10.1.138.48"
role :web, "app@10.1.138.48"
role :db,  "app@10.1.138.48", :primary => true
default_environment["PATH"] = "/home/app/opt/nginx/sbin:/home/app/.rvm/gems/ree-1.8.7-2011.03/bin:/home/app/.rvm/gems/ree-1.8.7-2011.03@global/bin:/home/app/.rvm/rubies/ree-1.8.7-2011.03/bin:/home/app/.rvm/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/home/app/bin:/sbin:/usr/sbin"
