import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/network/controllers/ssid_config_controller.dart';

class SSIDConfigPage extends StatefulWidget {
  SSIDConfigPage({Key? key}) : super(key: key);

  @override
  State<SSIDConfigPage> createState() => _SSIDConfigPageState();
}

class _SSIDConfigPageState extends State<SSIDConfigPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Map<String, String> _authData = {
    'SSID': '',
    'password': '',
    'newPassword': ''
  };

  @override
  Widget build(BuildContext context) {
    final controller = SSIDConfigController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Configurar SSID e Senha",
          style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 25),
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
                  labelText: "Nome da Rede",
                ),
                onSaved: (SSID) => _authData['SSID'] = SSID ?? '',
              ),
              TextFormField(
                key: const ValueKey('password'),
                decoration: const InputDecoration(
                  labelText: "Senha Atual",
                ),
                onSaved: (password) => _authData['password'] = password ?? '',
              ),
              TextFormField(
                key: const ValueKey('newPassword'),
                decoration: const InputDecoration(
                  labelText: "Nova Senha",
                ),
                onSaved: (newPassword) =>
                    _authData['newPassword'] = newPassword ?? '',
              ),
              TextFormField(
                key: const ValueKey('newPasswordConfirm'),
                decoration: const InputDecoration(
                  labelText: "Confirmar Nova Senha",
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

                  await controller.changeSSID();

                  setState(() => isLoading = false);
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.change_circle,
                  size: 25,
                  color: Colors.black87,
                ),
                label: Text("Alterar SSID",
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
