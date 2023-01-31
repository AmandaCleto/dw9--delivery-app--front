import 'package:dw9_delivery_app/app/core/ui/helpers/loader.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/messages.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/home/home_controller.dart';
import 'package:dw9_delivery_app/app/pages/home/home_state.dart';
import 'package:dw9_delivery_app/app/pages/home/widgets/delivery_products_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(listener: ((
        context,
        state,
      ) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? 'Erro não informado');
          },
        );
      }), buildWhen: (previous, current) {
        return current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        );
      }, builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return DeliveryProductsTile(
                    product: ProductModel(
                      name: state.products[index].name,
                      description: state.products[index].description,
                      price: state.products[index].price,
                      id: state.products[index].id,
                      image: state.products[index].image,
                    ),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
