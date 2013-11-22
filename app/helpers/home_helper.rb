module HomeHelper
  def is_subscribed(user, list)
    return user.lists.include? list
  end
end
