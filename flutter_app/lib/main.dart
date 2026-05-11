import 'package:flutter/material.dart';
import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

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
      home: const LoginPage(), //첫페이지는 로그인 페이지로 설정해둠
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  bool autoLogin = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() {
    debugPrint('Login: ${idController.text}, ${passwordController.text}');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainPage()),
    );
  }

  void handleGoogleLogin() {
    debugPrint('Google Login');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainPage()),
    );
  }

  void handleKakaoLogin() {
    debugPrint('Kakao Login');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainPage()),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF7ED),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 8),

                          // Logo & Title
                          Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFFB923C),
                                      Color(0xFFF97316),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x22000000),
                                      blurRadius: 12,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/paw.png',
                                    width: 40,
                                    height: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                '펫푸드 레시피',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF97316),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '우리 아이를 위한 건강한 식단',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 36),

                          // ID
                          const Text(
                            '아이디',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: idController,
                            decoration: InputDecoration(
                              hintText: '아이디를 입력하세요',
                              hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFFF97316),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Password
                          const Text(
                            '비밀번호',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: passwordController,
                            obscureText: !showPassword,
                            decoration: InputDecoration(
                              hintText: '비밀번호를 입력하세요',
                              hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(
                                  showPassword ? Icons.visibility_off : Icons.visibility,
                                  color: const Color(0xFF9CA3AF),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFFF97316),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Auto login
                          Row(
                            children: [
                              Checkbox(
                                value: autoLogin,
                                activeColor: const Color(0xFFF97316),
                                onChanged: (value) {
                                  setState(() {
                                    autoLogin = value ?? false;
                                  });
                                },
                              ),
                              const Text(
                                '자동 로그인',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Login button
                          SizedBox(
                            height: 52,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFF97316),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: handleLogin,
                              child: const Text(
                                '로그인',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Find ID / Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => const FindIdPage()),
                                  );
                                },
                                child: const Text(
                                  '아이디 찾기',
                                  style: TextStyle(color: Color(0xFF4B5563)),
                                ),
                              ),
                              const Text(
                                '|',
                                style: TextStyle(color: Color(0xFFD1D5DB)),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '비밀번호 찾기',
                                  style: TextStyle(color: Color(0xFF4B5563)),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Divider
                          Row(
                            children: const [
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFD1D5DB),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  '또는',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFD1D5DB),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Google login
                          SizedBox(
                            height: 52,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Color(0xFFD1D5DB)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: handleGoogleLogin,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.g_mobiledata, size: 26, color: Colors.black87),
                                  SizedBox(width: 6),
                                  Text(
                                    'Google로 로그인',
                                    style: TextStyle(
                                      color: Color(0xFF374151),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Kakao login
                          SizedBox(
                            height: 52,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFFEE500),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: handleKakaoLogin,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.chat_bubble, size: 18, color: Colors.black),
                                  SizedBox(width: 8),
                                  Text(
                                    '카카오로 로그인',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Sign up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '아직 회원이 아니신가요? ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => const SignupPage()),
                                  );
                                },
                                child: const Text(
                                  '회원가입',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFFF97316),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  '© 2026 펫푸드 레시피. All rights reserved.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ),
            ],
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

  final List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    CharacterPage(),
    CommunityPage(),
    ProfilePage(),
  ];

  void changeTab(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      extendBody: true,

      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          elevation: 4,
          backgroundColor: const Color(0xFFF28C28),
          shape: const CircleBorder(),
          onPressed: () => changeTab(2),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: index == 2 ? const Color(0xFFD96F00) : const Color(0xFFF28C28),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/paw.png',
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: const Color(0xFFF6E7DE),
        elevation: 12,
        child: SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BottomTabItem(
                icon: Icons.home_filled,
                label: '홈',
                selected: index == 0,
                onTap: () => changeTab(0),
              ),
              _BottomTabItem(
                icon: Icons.search,
                label: '검색',
                selected: index == 1,
                onTap: () => changeTab(1),
              ),
              const SizedBox(width: 56), // 가운데 발바닥 버튼 자리
              _BottomTabItem(
                icon: Icons.groups_outlined,
                label: '커뮤니티',
                selected: index == 3,
                onTap: () => changeTab(3),
              ),
              _BottomTabItem(
                icon: Icons.person_outline,
                label: '프로필',
                selected: index == 4,
                onTap: () => changeTab(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int currentPage = 0;

  final List<Map<String, dynamic>> trendingRecipes = [
    {
      'id': 1,
      'image':
          'https://images.unsplash.com/photo-1684882726821-2999db517441?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjaGlja2VuJTIwYnJlYXN0JTIwdmVnZXRhYmxlJTIwZG9nJTIwZm9vZHxlbnwxfHx8fDE3NzUwMzg2NzV8MA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': '닭가슴살 야채 볶음',
      'tags': ['#저지방', '#다이어트'],
    },
    {
      'id': 2,
      'image':
          'https://images.unsplash.com/photo-1580683750935-cecfc7ea57f0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxzYWxtb24lMjByaWNlJTIwdmVnZXRhYmxlJTIwYm93bHxlbnwxfHx8fDE3NzUwMzg2NzV8MA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': '연어 오메가3 영양 밥',
      'tags': ['#트렌드', '#면역력'],
    },
    {
      'id': 3,
      'image':
          'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?auto=format&fit=crop&w=900&q=80',
      'title': '소고기 브로콜리',
      'tags': ['#단백질', '#근육발달'],
    },
    {
      'id': 4,
      'image':
          'https://images.unsplash.com/photo-1739595415308-ba632ebfbfe2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxob21lbWFkZSUyMHBldCUyMGZvb2QlMjBjb29raW5nJTIwcHJlcGFyYXRpb258ZW58MXx8fHwxNzc0NDMyNjY5fDA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': '홈메이드 특선 요리',
      'tags': ['#수제', '#프리미엄'],
    },
  ];

  final List<Map<String, dynamic>> mealPhotos = [
    {
      'id': 1,
      'image':
          'https://images.unsplash.com/photo-1760445528367-7f0fa0229d19?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkb2clMjBlYXRpbmclMjBoZWFsdGh5JTIwbWVhbHxlbnwxfHx8fDE3NzE0MjIwOTh8MA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': '닭가슴살 야채 볶음',
      'date': '2026.02.18',
      'likes': 24,
    },
    {
      'id': 2,
      'image':
          'https://images.unsplash.com/photo-1597362925123-77861d3fbac7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwZXQlMjBmb29kJTIwaW5ncmVkaWVudHMlMjB2ZWdldGFibGVzfGVufDF8fHx8MTc3MTQyMjA5OXww&ixlib=rb-4.1.0&q=80&w=1080',
      'title': '연어 고구마 믹스',
      'date': '2026.02.17',
      'likes': 31,
    },
    {
      'id': 3,
      'image':
          'https://images.unsplash.com/photo-1769947322352-dd6cbdc4ec2d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjYXQlMjBlYXRpbmclMjBmb29kfGVufDF8fHx8MTc3MTM2MDQzMHww&ixlib=rb-4.1.0&q=80&w=1080',
      'title': '참치 브로콜리 스튜',
      'date': '2026.02.16',
      'likes': 18,
    },
  ];

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted || !_pageController.hasClients) return;
      final nextPage = (currentPage + 1) % trendingRecipes.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
      _autoSlide();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFE5E7EB)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '펫푸드 레시피',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF97316),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFACC15),
                            Color(0xFFEAB308),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x22000000),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Text(
                              'C',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFFEAB308),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '1,250',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Color(0xFF374151),
                            size: 28,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF97316),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Trending recipes
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Text(
              '트렌드 레시피',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: _pageController,
              itemCount: trendingRecipes.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final recipe = trendingRecipes[index];
                final tags = recipe['tags'] as List<dynamic>;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x22000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            recipe['image'],
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Color(0xB3000000),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe['title'],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 6,
                                  children: tags.map((tag) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.18),
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                      child: Text(
                                        tag.toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(trendingRecipes.length, (index) {
              final selected = currentPage == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: selected ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFFF97316)
                      : const Color(0xFFD1D5DB),
                  borderRadius: BorderRadius.circular(999),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // AI section
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFB923C),
                  Color(0xFFF97316),
                ],
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0x33FFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(999)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.chat_bubble_outline, color: Colors.white, size: 16),
                              SizedBox(width: 6),
                              Text(
                                'AI 셰프',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 14),
                      Text(
                        '우리 아이 맞춤 식단을\nAI가 추천해드려요',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.25,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '반려동물의 건강 상태, 알러지, 선호도를 고려한 맞춤 레시피',
                        style: TextStyle(
                          color: Color(0xFFFDEFE7),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 16),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(999)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                          child: Text(
                            'AI 상담 시작하기',
                            style: TextStyle(
                              color: Color(0xFFF97316),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.chat_bubble_outline,
                  size: 58,
                  color: Color(0x55FFFFFF),
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),

          // Meal records
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '나의 식단 기록',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '전체보기',
                    style: TextStyle(color: Color(0xFFF97316)),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mealPhotos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (context, index) {
                final meal = mealPhotos[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  meal['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Color(0xFF4B5563),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal['title'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1F2937),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    meal['date'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF6B7280),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        size: 14,
                                        color: Color(0xFFF97316),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${meal['likes']}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF6B7280),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: Color(0xFFD1D5DB),
                  width: 2,
                ),
                padding: const EdgeInsets.symmetric(vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: const Column(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 32,
                    color: Color(0xFF9CA3AF),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '식단 사진 추가하기',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 28, 16, 12),
            child: Text(
              '오늘의 팁',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F2937),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF3B82F6),
                  Color(0xFF8B5CF6),
                ],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '💡 건강 정보',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFFE0E7FF),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '반려견에게 양파, 마늘, 포도는 절대 급여하지 마세요. 중독 증상을 유발할 수 있습니다.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '더 알아보기',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFFE0E7FF),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFE0E7FF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  bool isSearchFocused = false;
  bool isLoadingSuggestions = false;
  String? suggestionError;
  List<String> suggestions = [];

  Timer? _debounce;

  final List<Map<String, dynamic>> popularSearches = [
    {'rank': 1, 'term': '닭가슴살 레시피', 'isNew': false},
    {'rank': 2, 'term': '다이어트 펫푸드', 'isNew': true},
    {'rank': 3, 'term': '알레르기 대응식', 'isNew': false},
    {'rank': 4, 'term': '강아지 간식', 'isNew': false},
    {'rank': 5, 'term': '연어 고구마', 'isNew': true},
    {'rank': 6, 'term': '생식 레시피', 'isNew': false},
    {'rank': 7, 'term': '저지방 식단', 'isNew': false},
    {'rank': 8, 'term': '시니어 건강식', 'isNew': true},
    {'rank': 9, 'term': '치킨 야채볼', 'isNew': false},
    {'rank': 10, 'term': '면역력 강화', 'isNew': false},
  ];

  final List<String> popularCategories = [
    '#트렌드',
    '#저지방',
    '#알러지프리',
    '#시니어',
    '#퍼피/키튼',
    '#다이어트',
    '#치아건강',
    '#면역력',
  ];

  final List<Map<String, dynamic>> recipes = [
    {
      'id': 1,
      'title': '토종닭 저지방 닭가슴살 레시피',
      'ingredients': '주재료: 닭가슴살, 고구마, ...',
      'image':
          'https://images.unsplash.com/photo-1684882726821-2999db517441?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjaGlja2VuJTIwYnJlYXN0JTIwdmVnZXRhYmxlJTIwZG9nJTIwZm9vZHxlbnwxfHx8fDE3NzUwMzg2NzV8MA&ixlib=rb-4.1.0&q=80&w=1080',
      'rating': 4.8,
      'reviews': 234,
      'author': '명랑이엄마',
      'tags': ['#저지방', '#다이어트'],
    },
    {
      'id': 2,
      'title': '연어 오메가3 영양 밥',
      'ingredients': '주재료: 연어, 현미, 당근, ...',
      'image':
          'https://images.unsplash.com/photo-1580683750935-cecfc7ea57f0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxzYWxtb24lMjByaWNlJTIwdmVnZXRhYmxlJTIwYm93bHxlbnwxfHx8fDE3NzUwMzg2NzV8MA&ixlib=rb-4.1.0&q=80&w=1080',
      'rating': 4.9,
      'reviews': 189,
      'author': '냥이집사',
      'tags': ['#트렌드', '#면역력'],
    },
    {
      'id': 3,
      'title': '소고기 야채 영양식',
      'ingredients': '주재료: 소고기, 단호박, ...',
      'image':
          'https://images.unsplash.com/photo-1618788856642-8e491177d973?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxmcmVzaCUyMG1lYXQlMjB2ZWdldGFibGVzJTIwY29va2luZ3xlbnwxfHx8fDE3NzUwMzg2NzZ8MA&ixlib=rb-4.1.0&q=80&w=1080',
      'rating': 4.7,
      'reviews': 156,
      'author': '댕댕이아빠',
      'tags': ['#시니어', '#치아건강'],
    },
  ];

  String get searchQuery => _searchController.text.trim();

  bool get showPopularSearches =>
      isSearchFocused && searchQuery.isEmpty;

  bool get showAutocomplete =>
      searchQuery.isNotEmpty;

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 300), () {
      fetchSuggestions(value);
    });
  }

  Future<void> fetchSuggestions(String query) async {
    final trimmed = query.trim();

    if (trimmed.isEmpty) {
      setState(() {
        suggestions = [];
        isLoadingSuggestions = false;
        suggestionError = null;
      });
      return;
    }

    setState(() {
      isLoadingSuggestions = true;
      suggestionError = null;
    });

    try {
      // TODO: 백엔드 API 연결
      // 예시:
      // final uri = Uri.parse(
      //   '$baseUrl/search/suggestions?q=${Uri.encodeQueryComponent(trimmed)}',
      // );
      // final response = await http.get(uri);
      // final decoded = jsonDecode(response.body);
      // setState(() {
      //   suggestions = List<String>.from(decoded);
      //   isLoadingSuggestions = false;
      // });

      // 현재는 연결 전 상태를 보여주기 위한 임시 처리
      await Future.delayed(const Duration(milliseconds: 250));

      setState(() {
        suggestions = [];
        isLoadingSuggestions = false;
      });
    } catch (e) {
      setState(() {
        suggestions = [];
        isLoadingSuggestions = false;
        suggestionError = '추천 검색어를 불러오지 못했습니다.';
      });
    }
  }

  void clearSearch() {
    _searchController.clear();
    setState(() {
      suggestions = [];
      suggestionError = null;
      isSearchFocused = false;
    });
  }

  void selectSuggestion(String suggestion) {
    _searchController.text = suggestion;
    setState(() {
      isSearchFocused = false;
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _openFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const _FilterBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isSearchFocused = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFF1F5F9)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '레시피 검색',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onTap: () {
                        setState(() {
                          isSearchFocused = true;
                        });
                      },
                      onChanged: (value) {
                        setState(() {});
                        onSearchChanged(value);
                      },
                      decoration: const InputDecoration(
                        hintText: '레시피 또는 재료를 검색하세요',
                        hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                        prefixIcon: Icon(Icons.search, color: Color(0xFF9CA3AF)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7A00),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: _openFilterModal,
                      icon: const Icon(Icons.tune, color: Colors.white),
                      label: const Text(
                        '우리 아이 맞춤 필터',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (showPopularSearches) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '인기 검색어',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSearchFocused = false;
                        });
                      },
                      child: const Text('닫기'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: popularSearches.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.8,
                  ),
                  itemBuilder: (context, index) {
                    final item = popularSearches[index];
                    final rank = item['rank'] as int;
                    final term = item['term'] as String;
                    final isNew = item['isNew'] as bool;

                    return InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        _searchController.text = term;
                        setState(() {
                          isSearchFocused = false;
                        });
                        onSearchChanged(term);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '$rank',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: rank <= 3
                                    ? const Color(0xFFFF7A00)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                term,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                            if (isNew)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'NEW',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ] else if (showAutocomplete) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '추천 검색어',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    TextButton(
                      onPressed: clearSearch,
                      child: const Text('초기화'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: isLoadingSuggestions
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : suggestionError != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              suggestionError!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFFEF4444),
                              ),
                            ),
                          )
                        : suggestions.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  '추천 검색어가 없습니다.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              )
                            : Column(
                                children: suggestions.map((suggestion) {
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () => selectSuggestion(suggestion),
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 12,
                                      ),
                                      margin: const EdgeInsets.only(bottom: 6),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.search,
                                            size: 18,
                                            color: Color(0xFF9CA3AF),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            suggestion,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF374151),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
              ),
              const SizedBox(height: 8),
            ] else ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '인기 카테고리',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: popularCategories.map((category) {
                        return OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFF9FAFB),
                            side: const BorderSide(color: Color(0xFFE5E7EB)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            category,
                            style: const TextStyle(color: Color(0xFF374151)),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '총 ${recipes.length}개의 레시피',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const Row(
                      children: [
                        Text(
                          '인기순',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFFF7A00),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('|', style: TextStyle(color: Color(0xFFD1D5DB))),
                        SizedBox(width: 8),
                        Text(
                          '최신순',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  children: recipes.map((recipe) {
                    final tags = recipe['tags'] as List<dynamic>;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                recipe['image'],
                                width: 96,
                                height: 96,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recipe['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF111827),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    recipe['ingredients'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF6B7280),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: tags.map((tag) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFF3E0),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          tag.toString(),
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFFFF7A00),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, size: 16, color: Colors.amber),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${recipe['rating']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        ' (${recipe['reviews']})',
                                        style: const TextStyle(
                                          color: Color(0xFF6B7280),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          '👤 ${recipe['author']}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _FilterBottomSheet extends StatelessWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '맞춤 필터',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '반려동물 종류',
                style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['강아지', '고양이', '기타'].map((item) {
                  return _FilterChip(label: item);
                }).toList(),
              ),

              const SizedBox(height: 20),
              const Text(
                '식단 목적',
                style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['다이어트', '알러지', '시니어', '성장기', '면역력', '피부/털']
                    .map((item) => _FilterChip(label: item))
                    .toList(),
              ),

              const SizedBox(height: 20),
              const Text(
                '주재료',
                style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['닭고기', '소고기', '연어', '참치', '오리', '양고기']
                    .map((item) => _FilterChip(label: item))
                    .toList(),
              ),

              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('초기화'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7A00),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('적용하기'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFD1D5DB)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFF374151)),
      ),
    );
  }
}

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> communityPosts = [
    {
      'id': 1,
      'author': '멍멍이엄마',
      'avatar': '🐕',
      'timeAgo': '2시간 전',
      'content': '오늘 초코한테 닭가슴살 야채 볶음 만들어줬어요! 너무 잘 먹네요 😊',
      'image':
          'https://images.unsplash.com/photo-1760445528367-7f0fa0229d19?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkb2clMjBlYXRpbmclMjBoZWFsdGh5JTIwbWVhbHxlbnwxfHx8fDE3NzE0MjIwOTh8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral',
      'likes': 42,
      'comments': 8,
      'views': 156,
      'tags': ['#닭가슴살', '#야채볶음'],
    },
    {
      'id': 2,
      'author': '냥이집사',
      'avatar': '🐱',
      'timeAgo': '5시간 전',
      'content':
          '연어 고구마 믹스 레시피 따라해봤는데 대박입니다! 우리 나비가 평소에 밥을 안 먹는 편인데 이건 진짜 순식간에 다 먹었어요 ㅋㅋㅋ',
      'image':
          'https://images.unsplash.com/photo-1597362925123-77861d3fbac7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwZXQlMjBmb29kJTIwaW5ncmVkaWVudHMlMjB2ZWdldGFibGVzfGVufDF8fHx8MTc3MTQyMjA5OXww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral',
      'likes': 67,
      'comments': 12,
      'views': 234,
      'tags': ['#연어', '#고구마', '#강추'],
    },
    {
      'id': 3,
      'author': '펫푸드마스터',
      'avatar': '👨‍🍳',
      'timeAgo': '1일 전',
      'content':
          '소고기 채소 스튜 만드는 팁 공유할게요! 소고기는 꼭 살짝 데쳐서 기름을 빼주세요. 반려동물 소화에 훨씬 좋답니다 👍',
      'image':
          'https://images.unsplash.com/photo-1769947322352-dd6cbdc4ec2d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjYXQlMjBlYXRpbmclMjBmb29kfGVufDF8fHx8MTc3MTM2MDQzMHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral',
      'likes': 89,
      'comments': 15,
      'views': 412,
      'tags': ['#소고기', '#채소스튜', '#팁'],
    },
  ];

  final List<Map<String, dynamic>> trendingTopics = [
    {'name': '저지방 레시피', 'count': 234},
    {'name': '알러지 프리', 'count': 189},
    {'name': '다이어트 식단', 'count': 156},
    {'name': '시니어 케어', 'count': 142},
  ];

  final List<String> tabs = ['전체', '레시피', '질문', '후기'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF7A00),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFE5E7EB)),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '커뮤니티',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '반려동물 식단에 대한 이야기를 나눠보세요',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

          // Trending Topics
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFE5E7EB)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.trending_up, color: Color(0xFFFF7A00), size: 22),
                    SizedBox(width: 8),
                    Text(
                      '인기 토픽',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: trendingTopics.map((topic) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFF3E0),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                topic['name'],
                                style: const TextStyle(
                                  color: Color(0xFFFF7A00),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '(${topic['count']})',
                                style: const TextStyle(
                                  color: Color(0xFFFB923C),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Filter Tabs
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFE5E7EB)),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final selected = selectedTabIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(tabs[index]),
                      selected: selected,
                      onSelected: (_) {
                        setState(() {
                          selectedTabIndex = index;
                        });
                      },
                      selectedColor: const Color(0xFFFF7A00),
                      backgroundColor: const Color(0xFFF3F4F6),
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : const Color(0xFF4B5563),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                        side: BorderSide.none,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Posts
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: communityPosts.map((post) {
                final tags = post['tags'] as List<dynamic>;

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0F000000),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // post header
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                        child: Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFEDD5),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  post['avatar'],
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post['author'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1F2937),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    post['timeAgo'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert, color: Color(0xFF9CA3AF)),
                            ),
                          ],
                        ),
                      ),

                      // content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          post['content'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF374151),
                            height: 1.4,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: tags.map((tag) {
                            return Text(
                              tag.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFF7A00),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.network(
                          post['image'],
                          width: double.infinity,
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // actions
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                _PostAction(
                                  icon: Icons.favorite_border,
                                  label: '${post['likes']}',
                                  onTap: () {},
                                ),
                                const SizedBox(width: 14),
                                _PostAction(
                                  icon: Icons.mode_comment_outlined,
                                  label: '${post['comments']}',
                                  onTap: () {},
                                ),
                                const SizedBox(width: 14),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${post['views']}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF6B7280),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share_outlined,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PostAction extends StatelessWidget {
  const _PostAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF4B5563)),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF4B5563),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> userPets = [
      {
        'id': 1,
        'name': '초코',
        'type': '강아지',
        'breed': '골든 리트리버',
        'age': '3살',
        'weight': '28kg',
        'allergies': ['닭고기', '밀'],
        'image':
            'https://images.unsplash.com/photo-1744824838728-59f825fc7da1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkb2clMjBwb3J0cmFpdCUyMGN1dGV8ZW58MXx8fHwxNzcxNDIyMDk5fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral',
      },
      {
        'id': 2,
        'name': '나비',
        'type': '고양이',
        'breed': '코리안 숏헤어',
        'age': '2살',
        'weight': '4.2kg',
        'allergies': ['생선'],
        'image':
            'https://images.unsplash.com/photo-1769947322352-dd6cbdc4ec2d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjYXQlMjBlYXRpbmclMjBmb29kfGVufDF8fHx8MTc3MTM2MDQzMHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral',
      },
    ];

    final List<Map<String, dynamic>> stats = [
      {'label': '저장한 레시피', 'value': 42, 'icon': Icons.favorite},
      {'label': '조리 완료', 'value': 28, 'icon': Icons.emoji_events},
      {'label': '작성한 리뷰', 'value': 15, 'icon': Icons.menu_book},
    ];

    final List<Map<String, dynamic>> menuSections = [
      {
        'title': '계정',
        'items': [
          {'label': '알림 설정', 'icon': Icons.notifications_none, 'badge': '3'},
          {'label': '개인정보 보호', 'icon': Icons.shield_outlined},
          {'label': '앱 설정', 'icon': Icons.settings},
        ],
      },
      {
        'title': '지원',
        'items': [
          {'label': '도움말 & FAQ', 'icon': Icons.help_outline},
          {'label': '고객 지원', 'icon': Icons.support_agent},
        ],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF97316),
                  Color(0xFFFB923C),
                ],
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '👤',
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '김반려',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'petlover@email.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFDEFE7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  children: stats.map((stat) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                stat['icon'] as IconData,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${stat['value']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                stat['label'] as String,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFFDEFE7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          Transform.translate(
            offset: const Offset(0, -18),
            child: Column(
              children: [
                // My pets
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '우리 아이들',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              '+ 추가하기',
                              style: TextStyle(color: Color(0xFFF97316)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ...userPets.map((pet) {
                        final allergies = (pet['allergies'] as List).join(', ');
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.network(
                                      pet['image'],
                                      width: 82,
                                      height: 82,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    right: -4,
                                    bottom: -4,
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF97316),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                pet['name'],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF1F2937),
                                                ),
                                              ),
                                              const SizedBox(height: 3),
                                              Text(
                                                '${pet['breed']} • ${pet['age']}',
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF6B7280),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Color(0xFF9CA3AF),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          '체중: ${pet['weight']}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF4B5563),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            '알러지: $allergies',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFFF97316),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                const SizedBox(height: 2),

                ...menuSections.map((section) {
                  final items = section['items'] as List<dynamic>;

                  return Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          section['title'] as String,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...items.map((item) {
                          final badge = item['badge'];
                          return InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                              child: Row(
                                children: [
                                  Icon(
                                    item['icon'] as IconData,
                                    color: const Color(0xFF4B5563),
                                    size: 22,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      item['label'] as String,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF1F2937),
                                      ),
                                    ),
                                  ),
                                  if (badge != null)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF97316),
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                      child: Text(
                                        badge.toString(),
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                }),

                Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '펫푸드 레시피 v1.0.0',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('이용약관'),
                          ),
                          const Text('|', style: TextStyle(color: Color(0xFFD1D5DB))),
                          TextButton(
                            onPressed: () {},
                            child: const Text('개인정보처리방침'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 30),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Color(0xFFFECACA)),
                      backgroundColor: const Color(0xFFFEF2F2),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.logout),
                    label: const Text('로그아웃'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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

class _BottomTabItem extends StatelessWidget {
  const _BottomTabItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = const Color(0xFFF28C28);
    final Color inactiveColor = const Color(0xFF8C8C8C);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected ? activeColor : inactiveColor,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: selected ? activeColor : inactiveColor,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    const int level = 12;
    const int exp = 750;
    const int maxExp = 1000;
    const int health = 85;
    const int happiness = 92;
    const int hunger = 45;

    final double expValue = exp / maxExp;

    final activities = [
      {
        'icon': Icons.restaurant,
        'label': '밥주기',
        'cost': 0,
        'color': const Color(0xFFFF7A00),
      },
      {
        'icon': Icons.favorite,
        'label': '쓰다듬기',
        'cost': 0,
        'color': const Color(0xFFEC4899),
      },
      {
        'icon': Icons.fitness_center,
        'label': '운동하기',
        'cost': 50,
        'color': const Color(0xFF3B82F6),
      },
      {
        'icon': Icons.auto_awesome,
        'label': '목욕시키기',
        'cost': 100,
        'color': const Color(0xFF8B5CF6),
      },
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFEDD5),
            Color(0xFFFFF7ED),
          ],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          // Header
          const Text(
            '캐릭터 키우기',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '우리 아이와 함께 성장해요',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
          ),

          const SizedBox(height: 20),

          // Character card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 16,
                        color: Color(0xFFFF7A00),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '레벨 12',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFFF7A00),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                Container(
                  width: 190,
                  height: 190,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFED7AA),
                        Color(0xFFFDBA74),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '🐶',
                      style: TextStyle(fontSize: 88),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  '초코',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '건강한 골든 리트리버',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),

                const SizedBox(height: 20),

                // exp
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '경험치',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    Text(
                      '750 / 1000',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1F2937),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: expValue,
                    minHeight: 10,
                    backgroundColor: Color(0xFFE5E7EB),
                    valueColor: AlwaysStoppedAnimation(Color(0xFFFF7A00)),
                  ),
                ),

                const SizedBox(height: 22),

                _StatBar(
                  icon: Icons.favorite,
                  iconBgColor: Color(0xFFFEE2E2),
                  iconColor: Color(0xFFEF4444),
                  label: '건강',
                  value: health,
                  progressColor: Color(0xFFEF4444),
                ),
                const SizedBox(height: 14),
                _StatBar(
                  icon: Icons.auto_awesome,
                  iconBgColor: Color(0xFFFEF3C7),
                  iconColor: Color(0xFFF59E0B),
                  label: '행복',
                  value: happiness,
                  progressColor: Color(0xFFF59E0B),
                ),
                const SizedBox(height: 14),
                _StatBar(
                  icon: Icons.restaurant,
                  iconBgColor: Color(0xFFFFEDD5),
                  iconColor: Color(0xFFFF7A00),
                  label: '배고픔',
                  value: hunger,
                  progressColor: Color(0xFFFF7A00),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Activities
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '활동',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  itemCount: activities.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.15,
                  ),
                  itemBuilder: (context, index) {
                    final activity = activities[index];
                    final int cost = activity['cost'] as int;

                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: activity['color'] as Color,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                activity['icon'] as IconData,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              activity['label'] as String,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              cost > 0 ? '🪙 $cost' : '무료',
                              style: TextStyle(
                                fontSize: 12,
                                color: cost > 0
                                    ? const Color(0xFFFF7A00)
                                    : const Color(0xFF16A34A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Achievements
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '최근 업적',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 16),
                _AchievementTile(
                  emoji: '🏆',
                  title: '첫 식단 완료',
                  date: '2026.03.20',
                  bgColor: Color(0xFFFFF3E0),
                  iconBgColor: Color(0xFFFF7A00),
                ),
                SizedBox(height: 12),
                _AchievementTile(
                  emoji: '⭐',
                  title: '7일 연속 접속',
                  date: '2026.03.18',
                  bgColor: Color(0xFFEFF6FF),
                  iconBgColor: Color(0xFF3B82F6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBar extends StatelessWidget {
  const _StatBar({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.progressColor,
  });

  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String label;
  final int value;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: iconColor),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 42,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF374151),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: value / 100,
              minHeight: 8,
              backgroundColor: const Color(0xFFE5E7EB),
              valueColor: AlwaysStoppedAnimation(progressColor),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 42,
          child: Text(
            '$value%',
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF374151),
            ),
          ),
        ),
      ],
    );
  }
}

