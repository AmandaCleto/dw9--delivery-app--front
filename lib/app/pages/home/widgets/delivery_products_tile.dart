import 'package:dw9_delivery_app/app/core/extensions/formatter_extensions.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';

class DeliveryProductsTile extends StatelessWidget {
  final ProductModel product;

  const DeliveryProductsTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.name,
                    style: context.appStyles.textExtraBold
                        .copyWith(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.description,
                    style: context.appStyles.textRegular.copyWith(
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.price.currencyPTBR,
                    style: context.appStyles.textMedium.copyWith(
                      fontSize: 12.0,
                      color: context.colors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: product.image,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.contain,
          )
          // Container(),
        ],
      ),
    );
  }
}
