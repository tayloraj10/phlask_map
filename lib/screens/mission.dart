import 'package:flutter/material.dart';
import 'package:phlask_map/components/map_app_bar.dart';

class MissionPage extends StatelessWidget {
  MissionPage({super.key});

  final TextStyle largeText = const TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  final TextStyle smallText =
      const TextStyle(color: Colors.black, fontSize: 16);
  final TextStyle highlightText = TextStyle(
      color: Colors.black, fontSize: 20, backgroundColor: Colors.grey[200]);

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
                          TextSpan(text: "Mission", style: largeText),
                          TextSpan(
                              text:
                                  "\n\nPHLASK: a pun on the word ‘flask’ to also symbolize Philadelphia (PHL) + Ask; to ‘phlask’ for water",
                              style: highlightText),
                          TextSpan(
                              text:
                                  "\n\nThe PHLASK mission is simple: expand accessibility to water and reduce waste associated with distribution.\n\nWater should remain abundant, clean and accessible to everyone. PHLASK's mission is to help people find publicly available sources of water, and to encourage private enterprises to provide public access to their water infrastructure - simply by PHLasking. Single-use water bottles are costly and wasteful. The PHLASK Ecosystem is a simple, cost-effective way to reduce our dependence on single-use water bottles, and an efficient solution to mitigating many of the negative externalities of consuming single-use plastic water bottles. We hope to normalize water-sharing and challenge the ethics of enterprises who exploit public water sources and environmental sovereignty for profiteering.",
                              style: smallText),
                          TextSpan(text: "\n\nHow to PHLASK", style: largeText),
                          TextSpan(
                              text:
                                  "\n\nPHLASKing is simple. Look on the PHLASK Map for the nearest accessible tap and go fill up your vessel.",
                              style: smallText),
                          TextSpan(text: "\n\nPublic tap", style: largeText),
                          TextSpan(
                              text:
                                  "\n\nFill up and enjoy the benefits of our taxes serving our basic human needs!",
                              style: smallText),
                          TextSpan(text: "\n\nPrivate tap", style: largeText),
                          TextSpan(
                              text:
                                  "\n\nFollow the instructions on the PHLASK MAP given by the proprietor for how they’ve accommodated sharing water.",
                              style: smallText),
                          TextSpan(text: "\n\nSharing water", style: largeText),
                          TextSpan(
                              text:
                                  "\n\nLet us know you’d like to share access to your water tap! Just fill out the form and provide some simple instructions for PHLASKers to know how they can politely and unobtrusively access your tap.",
                              style: smallText),
                          TextSpan(
                              text: "\n\nIs it too much to PHLASK for?",
                              style: largeText),
                          TextSpan(
                              text:
                                  "\n\nPrivate taps are affixed in a variety of locations, and can incur varying degrees of intrusion upon the proprietor to share. While respecting the relative inconvenience of providing access, we have faith that proprietors who ideologically agree with the mission would be willing to sustain the minor inconvenience for the greater good of sharing water and reducing waste. The Philadelphia Water Department charges half a cent per gallon; the cost of filling up a typical 16 fl oz. water bottle, or PHLASK Bottle, is only 1/14 of a cent.",
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
