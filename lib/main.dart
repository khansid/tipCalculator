import 'package:demo2/ui/home.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {


  //runApp(const ScaffoldExample());
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BillSplitter(),
  ));
}

// void main()=> runApp(const MaterialApp(
//   home: ScaffoldExample(),
// ));