class _AchievementTile extends StatelessWidget {
  const _AchievementTile({
    required this.emoji,
    required this.title,
    required this.date,
    required this.bgColor,
    required this.iconBgColor,
  });

  final String emoji;
  final String title;
  final String date;
  final Color bgColor;
  final Color iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FindIdPage extends StatefulWidget {
  const FindIdPage({super.key});

  @override
  State<FindIdPage> createState() => _FindIdPageState();
}

class _FindIdPageState extends State<FindIdPage> {
  String step = 'input';

  final TextEditingController nameController = TextEditingController();
  String year = '';
  String month = '';
  String day = '';

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationCodeController = TextEditingController();

  bool verificationSent = false;
  bool isVerified = false;
  String foundEmail = '';

  late final List<int> years;
  final List<int> months = List.generate(12, (i) => i + 1);
  final List<int> days = List.generate(31, (i) => i + 1);

  @override
  void initState() {
    super.initState();
    final currentYear = DateTime.now().year;
    years = List.generate(currentYear - 1949, (i) => currentYear - i);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    verificationCodeController.dispose();
    super.dispose();
  }

  void handleSendVerification() {
    setState(() {
      verificationSent = true;
    });
  }

  void handleVerifyCode() {
    if (verificationCodeController.text.length == 6) {
      setState(() {
        isVerified = true;
      });
    }
  }

