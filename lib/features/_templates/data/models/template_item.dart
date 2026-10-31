// ============================================================================
// TEMPLATE DE MÓDULO — copie a pasta `_module_template` inteira para criar
// um módulo novo, renomeie os arquivos/classes (Ctrl+Shift+R no VS Code
// ajuda) e ajuste os campos abaixo para o que o módulo realmente precisa.
// ============================================================================

class TemplateItem {
  const TemplateItem({
    required this.id,
    required this.titulo,
    // adicione aqui os campos que o seu módulo precisa
  });

  final int id;
  final String titulo;

  factory TemplateItem.fromJson(Map<String, dynamic> json) {
    return TemplateItem(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
    );
  }
}