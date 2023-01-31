import 'package:dw9_delivery_app/app/core/restClient/custom_dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//global instances
class ApplicationBindingProvider extends StatelessWidget {
  final Widget child;

  const ApplicationBindingProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CustomDio()),
      ],
      child: child,
    );
  }
}
