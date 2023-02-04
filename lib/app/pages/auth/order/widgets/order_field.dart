// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OrderField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String hintText;

  const OrderField({
    Key? key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.hintText,
  }) : super(key: key);

  @override
  State<OrderField> createState() => _OrderFieldState();
}

class _OrderFieldState extends State<OrderField> {
  final defaultBorder = const UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.grey,
  ));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.title,
              style: context.textStyles.textRegular.copyWith(
                fontSize: 16.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: defaultBorder,
              enabledBorder: defaultBorder,
              focusedBorder: defaultBorder,
            ),
          ),
        ],
      ),
    );
  }
}
