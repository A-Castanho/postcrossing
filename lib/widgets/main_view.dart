import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'customappbar.dart';

mixin MainView {
  late final CustomAppBar appBar;
  late final Widget body;

  Widget buildMainView(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