  void handleFindId() {
    const mockEmail = 'petlover1234@gmail.com';
    final parts = mockEmail.split('@');
    final localPart = parts[0];
    final domain = parts[1];

    final blurredLocal =
        localPart.substring(0, 3) + ('*' * (localPart.length - 3));
    final blurredEmail = '$blurredLocal@$domain';

    setState(() {
      foundEmail = blurredEmail;
      step = 'result';
    });
  }

  bool get canFindId {
    return nameController.text.trim().isNotEmpty &&
        year.isNotEmpty &&
        month.isNotEmpty &&
        day.isNotEmpty &&
        isVerified;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF7ED),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Text(
                          '아이디 찾기',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 24),
                    if (step == 'input') ...[
                      Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFB923C),
                                  Color(0xFFF97316),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/paw.png',
                                width: 32,
                                height: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '가입 시 등록한 정보를 입력해주세요',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      const Text(
                        '이름',
                        style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: nameController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: '이름을 입력하세요',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFF97316),
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        '생년월일',
                        style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: _DateDropdown(
                              value: year.isEmpty ? null : year,
                              hint: '년도',
                              items: years.map((y) => y.toString()).toList(),
                              onChanged: (value) {
                                setState(() {
                                  year = value ?? '';
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _DateDropdown(
                              value: month.isEmpty ? null : month,
                              hint: '월',
                              items: months.map((m) => m.toString()).toList(),
                              onChanged: (value) {
                                setState(() {
                                  month = value ?? '';
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _DateDropdown(
                              value: day.isEmpty ? null : day,
                              hint: '일',
                              items: days.map((d) => d.toString()).toList(),
                              onChanged: (value) {
                                setState(() {
                                  day = value ?? '';
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        '전화번호',
                        style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              enabled: !isVerified,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                final filtered = value.replaceAll(RegExp(r'[^0-9]'), '');
                                if (filtered != value) {
                                  phoneController.value = TextEditingValue(
                                    text: filtered,
                                    selection: TextSelection.collapsed(offset: filtered.length),
                                  );
                                }
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText: '010-0000-0000',
                                filled: true,
                                fillColor: isVerified ? const Color(0xFFF3F4F6) : Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFF97316),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 56,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFF97316),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: (phoneController.text.length < 10 || isVerified)
                                  ? null
                                  : handleSendVerification,
                              child: Text(verificationSent ? '재전송' : '인증번호'),
                            ),
                          ),
                        ],
                      ),

                      if (verificationSent && !isVerified) ...[
                        const SizedBox(height: 16),
                        const Text(
                          '인증번호',
                          style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: verificationCodeController,
                                keyboardType: TextInputType.number,
                                maxLength: 6,
                                onChanged: (value) {
                                  final filtered = value.replaceAll(RegExp(r'[^0-9]'), '');
                                  if (filtered != value) {
                                    verificationCodeController.value = TextEditingValue(
                                      text: filtered,
                                      selection: TextSelection.collapsed(offset: filtered.length),
                                    );
                                  }
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: '인증번호 6자리 입력',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFF97316),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              height: 56,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF22C55E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: verificationCodeController.text.length == 6
                                    ? handleVerifyCode
                                    : null,
                                child: const Text('확인'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '⏱️ 인증번호는 5분간 유효합니다',
                          style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                        ),
                      ],

                      if (isVerified) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0FDF4),
                            border: Border.all(color: const Color(0xFFBBF7D0)),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.check_circle, color: Color(0xFF16A34A)),
                              SizedBox(width: 8),
                              Text(
                                '전화번호 인증이 완료되었습니다',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF16A34A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),

                      SizedBox(
                        height: 56,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFFF97316),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: canFindId ? handleFindId : null,
                          child: const Text(
                            '아이디 찾기',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('로그인'),
                          ),
                          const Text('|', style: TextStyle(color: Color(0xFFD1D5DB))),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const FindPasswordPage()),
                              );
                            },
                            child: const Text('비밀번호 찾기'),
                          ),
                          const Text('|', style: TextStyle(color: Color(0xFFD1D5DB))),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const SignupPage()),
                              );
                            },
                            child: const Text('회원가입'),
                          ),
                        ],
                      ),
                    ] else ...[
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDCFCE7),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 40,
                              color: Color(0xFF22C55E),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '아이디를 찾았습니다',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '회원님의 정보와 일치하는 아이디입니다',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF7ED),
                              border: Border.all(color: const Color(0xFFFED7AA)),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '가입된 이메일 (아이디)',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  foundEmail,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFF97316),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('로그인하기'),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFFD1D5DB)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const FindPasswordPage()),
                                );
                              },
                              child: const Text(
                                '비밀번호 찾기',
                                style: TextStyle(color: Color(0xFF374151)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 28),
                    const Center(
                      child: Text(
                        '© 2026 펫푸드 레시피. All rights reserved.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9CA3AF),
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

class _DateDropdown extends StatelessWidget {
  const _DateDropdown({
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  final String? value;
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFF97316),
            width: 2,
          ),
        ),
      ),
      hint: Text(hint),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}

class FindPasswordPage extends StatefulWidget {
  const FindPasswordPage({super.key});

  @override
  State<FindPasswordPage> createState() => _FindPasswordPageState();
}

class _FindPasswordPageState extends State<FindPasswordPage> {
  String step = 'verify';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController verificationCodeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool verificationSent = false;
  bool showPassword = false;
  bool showPasswordConfirm = false;

  @override
  void dispose() {
    emailController.dispose();
    verificationCodeController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void handleSendVerification() {
    setState(() {
      verificationSent = true;
    });
  }

  void handleVerifyCode() {
    if (verificationCodeController.text.length == 6) {
      setState(() {
        step = 'reset';
      });
    }
  }

  void handleResetPassword() {
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (newPassword == confirmPassword && newPassword.length >= 8) {
      setState(() {
        step = 'complete';
      });
    }
  }

  bool get canSendVerification {
    return emailController.text.trim().isNotEmpty && !verificationSent;
  }

  bool get canVerifyCode {
    return verificationCodeController.text.length == 6;
  }

  bool get passwordsMatch {
    return confirmPasswordController.text.isNotEmpty &&
        newPasswordController.text == confirmPasswordController.text;
  }

  bool get passwordsNotMatch {
    return confirmPasswordController.text.isNotEmpty &&
        newPasswordController.text != confirmPasswordController.text;
  }

  bool get canResetPassword {
    return newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        newPasswordController.text == confirmPasswordController.text &&
        newPasswordController.text.length >= 8;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF7ED),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Text(
                          '비밀번호 찾기',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 24),

                    if (step == 'verify') ...[
                      Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFB923C),
                                  Color(0xFFF97316),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/paw.png',
                                width: 32,
                                height: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '가입 시 등록한 이메일로 인증번호를 전송합니다',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      const Text(
                        '이메일 (아이디)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF374151),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: emailController,
                              enabled: !verificationSent,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (_) => setState(() {}),
                              decoration: InputDecoration(
                                hintText: 'example@email.com',
                                filled: true,
                                fillColor: verificationSent
                                    ? const Color(0xFFF3F4F6)
                                    : Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFF97316),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 56,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFF97316),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: canSendVerification ? handleSendVerification : null,
                              child: Text(verificationSent ? '재전송' : '인증번호'),
                            ),
                          ),
                        ],
                      ),

                      if (verificationSent) ...[
                        const SizedBox(height: 16),
                        const Text(
                          '인증번호',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF374151),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: verificationCodeController,
                                keyboardType: TextInputType.number,
                                maxLength: 6,
                                onChanged: (value) {
                                  final filtered = value.replaceAll(RegExp(r'[^0-9]'), '');
                                  if (filtered != value) {
                                    verificationCodeController.value = TextEditingValue(
                                      text: filtered,
                                      selection: TextSelection.collapsed(offset: filtered.length),
                                    );
                                  }
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: '인증번호 6자리 입력',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFF97316),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              height: 56,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF22C55E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: canVerifyCode ? handleVerifyCode : null,
                                child: const Text('확인'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '⏱️ 인증번호는 5분간 유효합니다',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const FindIdPage()),
                              );
                            },
                            child: const Text('아이디 찾기'),
                          ),
                          const Text('|', style: TextStyle(color: Color(0xFFD1D5DB))),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const SignupPage()),
                              );
                            },
                            child: const Text('회원가입'),
                          ),
                        ],
                      ),
                    ] else if (step == 'reset') ...[
                      Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFB923C),
                                  Color(0xFFF97316),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/paw.png',
                                width: 32,
                                height: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '새 비밀번호 설정',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            '안전한 비밀번호로 변경해주세요',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      const Text(
                        '새 비밀번호',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF374151),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: newPasswordController,
                        obscureText: !showPassword,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: '비밀번호를 입력하세요 (8자 이상)',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(
                              showPassword ? Icons.visibility_off : Icons.visibility,
                              color: const Color(0xFF9CA3AF),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFF97316),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '영문, 숫자, 특수문자 조합 8자 이상',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        '새 비밀번호 확인',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF374151),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: !showPasswordConfirm,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: '비밀번호를 다시 입력하세요',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPasswordConfirm = !showPasswordConfirm;
                              });
                            },
                            icon: Icon(
                              showPasswordConfirm ? Icons.visibility_off : Icons.visibility,
                              color: const Color(0xFF9CA3AF),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFF97316),
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      if (passwordsNotMatch) ...[
                        const SizedBox(height: 6),
                        const Text(
                          '비밀번호가 일치하지 않습니다',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ],

                      if (passwordsMatch) ...[
                        const SizedBox(height: 6),
                        const Row(
                          children: [
                            Icon(Icons.check, size: 16, color: Color(0xFF22C55E)),
                            SizedBox(width: 4),
                            Text(
                              '비밀번호가 일치합니다',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF22C55E),
                              ),
                            ),
                          ],
                        ),
                      ],

                      const SizedBox(height: 24),

                      SizedBox(
                        height: 56,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFFF97316),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: canResetPassword ? handleResetPassword : null,
                          child: const Text(
                            '비밀번호 변경',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ] else ...[
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDCFCE7),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 40,
                              color: Color(0xFF22C55E),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '비밀번호 변경 완료',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '비밀번호가 성공적으로 변경되었습니다\n새 비밀번호로 로그인해주세요',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFF97316),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('로그인하기'),
                            ),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 28),
                    const Center(
                      child: Text(
                        '© 2026 펫푸드 레시피. All rights reserved.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9CA3AF),
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

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController verificationCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool showPassword = false;
  bool showPasswordConfirm = false;
  bool emailVerified = false;
  bool verificationSent = false;

  bool agreeAll = false;
  bool agreeTerms = false;
  bool agreePrivacy = false;
  bool agreeMarketing = false;

  String year = '';
  String month = '';
  String day = '';

  late final List<int> years;
  final List<int> months = List.generate(12, (i) => i + 1);
  final List<int> days = List.generate(31, (i) => i + 1);

  @override
  void initState() {
    super.initState();
    final currentYear = DateTime.now().year;
    years = List.generate(currentYear - 1949, (i) => currentYear - i);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    verificationCodeController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    nicknameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void handleSendVerification() {
    setState(() {
      verificationSent = true;
    });
  }

  void handleVerifyEmail() {
    if (verificationCodeController.text.length == 6) {
      setState(() {
        emailVerified = true;
      });
    }
  }

  void handleAgreeAll(bool? value) {
    final checked = value ?? false;
    setState(() {
      agreeAll = checked;
      agreeTerms = checked;
      agreePrivacy = checked;
      agreeMarketing = checked;
    });
  }

  void updateAgreeAll() {
    setState(() {
      agreeAll = agreeTerms && agreePrivacy && agreeMarketing;
    });
  }

  bool get passwordsMatch {
    return passwordConfirmController.text.isNotEmpty &&
        passwordController.text == passwordConfirmController.text;
  }

  bool get passwordsNotMatch {
    return passwordConfirmController.text.isNotEmpty &&
        passwordController.text != passwordConfirmController.text;
  }

  bool get canSignUp {
    return nameController.text.trim().isNotEmpty &&
        year.isNotEmpty &&
        month.isNotEmpty &&
        day.isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        emailVerified &&
        passwordController.text.length >= 8 &&
        passwordController.text == passwordConfirmController.text &&
        nicknameController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        agreeTerms &&
        agreePrivacy;
  }

  void handleSignup() {
    if (!canSignUp) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('회원가입이 완료되었습니다'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF7ED),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFFB923C),
                                Color(0xFFF97316),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/paw.png',
                              width: 40,
                              height: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '회원가입',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF97316),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '펫푸드 레시피와 함께하세요',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    const Text(
                      '이름 *',
                      style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nameController,
                      onChanged: (_) => setState(() {}),
                      decoration: _inputDecoration('이름을 입력하세요'),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      '생년월일 *',
                      style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _DateDropdown(
                            value: year.isEmpty ? null : year,
                            hint: '년도',
                            items: years.map((y) => y.toString()).toList(),
                            onChanged: (value) {
                              setState(() {
                                year = value ?? '';
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _DateDropdown(
                            value: month.isEmpty ? null : month,
                            hint: '월',
                            items: months.map((m) => m.toString()).toList(),
                            onChanged: (value) {
                              setState(() {
                                month = value ?? '';
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _DateDropdown(
                            value: day.isEmpty ? null : day,
                            hint: '일',
                            items: days.map((d) => d.toString()).toList(),
                            onChanged: (value) {
                              setState(() {
                                day = value ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      '이메일 *',
                      style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            enabled: !emailVerified,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (_) => setState(() {}),
                            decoration: _inputDecoration(
                              'example@email.com',
                              fillColor: emailVerified
                                  ? const Color(0xFFF3F4F6)
                                  : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: 56,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFFF97316),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: emailVerified ? null : handleSendVerification,
                            child: Text(verificationSent ? '재전송' : '인증번호'),
                          ),
                        ),
                      ],
                    ),

                    if (verificationSent && !emailVerified) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: verificationCodeController,
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                final filtered = value.replaceAll(RegExp(r'[^0-9]'), '');
                                if (filtered != value) {
                                  verificationCodeController.value = TextEditingValue(
                                    text: filtered,
                                    selection: TextSelection.collapsed(offset: filtered.length),
                                  );
                                }
                                setState(() {});
                              },
                              decoration: _inputDecoration(
                                '인증번호 6자리 입력',
                                counterText: '',
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 56,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFF22C55E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: verificationCodeController.text.length == 6
                                  ? handleVerifyEmail
                                  : null,
                              child: const Text('확인'),
                            ),
                          ),
                        ],
                      ),
                    ],

                    if (emailVerified) ...[
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.check, size: 16, color: Color(0xFF16A34A)),
                          SizedBox(width: 6),
                          Text(
                            '이메일 인증이 완료되었습니다',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF16A34A),
                            ),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 16),

                    const Text(
                      '비밀번호 *',
                      style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: passwordController,
                      obscureText: !showPassword,
                      onChanged: (_) => setState(() {}),
                      decoration: _inputDecoration(
                        '비밀번호를 입력하세요 (8자 이상)',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            showPassword ? Icons.visibility_off : Icons.visibility,
                            color: const Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '영문, 숫자, 특수문자 조합 8자 이상',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      '비밀번호 확인 *',
                      style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: passwordConfirmController,
                      obscureText: !showPasswordConfirm,
                      onChanged: (_) => setState(() {}),
                      decoration: _inputDecoration(
                        '비밀번호를 다시 입력하세요',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPasswordConfirm = !showPasswordConfirm;
                            });
                          },
                          icon: Icon(
                            showPasswordConfirm ? Icons.visibility_off : Icons.visibility,
                            color: const Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                    ),

                    if (passwordsNotMatch) ...[
                      const SizedBox(height: 6),
                      const Text(
                        '비밀번호가 일치하지 않습니다',
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ],

                    if (passwordsMatch) ...[
                      const SizedBox(height: 6),
                      const Row(
                        children: [
                          Icon(Icons.check, size: 16, color: Color(0xFF16A34A)),
                          SizedBox(width: 4),
                          Text(
                            '비밀번호가 일치합니다',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF16A34A),
                            ),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 16),

                    const Text(
                      '닉네임 *',
                      style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: nicknameController,
                            onChanged: (_) => setState(() {}),
                            decoration: _inputDecoration('닉네임을 입력하세요'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: 56,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFFF3F4F6),
                              side: const BorderSide(color: Color(0xFFE5E7EB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              '중복확인',
                              style: TextStyle(color: Color(0xFF374151)),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      '전화번호 *',
                      style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        final filtered = value.replaceAll(RegExp(r'[^0-9-]'), '');
                        if (filtered != value) {
                          phoneController.value = TextEditingValue(
                            text: filtered,
                            selection: TextSelection.collapsed(offset: filtered.length),
                          );
                        }
                        setState(() {});
                      },
                      decoration: _inputDecoration('010-0000-0000'),
                    ),

                    const SizedBox(height: 24),

                    CheckboxListTile(
                      value: agreeAll,
                      onChanged: handleAgreeAll,
                      activeColor: const Color(0xFFF97316),
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        '전체 동의',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const Divider(height: 1),

                    CheckboxListTile(
                      value: agreeTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeTerms = value ?? false;
                        });
                        updateAgreeAll();
                      },
                      activeColor: const Color(0xFFF97316),
                      contentPadding: const EdgeInsets.only(left: 12),
                      title: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '[필수] ',
                              style: TextStyle(color: Color(0xFFF97316)),
                            ),
                            TextSpan(
                              text: '이용약관 동의',
                              style: TextStyle(color: Color(0xFF374151)),
                            ),
                          ],
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    CheckboxListTile(
                      value: agreePrivacy,
                      onChanged: (value) {
                        setState(() {
                          agreePrivacy = value ?? false;
                        });
                        updateAgreeAll();
                      },
                      activeColor: const Color(0xFFF97316),
                      contentPadding: const EdgeInsets.only(left: 12),
                      title: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '[필수] ',
                              style: TextStyle(color: Color(0xFFF97316)),
                            ),
                            TextSpan(
                              text: '개인정보 수집 및 이용 동의',
                              style: TextStyle(color: Color(0xFF374151)),
                            ),
                          ],
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    CheckboxListTile(
                      value: agreeMarketing,
                      onChanged: (value) {
                        setState(() {
                          agreeMarketing = value ?? false;
                        });
                        updateAgreeAll();
                      },
                      activeColor: const Color(0xFFF97316),
                      contentPadding: const EdgeInsets.only(left: 12),
                      title: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '[선택] ',
                              style: TextStyle(color: Color(0xFF9CA3AF)),
                            ),
                            TextSpan(
                              text: '마케팅 정보 수신 동의',
                              style: TextStyle(color: Color(0xFF374151)),
                            ),
                          ],
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      height: 56,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFFF97316),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: canSignUp ? handleSignup : null,
                        child: const Text(
                          '회원가입',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '이미 계정이 있으신가요? ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '로그인',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFF97316),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),
                    const Center(
                      child: Text(
                        '© 2026 펫푸드 레시피. All rights reserved.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9CA3AF),
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

  InputDecoration _inputDecoration(
    String hintText, {
    Widget? suffixIcon,
    Color fillColor = Colors.white,
    String? counterText,
  }) {
    return InputDecoration(
      hintText: hintText,
      counterText: counterText,
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFFF97316),
          width: 2,
        ),
      ),
    );
  }
}