import 'package:flutter/material.dart';
import 'package:phlask_map/components/map_app_bar.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  final TextStyle largeText = const TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  final TextStyle smallText =
      const TextStyle(color: Colors.black, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MapAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Share", style: largeText),
                          TextSpan(
                              text:
                                  "\n\nDo you have access to water & food that you would like to share with the public? Add yourself to the map to promote a culture of sharing and PHLasking!",
                              style: smallText),
                          TextSpan(text: "\n\n", style: smallText)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
