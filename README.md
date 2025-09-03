# 🌾 Tarım ve Hayvancılık Yönetim Sistemi

Modern tarım ve hayvancılık işletmeleri için geliştirilmiş kapsamlı Flutter uygulaması.

## 🚀 Özellikler

### 📱 Ana Özellikler
- **Modern UI/UX**: Material Design 3 ile güzel ve kullanıcı dostu arayüz
- **Çoklu Dil Desteği**: Türkçe ve İngilizce dil seçenekleri
- **Tema Desteği**: Açık/koyu tema ve sistem teması desteği
- **Responsive Tasarım**: Tüm ekran boyutlarında uyumlu

### 🏞️ Arazi ve Üretim Yönetimi
- Arazi ekleme ve yönetimi
- Ürün planlaması ve takibi
- Ekim, sulama, gübreleme takvimi
- Verim analizi ve raporlama

### 🐄 Hayvancılık Takibi
- Hayvan türleri yönetimi
- Sağlık durumu takibi
- Aşılama ve veteriner kontrolleri
- Doğum, ölüm ve satış kayıtları

### 💰 Finans Yönetimi
- Gelir-gider takibi
- Maliyet analizi
- Kârlılık raporları
- Bütçe planlama

### 📊 Analitik ve Raporlama
- Gerçek zamanlı grafikler
- Performans analizi
- Karşılaştırmalı raporlar
- Tahmin modelleri

## 🛠️ Teknolojiler

- **Flutter**: 3.7.0+
- **Dart**: 3.0+
- **State Management**: Provider
- **Charts**: FL Chart
- **UI**: Material Design 3
- **Fonts**: Google Fonts (Poppins)

## 📦 Kurulum

### Gereksinimler
- Flutter SDK 3.7.0 veya üzeri
- Dart SDK 3.0 veya üzeri
- Android Studio / VS Code
- Git

### Adımlar

1. **Projeyi klonlayın**
```bash
git clone https://github.com/your-username/agriculture-management-app.git
cd agriculture-management-app
```

2. **Bağımlılıkları yükleyin**
```bash
flutter pub get
```

3. **Uygulamayı çalıştırın**
```bash
flutter run
```

## 📁 Proje Yapısı

```
lib/
├── constants/
│   └── app_colors.dart          # Uygulama renkleri
├── models/                      # Veri modelleri
├── screens/                     # Ekranlar
│   ├── splash_screen.dart       # Açılış ekranı
│   └── dashboard_screen.dart    # Ana dashboard
├── widgets/                     # Yeniden kullanılabilir widget'lar
│   ├── dashboard_card.dart      # Dashboard kartları
│   └── stat_card.dart          # İstatistik kartları
├── services/                    # Servisler
├── providers/                   # State management
└── utils/                       # Yardımcı fonksiyonlar
```

## 🎨 Tasarım Sistemi

### Renkler
- **Primary**: Koyu yeşil (#2E7D32)
- **Secondary**: Turuncu (#FF9800)
- **Success**: Yeşil (#388E3C)
- **Warning**: Sarı (#FFA000)
- **Error**: Kırmızı (#D32F2F)
- **Info**: Mavi (#1976D2)

### Fontlar
- **Primary Font**: Poppins
- **Weights**: Regular, Medium, SemiBold, Bold

## 🔧 Geliştirme

### Yeni Özellik Ekleme
1. İlgili model dosyasını `models/` klasörüne ekleyin
2. Servis dosyasını `services/` klasörüne ekleyin
3. Provider dosyasını `providers/` klasörüne ekleyin
4. UI bileşenlerini `widgets/` klasörüne ekleyin
5. Ekranı `screens/` klasörüne ekleyin

### Kod Standartları
- Dart/Flutter best practices uygulayın
- Widget'ları mümkün olduğunca küçük tutun
- Açıklayıcı değişken ve fonksiyon isimleri kullanın
- Gerekli yerlerde yorum ekleyin

## 📱 Ekran Görüntüleri

### Ana Dashboard
- Modern kart tasarımı
- İstatistik göstergeleri
- Hızlı erişim menüsü
- Grafik analizleri

### Splash Screen
- Animasyonlu logo
- Yükleme göstergesi
- Profesyonel görünüm

## 🚧 Gelecek Özellikler

- [ ] Offline mod desteği
- [ ] Push notification
- [ ] Harita entegrasyonu
- [ ] QR kod tarama
- [ ] PDF rapor oluşturma
- [ ] Cloud sync
- [ ] Çoklu kullanıcı desteği
- [ ] API entegrasyonu

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için `LICENSE` dosyasına bakın.

## 📞 İletişim

- **Geliştirici**: [Adınız]
- **Email**: [email@example.com]
- **GitHub**: [@username]

## 🙏 Teşekkürler

- Flutter ekibine
- Material Design ekibine
- Açık kaynak topluluğuna

---

⭐ Bu projeyi beğendiyseniz yıldız vermeyi unutmayın!
