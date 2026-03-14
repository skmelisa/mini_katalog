import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetail({super.key, required this.product}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    product['image'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product['name'],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  product['price'],
                  style: TextStyle(
                    fontSize: 22, 
                    fontWeight: FontWeight.w600, 
                    color: Colors.blue[900]
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            

            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                  "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
                  "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "
                  "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                  "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia "
                  "deserunt mollit anim id est laborum.",
                  style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, true);
                
               
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product['name']} added to cart!"),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
              label: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}