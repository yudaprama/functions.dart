import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void horizontalNavigation(BuildContext context, Widget screen, [bool rootNavigator = false]) {
	if (Platform.isIOS) {
	  Navigator.of(context, rootNavigator: rootNavigator).push(
			MaterialPageRoute(
				builder: (BuildContext context) => screen,
			),
		);
	} else {
	  Navigator.of(context, rootNavigator: rootNavigator).push(
			CupertinoPageRoute(
				builder: (BuildContext context) => screen,
			),
		);
	}
}
