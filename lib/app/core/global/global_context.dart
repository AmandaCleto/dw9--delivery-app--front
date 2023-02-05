import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class GlobalContext {
  //! Attention: Do never let_navigatorKey public!
  late final GlobalKey<NavigatorState> _navigatorKey;

  GlobalContext._();

  static GlobalContext? _instance;

  static GlobalContext get i {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  Future<void> loginExpire() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();

    showTopSnackBar(
      _navigatorKey.currentState!.overlay!,
      const CustomSnackBar.error(
        message: 'Login Expirado, clique nas sacola novamente.',
        backgroundColor: Colors.black,
      ),
    );

    _navigatorKey.currentState!.popUntil(ModalRoute.withName('/home'));
  }
}
