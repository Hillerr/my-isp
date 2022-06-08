import 'package:flutter/material.dart';
import 'package:my_isp/auth/views/components/auth_form.dart';
import 'package:my_isp/auth/models/repositories/auth_repository.dart';
import 'package:my_isp/utils/color_scheme.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(Map<String, String> formData) async {
    try {
      setState(() => _isLoading = true);

      await AuthRepository().login(formData['email']!, formData['password']!);
    } catch (e) {
      // tratar erro
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.bottonColor,
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: AuthForm(
                  onSubmit: _handleSubmit,
                ),
              ),
      ),
    );
  }
}
