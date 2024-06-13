import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ExpansionFeatures extends StatelessWidget {
  final String title;
  final String description;

  const ExpansionFeatures({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
      ),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.only(bottom: 8, left: 10),
        title: Text(
          title,
          style: theme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              description,
              style: theme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
