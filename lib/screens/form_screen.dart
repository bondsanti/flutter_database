import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ฟอร์มกรอกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อ-สกุล"),
                  autofocus: false,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ตำแหน่ง"),
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "เงินเดือน"),
                  keyboardType: TextInputType.number,
                ),
                RaisedButton(
                  color: Colors.green, // background
                  textColor: Colors.white, // foreground
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: Text("บันทึกข้อมูล"),
                )
              ],
            ),
          ),
        ));
  }
}
