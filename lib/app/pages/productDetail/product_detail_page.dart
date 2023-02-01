import 'package:auto_size_text/auto_size_text.dart';
import 'package:dw9_delivery_app/app/core/extensions/formatter_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/baseState/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/productDetail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentWidth(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.product.name,
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22.0),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
                  style: context.textStyles.textExtraBold,
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                height: 68.0,
                width: context.percentWidth(.5),
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                  return DeliveryIncrementDecrementButton(
                    amount: amount,
                    incrementTap: () {
                      controller.increment();
                    },
                    decrementTap: () {
                      controller.decrement();
                    },
                  );
                }),
              ),
              Container(
                width: context.percentWidth(.5),
                height: 68.0,
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(
                          OrderProductDto(
                            product: widget.product,
                            amount: amount,
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Adicionar',
                            style: context.textStyles.textExtraBold.copyWith(
                              fontSize: 13.0,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: AutoSizeText(
                              (widget.product.price * amount).currencyPTBR,
                              maxFontSize: 13.0,
                              minFontSize: 5.0,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: context.textStyles.textExtraBold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
