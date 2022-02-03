function fish_greeting
  set --local current_hour (date +"%H")

  set_color $fish_color_user
  if test $current_hour -ge 0 -a $current_hour -lt 12
    echo Good morning, $USER!
  else if test $current_hour -ge 12 -a $current_hour -lt 17
    echo Good afternoon, $USER!
  else
    echo Good evening, $USER!
  end
  set_color normal

  echo Current time is (set_color yellow; date +%T; set_color normal)
end
