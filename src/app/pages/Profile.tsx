import {
  ChevronRight,
  Bell,
  Shield,
  HelpCircle,
  LogOut,
  Settings,
  Heart,
  BookOpen,
  Award,
  Camera,
} from "lucide-react";
import { Link } from "react-router";
import { BottomNav } from "../components/BottomNav";
import { ImageWithFallback } from "../components/figma/ImageWithFallback";

export function Profile() {
  const userPets = [
    {
      id: 1,
      name: "초코",
      type: "강아지",
      breed: "골든 리트리버",
      age: "3살",
      weight: "28kg",
      allergies: ["닭고기", "밀"],
      image: "https://images.unsplash.com/photo-1744824838728-59f825fc7da1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkb2clMjBwb3J0cmFpdCUyMGN1dGV8ZW58MXx8fHwxNzcxNDIyMDk5fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
    },
    {
      id: 2,
      name: "나비",
      type: "고양이",
      breed: "코리안 숏헤어",
      age: "2살",
      weight: "4.2kg",
      allergies: ["생선"],
      image: "https://images.unsplash.com/photo-1769947322352-dd6cbdc4ec2d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjYXQlMjBlYXRpbmclMjBmb29kfGVufDF8fHx8MTc3MTM2MDQzMHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
    },
  ];

  const stats = [
    { label: "저장한 레시피", value: 42, icon: Heart },
    { label: "조리 완료", value: 28, icon: Award },
    { label: "작성한 리뷰", value: 15, icon: BookOpen },
  ];

  const menuSections = [
    {
      title: "계정",
      items: [
        { label: "알림 설정", icon: Bell, badge: "3" },
        { label: "개인정보 보호", icon: Shield },
        { label: "앱 설정", icon: Settings },
      ],
    },
    {
      title: "지원",
      items: [
        { label: "도움말 & FAQ", icon: HelpCircle },
        { label: "고객 지원", icon: HelpCircle },
      ],
    },
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      {/* Header */}
      <header className="bg-gradient-to-br from-orange-500 to-orange-400 px-5 pt-6 pb-8">
        <div className="flex items-center justify-between mb-6">
          <div className="flex items-center gap-3">
            <div className="w-16 h-16 bg-white rounded-full flex items-center justify-center">
              <span className="text-2xl">👤</span>
            </div>
            <div>
              <h1 className="text-white text-xl">김반려</h1>
              <p className="text-white/80 text-sm">petlover@email.com</p>
            </div>
          </div>
          <button className="text-white hover:text-white/80">
            <Settings className="w-6 h-6" />
          </button>
        </div>

        {/* Stats */}
        <div className="grid grid-cols-3 gap-3">
          {stats.map((stat) => (
            <div key={stat.label} className="bg-white/20 backdrop-blur-sm rounded-xl p-3 text-center">
              <stat.icon className="w-5 h-5 text-white mx-auto mb-1" />
              <p className="text-white text-xl">{stat.value}</p>
              <p className="text-white/80 text-xs mt-1">{stat.label}</p>
            </div>
          ))}
        </div>
      </header>

      <div className="max-w-md mx-auto">
        {/* My Pets Section */}
        <section className="px-5 py-5 bg-white mt-4 rounded-t-3xl -mt-6 relative z-10 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-gray-800">우리 아이들</h2>
            <button className="text-sm text-orange-500 hover:text-orange-600">
              + 추가하기
            </button>
          </div>

          <div className="space-y-3">
            {userPets.map((pet) => (
              <div
                key={pet.id}
                className="bg-gray-50 rounded-xl p-4 flex items-start gap-4 hover:bg-gray-100 transition-colors cursor-pointer"
              >
                <div className="relative">
                  <div className="w-20 h-20 rounded-xl overflow-hidden">
                    <ImageWithFallback
                      src={pet.image}
                      alt={pet.name}
                      className="w-full h-full object-cover"
                    />
                  </div>
                  <button className="absolute -bottom-1 -right-1 w-7 h-7 bg-orange-500 rounded-full flex items-center justify-center hover:bg-orange-600 transition-colors">
                    <Camera className="w-4 h-4 text-white" />
                  </button>
                </div>

                <div className="flex-1">
                  <div className="flex items-start justify-between mb-1">
                    <div>
                      <h3 className="text-gray-800">{pet.name}</h3>
                      <p className="text-sm text-gray-500">
                        {pet.breed} • {pet.age}
                      </p>
                    </div>
                    <ChevronRight className="w-5 h-5 text-gray-400" />
                  </div>
                  <div className="flex items-center gap-3 mt-2">
                    <span className="text-xs text-gray-600">체중: {pet.weight}</span>
                    <span className="text-xs text-orange-600">
                      알러지: {pet.allergies.join(", ")}
                    </span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Menu Sections */}
        {menuSections.map((section) => (
          <section key={section.title} className="px-5 py-4 bg-white mt-2">
            <h3 className="text-sm text-gray-500 mb-3">{section.title}</h3>
            <div className="space-y-1">
              {section.items.map((item) => {
                const content = (
                  <>
                    <div className="flex items-center gap-3">
                      <item.icon className="w-5 h-5 text-gray-600" />
                      <span className="text-gray-800">{item.label}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      {item.badge && (
                        <span className="bg-orange-500 text-white text-xs px-2 py-0.5 rounded-full">
                          {item.badge}
                        </span>
                      )}
                      <ChevronRight className="w-5 h-5 text-gray-400" />
                    </div>
                  </>
                );

                return item.label === "앱 설정" ? (
                  <Link
                    key={item.label}
                    to="/app-settings"
                    className="w-full flex items-center justify-between py-3 hover:bg-gray-50 rounded-lg px-2 transition-colors"
                  >
                    {content}
                  </Link>
                ) : (
                  <button
                    key={item.label}
                    className="w-full flex items-center justify-between py-3 hover:bg-gray-50 rounded-lg px-2 transition-colors"
                  >
                    {content}
                  </button>
                );
              })}
            </div>
          </section>
        ))}

        {/* App Info */}
        <section className="px-5 py-4 bg-white mt-2">
          <div className="text-center text-sm text-gray-500 space-y-1">
            <p>펫푸드 레시피 v1.0.0</p>
            <div className="flex items-center justify-center gap-4 mt-3">
              <button className="hover:text-orange-500">이용약관</button>
              <span className="text-gray-300">|</span>
              <button className="hover:text-orange-500">개인정보처리방침</button>
            </div>
          </div>
        </section>

        {/* Logout Button */}
        <section className="px-5 py-4">
          <button className="w-full flex items-center justify-center gap-2 py-3 text-red-500 hover:bg-red-50 rounded-xl transition-colors">
            <LogOut className="w-5 h-5" />
            <span>로그아웃</span>
          </button>
        </section>

        {/* Bottom Padding */}
        <div className="h-8" />
      </div>

      <BottomNav />
    </div>
  );
}
