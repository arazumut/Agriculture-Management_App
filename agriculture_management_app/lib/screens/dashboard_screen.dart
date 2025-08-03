import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/app_colors.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/stat_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Tarım Yönetim Sistemi',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Bildirimler sayfasına git
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Profil sayfasına git
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hoşgeldin Mesajı
            Text(
              'Hoş Geldiniz! 👋',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Bugün tarım işlerinizi yönetmeye hazır mısınız?',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // İstatistik Kartları
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Toplam Arazi',
                    value: '12',
                    unit: 'Dekar',
                    icon: Icons.landscape,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatCard(
                    title: 'Aktif Ürünler',
                    value: '8',
                    unit: 'Tür',
                    icon: Icons.eco,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Hayvan Sayısı',
                    value: '45',
                    unit: 'Adet',
                    icon: Icons.pets,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatCard(
                    title: 'Aylık Gelir',
                    value: '₺15,420',
                    unit: '',
                    icon: Icons.attach_money,
                    color: AppColors.info,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Hızlı Erişim Kartları
            Text(
              'Hızlı Erişim',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                DashboardCard(
                  title: 'Arazi Yönetimi',
                  subtitle: 'Arazilerinizi yönetin',
                  icon: Icons.landscape,
                  color: AppColors.primary,
                  onTap: () {
                    // Arazi yönetimi sayfasına git
                  },
                ),
                DashboardCard(
                  title: 'Hayvancılık',
                  subtitle: 'Hayvanlarınızı takip edin',
                  icon: Icons.pets,
                  color: AppColors.secondary,
                  onTap: () {
                    // Hayvancılık sayfasına git
                  },
                ),
                DashboardCard(
                  title: 'Üretim Takibi',
                  subtitle: 'Üretim süreçlerinizi izleyin',
                  icon: Icons.eco,
                  color: AppColors.success,
                  onTap: () {
                    // Üretim takibi sayfasına git
                  },
                ),
                DashboardCard(
                  title: 'Finans',
                  subtitle: 'Gelir-gider takibi',
                  icon: Icons.account_balance_wallet,
                  color: AppColors.info,
                  onTap: () {
                    // Finans sayfasına git
                  },
                ),
                DashboardCard(
                  title: 'Takvim',
                  subtitle: 'İş planlarınızı görün',
                  icon: Icons.calendar_today,
                  color: AppColors.warning,
                  onTap: () {
                    // Takvim sayfasına git
                  },
                ),
                DashboardCard(
                  title: 'Raporlar',
                  subtitle: 'Detaylı analizler',
                  icon: Icons.analytics,
                  color: AppColors.error,
                  onTap: () {
                    // Raporlar sayfasına git
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Grafik Bölümü
            Text(
              'Aylık Verim Analizi',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const months = [
                            'Oca',
                            'Şub',
                            'Mar',
                            'Nis',
                            'May',
                            'Haz',
                          ];
                          if (value.toInt() < months.length) {
                            return Text(
                              months[value.toInt()],
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 3),
                        FlSpot(1, 4),
                        FlSpot(2, 3.5),
                        FlSpot(3, 5),
                        FlSpot(4, 4.5),
                        FlSpot(5, 6),
                      ],
                      isCurved: true,
                      color: AppColors.primary,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.primary.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.landscape), label: 'Arazi'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Hayvan'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Rapor'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ayarlar'),
        ],
      ),
    );
  }
}
