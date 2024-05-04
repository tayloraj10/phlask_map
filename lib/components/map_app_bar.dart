import 'package:flutter/material.dart';

class MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MapAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static const TextStyle textStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      fontFamily: 'RobotoMono');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(6), // Set preferred size of shadow
        child: Material(
          elevation: 1, // Set elevation to add shadow
          color: Colors.grey[300], // Set color of shadow
          child: Container(
            height: 2, // Set height of bottom border
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () => {Navigator.pushNamed(context, '/map')},
        child: Tooltip(
          message: 'Go to the map',
          child: Image.asset(
            'images/phlask_logo.png',
            height: 40,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => {Navigator.pushNamed(context, '/mission')},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Mission',
              style: textStyle,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {Navigator.pushNamed(context, '/project')},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Project',
              style: textStyle,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {Navigator.pushNamed(context, '/share')},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Share Water & Food',
              style: textStyle,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {Navigator.pushNamed(context, '/contribute')},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Contribute',
              style: textStyle,
            ),
          ),
        )
      ],
    );
  }
}
