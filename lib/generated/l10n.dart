// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Task successfully saved!`
  String get taskSavedSuccessfully {
    return Intl.message(
      'Task successfully saved!',
      name: 'taskSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Fill all required fields`
  String get fillAllRequiredFields {
    return Intl.message(
      'Fill all required fields',
      name: 'fillAllRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get requiredField {
    return Intl.message(
      'Required field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Here you can add or edit a task, just enter the task title and description and click save.`
  String get taskInfoDescriptionForm {
    return Intl.message(
      'Here you can add or edit a task, just enter the task title and description and click save.',
      name: 'taskInfoDescriptionForm',
      desc: '',
      args: [],
    );
  }

  /// `Task Title`
  String get taskTitle {
    return Intl.message(
      'Task Title',
      name: 'taskTitle',
      desc: '',
      args: [],
    );
  }

  /// `Task Description`
  String get taskDescription {
    return Intl.message(
      'Task Description',
      name: 'taskDescription',
      desc: '',
      args: [],
    );
  }

  /// `Save Task`
  String get saveTask {
    return Intl.message(
      'Save Task',
      name: 'saveTask',
      desc: '',
      args: [],
    );
  }

  /// `Register New`
  String get registerNew {
    return Intl.message(
      'Register New',
      name: 'registerNew',
      desc: '',
      args: [],
    );
  }

  /// `Tasks To Do`
  String get tasksToDo {
    return Intl.message(
      'Tasks To Do',
      name: 'tasksToDo',
      desc: '',
      args: [],
    );
  }

  /// `Task successfully deleted!`
  String get taskDeletedSuccessfully {
    return Intl.message(
      'Task successfully deleted!',
      name: 'taskDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Delete Task`
  String get deleteTask {
    return Intl.message(
      'Delete Task',
      name: 'deleteTask',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this task? This action cannot be undone!`
  String get deleteTaskDescription {
    return Intl.message(
      'Are you sure you want to delete this task? This action cannot be undone!',
      name: 'deleteTaskDescription',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `No tasks found.`
  String get noTasksFound {
    return Intl.message(
      'No tasks found.',
      name: 'noTasksFound',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `On this screen you can view your tasks. Click the pending button to mark your task as completed. You can also delete or edit your task.`
  String get taskInfoDescriptionPage {
    return Intl.message(
      'On this screen you can view your tasks. Click the pending button to mark your task as completed. You can also delete or edit your task.',
      name: 'taskInfoDescriptionPage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
