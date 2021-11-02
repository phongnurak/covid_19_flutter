import 'package:flutter/material.dart';

class AboutProject extends StatelessWidget {
  const AboutProject({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3)
      ),
      title: Text("About Project"),
      content: Container(
        height: s.height * 0.8,
        width: s.width * 0.7,
      ),
      elevation: 10,
      actions: [
        OutlinedButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text(
            "OK",
            style: TextStyle(
              color: Colors.blue
            ),
          )
        )
      ],
    );
  }
}