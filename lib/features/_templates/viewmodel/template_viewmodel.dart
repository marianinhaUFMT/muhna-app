import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/template_item.dart';
import '../data/repositories/template_repository.dart';

part 'template_viewmodel.g.dart';

@riverpod
class TemplateViewModel extends _$TemplateViewModel {
  @override
  Future<List<TemplateItem>> build() async {
    final repository = ref.watch(templateRepositoryProvider);
    return repository.getItems();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(templateRepositoryProvider).getItems(),
    );
  }

  // adicione aqui os "comandos" do seu módulo
  // (ex: favoritar, marcar como lido, deletar...)
}