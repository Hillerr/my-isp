import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/core/models/user_auth.dart';
import 'package:my_isp/utils/routes.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Ocorreu um erro"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Entendido"),
          )
        ],
      ),
    );
  }

  void _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    if (mounted) setState(() => _isLoading = true);

    _formKey.currentState?.save();

    AuthUser auth = Provider.of<AuthUser>(context, listen: false);

    try {
      await auth.login(_authData['email'], _authData['password']);
    } catch (error) {
      _showErrorDialog("Ocorreu um erro inesperado");
    }

    if (mounted) setState(() => _isLoading = false);
    Navigator.of(context).pushReplacementNamed(AppRoutes.AUTH_OR_HOME);
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      color: const Color.fromRGBO(245, 245, 245, 1),
      elevation: 0,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "My ISP Login",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFormField(
                key: const ValueKey('email'),
                onSaved: (email) => _authData['email'] = email ?? '',
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: GoogleFonts.quicksand(),
                ),
                validator: (_email) {
                  final email = _email ?? '';
                  if (!EmailValidator.validate(email)) {
                    return "Informe um e-mail válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: GoogleFonts.quicksand(),
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                key: const ValueKey('password'),
                onSaved: (password) => _authData['password'] = password ?? '',
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.trim().length < 6) {
                    return "Senha deve haver no mínimo 6 caracteres";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () {
                    _submit();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    "Entrar",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
