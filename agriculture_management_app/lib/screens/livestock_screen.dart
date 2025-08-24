import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/app_colors.dart';
import '../widgets/common_app_bar.dart';

class LivestockScreen extends StatefulWidget {
  const LivestockScreen({super.key});

  @override
  State<LivestockScreen> createState() => _LivestockScreenState();
}

class _LivestockScreenState extends State<LivestockScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CommonAppBar(
        title: 'Hayvancılık Yönetimi',
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
            onPressed: () {
              _showAddAnimalDialog();
            },
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
          bottom: false, // Bottom safe area'yı devre dışı bırak
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: MediaQuery.of(context).padding.bottom + 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hoş Geldin Alanı
                _buildWelcomeSection(),
                const SizedBox(height: 16),
                
                // İstatistik Kartları
                _buildStatsGrid(),
                const SizedBox(height: 16),

                // Hayvan Kategorileri
                _buildCategorySection(),
                const SizedBox(height: 16),

                // Son Aktiviteler
                _buildRecentActivities(),
                const SizedBox(height: 16),

                // Sağlık Durumu Grafiği
                _buildHealthChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.secondary, AppColors.secondary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hayvan Çiftliği',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Hayvanlarınızın sağlığını takip edin',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.pets,
            size: 42,
            color: Colors.white.withOpacity(0.8),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: constraints.maxWidth > 400 ? 1.5 : 1.3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildEnhancedStatCard(
              'Toplam Hayvan',
              '125',
              'Büyükbaş & Küçükbaş',
              Icons.pets,
              AppColors.primary,
              '+5',
            ),
            _buildEnhancedStatCard(
              'Sağlıklı',
              '119',
              'Hayvan',
              Icons.favorite,
              AppColors.success,
              '+2',
            ),
            _buildEnhancedStatCard(
              'Süt Üretimi',
              '450L',
              'Günlük',
              Icons.local_drink,
              AppColors.info,
              '+12L',
            ),
            _buildEnhancedStatCard(
              'Aşı Oranı',
              '%95',
              'Tamamlandı',
              Icons.medical_services,
              AppColors.warning,
              '+5%',
            ),
          ],
        );
      },
    );
  }

  Widget _buildEnhancedStatCard(String title, String value, String subtitle,
      IconData icon, Color color, String trend) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  trend,
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hayvan Kategorileri',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryCard('Büyükbaş', '45', Icons.emoji_nature, AppColors.primary),
              _buildCategoryCard('Küçükbaş', '80', Icons.pets, AppColors.secondary),
              _buildCategoryCard('Kanatlı', '150', Icons.flutter_dash, AppColors.info),
              _buildCategoryCard('Diğer', '12', Icons.category, AppColors.warning),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String count, IconData icon, Color color) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const Spacer(),
          Text(
            count,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Son Aktiviteler',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildActivityItem('Aşı Uygulaması', 'İnek #23 - 2 saat önce', Icons.medical_services, AppColors.success),
              _buildActivityItem('Sağlık Kontrolü', 'Koyun #45 - 5 saat önce', Icons.health_and_safety, AppColors.info),
              _buildActivityItem('Süt Sağımı', '120L toplandı - 1 gün önce', Icons.local_drink, AppColors.warning),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String title, String subtitle, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.textSecondary,
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildHealthChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sağlık Durumu Analizi',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 180,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 85,
                  title: 'Sağlıklı\n85%',
                  color: AppColors.success,
                  radius: 55,
                  titleStyle: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  value: 10,
                  title: 'Tedavi\n10%',
                  color: AppColors.warning,
                  radius: 45,
                  titleStyle: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  value: 5,
                  title: 'Kritik\n5%',
                  color: AppColors.error,
                  radius: 45,
                  titleStyle: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showAddAnimalDialog() {
    String selectedAnimalType = 'Büyükbaş';
    String selectedBreed = 'Holstein';
    String selectedGender = 'Dişi';
    DateTime selectedBirthDate = DateTime.now().subtract(const Duration(days: 365));
    
    final animalTypes = ['Büyükbaş', 'Küçükbaş', 'Kanatlı'];
    final breeds = {
      'Büyükbaş': ['Holstein', 'Simmental', 'Jersey', 'Angus', 'Yerli Kara'],
      'Küçükbaş': ['Merinos', 'Akkaraman', 'İvesi', 'Kıl Keçisi', 'Saanen'],
      'Kanatlı': ['Leghorn', 'Rhode Island', 'Broiler', 'Hindi', 'Kaz'],
    };
    final genders = ['Dişi', 'Erkek'];

    final tagController = TextEditingController();
    final weightController = TextEditingController();
    final locationController = TextEditingController();
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 700),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [AppColors.secondary, AppColors.secondary.withOpacity(0.8)],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.pets,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yeni Hayvan Ekle',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    'Çiftliğinize yeni hayvan kaydedin',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.close,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Hayvan Tipi Seçimi
                        Text(
                          'Hayvan Tipi',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.textSecondary.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedAnimalType,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            items: animalTypes.map((type) {
                              return DropdownMenuItem(
                                value: type,
                                child: Row(
                                  children: [
                                    Icon(
                                      type == 'Büyükbaş' ? Icons.pets 
                                      : type == 'Küçükbaş' ? Icons.pets_outlined 
                                      : Icons.flutter_dash,
                                      color: AppColors.secondary,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      type,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedAnimalType = value!;
                                selectedBreed = breeds[selectedAnimalType]!.first;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Küpe Numarası
                        Text(
                          'Küpe Numarası',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: tagController,
                          decoration: InputDecoration(
                            hintText: 'Örn: TR001234',
                            prefixIcon: Icon(Icons.tag, color: AppColors.secondary),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.textSecondary.withOpacity(0.3)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.secondary, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Irk ve Cinsiyet
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Irk',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.textSecondary.withOpacity(0.3)),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      value: selectedBreed,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      ),
                                      items: breeds[selectedAnimalType]!.map((breed) {
                                        return DropdownMenuItem(
                                          value: breed,
                                          child: Text(
                                            breed,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedBreed = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cinsiyet',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.textSecondary.withOpacity(0.3)),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      value: selectedGender,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      ),
                                      items: genders.map((gender) {
                                        return DropdownMenuItem(
                                          value: gender,
                                          child: Row(
                                            children: [
                                              Icon(
                                                gender == 'Dişi' ? Icons.female : Icons.male,
                                                color: gender == 'Dişi' ? Colors.pink : Colors.blue,
                                                size: 18,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                gender,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Doğum Tarihi
                        Text(
                          'Doğum Tarihi',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: selectedBirthDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: AppColors.secondary,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (date != null) {
                              setState(() {
                                selectedBirthDate = date;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.textSecondary.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today, color: AppColors.secondary),
                                const SizedBox(width: 12),
                                Text(
                                  '${selectedBirthDate.day}/${selectedBirthDate.month}/${selectedBirthDate.year}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const Spacer(),
                                Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Ağırlık
                        Text(
                          'Ağırlık (kg)',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Örn: 450',
                            prefixIcon: Icon(Icons.monitor_weight, color: AppColors.secondary),
                            suffixText: 'kg',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.textSecondary.withOpacity(0.3)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.secondary, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Lokasyon
                        Text(
                          'Bulunduğu Yer',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: locationController,
                          decoration: InputDecoration(
                            hintText: 'Örn: Ahır A, Bölüm 2',
                            prefixIcon: Icon(Icons.location_on, color: AppColors.secondary),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.textSecondary.withOpacity(0.3)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.secondary, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Notlar
                        Text(
                          'Notlar (Opsiyonel)',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: notesController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Özel notlar, sağlık durumu, vs...',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Icon(Icons.notes, color: AppColors.secondary),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.textSecondary.withOpacity(0.3)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.secondary, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Butonlar
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                      color: AppColors.textSecondary.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'İptal',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Form validation
                                  if (tagController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Küpe numarası zorunludur!',
                                          style: GoogleFonts.poppins(),
                                        ),
                                        backgroundColor: AppColors.error,
                                      ),
                                    );
                                    return;
                                  }

                                  // TODO: Hayvan ekleme API çağrısı
                                  Navigator.pop(context);
                                  
                                  // Başarı mesajı
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Row(
                                        children: [
                                          const Icon(Icons.check_circle, color: Colors.white),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Hayvan başarıyla eklendi!',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      backgroundColor: AppColors.success,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Hayvan Ekle',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
