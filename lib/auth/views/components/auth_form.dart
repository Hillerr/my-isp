import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/auth/controllers/auth_form_controller.dart';

class AuthForm extends StatefulWidget {
  final void Function(Map<String, String>) onSubmit;
  const AuthForm({Key? key, required this.onSubmit}) : super(key: key);

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

  void _onSetState() {
    if (mounted) setState(() => _isLoading = true);
  }

  @override
  Widget build(BuildContext context) {
    final controller = AuthFormController();

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
                    controller.submit(
                      _authData,
                      _formKey,
                      widget.onSubmit,
                      _onSetState,
                    );
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
