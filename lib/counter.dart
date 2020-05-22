import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier
{
int number =0 ;
increment()
{
  number++;
  notifyListeners();
}

final  value  =4;
}