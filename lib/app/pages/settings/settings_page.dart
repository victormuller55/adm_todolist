import 'package:adm_todolist/app/widgets/scaffold.dart';
import 'package:adm_todolist/app/widgets/text.dart';
import 'package:adm_todolist/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final void Function(bool) onThemeChanged;
  final void Function(String) onLanguageChanged;
  final bool isDarkMode;
  final String currentLanguage;

  const SettingsPage({
    super.key,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.isDarkMode,
    required this.currentLanguage,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  late bool _localDarkMode;
  late String _selectedLanguage;

  final Map<String, String> _languages = {
    'pt': 'Português',
    'en': 'English',
  };

  @override
  void initState() {
    super.initState();
    _localDarkMode = widget.isDarkMode;
    _selectedLanguage = widget.currentLanguage;
  }

  Widget _darkmodeCard() {
    return SwitchListTile(
      value: _localDarkMode,
      onChanged: (value) {
        setState(() => _localDarkMode = value);
        widget.onThemeChanged(value);
      },
      title: appText(S.of(context).darkMode),
    );
  }

  Widget _languageDropdown() {
    return ListTile(
      title: appText(S.of(context).language),
      trailing: DropdownButton<String>(
        value: _selectedLanguage,
        items: _languages.entries.map((entry) {
          return DropdownMenuItem<String>(
            value: entry.key,
            child: appText(entry.value),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() => _selectedLanguage = value);
            widget.onLanguageChanged(value);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return appScaffold(
      context,
      title: S.of(context).settings,
      body: Column(
        children: [
          _darkmodeCard(),
          _languageDropdown(),
        ],
      ),
    );
  }
}
