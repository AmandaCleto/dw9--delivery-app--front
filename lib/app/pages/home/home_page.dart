import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/home/widgets/delivery_products_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductsTile(
                  product: ProductModel(
                    name: 'lanche x',
                    description:
                        'Lanche acompanha pão, hambúguer, mussarela, alface, tomate e maionese',
                    price: 20.0,
                    id: 1,
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_8j1PL70b32CbadGk76H4gk4P0ANZPHuNNEcjqNx5Mw&s.png',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
