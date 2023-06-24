import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'LosePage.dart';
import 'WinPage.dart';

class ShowWinFailPage extends StatelessWidget {
  const ShowWinFailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderLevelForm>(builder: (context, _, child) {
      return Stack(
        children: [
          Center(
            child: _.winpage ? WinPage() : SizedBox(),
          ),
          Center(
            child: _.losepage ? LosePage() : SizedBox(),
          ),
        ],
      );
    });
  }
}
