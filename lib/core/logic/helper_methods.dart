import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final navigatorkey = GlobalKey<NavigatorState>();

Future navigateTo(Widget Page) async {
  return await Navigator.of(navigatorkey.currentContext!)
      .push(MaterialPageRoute(
    builder: (context) => Page,
  ));
}