import "package:flutter/material.dart";

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ошибка',
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
    );
  }
}
