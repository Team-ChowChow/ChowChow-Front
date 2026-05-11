import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/chow_theme.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _o = false, _n = false, _c = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
        title: const Text('비밀번호 변경'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            obscureText: !_o,
            decoration: InputDecoration(
              labelText: '현재 비밀번호',
              suffixIcon: IconButton(onPressed: () => setState(() => _o = !_o), icon: Icon(_o ? Icons.visibility_off : Icons.visibility)),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            obscureText: !_n,
            decoration: InputDecoration(
              labelText: '새 비밀번호',
              suffixIcon: IconButton(onPressed: () => setState(() => _n = !_n), icon: Icon(_n ? Icons.visibility_off : Icons.visibility)),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            obscureText: !_c,
            decoration: InputDecoration(
              labelText: '새 비밀번호 확인',
              suffixIcon: IconButton(onPressed: () => setState(() => _c = !_c), icon: Icon(_c ? Icons.visibility_off : Icons.visibility)),
            ),
          ),
          const SizedBox(height: 28),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(colors: [ChowColors.orange400, ChowColors.orange500]),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => context.go('/profile'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: Text('변경하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
