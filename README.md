# Airdrop Calculator

Bu proje, mevcut ve potansiyel airdrop fırsatlarını analiz ederek kullanıcıya en iyi airdrop'u öneren basit bir Bash script'i içerir.

## Özellikler
- Mevcut airdrop fırsatlarını listeler.
- Her bir airdrop için getiri/zorluk oranı hesaplar.
- En iyi airdrop'u önerir.
- Airdrop verileri kolayca güncellenebilir (airdrops.csv dosyası).

## Kullanım

1. Script'i çalıştırmadan önce terminalde dosyanın bulunduğu klasöre gelin.
2. Script'i çalıştırmak için:

```bash
bash airdrop_calculator.sh
```

3. Script, mevcut airdrop fırsatlarını ve en iyi airdrop'u terminalde gösterecektir.

## Airdrop Verilerini Güncelleme

Airdrop verileri `airdrops.csv` dosyasında tutulur. Dosya formatı:

```
AirdropAdı,PotansiyelÖdülUSD,Zorluk(1-10)
```

Örnek:
```
Starknet,500,7
LayerZero,300,5
ZkSync,200,4
EigenLayer,600,8
```

Daha fazla airdrop eklemek veya mevcutları güncellemek için bu dosyayı düzenleyebilirsiniz.

## Gereksinimler
- Bash shell
- `bc` komutu (hesaplama için gereklidir)

## Katkı
Katkıda bulunmak isterseniz, lütfen bir pull request açın veya issue oluşturun.

---

**Not:** Bu script örnek amaçlıdır. Gerçek airdrop fırsatları ve ödülleri değişiklik gösterebilir.
# airdrop_calculator
This app calculates which airdrop would be logical to farm
