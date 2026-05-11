import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../theme/chow_theme.dart';
import '../widgets/chow_network_image.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchCtrl = TextEditingController();
  final _focusNode = FocusNode();
  bool _searchFocused = false;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _searchFocused = _focusNode.hasFocus);
    });
    _searchCtrl.addListener(() {
      setState(() => _query = _searchCtrl.text);
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get _showAutocomplete => _query.isNotEmpty;
  bool get _showPopular => _searchFocused && !_showAutocomplete;

  void _openFilter() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => const _FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Material(
            color: Colors.white,
            elevation: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('레시피 검색', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _searchCtrl,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: '오리 이플로드 검색...',
                        filled: true,
                        fillColor: ChowColors.gray50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search, color: ChowColors.gray400),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 10),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [ChowColors.orange400, ChowColors.orange500],
                        ),
                        boxShadow: const [
                          BoxShadow(blurRadius: 4, offset: Offset(0, 1), color: Color(0x14000000)),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: _openFilter,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.tune, color: Colors.white, size: 22),
                                SizedBox(width: 8),
                                Text('우리 아이 맞춤 필터', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: _showPopular
                ? _PopularSearches(
                    onPick: (t) {
                      _searchCtrl.text = t;
                      _focusNode.unfocus();
                    },
                    onClose: () => _focusNode.unfocus(),
                  )
                : _showAutocomplete
                    ? _Autocomplete(
                        onPick: (t) {
                          _searchCtrl.text = t;
                          _focusNode.unfocus();
                        },
                        onClear: () => _searchCtrl.clear(),
                      )
                    : _DefaultSearchBody(),
          ),
        ],
      ),
    );
  }
}

class _PopularSearches extends StatelessWidget {
  const _PopularSearches({required this.onPick, required this.onClose});

  final void Function(String) onPick;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('인기 검색어', style: Theme.of(context).textTheme.titleMedium),
            TextButton(onPressed: onClose, child: const Text('닫기', style: TextStyle(color: ChowColors.gray500))),
          ],
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.8,
          ),
          itemCount: kPopularSearches.length,
          itemBuilder: (context, i) {
            final item = kPopularSearches[i];
            return Material(
              color: ChowColors.gray50,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onPick(item.term),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        '${item.rank}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: item.rank <= 3 ? ChowColors.orange500 : ChowColors.gray400,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.term,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13, color: ChowColors.gray700),
                        ),
                      ),
                      if (item.isNew)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            color: ChowColors.red500,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Autocomplete extends StatelessWidget {
  const _Autocomplete({required this.onPick, required this.onClear});

  final void Function(String) onPick;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('추천 검색어', style: TextStyle(fontSize: 13, color: ChowColors.gray600)),
            TextButton(
              onPressed: onClear,
              child: const Text('초기화', style: TextStyle(fontSize: 12, color: ChowColors.gray400)),
            ),
          ],
        ),
        ...kAutocompleteSuggestions.map(
          (s) => ListTile(
            dense: true,
            leading: const Icon(Icons.search, size: 18, color: ChowColors.gray400),
            title: Text(s, style: const TextStyle(fontSize: 14, color: ChowColors.gray700)),
            onTap: () => onPick(s),
          ),
        ),
      ],
    );
  }
}

class _DefaultSearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
      children: [
        Text('인기 카테고리', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: kPopularCategories
              .map(
                (c) => OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ChowColors.gray700,
                    side: const BorderSide(color: ChowColors.gray200),
                    backgroundColor: ChowColors.gray50,
                  ),
                  child: Text(c, style: const TextStyle(fontSize: 13)),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('총 ${kSearchRecipes.length}개의 레시피', style: const TextStyle(fontSize: 13, color: ChowColors.gray600)),
            Row(
              children: [
                TextButton(onPressed: () {}, child: const Text('인기순', style: TextStyle(color: ChowColors.orange500, fontSize: 13))),
                const Text('|', style: TextStyle(color: ChowColors.gray300)),
                TextButton(onPressed: () {}, child: const Text('최신순', style: TextStyle(color: ChowColors.gray400, fontSize: 13))),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...kSearchRecipes.map((r) => _RecipeRow(recipe: r)),
      ],
    );
  }
}

class _RecipeRow extends StatelessWidget {
  const _RecipeRow({required this.recipe});

  final SearchRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: ChowColors.gray200),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 96,
                    height: 96,
                    child: ChowNetworkImage(url: recipe.image),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: ChowColors.gray900),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        recipe.ingredients,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11, color: ChowColors.gray500),
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 4,
                        children: recipe.tags
                            .map(
                              (t) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: ChowColors.orange50,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(t, style: const TextStyle(fontSize: 10, color: ChowColors.orange600)),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 15, color: Color(0xFFFACC15)),
                          Text(' ${recipe.rating}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                          Text(' (${recipe.reviews})', style: const TextStyle(fontSize: 11, color: ChowColors.gray500)),
                          const SizedBox(width: 8),
                          Text('👤 ${recipe.author}', style: const TextStyle(fontSize: 11, color: ChowColors.gray500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterBottomSheet extends StatelessWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.72,
      minChildSize: 0.45,
      maxChildSize: 0.92,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 28),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: ChowColors.gray200,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('맞춤 필터', style: Theme.of(context).textTheme.titleLarge),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 16),
              const Text('반려동물 종류', style: TextStyle(fontSize: 13, color: ChowColors.gray700)),
              const SizedBox(height: 10),
              Row(
                children: [
                  for (var i = 0; i < 3; i++)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: i < 2 ? 6 : 0),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(['강아지', '고양이', '기타'][i], style: const TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('식단 목적', style: TextStyle(fontSize: 13, color: ChowColors.gray700)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['다이어트', '알러지', '시니어', '성장기', '면역력', '피부/털']
                    .map((t) => OutlinedButton(onPressed: () {}, child: Text(t, style: const TextStyle(fontSize: 13))))
                    .toList(),
              ),
              const SizedBox(height: 20),
              const Text('주재료', style: TextStyle(fontSize: 13, color: ChowColors.gray700)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['닭고기', '소고기', '연어', '참치', '오리', '양고기']
                    .map((t) => OutlinedButton(onPressed: () {}, child: Text(t, style: const TextStyle(fontSize: 13))))
                    .toList(),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                      child: const Text('초기화'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(colors: [ChowColors.orange400, ChowColors.orange500]),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => Navigator.pop(context),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Center(child: Text('적용하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
