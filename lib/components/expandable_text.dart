// https://stackoverflow.com/questions/49572747/flutter-how-to-hide-or-show-more-text-within-certain-length
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxChars;

  ExpandableText({@required this.text, this.maxChars = 250 });

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > widget.maxChars) {
      firstHalf = widget.text.substring(0, widget.maxChars);
      secondHalf = widget.text.substring(widget.maxChars, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf, style: Theme.of(context).textTheme.bodyText1)
          : Column(
              children: <Widget>[
                Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf), style: Theme.of(context).textTheme.bodyText1),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          flag ? "Read more" : "Read less",
                          style: Theme.of(context).accentTextTheme.button
                        )
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}