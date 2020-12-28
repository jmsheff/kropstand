import 'package:KropStand/ks_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function() onTap;
  final bool canRequestFocus;
  final bool autoFocus; 

  SearchBar({ this.onTap, this.canRequestFocus = true, this.autoFocus = false });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      autofocus: autoFocus,
      focusNode: FocusNode(canRequestFocus: canRequestFocus),
      // TODO: Change transistion
      onTap: onTap,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.all(8),
      style: Theme.of(context).textTheme.headline3,
      placeholderStyle: Theme.of(context).textTheme.headline3,
      prefix: Padding(
          padding: EdgeInsets.only(left: 8), child: Icon(KsIcons.search)),
      placeholder: 'Search',
    );
  }
}
