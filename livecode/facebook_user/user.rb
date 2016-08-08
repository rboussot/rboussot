class User
attr_writer :name, :birthdate

  def initialize(email, name)
    @name = name
    @email = email
    @password = "passancien"
    @profile_pic = "url"
    @friends = []
    @birthdate = nil
  end

  def change_password!(old_password, new_password)
    if old_password == @password
      @password = new_password
    else
      "wrong password"
    end
  end

  def add_friend!(other_user)
    unless friends_with? (other_user)
      @friends << other_user
      other_user.add_friend!(self)
    end
  end

  def age
    return (Date.today - @birthdate).to_i / 365
  end

  def friends_with?(user)
    @friends.include?(user)
  end

  def remove_friend!(bad_friend)
    if friends_with(bad_friend)
      @friends.delete(bad_friend)
      bad_friend.remove_friend!(self)
    end
  end

  def print_friends
    @friends.each do |friend|
      puts friend.to_s
    end
  end

  def to_s
    return "Hello ! I'm #{name} and I'm #{age} years old."
  end
end
