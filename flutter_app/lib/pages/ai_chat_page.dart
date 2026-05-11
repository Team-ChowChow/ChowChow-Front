import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/sample_data.dart';
import '../theme/chow_theme.dart';

class ChatMessage {
  ChatMessage({required this.id, required this.text, required this.isUser, required this.timestamp});

  final int id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
}

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final _scroll = ScrollController();
  final _input = TextEditingController();
  final _messages = <ChatMessage>[
    ChatMessage(
      id: 1,
      text:
          '안녕하세요! 저는 AI 셰프입니다. 🐾\n반려동물의 건강한 식단을 위해 도와드리겠습니다.\n\n어떤 도움이 필요하신가요?',
      isUser: false,
      timestamp: DateTime.now(),
    ),
  ];

  @override
  void dispose() {
    _scroll.dispose();
    _input.dispose();
    super.dispose();
  }

  void _scrollBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _aiReply(String userInput) {
    final lower = userInput.toLowerCase();
    if (lower.contains('알러지') || lower.contains('알레르기')) {
      return '알러지가 있는 반려동물을 위해서는 단백질 공급원을 신중하게 선택해야 합니다.\n\n추천 식재료:\n• 오리고기 (저알러지 단백질)\n• 고구마 (탄수화물)\n• 호박 (소화 촉진)\n\n자세한 레시피를 보여드릴까요?';
    }
    if (lower.contains('다이어트') || lower.contains('체중')) {
      return '체중 관리를 위한 저지방 식단을 추천드립니다.\n\n• 닭가슴살 + 브로콜리\n• 흰살생선 + 당근\n• 두부 + 시금치\n\n하루 급여량은 체중에 따라 다릅니다. 현재 반려동물의 체중은 몇 kg인가요?';
    }
    if (lower.contains('강아지') || lower.contains('개')) {
      return '강아지를 위한 건강한 레시피를 추천드립니다!\n\n🍖 닭가슴살 야채 볶음\n재료: 닭가슴살 100g, 당근 50g, 브로콜리 30g\n\n🐟 연어 고구마 믹스\n재료: 연어 80g, 고구마 100g, 애호박 40g\n\n어떤 레시피에 관심이 있으신가요?';
    }
    if (lower.contains('고양이') || lower.contains('냥')) {
      return '고양이를 위한 레시피를 추천드립니다!\n\n🐟 참치 브로콜리 스튜\n재료: 참치 100g, 브로콜리 30g, 달걀 1개\n\n🥩 소고기 감자 믹스\n재료: 소고기 80g, 감자 60g, 시금치 20g\n\n고양이는 필수 아미노산인 타우린이 필요하니 생선이나 육류를 충분히 포함해주세요.';
    }
    return '궁금하신 내용을 더 자세히 말씀해주시면, 맞춤형 레시피와 영양 정보를 제공해드리겠습니다.\n\n다음과 같은 정보를 알려주시면 더 정확한 상담이 가능합니다:\n• 반려동물 종류 (강아지/고양이)\n• 나이와 체중\n• 특이사항 (알러지, 질병 등)\n• 선호하는 식재료';
  }

  void _send() {
    final text = _input.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(id: _messages.length + 1, text: text, isUser: true, timestamp: DateTime.now()));
      _input.clear();
    });
    _scrollBottom();
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _messages.add(
          ChatMessage(
            id: _messages.length + 1,
            text: _aiReply(text),
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
      });
      _scrollBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChowColors.gray50,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [ChowColors.orange400, ChowColors.orange500]),
              boxShadow: [BoxShadow(blurRadius: 6, offset: Offset(0, 2), color: Color(0x22000000))],
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 14),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.go('/'),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.auto_awesome, color: ChowColors.orange500, size: 22),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('AI 셰프', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                          Text('맞춤 레시피 상담', style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scroll,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
              itemCount: _messages.length,
              itemBuilder: (context, i) {
                final m = _messages[i];
                final t = TimeOfDay.fromDateTime(m.timestamp);
                final timeStr = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
                return Align(
                  alignment: m.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.82),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: m.isUser ? ChowColors.orange500 : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(m.isUser ? 16 : 4),
                        bottomRight: Radius.circular(m.isUser ? 4 : 16),
                      ),
                      boxShadow: m.isUser ? null : const [BoxShadow(blurRadius: 4, offset: Offset(0, 1), color: Color(0x0D000000))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!m.isUser)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Icon(Icons.auto_awesome, size: 16, color: ChowColors.orange500),
                                SizedBox(width: 6),
                                Text('AI 셰프', style: TextStyle(fontSize: 11, color: ChowColors.orange500)),
                              ],
                            ),
                          ),
                        Text(
                          m.text,
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.45,
                            color: m.isUser ? Colors.white : ChowColors.gray800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          timeStr,
                          style: TextStyle(
                            fontSize: 11,
                            color: m.isUser ? Colors.white70 : ChowColors.gray400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (_messages.length <= 1)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('💡 추천 질문', style: TextStyle(fontSize: 13, color: ChowColors.gray600)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: kAiQuickQuestions
                          .map(
                            (q) => OutlinedButton(
                              onPressed: () {
                                _input.text = q;
                                setState(() {});
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: ChowColors.gray700,
                                side: const BorderSide(color: ChowColors.gray200),
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              ),
                              child: Text(q, style: const TextStyle(fontSize: 12)),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          Material(
            color: Colors.white,
            elevation: 6,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _input,
                        decoration: InputDecoration(
                          hintText: '메시지를 입력하세요...',
                          filled: true,
                          fillColor: ChowColors.gray100,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        ),
                        onSubmitted: (_) => _send(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _input,
                      builder: (context, v, _) {
                        final enabled = v.text.trim().isNotEmpty;
                        return Material(
                          color: enabled ? ChowColors.orange500 : ChowColors.gray300,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: enabled ? _send : null,
                            child: const SizedBox(
                              width: 48,
                              height: 48,
                              child: Icon(Icons.send, color: Colors.white, size: 22),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
