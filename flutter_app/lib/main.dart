import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/chow_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ChowChowApp());
}

class ChowChowApp extends StatelessWidget {
  const ChowChowApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createAppRouter();
    return MaterialApp.router(
      title: '펫푸드 레시피',
      debugShowCheckedModeBanner: false,
      theme: buildChowTheme(),
      routerConfig: router,
    );
  }
}
