import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/template_viewmodel.dart';
import 'widgets/template_card.dart';

class TemplatePage extends ConsumerWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(templateViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Título do módulo')),
      body: itemsAsync.when(
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => TemplateCard(item: items[index]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('$error')),
      ),
    );
  }
}