function bat-info --wraps='upower -i /org/freedesktop/UPower/devices/battery_BAT0' --description 'alias bat-info=upower -i /org/freedesktop/UPower/devices/battery_BAT0'
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 $argv
        
end
