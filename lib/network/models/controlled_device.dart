import 'dart:math';

class ControlledDevice {
  String id = Random().nextDouble().toString();
  String name;
  String macAddress;

  ControlledDevice(this.name, this.macAddress);
}
