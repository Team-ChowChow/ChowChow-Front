import { MessageCircle, Camera, Heart, Clock, TrendingUp, Bell, Coins } from "lucide-react";
import { BottomNav } from "../components/BottomNav";
import { ImageWithFallback } from "../components/figma/ImageWithFallback";
import Slider from "react-slick";
import { Link } from "react-router";

export function Home() {
  const mealPhotos = [
    {
      id: 1,
      image: "https://images.unsplash.com/photo-1760445528367-7f0fa0229d19?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkb2clMjBlYXRpbmclMjBoZWFsdGh5JTIwbWVhbHxlbnwxfHx8fDE3NzE0MjIwOTh8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      title: "닭가슴살 야채 볶음",
      date: "2026.02.18",
      likes: 24,
    },
    {
      id: 2,
      image: "https://images.unsplash.com/photo-1597362925123-77861d3fbac7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwZXQlMjBmb29kJTIwaW5ncmVkaWVudHMlMjB2ZWdldGFibGVzfGVufDF8fHx8MTc3MTQyMjA5OXww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      title: "연어 고구마 믹스",
      date: "2026.02.17",
      likes: 31,
    },
    {
      id: 3,
      image: "https://images.unsplash.com/photo-1769947322352-dd6cbdc4ec2d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjYXQlMjBlYXRpbmclMjBmb29kfGVufDF8fHx8MTc3MTM2MDQzMHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      title: "참치 브로콜리 스튜",
      date: "2026.02.16",
      likes: 18,
    },
  ];

  const trendingRecipes = [
    {
      id: 1,
      image: "https://images.unsplash.com/photo-1588505617603-f80b72bf8f24?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkb2clMjBmb29kJTIwY2hpY2tlbiUyMHZlZ2V0YWJsZXMlMjBoZWFsdGh5JTIwbWVhbHxlbnwxfHx8fDE3NzQ0MzI2Njh8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      title: "닭가슴살 야채 볶음",
      tags: ["#트렌드", "#저지방"],
    },
    {
      id: 2,
      image: "https://images.unsplash.com/photo-1565299647508-7c3b8ec04837?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxzYWxtb24lMjBzd2VldCUyMHBvdGF0byUyMHBldCUyMGZvb2QlMjBpbmdyZWRpZW50c3xlbnwxfHx8fDE3NzQ0MzI2Njh8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      title: "연어 고구마 믹스",
      tags: ["#오메가3", "#영양만점"],
    },
    {
      id: 3,
      image: "https://images.unsplash.com/photo-1769195045450-a53e5fef9d5e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxiZWVmJTIwYnJvY2NvbGklMjBkb2clMjBudXRyaXRpb24lMjBtZWFsfGVufDF8fHx8MTc3NDQzMjY2OXww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      title: "소고기 브로콜리",
      tags: ["#단백질", "#근육발달"],
    },
    {
      id: 4,
      image: "https://images.unsplash.com/photo-1739595415308-ba632ebfbfe2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxob21lbWFkZSUyMHBldCUyMGZvb2QlMjBjb29raW5nJTIwcHJlcGFyYXRpb258ZW58MXx8fHwxNzc0NDMyNjY5fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      title: "홈메이드 특선 요리",
      tags: ["#수제", "#프리미엄"],
    },
  ];

  const sliderSettings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: false,
  };

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      {/* Header */}
      <header className="bg-white px-5 py-4 border-b border-gray-200">
        <div className="flex items-center justify-between">
          <h1 className="text-orange-500">펫푸드 레시피</h1>
          <div className="flex items-center gap-3">
            <div className="flex items-center gap-2 bg-gradient-to-br from-yellow-400 to-yellow-500 px-4 py-2 rounded-full shadow-md hover:shadow-lg transition-shadow">
              <div className="w-5 h-5 bg-white rounded-full flex items-center justify-center">
                <span className="text-yellow-600 text-xs font-bold">C</span>
              </div>
              <span className="text-sm font-semibold text-white">1,250</span>
            </div>
            <button className="relative p-2 hover:bg-gray-100 rounded-full transition-colors">
              <Bell className="w-6 h-6 text-gray-700" />
              <span className="absolute top-1 right-1 w-2 h-2 bg-orange-500 rounded-full"></span>
            </button>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <div className="max-w-md mx-auto">
        {/* Trending Recipes Slider */}
        <section className="mt-6 mb-6">
          <div className="px-4 mb-3">
            <h3 className="text-gray-800">트렌드 레시피</h3>
          </div>
          <div className="trending-slider px-4">
            <Slider {...sliderSettings}>
              {trendingRecipes.map((recipe) => (
                <div key={recipe.id} className="px-2">
                  <div className="bg-white rounded-2xl overflow-hidden shadow-lg">
                    <div className="relative aspect-[16/9]">
                      <ImageWithFallback
                        src={recipe.image}
                        alt={recipe.title}
                        className="w-full h-full object-cover"
                      />
                      <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                      <div className="absolute bottom-0 left-0 right-0 p-4">
                        <h4 className="text-white text-lg mb-2">{recipe.title}</h4>
                        <div className="flex gap-2">
                          {recipe.tags.map((tag, index) => (
                            <span
                              key={index}
                              className="text-xs bg-white/20 backdrop-blur-sm text-white px-3 py-1 rounded-full"
                            >
                              {tag}
                            </span>
                          ))}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </Slider>
          </div>
        </section>

        {/* AI Recipe Generation Section */}
        <section className="bg-gradient-to-br from-orange-400 to-orange-500 mx-4 rounded-2xl p-6 shadow-lg">
          <div className="flex items-start justify-between">
            <div className="flex-1">
              <div className="inline-flex items-center gap-2 bg-white/20 px-3 py-1 rounded-full mb-3">
                <MessageCircle className="w-4 h-4 text-white" />
                <span className="text-white text-sm">AI 셰프</span>
              </div>
              <h2 className="text-white text-xl mb-2">
                우리 아이 맞춤 식단을<br />AI가 추천해드려요
              </h2>
              <p className="text-white/90 text-sm mb-4">
                반려동물의 건강 상태, 알러지, 선호도를 고려한 맞춤 레시피
              </p>
              <Link to="/recipe-generation">
                <button className="bg-white text-orange-500 px-6 py-2.5 rounded-full hover:bg-orange-50 transition-colors">
                  AI 레시피 생성
                </button>
              </Link>
            </div>
            <MessageCircle className="w-16 h-16 text-white/20" strokeWidth={1.5} />
          </div>
        </section>

        {/* Meal Photos Section */}
        <section className="px-4 mt-8">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-gray-800">나의 식단 기록</h3>
            <button className="text-sm text-orange-500 hover:text-orange-600">전체보기</button>
          </div>

          <div className="grid grid-cols-2 gap-3">
            {mealPhotos.map((meal) => (
              <div key={meal.id} className="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-shadow">
                <div className="relative aspect-square">
                  <ImageWithFallback
                    src={meal.image}
                    alt={meal.title}
                    className="w-full h-full object-cover"
                  />
                  <button className="absolute top-2 right-2 w-8 h-8 bg-white/90 rounded-full flex items-center justify-center hover:bg-white transition-colors">
                    <Heart className="w-4 h-4 text-gray-600" />
                  </button>
                </div>
                <div className="p-3">
                  <p className="text-sm text-gray-800 mb-1">{meal.title}</p>
                  <div className="flex items-center justify-between">
                    <span className="text-xs text-gray-500">{meal.date}</span>
                    <div className="flex items-center gap-1">
                      <Heart className="w-3 h-3 text-orange-500" fill="currentColor" />
                      <span className="text-xs text-gray-600">{meal.likes}</span>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Add Photo Button */}
          <button className="w-full mt-4 bg-white border-2 border-dashed border-gray-300 rounded-xl p-6 hover:border-orange-500 hover:bg-orange-50/50 transition-colors">
            <Camera className="w-8 h-8 text-gray-400 mx-auto mb-2" />
            <p className="text-sm text-gray-600">식단 사진 추가하기</p>
          </button>
        </section>

        {/* Today's Tips */}
        <section className="px-4 mt-8 mb-6">
          <h3 className="text-gray-800 mb-4">오늘의 팁</h3>
          <div className="bg-gradient-to-r from-blue-500 to-purple-500 rounded-xl p-5 text-white">
            <p className="text-sm opacity-90 mb-2">💡 건강 정보</p>
            <p className="mb-3">
              반려견에게 양파, 마늘, 포도는 절대 급여하지 마세요. 중독 증상을 유발할 수 있습니다.
            </p>
            <button className="text-sm underline opacity-90">더 알아보기</button>
          </div>
        </section>
      </div>

      <BottomNav />
    </div>
  );
}