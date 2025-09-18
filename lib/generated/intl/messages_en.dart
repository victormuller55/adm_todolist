// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteTask": MessageLookupByLibrary.simpleMessage("Delete Task"),
        "deleteTaskDescription": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this task? This action cannot be undone!"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "fillAllRequiredFields":
            MessageLookupByLibrary.simpleMessage("Fill all required fields"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "noTasksFound": MessageLookupByLibrary.simpleMessage("No tasks found."),
        "pending": MessageLookupByLibrary.simpleMessage("Pending"),
        "registerNew": MessageLookupByLibrary.simpleMessage("Register New"),
        "requiredField": MessageLookupByLibrary.simpleMessage("Required field"),
        "saveTask": MessageLookupByLibrary.simpleMessage("Save Task"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "taskDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Task successfully deleted!"),
        "taskDescription":
            MessageLookupByLibrary.simpleMessage("Task Description"),
        "taskInfoDescriptionForm": MessageLookupByLibrary.simpleMessage(
            "Here you can add or edit a task, just enter the task title and description and click save."),
        "taskInfoDescriptionPage": MessageLookupByLibrary.simpleMessage(
            "On this screen you can view your tasks. Click the pending button to mark your task as completed. You can also delete or edit your task."),
        "taskSavedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Task successfully saved!"),
        "taskTitle": MessageLookupByLibrary.simpleMessage("Task Title"),
        "tasksToDo": MessageLookupByLibrary.simpleMessage("Tasks To Do")
      };
}
