import 'package:crm_draivfmobileapp/core/constatnts/colors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/font_types.dart';
import 'package:flutter/material.dart';
import '../../../core/constatnts/images.dart';
import '../chart_screen.dart';
import '../login/login_screen.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  final String userEmail;

  const DashboardScreen({super.key, required this.userEmail});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> zones = [
    "Chennai",
    "Karnataka",
    "Central TN",
    "Kerala",
    "South TN",
    "West1 TN",
    "AP & Vellore",
    "West2 TN",
    "International",
    "Not Specified",
  ];

  final List<int> targetLeads = [
    1950,
    1201,
    1500,
    1577,
    600,
    1400,
    1200,
    1000,
    0,
    0,
  ];

  final List<int> actualLeads = [
    1200,
    951,
    1577,
    1500,
    392,
    1004,
    633,
    460,
    3,
    573,
  ];

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    return List.generate(zones.length, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: targetLeads[index].toDouble(),
            color: Colors.orange,
            width: 14,
            borderRadius: BorderRadius.circular(4),
          ),
          BarChartRodData(
            toY: actualLeads[index].toDouble(),
            color: Colors.deepOrange,
            width: 14,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        centerTitle: true,
        title: Image.asset(AppImages.logo, height: 30, width: 200),
        backgroundColor: AppColor.primaryColor2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              "Dashboard - Charts",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: MyFonts.poppins,
              ),
            ),
            const SizedBox(height: 10),

            // ✅ 8 Chart Buttons
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two buttons per row
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.6,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChartDetailsScreen(
                          chartIndex: index,
                          zones: zones,
                          targetLeads: targetLeads,
                          actualLeads: actualLeads,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Chart ${index + 1}",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: MyFonts.poppins,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.primaryColor1, AppColor.primaryColor2],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColor.primaryColor1, AppColor.primaryColor2],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    AppImages.profileImage,
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
              accountName: Text(
                "Karthick",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: MyFonts.poppins,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                widget.userEmail,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: MyFonts.poppins,
                  color: Colors.white,
                ),
              ),
            ),
            Divider(color: Colors.white.withOpacity(0.3)),
            _buildDrawerItem(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
                Navigator.pop(context);
                _logout(context);
              },
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.redAccent : Colors.white,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.redAccent : Colors.white,
          fontFamily: MyFonts.poppins,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }
}
