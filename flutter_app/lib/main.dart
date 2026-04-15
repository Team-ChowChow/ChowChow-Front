import 'package:flutter/material.dart';

void main() {
  runApp(const PetFoodApp());
}

class PetFoodApp extends StatelessWidget {
  const PetFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '펫푸드 레시피',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF7A00)),
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 360,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(
                    radius: 34,
                    backgroundColor: Color(0xFFFF7A00),
                    child: Text('🐾', style: TextStyle(fontSize: 28)),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    '펫푸드 레시피',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFFF7A00),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '우리 아이를 위한 건강한 식단',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color(0xFF374151)),
                  ),
                  const SizedBox(height: 24),
                  const _FieldLabel('아이디'),
                  const _TextInput(hintText: '아이디를 입력하세요'),
                  const SizedBox(height: 12),
                  const _FieldLabel('비밀번호'),
                  const _TextInput(hintText: '비밀번호를 입력하세요', isPassword: true),
                  const SizedBox(height: 6),
                  const Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('자동 로그인'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7A00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const MainPage()),
                      );
                    },
                    child: const Text('로그인'),
                  ),
                  const SizedBox(height: 10),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFFEE500),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    child: const Text('카카오로 로그인'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  static const pages = [
    HomePage(),
    SearchPage(),
    CommunityPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: '홈'),
          NavigationDestination(icon: Icon(Icons.search), label: '검색'),
          NavigationDestination(icon: Icon(Icons.groups_outlined), label: '커뮤니티'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: '프로필'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '펫푸드 레시피',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFFFF7A00),
                fontWeight: FontWeight.bold,
              ),
            ),
            Chip(
              backgroundColor: Color(0xFFFACC15),
              label: Text('C 1,250'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _heroCard(),
        const SizedBox(height: 14),
        _aiCard(),
        const SizedBox(height: 16),
        const Text(
          '나의 식단 기록',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(4, (i) => _recordCard(i)),
        ),
      ],
    );
  }

  static Widget _heroCard() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?auto=format&fit=crop&w=900&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(14),
      child: const Text(
        '소고기 브로콜리',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
          shadows: [Shadow(blurRadius: 6, color: Colors.black45)],
        ),
      ),
    );
  }

  static Widget _aiCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFF8A00),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AI 셰프', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text(
            '우리 아이 맞춤 식단을\nAI가 추천해드려요',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '건강 상태, 알러지, 선호도를 고려한 추천 레시피',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Chip(
            label: Text('AI 상담 시작하기'),
            backgroundColor: Color(0xFFFFF3E0),
          ),
        ],
      ),
    );
  }

  static Widget _recordCard(int i) {
    const images = [
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=600&q=80',
      'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&w=600&q=80',
      'https://images.unsplash.com/photo-1547592166-23ac45744acd?auto=format&fit=crop&w=600&q=80',
      'https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&w=600&q=80',
    ];
    const titles = ['닭가슴살 야채 볶음', '연어 고구마 믹스', '참치 브로콜리 스튜', '식단 사진 추가하기'];
    return SizedBox(
      width: 155,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(images[i], height: 90, width: 140, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Text(titles[i], maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('레시피 검색', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        const _TextInput(hintText: '요리 이름으로 검색...'),
        const SizedBox(height: 10),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF7A00)),
          onPressed: () {},
          child: const Text('우리 아이 맞춤 필터'),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            Chip(label: Text('#트렌드')),
            Chip(label: Text('#저지방')),
            Chip(label: Text('#알러지프리')),
            Chip(label: Text('#퍼피/키튼')),
            Chip(label: Text('#면역력')),
          ],
        ),
        const SizedBox(height: 12),
        const Text('총 3개의 레시피'),
        const SizedBox(height: 8),
        ...List.generate(3, (i) => _recipeItem(i)),
      ],
    );
  }

  Widget _recipeItem(int i) {
    const images = [
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=600&q=80',
      'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&w=600&q=80',
      'https://images.unsplash.com/photo-1547592166-23ac45744acd?auto=format&fit=crop&w=600&q=80',
    ];
    const titles = ['두준쿠 저지방 닭가슴살 레시피', '연어 오메가3 영양 밥', '소고기 채소 스튜'];
    const tags = ['#저지방 #다이어트', '#트렌드 #면역력', '#퍼피/키튼 #면역력'];

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(images[i], width: 92, height: 92, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titles[i], style: const TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(tags[i], style: const TextStyle(color: Color(0xFF6B7280))),
                  const SizedBox(height: 6),
                  const Text('⭐ 4.8 (234) · 멍멍이엄마'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('커뮤니티', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        const Text('반려동물 식단에 대한 이야기를 나눠보세요', style: TextStyle(color: Color(0xFF6B7280))),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: const [
            Chip(label: Text('전체')),
            Chip(label: Text('레시피')),
            Chip(label: Text('질문')),
            Chip(label: Text('후기')),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('멍멍이엄마', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('오늘 초코한테 닭가슴살 야채 볶음 만들어줬어요! 너무 잘 먹네요 🙂\n#닭가슴살 #야채볶음'),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&w=900&q=80',
                    height: 260,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFF7A00),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('김반려', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('petlover@email.com', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('우리 아이들', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                _PetTile(name: '초코', desc: '골든 리트리버 · 3살', allergy: '알러지: 닭고기, 밀'),
                SizedBox(height: 8),
                _PetTile(name: '나비', desc: '코리안 숏헤어 · 2살', allergy: '알러지: 생선'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PetTile extends StatelessWidget {
  const _PetTile({
    required this.name,
    required this.desc,
    required this.allergy,
  });

  final String name;
  final String desc;
  final String allergy;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&w=200&q=80',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$desc\n$allergy'),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}

class _TextInput extends StatelessWidget {
  const _TextInput({
    required this.hintText,
    this.isPassword = false,
  });

  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
      ),
    );
  }
}
