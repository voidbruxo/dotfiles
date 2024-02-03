function rm-orph --wraps='sudo pacman -Rscn $(sudo pacman -Qtdq)' --description 'alias rm-orph=sudo pacman -Rscn $(sudo pacman -Qtdq)'
  sudo pacman -Rscn $(sudo pacman -Qtdq) $argv
        
end
