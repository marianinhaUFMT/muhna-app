import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/template_item.dart';

part 'template_repository.g.dart';

// 1. Defina o contrato do módulo -- o que ele promete entregar
abstract class TemplateRepository {
  Future<List<TemplateItem>> getItems();
}

// 2. Implementação real, batendo com a rota combinada com o backend
class TemplateRemoteRepository implements TemplateRepository {
  TemplateRemoteRepository(this._client);
  final ApiClient _client;

  @override
  Future<List<TemplateItem>> getItems() async {
    final response = await _client.get('/SUBSTITUA-PELA-ROTA');
    final data = response.data as List<dynamic>;
    return data
        .map((json) => TemplateItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

// 3. Implementação falsa -- permite desenvolver o módulo sem depender
//    do backend estar pronto
class TemplateMockRepository implements TemplateRepository {
  @override
  Future<List<TemplateItem>> getItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      TemplateItem(id: 1, titulo: 'Item de exemplo'),
    ];
  }
}

// 4. Só esta função decide qual implementação está ativa no momento.
//    É a ÚNICA linha que muda quando o backend do módulo fica pronto.
@riverpod
TemplateRepository templateRepository(Ref ref) {
  return TemplateMockRepository();
  // troque por: return TemplateRemoteRepository(ref.watch(apiClientProvider));
}