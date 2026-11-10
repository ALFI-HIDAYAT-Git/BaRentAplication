import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. Bagian Info Akun / Foto Profil
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Alfi Hidayat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'alfi@gmail.com',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),

            // 2. Menu Navigasi Profil Sederhana
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.indigo),
              title: const Text('Pinjaman Saya'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                // Aksi pengaturan
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.indigo),
              title: const Text('Pengaturan'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                // Aksi barang favorit
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.indigo),
              title: const Text('Bantuan & FAQ'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                // Aksi bantuan
              },
            ),
            const Divider(),
            const SizedBox(height: 12),

            // 3. Tombol Logout (Menghapus tumpukan halaman sesuai modul tugas)[cite: 63]
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // kembali atau keluar
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text(
                  'Keluar (Logout)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
