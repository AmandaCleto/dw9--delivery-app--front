import 'package:dw9_delivery_app/app/pages/home/home_page.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository_imp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImp(
              dio: context.read(),
            ),
          )
        ],
        child: const HomePage(),
      );
}
