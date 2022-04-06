import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Transection.dart';
import '../providers/transection_providers.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  //ตัวแปรรับค่า
  final fullnameController = TextEditingController();
  final positionController = TextEditingController();
  final salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ฟอร์มกรอกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อ-สกุล"),
                  controller: fullnameController, //ผูกค่ากับตัวแปรที่ประกาศไว้
                  autofocus: false,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกชื่อ-นามสกุล";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ตำแหน่ง"),
                  controller: positionController, //ผูกค่ากับตัวแปรที่ประกาศไว้
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกตำแหน่ง";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "เงินเดือน"),
                  controller: salaryController, //ผูกค่ากับตัวแปรที่ประกาศไว้
                  keyboardType: TextInputType.number,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกจำนวนเงิน";
                    }
                    if (double.parse(str) <= 0) {
                      return "กรุณากรอกจำนวนมากกว่า 0";
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  color: Colors.green, // background
                  textColor: Colors.white, // foreground
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var fullname = fullnameController.text;
                      var position = positionController.text;
                      var salary = salaryController.text;

                      // print({fullname, position, salary});
                      //เตรียมข้อมูล
                      Transection statement = Transection(
                          fullname: fullname,
                          position: position,
                          salary: double.parse(salary),
                          date: DateTime.now());

                      //เรียกใช้งาน provider
                      var provider = Provider.of<TransectionProviders>(context,
                          listen: false);

                      provider.addTransection(statement);

                      Navigator.pop(
                        context,
                      );
                    }
                  },
                  child: Text("บันทึกข้อมูล"),
                )
              ],
            ),
          ),
        ));
  }
}
