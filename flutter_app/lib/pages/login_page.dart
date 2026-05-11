import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/chow_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _showPw = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF7ED), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(colors: [ChowColors.orange400, ChowColors.orange500]),
                              boxShadow: const [BoxShadow(blurRadius: 12, offset: Offset(0, 4), color: Color(0x33000000))],
                            ),
                            alignment: Alignment.center,
                            child: const Text('🐾', style: TextStyle(fontSize: 36)),
                          ),
                          const SizedBox(height: 16),
                          Text('펫푸드 레시피', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: ChowColors.orange500, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          const Text('우리 아이를 위한 건강한 식단', style: TextStyle(fontSize: 13, color: ChowColors.gray600)),
                          const SizedBox(height: 36),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('아이디', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ChowColors.gray700)),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _email,
                            decoration: const InputDecoration(hintText: '아이디를 입력하세요'),
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('비밀번호', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ChowColors.gray700)),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _password,
                            obscureText: !_showPw,
                            decoration: InputDecoration(
                              hintText: '비밀번호를 입력하세요',
                              suffixIcon: IconButton(
                                onPressed: () => setState(() => _showPw = !_showPw),
                                icon: Icon(_showPw ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: ChowColors.gray400),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (_) {}),
                              const Text('자동 로그인', style: TextStyle(fontSize: 13, color: ChowColors.gray600)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () => context.go('/'),
                              style: FilledButton.styleFrom(backgroundColor: ChowColors.orange500, padding: const EdgeInsets.symmetric(vertical: 14)),
                              child: const Text('로그인'),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(onPressed: () => context.push('/find-id'), child: const Text('아이디 찾기', style: TextStyle(color: ChowColors.gray600, fontSize: 13))),
                              const Text('|', style: TextStyle(color: ChowColors.gray300)),
                              TextButton(onPressed: () => context.push('/find-password'), child: const Text('비밀번호 찾기', style: TextStyle(color: ChowColors.gray600, fontSize: 13))),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(child: Divider(color: ChowColors.gray300)),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text('또는', style: TextStyle(fontSize: 13, color: ChowColors.gray500)),
                              ),
                              Expanded(child: Divider(color: ChowColors.gray300)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              side: const BorderSide(color: ChowColors.gray300),
                              foregroundColor: ChowColors.gray700,
                            ),
                            icon: _googleIcon(),
                            label: const Text('Google로 로그인'),
                          ),
                          const SizedBox(height: 10),
                          FilledButton.icon(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              backgroundColor: ChowColors.kakaoYellow,
                              foregroundColor: Colors.black,
                            ),
                            icon: const Icon(Icons.chat_bubble, size: 20, color: Colors.black),
                            label: const Text('카카오로 로그인'),
                          ),
                          const SizedBox(height: 22),
                          Text.rich(
                            TextSpan(
                              text: '아직 회원이 아니신가요? ',
                              style: const TextStyle(fontSize: 13, color: ChowColors.gray600),
                              children: [
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () => context.push('/signup'),
                                    child: const Text('회원가입', style: TextStyle(color: ChowColors.orange500, fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('© 2026 펫푸드 레시피. All rights reserved.', style: TextStyle(fontSize: 11, color: ChowColors.gray500)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _googleIcon() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CustomPaint(painter: _GoogleMarkPainter()),
    );
  }
}

class _GoogleMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final p = Paint()..style = PaintingStyle.fill;
    p.color = const Color(0xFF4285F4);
    canvas.drawPath(Path()..addRect(Rect.fromLTWH(w * 0.45, 0, w * 0.55, h * 0.45)), p);
    p.color = const Color(0xFF34A853);
    canvas.drawPath(Path()..addRect(Rect.fromLTWH(w * 0.45, h * 0.55, w * 0.55, h * 0.45)), p);
    p.color = const Color(0xFFFBBC05);
    canvas.drawPath(Path()..addRect(Rect.fromLTWH(0, h * 0.45, w * 0.45, h * 0.2)), p);
    p.color = const Color(0xFFEA4335);
    canvas.drawPath(Path()..addRect(Rect.fromLTWH(0, 0, w * 0.45, h * 0.55)), p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
