import { Search as SearchIcon, Filter, Star } from "lucide-react";
import { useState } from "react";
import { ImageWithFallback } from "../components/figma/ImageWithFallback";
import { BottomNav } from "../components/BottomNav";

export function Search() {
  const [searchQuery, setSearchQuery] = useState("");
  const [isSearchFocused, setIsSearchFocused] = useState(false);
  const [showFilterModal, setShowFilterModal] = useState(false);
  
  const popularSearches = [
    { rank: 1, term: "닭가슴살 레시피", isNew: false },
    { rank: 2, term: "다이어트 펫푸드", isNew: true },
    { rank: 3, term: "알레르기 대응식", isNew: false },
    { rank: 4, term: "강아지 간식", isNew: false },
    { rank: 5, term: "연어 고구마", isNew: true },
    { rank: 6, term: "생식 레시피", isNew: false },
    { rank: 7, term: "저지방 식단", isNew: false },
    { rank: 8, term: "시니어 건강식", isNew: true },
    { rank: 9, term: "치킨 야채볼", isNew: false },
    { rank: 10, term: "면역력 강화", isNew: false },
  ];

  const autocompleteSuggestions = [
    "닭가슴살 야채 통조림",
    "닭가슴살 고구마 볼",
    "닭가슴살 연어 믹스",
    "닭가슴살 브로콜리",
  ];

  const popularCategories = [
    "#트렌드", "#저지방", "#알러지프리", "#시니어", 
    "#피부/키트", "#다이어트", "#치아건강", "#면역력"
  ];

  const recipes = [
    {
      id: 1,
      title: "토종닭 저지방 닭가슴살 레시피",
      ingredients: "주재료: 닭가슴살, 고구마, ...",
      image: "https://images.unsplash.com/photo-1684882726821-2999db517441?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjaGlja2VuJTIwYnJlYXN0JTIwdmVnZXRhYmxlJTIwZG9nJTIwZm9vZHxlbnwxfHx8fDE3NzUwMzg2NzV8MA&ixlib=rb-4.1.0&q=80&w=1080",
      rating: 4.8,
      reviews: 234,
      author: "명랑이엄마",
      tags: ["#저지방", "#다이어트"],
    },
    {
      id: 2,
      title: "연어 오메가3 영양 밥",
      ingredients: "주재료: 연어, 현미, 당근, ...",
      image: "https://images.unsplash.com/photo-1580683750935-cecfc7ea57f0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxzYWxtb24lMjByaWNlJTIwdmVnZXRhYmxlJTIwYm93bHxlbnwxfHx8fDE3NzUwMzg2NzV8MA&ixlib=rb-4.1.0&q=80&w=1080",
      rating: 4.9,
      reviews: 189,
      author: "냥이집사",
      tags: ["#트렌드", "#면역력"],
    },
    {
      id: 3,
      title: "소고기 야채 영양식",
      ingredients: "주재료: 소고기, 단호박, ...",
      image: "https://images.unsplash.com/photo-1618788856642-8e491177d973?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxmcmVzaCUyMG1lYXQlMjB2ZWdldGFibGVzJTIwY29va2luZ3xlbnwxfHx8fDE3NzUwMzg2NzZ8MA&ixlib=rb-4.1.0&q=80&w=1080",
      rating: 4.7,
      reviews: 156,
      author: "댕댕이아빠",
      tags: ["#시니어", "#치아건강"],
    },
  ];

  const showAutocomplete = searchQuery.length > 0;
  const showPopularSearches = isSearchFocused && !showAutocomplete;

  return (
    <div className="min-h-screen bg-white pb-20">
      {/* Header */}
      <div className="px-5 py-4 sticky top-0 z-10 bg-white border-b border-gray-100">
        <h1 className="mb-4">레시피 검색</h1>
        
        {/* Search Bar */}
        <div className="mb-3">
          <div className="relative">
            <SearchIcon className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
            <input
              type="text"
              placeholder="오리 이플로드 검색..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              onFocus={() => setIsSearchFocused(true)}
              className="w-full pl-12 pr-4 py-3.5 bg-gray-50 rounded-xl border-none focus:outline-none focus:bg-gray-100 transition-colors"
            />
          </div>
        </div>

        {/* Filter Button */}
        <button 
          onClick={() => setShowFilterModal(true)}
          className="w-full bg-gradient-to-r from-orange-400 to-orange-500 text-white py-3.5 rounded-xl flex items-center justify-center gap-2 hover:from-orange-500 hover:to-orange-600 transition-all shadow-sm"
        >
          <Filter className="w-5 h-5" />
          <span>우리 아이 맞춤 필터</span>
        </button>
      </div>

      {/* Popular Searches Overlay */}
      {showPopularSearches && (
        <div className="px-5 py-4 bg-white">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-gray-900">인기 검색어</h2>
            <button 
              onClick={() => setIsSearchFocused(false)}
              className="text-sm text-gray-500"
            >
              닫기
            </button>
          </div>
          
          <div className="grid grid-cols-2 gap-3">
            {popularSearches.map((item) => (
              <button
                key={item.rank}
                className="flex items-center gap-3 p-3 bg-gray-50 rounded-xl hover:bg-gray-100 transition-colors"
                onClick={() => {
                  setSearchQuery(item.term);
                  setIsSearchFocused(false);
                }}
              >
                <span className={`text-sm font-bold ${
                  item.rank <= 3 ? 'text-orange-500' : 'text-gray-400'
                }`}>
                  {item.rank}
                </span>
                <span className="text-sm text-gray-700 flex-1 text-left">
                  {item.term}
                </span>
                {item.isNew && (
                  <span className="text-xs bg-red-500 text-white px-1.5 py-0.5 rounded">
                    NEW
                  </span>
                )}
              </button>
            ))}
          </div>
        </div>
      )}

      {/* Autocomplete Suggestions */}
      {showAutocomplete && (
        <div className="px-5 py-4 bg-white border-b border-gray-100">
          <div className="flex items-center justify-between mb-3">
            <h3 className="text-sm text-gray-600">추천 검색어</h3>
            <button 
              onClick={() => setSearchQuery("")}
              className="text-xs text-gray-400"
            >
              초기화
            </button>
          </div>
          
          <div className="space-y-2">
            {autocompleteSuggestions.map((suggestion, index) => (
              <button
                key={index}
                className="w-full text-left px-3 py-2.5 hover:bg-gray-50 rounded-lg transition-colors flex items-center gap-2"
                onClick={() => {
                  setSearchQuery(suggestion);
                  setIsSearchFocused(false);
                }}
              >
                <SearchIcon className="w-4 h-4 text-gray-400" />
                <span className="text-sm text-gray-700">{suggestion}</span>
              </button>
            ))}
          </div>
        </div>
      )}

      {/* Popular Categories */}
      {!showPopularSearches && !showAutocomplete && (
        <>
          <div className="px-5 py-4">
            <h2 className="text-gray-900 mb-3">인기 카테고리</h2>
            <div className="flex flex-wrap gap-2">
              {popularCategories.map((category, index) => (
                <button
                  key={index}
                  className="px-4 py-2 bg-gray-50 text-gray-700 rounded-full text-sm hover:bg-orange-50 hover:text-orange-600 transition-colors border border-gray-200"
                >
                  {category}
                </button>
              ))}
            </div>
          </div>

          {/* Recipe Results */}
          <div className="px-5 py-4">
            <div className="flex items-center justify-between mb-4">
              <span className="text-sm text-gray-600">총 {recipes.length}개의 레시피</span>
              <div className="flex gap-2">
                <button className="text-sm text-orange-500">인기순</button>
                <span className="text-gray-300">|</span>
                <button className="text-sm text-gray-400">최신순</button>
              </div>
            </div>

            <div className="space-y-4">
              {recipes.map((recipe) => (
                <div
                  key={recipe.id}
                  className="bg-white border border-gray-200 rounded-2xl overflow-hidden hover:shadow-md transition-shadow"
                >
                  <div className="flex gap-3 p-3">
                    <div className="w-24 h-24 flex-shrink-0">
                      <ImageWithFallback
                        src={recipe.image}
                        alt={recipe.title}
                        className="w-full h-full object-cover rounded-xl"
                      />
                    </div>
                    
                    <div className="flex-1 min-w-0">
                      <h3 className="text-sm mb-1 text-gray-900 line-clamp-2">
                        {recipe.title}
                      </h3>
                      <p className="text-xs text-gray-500 mb-2 line-clamp-1">
                        {recipe.ingredients}
                      </p>
                      
                      <div className="flex flex-wrap gap-1 mb-2">
                        {recipe.tags.map((tag, index) => (
                          <span
                            key={index}
                            className="text-xs px-2 py-0.5 bg-orange-50 text-orange-600 rounded"
                          >
                            {tag}
                          </span>
                        ))}
                      </div>
                      
                      <div className="flex items-center gap-3 text-xs text-gray-500">
                        <div className="flex items-center gap-1">
                          <Star className="w-3.5 h-3.5 fill-yellow-400 text-yellow-400" />
                          <span className="text-gray-900 font-medium">{recipe.rating}</span>
                          <span>({recipe.reviews})</span>
                        </div>
                        <span>👤 {recipe.author}</span>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </>
      )}

      {/* Filter Modal */}
      {showFilterModal && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-end">
          <div className="w-full max-w-[430px] mx-auto bg-white rounded-t-3xl p-6 animate-slide-up">
            <div className="flex items-center justify-between mb-6">
              <h2>맞춤 필터</h2>
              <button 
                onClick={() => setShowFilterModal(false)}
                className="text-gray-500"
              >
                ✕
              </button>
            </div>

            <div className="space-y-6">
              {/* Pet Type */}
              <div>
                <h3 className="text-sm mb-3 text-gray-700">반려동물 종류</h3>
                <div className="flex gap-2">
                  {["강아지", "고양이", "기타"].map((type) => (
                    <button
                      key={type}
                      className="flex-1 py-2.5 border border-gray-300 rounded-lg text-sm hover:border-orange-400 hover:bg-orange-50 transition-colors"
                    >
                      {type}
                    </button>
                  ))}
                </div>
              </div>

              {/* Diet Type */}
              <div>
                <h3 className="text-sm mb-3 text-gray-700">식단 목적</h3>
                <div className="flex flex-wrap gap-2">
                  {["다이어트", "알러지", "시니어", "성장기", "면역력", "피부/털"].map((purpose) => (
                    <button
                      key={purpose}
                      className="px-4 py-2 border border-gray-300 rounded-full text-sm hover:border-orange-400 hover:bg-orange-50 transition-colors"
                    >
                      {purpose}
                    </button>
                  ))}
                </div>
              </div>

              {/* Main Ingredient */}
              <div>
                <h3 className="text-sm mb-3 text-gray-700">주재료</h3>
                <div className="flex flex-wrap gap-2">
                  {["닭고기", "소고기", "연어", "참치", "오리", "양고기"].map((ingredient) => (
                    <button
                      key={ingredient}
                      className="px-4 py-2 border border-gray-300 rounded-full text-sm hover:border-orange-400 hover:bg-orange-50 transition-colors"
                    >
                      {ingredient}
                    </button>
                  ))}
                </div>
              </div>

              {/* Action Buttons */}
              <div className="flex gap-3 pt-4">
                <button 
                  onClick={() => setShowFilterModal(false)}
                  className="flex-1 py-3.5 border border-gray-300 rounded-xl text-gray-700 hover:bg-gray-50 transition-colors"
                >
                  초기화
                </button>
                <button 
                  onClick={() => setShowFilterModal(false)}
                  className="flex-1 py-3.5 bg-gradient-to-r from-orange-400 to-orange-500 text-white rounded-xl hover:from-orange-500 hover:to-orange-600 transition-all"
                >
                  적용하기
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      <BottomNav />
    </div>
  );
}
