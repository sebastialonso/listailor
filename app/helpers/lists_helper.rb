module ListsHelper
  def secondsToDuration(input)
    dur = ""
    if input < 3600
      seconds = input / 60
      seconds < 10 ? dur += "0" + seconds.to_s : dur += seconds.to_s
      input -= seconds*60
      dur += ":"
      input < 10 ? dur += "0" + input.to_s : dur += input.to_s
      dur
    else
      hours = input / 3600
      dur = hours.to_s
      input -= hours * 3600
      if input.zero
        dur += "00:00"
        return dur
      else
        input = input / 60
      end
    end
  end
end
