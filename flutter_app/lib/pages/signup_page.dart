import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/chow_theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _showPw = false;
  bool _showPw2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
        title: const Text('회원가입'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(decoration: const InputDecoration(labelText: '이름')),
          const SizedBox(height: 12),
          TextField(decoration: const InputDecoration(labelText: '이메일')),
          const SizedBox(height: 12),
          TextField(
            obscureText: !_showPw,
            decoration: InputDecoration(
              labelText: '비밀번호',
              suffixIcon: IconButton(
                onPressed: () => setState(() => _showPw = !_showPw),
                icon: Icon(_showPw ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            obscureText: !_showPw2,
            decoration: InputDecoration(
              labelText: '비밀번호 확인',
              suffixIcon: IconButton(
                onPressed: () => setState(() => _showPw2 = !_showPw2),
                icon: Icon(_showPw2 ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(onPressed: () => context.go('/login'), child: const Text('가입하기')),
          const SizedBox(height: 12),
          TextButton(onPressed: () => context.go('/login'), child: const Text('이미 계정이 있으신가요? 로그인')),
        ],
      ),
    );
  }
}
