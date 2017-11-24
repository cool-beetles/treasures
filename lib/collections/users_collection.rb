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
    Dir["#{file_name}/*.user"].each do |user_file_path|
      user_file = File.open(user_file_path)
      user_array = user_file.read.strip.split("||")
      
      id = user_array[0].to_i
      first_name = user_array[1]
      last_name = user_array[2]
      age = user_array[3]
      user = User.new(id, first_name, last_name, age)
    end
  end
end
