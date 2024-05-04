import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phlask_map/models/constants.dart';

class PropertyTile extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const PropertyTile(
      {super.key,
      required this.title,
      required this.controller,
      this.keyboardType = TextInputType.text});

  Future<void> changeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: stringToDate(controller.text),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      controller.text = dateToString(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title != 'Change Date')
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          if (title == 'Change Date')
            ElevatedButton(
                onPressed: () => {changeDate(context)},
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                )),
          // IntrinsicWidth(child:
          TextFormField(
            readOnly: title == 'Change Date',
            keyboardType: keyboardType,
            textAlign: TextAlign.center,
            controller: controller,
            inputFormatters: ['# of Bags', 'Pounds of Trash Cleaned']
                    .contains(title)
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : null,
          ),
          // ),
        ],
      )),
    );
  }
}
