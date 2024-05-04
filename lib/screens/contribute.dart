import 'package:flutter/material.dart';
import 'package:phlask_map/components/map_app_bar.dart';

class ContributePage extends StatelessWidget {
  const ContributePage({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Contribute", style: largeText),
                          TextSpan(
                              text:
                                  "\n\nThe PHLASK team is always looking for ways to welcome new contributors! If you have any skills or interest in the following areas, we encourage you to reach out and get involved.",
                              style: smallText),
                          TextSpan(
                              text: "\n\n    • Programming",
                              style: smallText.copyWith(fontSize: 22)),
                          TextSpan(
                              text: "\n\nCode of Conduct", style: largeText),
                          TextSpan(
                              text:
                                  "\n\nThe PHLASK App is being developed by a collectively organized group of volunteers known as the PHLASK Cooperative. We operate with the principles of non-hierarchical, collective self-management in service of fulfilling the project’s mission. The PHLASK Cooperative is composed of individuals of varying socioeconomic, educational and technical backgrounds, and welcomes all individuals to contribute to the project’s mission. Our core operating philosophy, and established norms for cooperation, are rooted in transparency, sharing and mentorship. We welcome all newcomers to help us uphold these principles and continue nurturing the equitable growth and development of all project contributors as we work together to create a tool to benefit the public.",
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
