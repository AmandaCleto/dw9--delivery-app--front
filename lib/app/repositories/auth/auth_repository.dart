import 'package:dw9_delivery_app/app/models/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel?> login(String email, String password) async {}

  Future<void> register(String name, String email, String password) async {}
}
