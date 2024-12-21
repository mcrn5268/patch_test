import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_item.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String? _selectedCategory;
  String _searchQuery = '';
  String? _selectedSortOption;
  bool _isAscending = true;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    Provider.of<ProductProvider>(context, listen: false).fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final categories = productProvider.categories;

    // List of asset names in the order corresponding to the categories
    final assetNames = [
      'electronics.png',
      'jewelry.png',
      'mens.png',
      'womens.png'
    ];
    final categoriesNames = [
      'Electronics',
      'Jewelry',
      'Men\'s Wear',
      'Women\'s Wear'
    ];

    final filteredProducts = productProvider.products
        .where((prod) =>
            (_selectedCategory == null || prod.category == _selectedCategory) &&
            (prod.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                prod.description
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase())))
        .toList();
// Apply sorting
    if (_selectedSortOption != null) {
      filteredProducts.sort((a, b) => _isAscending
          ? a.price.compareTo(b.price)
          : b.price.compareTo(a.price));
    }
    return Scaffold(
      body: productProvider.products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Search Bar Section
                Column(
                  children: [
                    Container(
                      height: 20,
                      color: const Color(0xFF806cac),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 25,
                                    color: const Color(0xFF806cac),
                                  ),
                                  Container(
                                    height: 25,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withValues(),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        _searchQuery = value;
                                      });
                                    },
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 18),
                                      hintText: 'What are you looking for?',
                                      hintStyle: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Categories Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: const Text(
                        'Choose from any category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(categories.length, (index) {
                          final category = categoriesNames[index];
                          final assetName = assetNames[index];

                          return Expanded(
                            // Makes each category take equal space
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategory =
                                      category == _selectedCategory
                                          ? null
                                          : category;
                                });
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Outer gradient circle
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 89,
                                            height: 89,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: _selectedCategory ==
                                                      category
                                                  ? LinearGradient(
                                                      begin: Alignment
                                                          .topLeft, // Gradient starts from top-left
                                                      end: Alignment
                                                          .bottomRight, // Gradient ends at bottom-right
                                                      colors: [
                                                        const Color.fromARGB(
                                                            255,
                                                            52,
                                                            206,
                                                            180), // Darker green
                                                        Colors.greenAccent[
                                                            200]!, // Lighter green
                                                      ],
                                                    )
                                                  : null, // No gradient if the category is not selected
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/$assetName',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // White gap padding from the image to separate the green gradient color
                                          Container(
                                            width: 84,
                                            height: 84,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor, // Background color of the container
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/$assetName',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Inner image circle
                                      Container(
                                        width: 80, // Image circle size
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/$assetName',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    category,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${filteredProducts.length} products to choose from',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_selectedSortOption == 'low-to-high') {
                                  _selectedSortOption = null;
                                  _isAscending = true;
                                } else {
                                  _selectedSortOption = 'low-to-high';
                                  _isAscending = true;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _selectedSortOption == 'low-to-high'
                                      ? const Color(0xFF806cac)
                                      : Colors.grey[350],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'Lowest price first',
                              style: TextStyle(
                                color: _selectedSortOption == 'low-to-high'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_selectedSortOption == 'high-to-low') {
                                  _selectedSortOption = null;
                                  _isAscending = true;
                                } else {
                                  _selectedSortOption = 'high-to-low';
                                  _isAscending = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _selectedSortOption == 'high-to-low'
                                      ? const Color(0xFF806cac)
                                      : Colors.grey[350],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'Highest price first',
                              style: TextStyle(
                                color: _selectedSortOption == 'high-to-low'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Products Section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      itemCount: filteredProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 items horizontally
                        crossAxisSpacing: 10, // Spacing between columns
                        mainAxisSpacing: 10, // Spacing between rows
                        childAspectRatio:
                            0.8, // Aspect ratio for each item (width/height)
                      ),
                      itemBuilder: (ctx, i) => ProductItem(filteredProducts[i]),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
