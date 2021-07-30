
import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  final String title;
  final Function btnOnClick;
  
  
  const NumberText(this.title,this.btnOnClick );
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
       onPressed: (){},
       color: Colors.blueAccent,
          child: InkWell(
        onTap: btnOnClick,
        child: Container(
          height: 70,
          width: 50,
          
          alignment:Alignment.center,
              child: Text(title,style: TextStyle(fontWeight: FontWeight.w900,fontSize:20,color: Colors.white),
            
          ),
        ),
      ),
    );
  }
}
