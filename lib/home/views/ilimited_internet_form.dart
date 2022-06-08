import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_isp/home/controllers/ilimited_internet_controller.dart';
import 'package:my_isp/home/models/ilimited_internet_form_data.dart';
import 'package:my_isp/home/views/components/ilimited_internet_button.dart';
import 'package:my_isp/utils/routes.dart';
import 'package:provider/provider.dart';

class IlimitedInternetForm extends StatefulWidget {
  final Function(IlimitedInternetFormData data) onAdd;

  const IlimitedInternetForm({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<IlimitedInternetForm> createState() => _IlimitedInternetFormState();
}

class _IlimitedInternetFormState extends State<IlimitedInternetForm> {
  final _formKey = GlobalKey<FormState>();

  IlimitedInternetFormData _formData = IlimitedInternetFormData();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<IlimitedInternetController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Criar Solicitação de Internet Ilimitada",
          style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 25),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IlimitedInternetButton(
                      onClick: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.now().add(const Duration(days: 2)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 30)),
                          firstDate: DateTime.now(),
                        );
                        setState(() {
                          _formData.initialDateTime = date;
                        });
                      },
                      label: "Data de ínicio",
                      icon: const Icon(Icons.calendar_today),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IlimitedInternetButton(
                      onClick: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 00, minute: 0),
                        );
                        setState(
                          () => _formData.initialTimeOfDay = time,
                        );
                      },
                      label: "Horário de início",
                      icon: const Icon(Icons.timelapse),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_formData.initialDateTime != null)
                  Text(DateFormat("dd/MM/yyyy")
                      .format(_formData.initialDateTime!)),
                if (_formData.initialTimeOfDay != null)
                  Text(
                    '${_formData.initialTimeOfDay!.hour}:${_formData.initialTimeOfDay!.minute}',
                  ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IlimitedInternetButton(
                      onClick: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.now().add(const Duration(days: 2)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 30)),
                          firstDate: DateTime.now(),
                        );

                        setState(() => _formData.finalDateTime = date);
                      },
                      label: "Data final",
                      icon: const Icon(Icons.calendar_today),
                    ),
                    IlimitedInternetButton(
                      onClick: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 00, minute: 0),
                        );
                        setState(() => _formData.finalTimeOfDay = time);
                      },
                      label: "Horário final",
                      icon: const Icon(Icons.timelapse),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_formData.finalDateTime != null)
                  Text(DateFormat("dd/MM/yyyy")
                      .format(_formData.finalDateTime!)),
                if (_formData.finalTimeOfDay != null)
                  Text(
                      '${_formData.finalTimeOfDay!.hour}:${_formData.finalTimeOfDay!.minute}'),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: _formData.isComplete()
                      ? () {
                          widget.onAdd(_formData);
                          controller.closeForm(context);
                        }
                      : null,
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                  label: Text("Criar solicitação",
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
      ),
    );
  }
}
