function grub-update --wraps='doas grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias grub-update=doas grub-mkconfig -o /boot/grub/grub.cfg'
  doas grub-mkconfig -o /boot/grub/grub.cfg $argv
        
end
