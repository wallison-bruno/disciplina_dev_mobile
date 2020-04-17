library animated_dialog_box;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:jogo_da_memoria/main.dart';

class Animated_dialog_box {
  static Future showRotatedAlert({
    @required BuildContext context,
    @required Widget yourWidget,
    Widget icon,
    Widget title,
    @required Widget firstButton,
    Widget secondButton,
  }) {
    assert(context != null, "context está null!!");
    assert(yourWidget != null, "Widget está null!!");
    assert(firstButton != null, "button está null!!");
    return showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {},
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        barrierLabel: '',
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.rotate(
            angle: math.radians(anim1.value * 360),
            child: AlertDialog(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              title: title,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  icon,
                  Container(
                    height: 10,
                  ),
                  yourWidget
                ],
              ),
              actions: <Widget>[firstButton, secondButton],
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 300));
  }
}
