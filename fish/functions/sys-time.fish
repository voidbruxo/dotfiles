function sys-time --wraps=stat\ /\ \|\ awk\ \'/Birth:\ /\{print\ \}\' --description alias\ sys-time=stat\ /\ \|\ awk\ \'/Birth:\ /\{print\ \}\'
  stat / | awk '/Birth: /{print }' $argv
        
end
