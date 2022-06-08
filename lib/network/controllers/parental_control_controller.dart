import 'package:flutter/material.dart';
import 'package:my_isp/network/models/controlled_device.dart';
import 'package:my_isp/network/models/parental_control.dart';
import 'package:my_isp/network/views/device_form.dart';

class ParentalControlController {
  ParentalControl _parentalControl;

  ParentalControlController(this._parentalControl);

  List<ControlledDevice> get devices => _parentalControl.controlledDevices;

  int get itemsCount {
    return _parentalControl.itemsCount;
  }

  void addDevice(String owner, String macAddress) {
    if (_isValidMacAddress(macAddress)) {
      _parentalControl.addDevice(macAddress, owner);
    } else {
      throw Exception("Not a valid mac address");
    }
  }

  void removeDevice(ControlledDevice device) {
    _parentalControl.removeDevice(device.id);
  }

  bool _isValidMacAddress(String macAdress) {
    // Method to validate a mac address filled in the form

    return true;
  }

  Future<void> openForm(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => DeviceForm(
          onAdd: addDevice,
        ),
      ),
    );
  }

  void editDevice(ControlledDevice device) {}

  void onAdd() {}
}
