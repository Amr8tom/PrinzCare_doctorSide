import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';

class AppointmentSlot {
  String name;
  List<Slots?> time;

  AppointmentSlot(this.name, this.time);
}

class Categories {
  String image;
  String name;

  Categories(this.image, this.name);
}

class LocalSlot {
  String time;
  int index;

  LocalSlot(this.time, this.index);
}
