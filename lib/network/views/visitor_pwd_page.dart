import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitorPwdPage extends StatefulWidget {
  const VisitorPwdPage({Key? key}) : super(key: key);

  @override
  State<VisitorPwdPage> createState() => _VisitorPwdPageState();
}

class _VisitorPwdPageState extends State<VisitorPwdPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Map<String, String> _authData = {
    'SSID': '',
    'password': '',
    'newPassword': ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Configurar Rede de Visitante",
          style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey("SSID"),
                decoration: const InputDecoration(
                  labelText: "Nome da Rede de Visitante",
                ),
                onSaved: (SSID) => _authData['SSID'] = SSID ?? '',
              ),
              TextFormField(
                key: const ValueKey('password'),
                decoration: const InputDecoration(
                  labelText: "Senha da Rede Atual",
                ),
                onSaved: (password) => _authData['password'] = password ?? '',
              ),
              TextFormField(
                key: const ValueKey('newPassword'),
                decoration: const InputDecoration(
                  labelText: "Senha da Rede de Visitante",
                ),
                onSaved: (newPassword) =>
                    _authData['newPassword'] = newPassword ?? '',
              ),
              TextFormField(
                key: const ValueKey('newPasswordConfirm'),
                decoration: const InputDecoration(
                  labelText: "Confirmar Senha da rede de Visitante",
                ),
                onSaved: (newPasswordConfirm) =>
                    _authData['newPasswordConfirm'] = newPasswordConfirm ?? '',
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }

                  setState(() => isLoading = true);

                  // await controller.changeSSID();

                  setState(() => isLoading = false);
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.create,
                  size: 25,
                  color: Colors.black87,
                ),
                label: Text("Criar Rede Visitante",
                    style: GoogleFonts.quicksand(color: Colors.black87)),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
              ),
              if (isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
