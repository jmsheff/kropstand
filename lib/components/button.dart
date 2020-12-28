import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ButtonData {
  ButtonData({ @required this.label, this.prefixIcon, this.suffixIcon, @required this.onPressed });

  final String label;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Function() onPressed;
}

class _Button extends StatelessWidget {
  _Button({ @required this.color, @required this.highlightColor, @required this.textStyle, @required this.data });
  
  final Color color;
  final Color highlightColor;
  final TextStyle textStyle;
  final ButtonData data;
 

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: Theme.of(context).buttonTheme.padding,
      height: Theme.of(context).buttonTheme.height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      highlightColor: highlightColor,
      color: color,
      onPressed: data.onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        data.prefixIcon != null ? Padding(padding: EdgeInsets.only(right: 8), child: Icon(data.prefixIcon, color: textStyle.color)) : SizedBox.shrink(),
        Text(data.label, style: textStyle ),
        data.suffixIcon != null ? Padding(padding: EdgeInsets.only(left: 8), child: Icon(data.suffixIcon, color: textStyle.color)) : SizedBox.shrink()
      ],)
    );
  }
}

class SolidButton extends _Button {
  SolidButton(this.data);
  final ButtonData data;

  @override
  Widget build(BuildContext context) {
    return _Button(
      color: Theme.of(context).colorScheme.primary,
      highlightColor: Theme.of(context).colorScheme.primaryVariant,
      textStyle: Theme.of(context).textTheme.button,
      data: data
    );
  }
}

class GlassButton extends StatelessWidget {
  GlassButton(this.data);
  final ButtonData data; 

  @override
  Widget build(BuildContext context) {
    return _Button(
      color: Theme.of(context).colorScheme.secondary,
      highlightColor: Theme.of(context).colorScheme.secondaryVariant,
      textStyle: Theme.of(context).accentTextTheme.button,
      data: data
    );
  }
}


/* class Button extends StatefulWidget {
  Button({@required this.child, @required this.onPressed, @required this.type});
  final ButtonType type;
  final Widget child;
  final Function() onPressed;

  @override
  _ButtonState createState() => _ButtonState();
}


class _ButtonState extends State<Button> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) {
        setState(() {
          _isActive = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isActive = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isActive = false;
        });
      },
      child: Container(
        height: 40,
        padding: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: _isActive ? 
          widget.type == ButtonType.solid ?
            Theme.of(context).colorScheme.primaryVariant
            :  Theme.of(context).colorScheme.secondaryVariant
          : widget.type == ButtonType.solid ?
          Theme.of(context).primaryColor 
            : Theme.of(context).colorScheme.secondary,
        ),
        child: widget.child
      )
    );
  }
} */