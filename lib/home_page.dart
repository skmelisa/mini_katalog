import 'package:flutter/material.dart';
import 'product_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> filteredProducts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void filterProducts(String query) {
    final filtered = products.where((product) {
      final nameLower = product['name'].toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    setState(() {
      filteredProducts = filtered;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mini Katalog'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Ürün ara...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: filterProducts,
              ),
            ),
           
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(12),
               child: SizedBox(
                 height: 80,
                 width: double.infinity,
                 child: Image.asset(
                   'assets/images/banner.png',
                   fit: BoxFit.fill,
                 ),
                ),
              ),
            ),
SizedBox(height: 16),
         
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetail(product: product),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              product['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(product['price']),
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

final List<Map<String, dynamic>> products = [
  {
    "id": 1,
    "name": "iPhone 15 Pro",
    "price": "\$999",
    "image": "https://wantapi.com/assets/images/iphone.png"
  },
  {
    "id": 2,
    "name": "iPhone 15",
    "price": "\$799",
    "image": "https://wantapi.com/assets/images/iphone_pink.png"
  },
  {
    "id": 3,
    "name": "iPhone 15 Plus",
    "price": "\$899",
    "image": "https://wantapi.com/assets/images/iphone_yellow.png"
  },
  {
    "id": 4,
    "name": "iPhone 14",
    "price": "\$699",
    "image": "https://wantapi.com/assets/images/iphone_blue.png"
  },
  {
    "id": 5,
    "name": "iPhone SE",
    "price": "\$429",
    "image": "https://wantapi.com/assets/images/iphone_se.png"
  },
  {
    "id": 6,
    "name": "MacBook Pro 16\"",
    "price": "\$2,499",
    "image": "https://wantapi.com/assets/images/macbook.png"
  },
  {
    "id": 7,
    "name": "MacBook Pro 14\"",
    "price": "\$1,599",
    "image": "https://wantapi.com/assets/images/macbook_silver.png"
  },
  {
    "id": 8,
    "name": "MacBook Air 15\"",
    "price": "\$1,299",
    "image": "https://wantapi.com/assets/images/macbook_air.png"
  },
  {
    "id": 9,
    "name": "MacBook Air 13\"",
    "price": "\$1,099",
    "image": "https://wantapi.com/assets/images/macbook_starlight.png"
  },
  {
    "id": 10,
    "name": "iMac",
    "price": "\$1,299",
    "image": "https://wantapi.com/assets/images/imac.png"
  },
  {
    "id": 11,
    "name": "iPad Pro 12.9\"",
    "price": "\$1,099",
    "image": "https://wantapi.com/assets/images/ipad.png"
  },
  {
    "id": 12,
    "name": "iPad Air",
    "price": "\$599",
    "image": "https://wantapi.com/assets/images/ipad_air.png"
  },
  {
    "id": 13,
    "name": "iPad Mini",
    "price": "\$499",
    "image": "https://wantapi.com/assets/images/ipad_mini.png"
  },
  {
    "id": 14,
    "name": "Apple Watch Ultra 2",
    "price": "\$799",
    "image": "https://wantapi.com/assets/images/watch.png"
  },
  {
    "id": 15,
    "name": "Apple Watch Series 9",
    "price": "\$399",
    "image": "https://wantapi.com/assets/images/watch_series9.png"
  },
  {
    "id": 16,
    "name": "Apple Vision Pro",
    "price": "\$3,499",
    "image": "https://wantapi.com/assets/images/vision_pro.png"
  },
  {
    "id": 17,
    "name": "AirPods Pro (2nd Gen)",
    "price": "\$249",
    "image": "https://wantapi.com/assets/images/airpods.png"
  },
  {
    "id": 18,
    "name": "AirPods Max",
    "price": "\$549",
    "image": "https://wantapi.com/assets/images/airpods_max.png"
  },
  {
    "id": 19,
    "name": "HomePod",
    "price": "\$299",
    "image": "https://wantapi.com/assets/images/homepod.png"
  },
  {
    "id": 20,
    "name": "HomePod Mini",
    "price": "\$99",
    "image": "https://wantapi.com/assets/images/homepod_mini.png"
  },
];
