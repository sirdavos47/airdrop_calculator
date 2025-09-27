#!/bin/bash
# airdrop_calculator.sh
# Basit airdrop hesaplama scripti

done < $airdrop_file

# Dosya tanımları
airdrop_file="airdrops.csv"
history_file="history.log"

# Varsayılan airdrop verileri
if [ ! -f "$airdrop_file" ]; then
  cat <<EOL > $airdrop_file
Starknet,500,7
LayerZero,300,5
ZkSync,200,4
EigenLayer,600,8
EOL
fi

# Geçmişi göster
function show_history() {
  if [ -f "$history_file" ]; then
    echo "\n--- Önceki İşlemler ---"
    cat "$history_file"
    echo "----------------------\n"
  else
    echo "\nGeçmiş bulunamadı.\n"
  fi
}

# Yeni airdrop ekle
function add_airdrop() {
  read -p "Airdrop adı: " name
  read -p "Potansiyel ödül (USD): " reward
  read -p "Zorluk (1-10): " difficulty
  echo "$name,$reward,$difficulty" >> "$airdrop_file"
  echo "Eklendi: $name, $reward, $difficulty"
}

# Airdrop sil
function delete_airdrop() {
  read -p "Silmek istediğiniz airdrop adı: " delname
  grep -v "^$delname," "$airdrop_file" > tmpfile && mv tmpfile "$airdrop_file"
  echo "$delname silindi."
}

# Hesaplama ve geçmişe kaydetme
function calculate_best() {
  echo "\nMevcut Airdrop Fırsatları:"
  cat $airdrop_file | awk -F',' '{printf "%s: $%s (Zorluk: %s)\n", $1, $2, $3}'

  echo "\nHer airdrop için getiri/zorluk oranı hesaplanıyor..."
  echo "Airdrop        Getiri/Zorluk Oranı"
  echo "-----------------------------------"

  best_score=0
  best_airdrop=""
  results=""

  while IFS=',' read -r name reward difficulty; do
    score=$(echo "scale=2; $reward/$difficulty" | bc)
    printf "%-13s %s\n" "$name" "$score"
    results+="$name:$score; "
    if (( $(echo "$score > $best_score" | bc -l) )); then
      best_score=$score
      best_airdrop=$name
    fi
  done < $airdrop_file

  echo "\nEn iyi airdrop: $best_airdrop (Getiri/Zorluk: $best_score)"
  # Geçmişe kaydet
  echo "$(date '+%Y-%m-%d %H:%M:%S') | $results Best: $best_airdrop ($best_score)" >> "$history_file"
}

# Ana menü
while true; do
  echo "\nAirdrop Calculator Menü"
  echo "1) Airdropları Listele ve Hesapla"
  echo "2) Yeni Airdrop Ekle"
  echo "3) Airdrop Sil"
  echo "4) Geçmişi Göster"
  echo "5) Çıkış"
  read -p "Seçiminiz [1-5]: " choice
  case $choice in
    1) calculate_best ;;
    2) add_airdrop ;;
    3) delete_airdrop ;;
    4) show_history ;;
    5) echo "Çıkılıyor..."; exit 0 ;;
    *) echo "Geçersiz seçim!" ;;
  esac
done
