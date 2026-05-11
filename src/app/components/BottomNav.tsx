import { Home, Search, User, Users } from "lucide-react";
import { Link, useLocation } from "react-router";

export function BottomNav() {
  const location = useLocation();
  
  const isActive = (path: string) => location.pathname === path;
  
  return (
    <nav className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 z-50">
      <div className="grid grid-cols-5 items-center h-16 max-w-md mx-auto px-4 relative">
        <Link
          to="/"
          className={`flex flex-col items-center gap-1 justify-self-start ${
            isActive("/") ? "text-orange-500" : "text-gray-400"
          }`}
        >
          <Home className="w-6 h-6" fill={isActive("/") ? "currentColor" : "none"} />
          <span className="text-xs">홈</span>
        </Link>
        
        <Link
          to="/search"
          className={`flex flex-col items-center gap-1 justify-self-center ${
            isActive("/search") ? "text-orange-500" : "text-gray-400"
          }`}
        >
          <Search className="w-6 h-6" fill={isActive("/search") ? "currentColor" : "none"} />
          <span className="text-xs">검색</span>
        </Link>
        
        {/* Character Button - Centered and Elevated */}
        <Link
          to="/character"
          className="flex justify-center -top-8 relative"
        >
          <div className="w-16 h-16 bg-gradient-to-br from-orange-400 to-orange-500 rounded-full shadow-lg flex items-center justify-center hover:from-orange-500 hover:to-orange-600 transition-all hover:scale-105 border-4 border-white">
            <span className="text-2xl">🐾</span>
          </div>
        </Link>
        
        <Link
          to="/community"
          className={`flex flex-col items-center gap-1 justify-self-center ${
            isActive("/community") ? "text-orange-500" : "text-gray-400"
          }`}
        >
          <Users className="w-6 h-6" fill={isActive("/community") ? "currentColor" : "none"} />
          <span className="text-xs">커뮤니티</span>
        </Link>
        
        <Link
          to="/profile"
          className={`flex flex-col items-center gap-1 justify-self-end ${
            isActive("/profile") ? "text-orange-500" : "text-gray-400"
          }`}
        >
          <User className="w-6 h-6" fill={isActive("/profile") ? "currentColor" : "none"} />
          <span className="text-xs">프로필</span>
        </Link>
      </div>
    </nav>
  );
}