import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/chow_theme.dart';

class FindPasswordPage extends StatelessWidget {
  const FindPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
        title: const Text('비밀번호 찾기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('아이디와 이메일을 입력해주세요.', style: TextStyle(color: ChowColors.gray600)),
            const SizedBox(height: 20),
            TextField(decoration: const InputDecoration(labelText: '아이디')),
            const SizedBox(height: 12),
            TextField(decoration: const InputDecoration(labelText: '이메일')),
            const SizedBox(height: 24),
            FilledButton(onPressed: () {}, child: const Text('인증 메일 발송')),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: () => context.push('/change-password'), child: const Text('비밀번호 변경으로')),
          ],
        ),
      ),
    );
  }
}
