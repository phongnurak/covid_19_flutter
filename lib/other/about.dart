import 'package:flutter/material.dart';
import 'dart:html' as html;
class AboutProject extends StatelessWidget {
  const AboutProject({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3)
      ),
      title: Text(
        "About Project",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: (s.width * 0.02) + (s.height * 0.01) 
        ),
      ),
      content: Container(
        // height: s.height * 0.8,
        width: s.width * 0.5,
        child: Text("โปรเจคนี้ทำขึ้นเพื่อทดลองใช้ API เพื่อนำข้อมูลของโควิด 19 มาแสดงบนเว็บไซต์และเก็บเป็นส่วนหนึ่งในผลงานที่สร้างขึ้นจากการเขียนโปรแกรมด้วยเครื่องมือ Flutter") ,
      ),
      elevation: 10,
      actions: [
        OutlinedButton(
          onPressed: (){
            html.window.open("https://webprofile-55636.web.app/#/home", "");
          }, 
          child: Text(
            "Additional works",
            style: TextStyle(
              color: Colors.blue
            ),
          )
        ),
        OutlinedButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text(
            "Close",
            style: TextStyle(
              color: Colors.blue
            ),
          )
        )
      ],
    );
  }
}