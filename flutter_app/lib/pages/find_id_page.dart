import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/chow_theme.dart';

class FindIdPage extends StatelessWidget {
  const FindIdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
        title: const Text('아이디 찾기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('가입 시 등록한 정보를 입력해주세요.', style: TextStyle(color: ChowColors.gray600)),
            const SizedBox(height: 20),
            TextField(decoration: const InputDecoration(labelText: '이름')),
            const SizedBox(height: 12),
            TextField(decoration: const InputDecoration(labelText: '휴대폰 번호')),
            const SizedBox(height: 24),
            FilledButton(onPressed: () {}, child: const Text('아이디 찾기')),
          ],
        ),
      ),
    );
  }
}
