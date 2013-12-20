require 'casserver/authenticators/base'

begin
  require 'active_record'
rescue LoadError
  require 'rubygems'
  require 'active_record'
end

require "digest/sha1"

require "pp"

class RedmineAuthenticator < CASServer::Authenticators::Base

  def validate(credentials)
    read_standard_credentials(credentials)
    user = User.try_to_login(@username, @password)
    @extra_attributes = {"redmine_uid" => user.id, "admin" => user.admin, "language" => user.language, "mail" => user.mail}  unless user.blank?
    return !!user
  end
  
end

class User < ActiveRecord::Base
  establish_connection(CASServer::Server.config["redmine_database"])
  
  
  STATUS_ACTIVE     = 1
  
  def active?
    self.status == STATUS_ACTIVE
  end
  
  # Return password digest
  def self.hash_password(clear_password)
    Digest::SHA1.hexdigest(clear_password || "")
  end
    
  def self.try_to_login(login, password)
    # Make sure no one can sign in with an empty password
    return nil if password.to_s.empty?
    user = find_by_login(login)
    if user
      # user is already in local database
      return nil if !user.active?
      
      # authentication with local password
      return nil unless User.hash_password(password) == user.hashed_password        
    end
    
    user.update_attribute(:last_login_on, Time.now) if user && !user.new_record?
    user
  rescue => text
    raise text
  end
end

class AnonymousUser < User
end