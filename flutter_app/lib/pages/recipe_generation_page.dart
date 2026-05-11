import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/sample_data.dart';
import '../theme/chow_theme.dart';

class RecipeGenerationPage extends StatefulWidget {
  const RecipeGenerationPage({super.key});

  @override
  State<RecipeGenerationPage> createState() => _RecipeGenerationPageState();
}

class _RecipeGenerationPageState extends State<RecipeGenerationPage>
    with TickerProviderStateMixin {
  late final AnimationController _pulseCtrl;
  late final Animation<double> _pulseScale;
  late final AnimationController _bounceCtrl;
  late final Animation<double> _bounceY;

  Timer? _progressTimer;
  Timer? _stepTimer;
  int _progress = 0;
  int _currentStep = 0;
  bool _navScheduled = false;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat(reverse: true);
    _pulseScale = Tween<double>(begin: 0.94, end: 1.0).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );

    _bounceCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 550))..repeat(reverse: true);
    _bounceY = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _bounceCtrl, curve: Curves.easeOut),
    );

    _progressTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;
      if (_progress >= 100) {
        _progressTimer?.cancel();
        if (!_navScheduled) {
          _navScheduled = true;
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) context.go('/');
          });
        }
        return;
      }
      setState(() {
        _progress = (_progress + 2).clamp(0, 100);
      });
    });

    _stepTimer = Timer.periodic(const Duration(milliseconds: 1500), (_) {
      if (!mounted) return;
      setState(() {
        if (_currentStep < kRecipeGenSteps.length - 1) {
          _currentStep++;
        } else {
          _stepTimer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    _stepTimer?.cancel();
    _pulseCtrl.dispose();
    _bounceCtrl.dispose();
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        ScaleTransition(
                          scale: _pulseScale,
                          child: Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [ChowColors.orange400, ChowColors.orange500],
                              ),
                              boxShadow: const [
                                BoxShadow(blurRadius: 12, offset: Offset(0, 4), color: Color(0x33000000)),
                              ],
                            ),
                            child: const Icon(Icons.restaurant_menu, color: Colors.white, size: 48),
                          ),
                        ),
                        Positioned(
                          top: -8,
                          right: -8,
                          child: AnimatedBuilder(
                            animation: _bounceY,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, _bounceY.value),
                                child: child,
                              );
                            },
                            child: const Icon(Icons.auto_awesome, color: Color(0xFFFACC15), size: 34),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Text(
                      '맛있고 건강한 레시피가',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: ChowColors.gray900),
                    ),
                    Text(
                      '만들어지고 있어요',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: ChowColors.orange500, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '우리 아이를 위한 특별한 레시피를\nAI가 정성껏 준비하고 있습니다',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ChowColors.gray600, fontSize: 14, height: 1.5),
                    ),
                    const SizedBox(height: 28),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: SizedBox(
                            height: 10,
                            width: constraints.maxWidth,
                            child: Stack(
                              children: [
                                Container(color: ChowColors.gray200),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                  width: constraints.maxWidth * (_progress / 100).clamp(0.0, 1.0),
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [ChowColors.orange400, ChowColors.orange500]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$_progress%', style: const TextStyle(fontSize: 13, color: ChowColors.gray600)),
                        Text(
                          _progress == 100 ? '완료!' : '생성 중...',
                          style: const TextStyle(fontSize: 13, color: ChowColors.orange500, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: ChowColors.orange100),
                        boxShadow: const [BoxShadow(blurRadius: 4, color: Color(0x0A000000))],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2, color: ChowColors.orange500),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              kRecipeGenSteps[_currentStep.clamp(0, kRecipeGenSteps.length - 1)],
                              style: const TextStyle(color: ChowColors.gray700, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(kRecipeGenSteps.length, (index) {
                      final active = index <= _currentStep;
                      final done = index < _currentStep;
                      final current = index == _currentStep;
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: active ? 1 : 0.3,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: done
                                      ? ChowColors.green500
                                      : current
                                          ? ChowColors.orange500
                                          : ChowColors.gray300,
                                ),
                                child: done
                                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                                    : Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: current ? Colors.white : ChowColors.gray600,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  kRecipeGenSteps[index],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: active ? ChowColors.gray700 : ChowColors.gray400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ChowColors.orange50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: ChowColors.orange100),
                      ),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '💡 Tip: ', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF9A3412))),
                            TextSpan(
                              text: 'AI가 생성한 레시피는 저장하여 언제든지 다시 확인할 수 있어요!',
                              style: TextStyle(fontSize: 13, color: Color(0xFF9A3412)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
