import 'package:flutter/foundation.dart';
import '../models/Transection.dart';

class TransectionProviders with ChangeNotifier {
  //object ตย ข้อมูล

  List<Transection> transections = [
    Transection(
        fullname: "John snow",
        position: "Backend",
        salary: 35000,
        date: DateTime.now()),
    Transection(
        fullname: "Mary son",
        position: "Frontend",
        salary: 25000,
        date: DateTime.now()),
    Transection(
        fullname: "Kery experess",
        position: "Flutter",
        salary: 50000,
        date: DateTime.now()),
  ];
  //ดึงข้อมูล
  List<Transection> getTransection() {
    return transections;
  }

  addTransection(Transection statement) {
    transections.insert(0, statement);
    //แจ้งเตือนไปยัง consumer
    notifyListeners();
  }
}
