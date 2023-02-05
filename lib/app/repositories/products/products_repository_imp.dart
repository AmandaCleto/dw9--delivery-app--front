// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/app/core/exceptions/repository_exceptions.dart';
import 'package:dw9_delivery_app/app/core/restClient/custom_dio.dart';
import 'package:dw9_delivery_app/app/dto/order_dto.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';

import './products_repository.dart';

class ProductsRepositoryImp implements ProductsRepository {
  CustomDio dio;

  ProductsRepositoryImp({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');

      return result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar produtos');
      // TODO
    }
  }
}
