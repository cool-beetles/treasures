class UsersCollection
  @@users = []

  def self.add(user)
    @@users << user
  end

  def self.all
    @@users
  end
  
  def self.find_by_id(id)
    @@users.detect { |user| user.id == id }    
  end

  def self.save
    @@users.each { |user| 
      file = File.new("../lib/collections/users_files/#{user.id}.user","w")
      file.puts("#{user.id}||#{user.first_name}||#{user.last_name}||#{user.age}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    self.add(Dir.glob("#{file_name}/*.user"))
  end
end
