import 'package:crm_draivfmobileapp/core/constatnts/colors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/font_types.dart';
import 'package:flutter/material.dart';
import '../../../core/constatnts/images.dart';
import '../login/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  final String userEmail;

  const DashboardScreen({super.key, required this.userEmail});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: _buildDrawer(context),
      appBar: AppBar(
        // toolbarHeight: 70,
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        centerTitle: true,
        title: Image.asset(AppImages.logo, height: 30, width: 200),
        backgroundColor: AppColor.primaryColor2,
      ),
      body: const Center(
        child: Text(
          "Welcome to Dashboard!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: MyFonts.poppins,
          ),
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

            // Dashboard
            ExpansionTile(
              leading: Icon(Icons.dashboard, color: Colors.white),
              title: _drawerText("Dashboard"),
              trailing: Icon(Icons.arrow_drop_down, color: Colors.white),
              children: [
                _buildSubMenuItem(
                  title: "Main Dashboard",
                  onTap: () => Navigator.pop(context),
                ),
                _buildSubMenuItem(
                  title: "Tele Dashboard",
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),

            // Leads
            ExpansionTile(
              leading: Icon(Icons.call, color: Colors.white),
              title: _drawerText("Leads"),
              trailing: Icon(Icons.arrow_drop_down, color: Colors.white),
              children: [
                _buildSubMenuItem(
                  title: "Domestic Leads",
                  onTap: () => Navigator.pop(context),
                ),
                _buildSubMenuItem(
                  title: "International Leads",
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),

            // Donor Leads
            ExpansionTile(
              leading: Icon(Icons.leaderboard, color: Colors.white),
              title: _drawerText("Donor Leads"),
              trailing: Icon(Icons.arrow_drop_down, color: Colors.white),
              children: [
                _buildSubMenuItem(
                  title: "Donor Leads",
                  onTap: () => Navigator.pop(context),
                ),
                _buildSubMenuItem(
                  title: "Donor Leads New",
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),

            _buildDrawerItem(
              icon: Icons.school,
              title: "Course",
              onTap: () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              title: "Enquiry",
              onTap: () => Navigator.pop(context),
            ),

            Divider(color: Colors.white.withOpacity(0.3)),

            // Logout Button
            _buildDrawerItem(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
                Navigator.pop(context);
                _logout(context);
              },
              isLogout: true,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ---------------- Drawer Text Style ----------------
  Text _drawerText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontFamily: MyFonts.poppins,
        fontSize: 16,
      ),
    );
  }

  // ---------------- Drawer Item ----------------
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

  // ---------------- Sub Menu Item ----------------
  Widget _buildSubMenuItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 72, right: 16),
      dense: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontFamily: MyFonts.poppins,
          fontSize: 15,
        ),
      ),
      onTap: onTap,
    );
  }
}
