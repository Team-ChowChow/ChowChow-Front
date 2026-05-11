import { createBrowserRouter } from "react-router";
import { Home } from "./pages/Home";
import { Search } from "./pages/Search";
import { Community } from "./pages/Community";
import { Profile } from "./pages/Profile";
import { Login } from "./pages/Login";
import { Signup } from "./pages/Signup";
import { FindId } from "./pages/FindID";
import { FindPassword } from "./pages/FindPW";
import { ChangePassword } from "./pages/ChangePassword";
import { Character } from "./pages/Character";
import { AIChat } from "./pages/AIChat";
import { RecipeGeneration } from "./pages/RecipeGeneration";
import { AppSettings } from "./pages/AppSettings";

// Router configuration
export const router = createBrowserRouter([
  {
    path: "/",
    Component: Home,
  },
  {
    path: "/search",
    Component: Search,
  },
  {
    path: "/community",
    Component: Community,
  },
  {
    path: "/profile",
    Component: Profile,
  },
  {
    path: "/login",
    Component: Login,
  },
  {
    path: "/signup",
    Component: Signup,
  },
  {
    path: "/find-id",
    Component: FindId,
  },
  {
    path: "/find-password",
    Component: FindPassword,
  },
  {
    path: "/change-password",
    Component: ChangePassword,
  },
  {
    path: "/character",
    Component: Character,
  },
  {
    path: "/ai-chat",
    Component: AIChat,
  },
  {
    path: "/recipe-generation",
    Component: RecipeGeneration,
  },
  {
    path: "/app-settings",
    Component: AppSettings,
  },
]);