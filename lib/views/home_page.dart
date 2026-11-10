import 'package:flutter/material.dart';

import '../models/model_produk.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Data rpoduk
  final List<ProductModel> allProducts = [
    ProductModel(
      name: 'Kamera DSLR Canon',
      price: 'Rp 50.000 /hari',
      image: 'https://tse1.mm.bing.net/th/id/OIP.1dj0XGh-zmRSesuv3jokFwHaHa?r=0&pid=Api&h=220&P=0',
      location: 'Purworejo',
      rating: 4.8,
      ulasan: 145,
      storeName: 'Purworejo Kamera',
      description: 'Kamera DSLR Canon kondisi mulus, lensa bersih, hasil tajam. Cocok untuk dokumentasi event, wisuda, dan liburan.',
    ),
    ProductModel(
      name: 'Tenda Camping 4P',
      price: 'Rp 35.000 /hari',
      image: 'https://tse2.mm.bing.net/th/id/OIP.tXXtXFMcXg71DiMCXc599AHaHa?r=0&pid=Api&h=220&P=0',
      location: 'Kutoarjo',
      rating: 4.7,
      ulasan: 98,
      storeName: 'Outdoor Kutoarjo',
      description: 'Tenda kapasitas 4 orang, anti air (waterproof), mudah dipasang, lengkap dengan pasak dan pasak tambahan.',
    ),
    ProductModel(
      name: 'Projector Infocus',
      price: 'Rp 75.000 /hari',
      image: 'https://tse4.mm.bing.net/th/id/OIP.Tx94kXKIijdcejgSu8Vx9QHaEK?r=0&pid=Api&h=220&P=0',
      location: 'Purworejo',
      rating: 4.9,
      ulasan: 210,
      storeName: 'Rental Multimedia PWRE',
      description: 'Projector Infocus terang dan jernih, cocok untuk nobar, presentasi kantor, atau acara seminar.',
    ),
    ProductModel(
      name: 'Sepeda Gunung',
      price: 'Rp 40.000 /hari',
      image: 'https://tse3.mm.bing.net/th/id/OIP.i0ylrEZC5AHgNBqsU_HOqAHaHa?r=0&pid=Api&h=220&P=0',
      location: 'Banyuurip',
      rating: 4.6,
      ulasan: 75,
      storeName: 'Banyuurip Bike Rent',
      description: 'Sepeda gunung tangguh untuk jalur offroad ringan maupun jalanan kota, gear empuk dan terawat.',
    ),
    ProductModel(
      name: 'Kamera Mirrorless Canon',
      price: 'Rp 50.000 /hari',
      image: 'https://tse4.mm.bing.net/th/id/OIP.UJLAeiU0P0KYBFSq_XTNRQHaHa?r=0&pid=Api&h=220&P=0',
      location: 'Purworejo',
      rating: 4.9,
      ulasan: 180,
      storeName: 'Purworejo Kamera',
      description: 'Kamera mirrorless ringkas, autofocus cepat, sangat nyaman untuk vlogging dan foto portrait.',
    ),
    ProductModel(
      name: 'PS4',
      price: 'Rp 35.000 /hari',
      image: 'https://tse1.mm.bing.net/th/id/OIP.4jIxpW7vDRdzYe0Hl6jsYgHaHa?r=0&pid=Api&h=220&P=0',
      location: 'Kutoarjo',
      rating: 4.8,
      ulasan: 130,
      storeName: 'GameStation Rental',
      description: 'PlayStation 4 Slim lengkap dengan 2 stick dualshock original dan game pilihan terbaru.',
    ),
    ProductModel(
      name: 'Projector Acer',
      price: 'Rp 75.000 /hari',
      image: 'https://tse3.mm.bing.net/th/id/OIP.f0tb3C3_E-iCiWvvjfwMYwHaHa?r=0&pid=Api&h=220&P=0',
      location: 'Purworejo',
      rating: 4.7,
      ulasan: 90,
      storeName: 'Rental Multimedia PWRE',
      description: 'Projector Acer resolusi tinggi, port HDMI & VGA lengkap, siap pakai untuk berbagai acara.',
    ),
    ProductModel(
      name: 'Drone DJI',
      price: 'Rp 40.000 /hari',
      image: 'https://tse4.mm.bing.net/th/id/OIP.aNbCd2iVIWC-xvZ-vj0H8AHaGL?r=0&pid=Api&h=220&P=0',
      location: 'Banyuurip',
      rating: 4.9,
      ulasan: 115,
      storeName: 'Sky Drone Rental',
      description: 'Drone DJI stabil di angin, hasil video jernih beresolusi tinggi, cocok untuk dokumentasi udara.',
    ),
  ];

  // List kategori pilihan
  final List<String> categories = [
    'Semua',
    'Kamera',
    'Outdoor',
    'Elektronik',
    'Kendaraan',
  ];
  String selectedCategory = 'Semua';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Logika filter produk berdasarkan pencarian dan kategori
    List<ProductModel> filteredProducts = allProducts.where((product) {
      final matchesSearch = product.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      if (selectedCategory == 'Semua') {
        return matchesSearch;
      } else if (selectedCategory == 'Kamera') {
        return matchesSearch && product.name.toLowerCase().contains('kamera');
      } else if (selectedCategory == 'Outdoor') {
        return matchesSearch &&
            (product.name.toLowerCase().contains('tenda') ||
                product.name.toLowerCase().contains('sepeda'));
      } else if (selectedCategory == 'Elektronik') {
        return matchesSearch &&
            (product.name.toLowerCase().contains('projector') ||
                product.name.toLowerCase().contains('ps4') ||
                product.name.toLowerCase().contains('drone'));
      } else if (selectedCategory == 'Kendaraan') {
        return matchesSearch && product.name.toLowerCase().contains('sepeda');
      }
      return matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Barent - Sewa Barang Terdekat',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari barang sewaan...',
                prefixIcon: const Icon(Icons.search, color: Colors.indigo),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 2. MENU KATEGORI (HORIZONTAL LISTVIEW)
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      selectedColor: Colors.indigo.shade100,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? Colors.indigo.shade900
                            : Colors.black87,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // 3. GRIDVIEW PRODUK HASIL FILTER
            Expanded(
              child: filteredProducts.isEmpty
                  ? const Center(
                      child: Text(
                        'Barang tidak ditemukan',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : GridView.builder(
                      itemCount: filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 12.0,
                            crossAxisSpacing: 12.0,
                            childAspectRatio: 0.75,
                          ),
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(product: product),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(8.0),
                                    ),
                                    child: Image.network(
                                      product.image,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        product.price,
                                        style: const TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            product.location,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
