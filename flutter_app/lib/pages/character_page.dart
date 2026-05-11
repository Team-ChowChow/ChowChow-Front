import 'package:flutter/material.dart';

import '../theme/chow_theme.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  static const _stats = (level: 12, exp: 750, maxExp: 1000, health: 85, happiness: 92, hunger: 45);

  @override
  Widget build(BuildContext context) {
    final expFrac = _stats.exp / _stats.maxExp;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFEDD5), Color(0xFFFFF7ED)],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('캐릭터 키우기', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ChowColors.gray800)),
                    SizedBox(height: 4),
                    Text('우리 아이와 함께 성장해요', style: TextStyle(fontSize: 13, color: ChowColors.gray500)),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _WhiteCard(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(color: ChowColors.orange50, borderRadius: BorderRadius.circular(999)),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.auto_awesome, size: 16, color: ChowColors.orange500),
                            SizedBox(width: 6),
                            Text('레벨 12', style: TextStyle(fontSize: 13, color: ChowColors.orange600)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 192,
                        height: 192,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFED7AA), Color(0xFFFDBA74)],
                          ),
                          boxShadow: const [
                            BoxShadow(blurRadius: 12, offset: Offset(0, 4), color: Color(0x33000000)),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text('🐶', style: TextStyle(fontSize: 72)),
                      ),
                      const SizedBox(height: 12),
                      const Text('초코', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ChowColors.gray800)),
                      const Text('건강한 골든 리트리버', style: TextStyle(fontSize: 13, color: ChowColors.gray500)),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('경험치', style: TextStyle(fontSize: 13, color: ChowColors.gray600)),
                          Text('${_stats.exp} / ${_stats.maxExp}', style: const TextStyle(fontSize: 13, color: ChowColors.gray800, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: SizedBox(
                          height: 10,
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0, end: expFrac),
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOutCubic,
                            builder: (context, value, _) {
                              return Stack(
                                children: [
                                  Container(color: ChowColors.gray200),
                                  FractionallySizedBox(
                                    widthFactor: value.clamp(0.0, 1.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [ChowColors.orange400, ChowColors.orange500]),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _StatRow(
                        icon: Icons.favorite,
                        iconBg: const Color(0xFFFEE2E2),
                        iconColor: ChowColors.red500,
                        label: '건강',
                        value: _stats.health,
                        barColor: ChowColors.red500,
                      ),
                      const SizedBox(height: 10),
                      _StatRow(
                        icon: Icons.auto_awesome,
                        iconBg: const Color(0xFFFEF9C3),
                        iconColor: ChowColors.yellow500,
                        label: '행복',
                        value: _stats.happiness,
                        barColor: ChowColors.yellow500,
                      ),
                      const SizedBox(height: 10),
                      _StatRow(
                        icon: Icons.restaurant,
                        iconBg: ChowColors.orange100,
                        iconColor: ChowColors.orange500,
                        label: '배고픔',
                        value: _stats.hunger,
                        barColor: ChowColors.orange500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _WhiteCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('활동', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: ChowColors.gray800)),
                      const SizedBox(height: 14),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.15,
                        children: const [
                          _ActivityTile(icon: Icons.restaurant, label: '밥주기', cost: 0, color: ChowColors.orange500),
                          _ActivityTile(icon: Icons.favorite, label: '쓰다듬기', cost: 0, color: ChowColors.pink500),
                          _ActivityTile(icon: Icons.fitness_center, label: '운동하기', cost: 50, color: Color(0xFF3B82F6)),
                          _ActivityTile(icon: Icons.auto_awesome, label: '목욕시키기', cost: 100, color: ChowColors.purple500),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _WhiteCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('최근 업적', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: ChowColors.gray800)),
                      const SizedBox(height: 12),
                      _AchievementRow(emoji: '🏆', title: '첫 식단 완료', date: '2026.03.20', bg: ChowColors.orange50, circle: ChowColors.orange500),
                      const SizedBox(height: 10),
                      _AchievementRow(emoji: '⭐', title: '7일 연속 접속', date: '2026.03.18', bg: const Color(0xFFEFF6FF), circle: Color(0xFF3B82F6)),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhiteCard extends StatelessWidget {
  const _WhiteCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(blurRadius: 10, offset: Offset(0, 3), color: Color(0x14000000)),
        ],
      ),
      child: child,
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.barColor,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String label;
  final int value;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, size: 18, color: iconColor),
        ),
        const SizedBox(width: 8),
        SizedBox(width: 40, child: Text(label, style: const TextStyle(fontSize: 13, color: ChowColors.gray700))),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: SizedBox(
              height: 6,
              child: Stack(
                children: [
                  Container(color: ChowColors.gray200),
                  FractionallySizedBox(
                    widthFactor: (value / 100).clamp(0.0, 1.0),
                    child: Container(color: barColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 40,
          child: Text('$value%', textAlign: TextAlign.right, style: const TextStyle(fontSize: 13, color: ChowColors.gray700)),
        ),
      ],
    );
  }
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile({
    required this.icon,
    required this.label,
    required this.cost,
    required this.color,
  });

  final IconData icon;
  final String label;
  final int cost;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ChowColors.gray50,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: Colors.white, size: 26),
              ),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontSize: 13, color: ChowColors.gray800, fontWeight: FontWeight.w500)),
              const SizedBox(height: 2),
              Text(
                cost > 0 ? '🪙 $cost' : '무료',
                style: TextStyle(fontSize: 11, color: cost > 0 ? ChowColors.orange600 : ChowColors.green500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AchievementRow extends StatelessWidget {
  const _AchievementRow({
    required this.emoji,
    required this.title,
    required this.date,
    required this.bg,
    required this.circle,
  });

  final String emoji;
  final String title;
  final String date;
  final Color bg;
  final Color circle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: circle, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(emoji, style: const TextStyle(fontSize: 22)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, color: ChowColors.gray800, fontWeight: FontWeight.w500)),
                Text(date, style: const TextStyle(fontSize: 11, color: ChowColors.gray500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
