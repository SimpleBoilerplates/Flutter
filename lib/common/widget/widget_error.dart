import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

class WidgetError extends StatelessWidget {
  final bool visible;

  const WidgetError({Key key, this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error_outline, color: Colors.red[300], size: 80.0),
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                S.of(context).error,
                style: TextStyle(
                  color: Colors.red[300],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
