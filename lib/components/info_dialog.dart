import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Welcome to the PHLASK App!'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your tool for finding and sharing free resources in Philadelphia - all you have to do is PHLask!',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () => {Navigator.pop(context)},
            child: const Text('Close'))
      ],
    );
  }
}
