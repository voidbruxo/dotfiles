function rm-orph --wraps='doas pacman -Rscn ' --description 'alias rm-orph=doas pacman -Rscn '
  doas pacman -Rscn  $argv
        
end
