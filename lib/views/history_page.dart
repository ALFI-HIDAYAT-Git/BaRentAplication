import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy riwayat sewa
    final List<Map<String, String>> historyList = [
      {
        'name': 'Kamera DSLR Canon',
        'date': '10 Nov 2026 - 12 Nov 2026',
        'price': 'Rp 100.000',
        'status': 'Selesai',
        'statusColor': 'green',
      },
      {
        'name': 'Tenda Camping 4P',
        'date': '01 Nov 2026 - 03 Nov 2026',
        'price': 'Rp 70.000',
        'status': 'Selesai',
        'statusColor': 'green',
      },
      {
        'name': 'Projector Infocus',
        'date': '15 Okt 2026 - 16 Okt 2026',
        'price': 'Rp 75.000',
        'status': 'Selesai',
        'statusColor': 'green',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Penyewaan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: historyList.isEmpty
          ? const Center(
              child: Text(
                'Belum ada riwayat penyewaan',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.separated(
              itemCount: historyList.length,
              padding: const EdgeInsets.all(12.0),
              separatorBuilder: (context, index) => const SizedBox(height: 8.0),
              itemBuilder: (context, index) {
                final history = historyList[index];
                return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Info Barang & Tanggal
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              history['name']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              history['date']!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              history['price']!,
                              style: const TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        // Status Sewa
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: Colors.green.shade200),
                          ),
                          child: Text(
                            history['status']!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
