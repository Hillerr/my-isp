import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceForm extends StatelessWidget {
  final Function(String name, String macAdress) onAdd;
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _authData = {'name': '', 'macAdress': ''};

  DeviceForm({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Controle Parental",
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
                key: const ValueKey("name"),
                decoration: const InputDecoration(
                  labelText: "Nome do dispositivo",
                ),
                onSaved: (name) => _authData['name'] = name ?? '',
              ),
              TextFormField(
                key: const ValueKey('macAddress'),
                decoration: const InputDecoration(
                  labelText: "Endereço MAC",
                ),
                onSaved: (macAddress) =>
                    _authData['macAddress'] = macAddress ?? '',
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  onAdd(_authData['name']!, _authData['macAddress']!);
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.add,
                  size: 25,
                ),
                label: Text("Adcionar Dispostivo",
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
            ],
          ),
        ),
      ),
    );
  }
}
