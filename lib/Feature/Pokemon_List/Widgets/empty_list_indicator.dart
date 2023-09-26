import 'package:flutter/material.dart';

import '../../../Core/Helpers/static_constants.dart';

class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Text(
          "Error",
          style: TextStyle(fontSize: AppConstants.large_font, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Pokemon list is empty"),
        Spacer(),
      ],
    );
  }
}
