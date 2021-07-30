import 'package:flutter/material.dart';

class Symbol extends StatelessWidget {
  final String title;
  final Function btnOnclick;
  //final String   operation;
 
  
  const Symbol({this.title,this.btnOnclick,});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        
      },
      child: InkWell(
        onTap: btnOnclick,
        child: Container(
          alignment: Alignment.center,
          height: 70,
          width: 50,
          //color: Colors.white,
          child:Text(title,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.blueAccent),
          
        )),
      ),
    );
  }
}