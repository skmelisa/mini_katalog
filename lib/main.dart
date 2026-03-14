import 'package:flutter/material.dart';
import 'product_detail.dart';
import 'cart.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, 
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  List<Map<String, dynamic>> filteredProducts = [];
  List<Map<String, dynamic>> cart = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      cart.add(product);
    });
  }

  void searchProduct(String query) {
    setState(() {
      filteredProducts = products
          .where((p) =>
              p['name'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CartPage(cart: cart)),
                  );
                },
              ),
              if (cart.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      cart.length.toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                )
            ],
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: searchProduct,
              ),
            ),

      
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: AspectRatio(
                aspectRatio: 4.0, 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/banner.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth, 
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.blueGrey[100],
                      child: const Icon(Icons.image, size: 50),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
       
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () async {
                      final added = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetail(product: product),
                        ),
                      );
                      if (added == true) addToCart(product);
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.network(
                                product['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product['name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text(
                              product['price'],
                              style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}