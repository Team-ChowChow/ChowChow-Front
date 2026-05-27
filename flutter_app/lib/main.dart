import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'constants/phone_size.dart';
import 'router/app_router.dart';
import 'theme/chow_theme.dart';
import 'widgets/phone_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ChowChowApp());
}

class ChowChowApp extends StatelessWidget {
  const ChowChowApp({super.key});

  static bool get _isWindowsDesktop => !kIsWeb && Platform.isWindows;

  @override
  Widget build(BuildContext context) {
    final router = createAppRouter();
    return MaterialApp.router(
      title: '펫푸드 레시피',
      debugShowCheckedModeBanner: false,
      theme: buildChowTheme(),
      routerConfig: router,
      builder: (context, child) {
        final content = child ?? const SizedBox.shrink();

        if (PhoneShell.shouldWrap) {
          return PhoneShell(child: content);
        }

        if (_isWindowsDesktop) {
          final mq = MediaQuery.of(context);
          return MediaQuery(
            data: mq.copyWith(
              size: kPhoneLogicalSize,
              textScaler: mq.textScaler.clamp(maxScaleFactor: 1.1),
            ),
            child: content,
          );
        }

        return content;
      },
    );
  }
}
