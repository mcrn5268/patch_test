import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 300, 
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), 
        border: Border.all(
          color: Colors.grey[350]!, 
          width: 1, 
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit
                      .contain, 
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow:
                      TextOverflow.ellipsis, // Prevent overflow for the title
                ),
                SizedBox(height: 4),
                Flexible(
                  child: Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow
                        .ellipsis, // Prevent overflow for the description
                  ),
                ),
                Spacer(),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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
