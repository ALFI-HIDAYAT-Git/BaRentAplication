class ProductModel {
  final String name;
  final String price;
  final String image;
  final String location;
  final double rating;
  final int ulasan;
  final String storeName;
  final String description;

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.location,
    this.rating = 4.5,
    this.ulasan = 120,
    this.storeName = 'Barent Official Store',
    this.description = 'Barang dalam kondisi baik, aman, dan siap pakai. Sangat cocok dengan keperluan Anda.',
  });
}
