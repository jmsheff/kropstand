import 'package:flutter/material.dart';

class QuickLink extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Function() onPressed;

  const QuickLink({ Key key, @required this.iconData, @required this.label, @required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
    child: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle),
          padding: EdgeInsets.all(16),
          child: Icon(
            iconData,
            color: Theme.of(context).colorScheme.onSecondary,
          )),
          SizedBox(height: 8,),
          Text(label, style: Theme.of(context).accentTextTheme.headline3,)
      ],
    )
    );
  }
}
