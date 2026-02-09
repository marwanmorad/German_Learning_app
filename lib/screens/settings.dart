import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // خلفية رمادية هادية جداً
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFE65100)),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFFE65100),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          // --- بروفايل المستخدم ---
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: const Color(0xFFE65100),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Marwan Morad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'marwan@example.com',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // --- قسم الحساب ---
          _buildSectionTitle('Account Settings'),
          _buildSettingItem(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.notifications_none,
            title: 'Notification Settings',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.lock_outline,
            title: 'Privacy & Security',
            onTap: () {},
          ),

          const SizedBox(height: 20),

          // --- قسم التطبيق ---
          _buildSectionTitle('App Settings'),
          _buildSettingItem(
            icon: Icons.language,
            title: 'App Language',
            trailing: const Text(
              'English',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            trailing: Switch(
              value: false,
              onChanged: (val) {},
              activeColor: const Color(0xFFE65100),
            ),
            onTap: () {},
          ),

          const SizedBox(height: 20),

          // --- خروج ---
          _buildSettingItem(
            icon: Icons.logout,
            title: 'Logout',
            textColor: Colors.red,
            iconColor: Colors.red,
            onTap: () {},
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFE65100),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
    Color textColor = Colors.black,
    Color iconColor = Colors.grey,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
        trailing:
            trailing ??
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
