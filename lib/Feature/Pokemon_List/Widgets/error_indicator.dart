import 'package:flutter/material.dart';

import '../../../Core/Helpers/static_constants.dart';

class ErrorIndicator extends StatelessWidget {
  final VoidCallback onTryAgain;
  const ErrorIndicator({super.key, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          "No connection",
          style: TextStyle(fontSize: AppConstants.large_font, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Please check internet connection and try again"),
        const Spacer(),
        ElevatedButton.icon(onPressed: onTryAgain, icon: const Icon(Icons.refresh), label: const Text("Try Again"))
      ],
    );
  }
}
