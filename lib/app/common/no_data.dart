import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class NoData extends StatelessWidget {
  final String? text;
  const NoData({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Image.asset(Constants.noData, width: 200),
          const SizedBox(
            height: 20.0,
          ),
          Text(text ?? 'No Data',
              style: context.textTheme.displayMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
