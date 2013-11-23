module HomeHelper
  def is_subscribed(user, list)
    return user.lists.include? list
  end

  def pluralize_suscritas(number)
    st = "#{number}"
    if number > 1
      st += " personas suscritas"
    elsif number == 1
      st += " persona suscrita"
    else
      "error"
    end
    st
  end
end
