import 'package:flutter/material.dart';

import '../Features/Widgets/LoadingDialog.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showLoaderDialog(context),
      ),
    );
  }
}
