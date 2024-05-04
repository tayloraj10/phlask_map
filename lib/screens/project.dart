import 'package:flutter/material.dart';
import 'package:phlask_map/components/map_app_bar.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

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
                          TextSpan(text: "Project", style: largeText),
                          TextSpan(
                              text:
                                  """\n\nThe project was conceived as a Social Practice art project to use technology as an artistic medium to build social cohesion for solving collective sustainability issues.\n\nRecognizing that the public plumbing infrastructure can much more efficiently distribute water than more energy-intensive, wasteful distribution of single-use plastic bottles, we determined that encouraging users to obtain water from the public water system instead of single-use plastic bottles would have net-positive impacts of reducing waste and reducing energy consumption.\n\nWhile the Philadelphia Water Department maintains many public drinking fountains throughout the city, they are scarce when compared to the ubiquity of private taps at restaurants, shops, cafes, businesses and even people's homes. While every citizen already has the right to ask the proprietor to share water from their tap, this isn't a culturally normalized behavior. Unspoken norms of patronage and privacy, coupled with policies like "restroom is for customers only," give the impression that private businesses may not be willing to share water, which would discourage even asking in the first place.\n\nWe hope that the PHLASK project will help identify businesses that reject such boundaries and would like to normalize water sharing. This project is a conscious effort to create and normalize, what we believe is, a more environmentally sustainable behavior.""",
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
