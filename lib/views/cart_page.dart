import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy produk di dalam keranjang
    final List<Map<String, String>> cartItems = [
      {
        'name': 'Kamera DSLR Canon',
        'price': 'Rp 50.000 /hari',
        'image': 'https://tse1.mm.bing.net/th/id/OIP.1dj0XGh-zmRSesuv3jokFwHaHa?r=0&pid=Api&h=220&P=0',
        'duration': '2 Hari',
        'subtotal': 'Rp 100.000',
      },
      {
        'name': 'Tenda Camping 4P',
        'price': 'Rp 35.000 /hari',
        'image': 'https://tse2.mm.bing.net/th/id/OIP.tXXtXFMcXg71DiMCXc599AHaHa?r=0&pid=Api&h=220&P=0',
        'duration': '1 Hari',
        'subtotal': 'Rp 35.000',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang Sewa',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Keranjang Anda masih kosong',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // Gambar Produk di Keranjang
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            item['image']!,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Detail Produk & Durasi Sewa
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['price']!,
                                style: const TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Durasi: ${item['duration']!}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Subtotal & Tombol Hapus
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item['subtotal']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                              onPressed: () {
                                // Aksi hapus item dari keranjang
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      // Total Pembayaran & Tombol Checkout
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Pembayaran:',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  'Rp 135.000',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pesanan berhasil diproses ke checkout!')),
                );
              },
              child: const Text(
                'Checkout (Sewa)',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}