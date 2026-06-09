import 'package:flutter/material.dart';
import 'package:flutter_application_api/app/config.dart';
import 'package:flutter_application_api/models/product.dart';
import 'package:flutter_application_api/providers/cart_provider.dart';
import 'package:flutter_application_api/services/api_service.dart';
import 'package:flutter_application_api/widgets/product_card.dart';
import 'package:flutter_application_api/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _apiService = ApiService();
  final _searchController = TextEditingController();

  bool _isLoading = true;
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config().appName),
        actions: [

          // hide the cart icon part in ENV demo
          if (!Config().isDemo)

            ListenableBuilder(
              listenable: CartProvider(),
              builder: (context, _) {
                final count = CartProvider().itemCount;
                return IconButton(
                  icon: count > 0
                      ? Badge(
                          label: Text('$count'),
                          child: const Icon(Icons.shopping_cart),
                        )
                      : const Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                );
              },
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [

        SearchBarWidget(
          controller: _searchController,
          onChanged: _onSearchChanged,
        ),
        Expanded(
          child: _filteredProducts.isEmpty
              ? const Center(child: Text('No results found'))
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: _buildProductItem,
                ),
        ),
      ],
    );
  }

  // add to cart
  Widget _buildProductItem(BuildContext context, int index) {
    final product = _filteredProducts[index];
    return ProductCard(
      product: product,
      onAddToCart: () => _addToCart(product),
    );
  }

  void _onSearchChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _filteredProducts = List.from(_products);
      } else {
        _filteredProducts = _products
            .where((p) => p.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  // 
  void _addToCart(Product product) {
    CartProvider().addItem(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} added to cart')),
    );
  }

  Future<void> _loadProducts() async {
    final products = await _apiService.fetchProducts();
    setState(() {
      _products = products;
      _filteredProducts = List.from(products);
      _isLoading = false;
    });
  }
}
