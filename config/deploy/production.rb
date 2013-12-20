role :app, "app@p.xingcloud.com"
role :web, "app@p.xingcloud.com"
role :db,  "app@p.xingcloud.com", :primary => true
default_environment["PATH"] = "/opt/ree/bin:/opt/ree/lib/ruby/gems/1.8/bin:/home/app/opt/nginx/sbin:/sbin:/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/home/app/bin:/usr/local/sbin:/usr/sbin:/home/app/soft/mongodb/bin:/home/app/apps/redmine/shared/bin"
