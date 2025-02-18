  import 'package:flutter/material.dart';

Widget buildSettingsSection() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          _buildSettingsTile(
            Icons.edit,
            'Profili Düzenle',
            () {
              // Profil düzenleme sayfasına yönlendirme
            },
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            Icons.lock,
            'Şifre Değiştir',
            () {
              // Şifre değiştirme sayfasına yönlendirme
            },
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            Icons.notifications,
            'Bildirim Ayarları',
            () {
              // Bildirim ayarları sayfasına yönlendirme
            },
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            Icons.security,
            'Gizlilik Ayarları',
            () {
              // Gizlilik ayarları sayfasına yönlendirme
            },
          ),
        ],
      ),
    );
    
  }

   Widget _buildSettingsTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF4A148C),),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
