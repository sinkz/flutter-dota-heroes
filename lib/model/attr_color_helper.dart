import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class AttrColorHelper {
  static Color getValue(String atribute){
    switch(atribute){
      case "agi": 
        return Colors.green;
      case "int": 
        return Colors.blue;
      case "str": 
        return Colors.red;  
      default:
        return Colors.black;
    }
  }
}
