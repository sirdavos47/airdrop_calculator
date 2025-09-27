#!/bin/bash
# airdrop_calculator.sh
# Basit airdrop hesaplama scripti

# Airdrop verileri: isim,potansiyel_odul_usd,zorluk(1-10)
# Bu verileri bir dosyada tutuyoruz
airdrop_file="airdrops.csv"

if [ ! -f "$airdrop_file" ]; then
  cat <<EOL > $airdrop_file
Starknet,500,7
LayerZero,300,5
ZkSync,200,4
EigenLayer,600,8
EOL
fi

echo "Mevcut Airdrop Fırsatları:"
cat $airdrop_file | awk -F',' '{printf "%s: $%s (Zorluk: %s)\n", $1, $2, $3}'

echo "\nHer airdrop için getiri/zorluk oranı hesaplanıyor..."
echo "Airdrop        Getiri/Zorluk Oranı"
echo "-----------------------------------"

best_score=0
best_airdrop=""

while IFS=',' read -r name reward difficulty; do
  score=$(echo "scale=2; $reward/$difficulty" | bc)
  printf "%-13s %s\n" "$name" "$score"
  if (( $(echo "$score > $best_score" | bc -l) )); then
    best_score=$score
    best_airdrop=$name
  fi
done < $airdrop_file

echo "\nEn iyi airdrop: $best_airdrop (Getiri/Zorluk: $best_score)"
