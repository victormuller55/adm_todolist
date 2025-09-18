// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "completed": MessageLookupByLibrary.simpleMessage("Concluído"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Modo Escuro"),
        "delete": MessageLookupByLibrary.simpleMessage("Excluir"),
        "deleteTask": MessageLookupByLibrary.simpleMessage("Excluir Tarefa"),
        "deleteTaskDescription": MessageLookupByLibrary.simpleMessage(
            "Você tem certeza que deseja excluir essa tarefa? Essa ação não pode ser desfeita!"),
        "edit": MessageLookupByLibrary.simpleMessage("Editar"),
        "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
            "Preencha todos os campos obrigatórios"),
        "language": MessageLookupByLibrary.simpleMessage("Idioma"),
        "noTasksFound":
            MessageLookupByLibrary.simpleMessage("Nenhuma tarefa encontrada."),
        "pending": MessageLookupByLibrary.simpleMessage("Pendente"),
        "registerNew": MessageLookupByLibrary.simpleMessage("Cadastrar Novo"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("Campo obrigatório"),
        "saveTask": MessageLookupByLibrary.simpleMessage("Salvar Tarefa"),
        "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
        "taskDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Tarefa excluída com sucesso!"),
        "taskDescription":
            MessageLookupByLibrary.simpleMessage("Descrição da Tarefa"),
        "taskInfoDescriptionForm": MessageLookupByLibrary.simpleMessage(
            "Aqui você poderá cadastrar ou alterar uma tarefa, basta digitar o título e descrição da tarefa e clicar em salvar."),
        "taskInfoDescriptionPage": MessageLookupByLibrary.simpleMessage(
            "Nesta tela você poderá visualizar suas tarefas, clicando no botão pendente você pode marcar sua tarefa como concluído, você também poderá excluir e editar sua tarefa."),
        "taskSavedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Tarefa cadastrada com sucesso!"),
        "taskTitle": MessageLookupByLibrary.simpleMessage("Título da Tarefa"),
        "tasksToDo": MessageLookupByLibrary.simpleMessage("Tarefas para fazer")
      };
}
