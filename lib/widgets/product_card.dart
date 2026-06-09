import 'package:flutter/material.dart';
import 'package:flutter_application_api/app/config.dart';
import 'package:flutter_application_api/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.thumbnail,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(Icons.image_not_supported, size: 40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // hide the add cart button part in ENV demo
                if (!Config().isDemo)
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: onAddToCart,
                      child: const Text('Add to Cart'),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
