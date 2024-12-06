function fish_greeting
  set --local current_hour (date +"%H")

  set_color $fish_color_user

  if test $current_hour -ge 5 -a $current_hour -lt 12
    echo Good morning, $USER!
  else if test $current_hour -ge 12 -a $current_hour -lt 18
    echo Good afternoon, $USER!
  else if test $current_hour -ge 18 -a $current_hour -lt 22
    echo Good evening, $USER!
  else
    echo Good night, $USER!
  end

  set_color normal
end
