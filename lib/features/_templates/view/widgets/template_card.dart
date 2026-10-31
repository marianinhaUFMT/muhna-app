import 'package:flutter/material.dart';

import '../../data/models/template_item.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({super.key, required this.item});

  final TemplateItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(item.titulo)),
    );
  }
}