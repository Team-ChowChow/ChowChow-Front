import { FormEvent, useEffect, useMemo, useState } from "react";
import { login, logout } from "../features/auth/api";
import { getCommunityPosts, type CommunityPost } from "../features/community/api";
import { getMyPets, type Pet } from "../features/pet/api";
import { getRecipes, type Recipe } from "../features/recipes/api";
import { getMyProfile, type UserProfile } from "../features/user/api";
import { ApiError, getAccessToken } from "../shared/api/http";

type TabKey = "home" | "search" | "community" | "profile";

const fallbackImage =
  "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=600&q=80";

export default function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(Boolean(getAccessToken()));
  const [tab, setTab] = useState<TabKey>("home");
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const [posts, setPosts] = useState<CommunityPost[]>([]);
  const [pets, setPets] = useState<Pet[]>([]);
  const [profile, setProfile] = useState<UserProfile | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [loadError, setLoadError] = useState<string | null>(null);

  useEffect(() => {
    if (!isLoggedIn) {
      return;
    }

    async function bootstrap() {
      setIsLoading(true);
      setLoadError(null);

      try {
        const [recipeData, postData, petData, profileData] = await Promise.all([
          getRecipes(),
          getCommunityPosts(),
          getMyPets(),
          getMyProfile(),
        ]);

        setRecipes(recipeData);
        setPosts(postData);
        setPets(petData);
        setProfile(profileData);
      } catch (error) {
        if (error instanceof ApiError && error.status === 401) {
          setLoadError("토큰이 만료되었거나 유효하지 않습니다. 다시 로그인해 주세요.");
          setIsLoggedIn(false);
          return;
        }
        setLoadError("백엔드 데이터를 불러오지 못했습니다.");
      } finally {
        setIsLoading(false);
      }
    }

    void bootstrap();
  }, [isLoggedIn]);

  if (!isLoggedIn) {
    return <LoginScreen onLoginSuccess={() => setIsLoggedIn(true)} />;
  }

  return (
    <main className="phone-shell">
      <section className="screen-content">
        {loadError ? <p className="error-text">{loadError}</p> : null}
        {isLoading ? <p className="muted">백엔드 데이터 동기화 중...</p> : null}
        {tab === "home" && <HomeScreen recipes={recipes} />}
        {tab === "search" && <SearchScreen recipes={recipes} />}
        {tab === "community" && <CommunityScreen posts={posts} />}
        {tab === "profile" && (
          <ProfileScreen
            profile={profile}
            pets={pets}
            onLogout={async () => {
              await logout();
              setIsLoggedIn(false);
            }}
          />
        )}
      </section>
      <BottomNav tab={tab} onChange={setTab} />
    </main>
  );
}

function LoginScreen({ onLoginSuccess }: { onLoginSuccess: () => void }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  const canSubmit = email.trim().length > 0 && password.trim().length > 0;

  async function handleLogin(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (!canSubmit) {
      return;
    }

    setErrorMessage(null);
    setIsSubmitting(true);

    try {
      await login({ email: email.trim(), password });
      onLoginSuccess();
    } catch {
      setErrorMessage("로그인에 실패했습니다. Supabase 계정 정보와 .env 설정을 확인해 주세요.");
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <main className="phone-shell login-shell">
      <section className="screen-content login-content">
        <div className="logo-circle">🐾</div>
        <h1 className="brand-title">펫푸드 레시피</h1>
        <p className="brand-subtitle">백엔드 API 연결 모드</p>

        <form className="login-form" onSubmit={handleLogin}>
          <label className="field-label">이메일</label>
          <input
            className="field-input"
            placeholder="이메일을 입력하세요"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
          />

          <label className="field-label">비밀번호</label>
          <input
            className="field-input"
            placeholder="비밀번호를 입력하세요"
            type="password"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
          />

          <button className="primary-btn" disabled={!canSubmit || isSubmitting} type="submit">
            {isSubmitting ? "로그인 중..." : "Supabase 로그인"}
          </button>
        </form>

        {errorMessage ? <p className="error-text">{errorMessage}</p> : null}
      </section>
    </main>
  );
}

function HomeScreen({ recipes }: { recipes: Recipe[] }) {
  const visibleRecipes = useMemo(() => recipes.slice(0, 4), [recipes]);

  return (
    <div className="page">
      <header className="top-bar">
        <h2>펫푸드 레시피</h2>
        <div className="coin-pill">API 연결됨</div>
      </header>

      <article className="hero-card">
        <img src={fallbackImage} alt="대표 레시피" />
        <div className="hero-title">{visibleRecipes[0]?.recipeTitle ?? "레시피를 불러오는 중"}</div>
      </article>

      <section className="ai-card">
        <p className="ai-label">AI 셰프</p>
        <h3>/api/ai/diet/recommend 연동 준비 완료</h3>
        <p>현재는 목록 조회 중심으로 연결되어 있으며, 추천 요청은 다음 단계에서 바로 확장 가능합니다.</p>
      </section>

      <h3 className="section-title">공개 레시피</h3>
      <div className="recipe-grid">
        {visibleRecipes.map((recipe) => (
          <article key={recipe.recipeId} className="recipe-mini">
            <img src={fallbackImage} alt={recipe.recipeTitle} />
            <p>{recipe.recipeTitle}</p>
          </article>
        ))}
      </div>
    </div>
  );
}

function SearchScreen({ recipes }: { recipes: Recipe[] }) {
  const [keyword, setKeyword] = useState("");
  const filtered = useMemo(() => {
    if (!keyword.trim()) {
      return recipes;
    }
    const normalized = keyword.trim().toLowerCase();
    return recipes.filter((recipe) => recipe.recipeTitle.toLowerCase().includes(normalized));
  }, [keyword, recipes]);

  return (
    <div className="page">
      <h2 className="page-title">레시피 검색</h2>
      <input
        className="search-box"
        placeholder="요리 이름으로 검색..."
        value={keyword}
        onChange={(event) => setKeyword(event.target.value)}
      />

      <p className="result-text">총 {filtered.length}개의 레시피</p>

      <div className="recipe-list">
        {filtered.map((recipe) => (
          <article key={recipe.recipeId} className="recipe-item">
            <img src={fallbackImage} alt={recipe.recipeTitle} />
            <div>
              <h4>{recipe.recipeTitle}</h4>
              <p>{recipe.recipePurpose ?? "레시피 목적 정보 없음"}</p>
              <small>
                공개 여부: {recipe.isPublic ? "공개" : "비공개"} · AI 생성: {recipe.isAiGenerated ? "Y" : "N"}
              </small>
            </div>
          </article>
        ))}
      </div>
    </div>
  );
}

function CommunityScreen({ posts }: { posts: CommunityPost[] }) {
  const firstPost = posts[0];

  return (
    <div className="page">
      <h2 className="page-title">커뮤니티</h2>
      <p className="muted">`/api/community/posts` 실데이터 연동</p>

      {firstPost ? (
        <article className="post-card">
          <strong>{firstPost.postTitle || "제목 없음"}</strong>
          <p>{firstPost.postContentPreview || firstPost.postContent || "내용 없음"}</p>
          {firstPost.postImageUrl ? <img src={firstPost.postImageUrl} alt="커뮤니티 이미지" /> : null}
        </article>
      ) : (
        <p className="muted">표시할 게시글이 없습니다.</p>
      )}
    </div>
  );
}

function ProfileScreen({
  profile,
  pets,
  onLogout,
}: {
  profile: UserProfile | null;
  pets: Pet[];
  onLogout: () => void;
}) {
  return (
    <div className="page">
      <section className="profile-header">
        <h2>{profile?.userNickname ?? profile?.userName ?? "사용자"}</h2>
        <p>상태: {profile?.userStatus ?? "정보 없음"}</p>
      </section>

      <section className="profile-card">
        <h3>내 반려동물</h3>
        {pets.map((pet) => (
          <div key={pet.petId} className="pet-item">
            <img src={pet.petProfileImageUrl ?? fallbackImage} alt={pet.petName} />
            <div>
              <strong>{pet.petName}</strong>
              <p>
                {pet.petType ?? "타입 정보 없음"} · {pet.breedName ?? "품종 정보 없음"}
              </p>
              <small>알러지 ID: {(pet.allergyIds ?? []).join(", ") || "없음"}</small>
            </div>
          </div>
        ))}
      </section>

      <button className="logout-btn" type="button" onClick={onLogout}>
        로그아웃
      </button>
    </div>
  );
}

function BottomNav({
  tab,
  onChange,
}: {
  tab: TabKey;
  onChange: (tab: TabKey) => void;
}) {
  return (
    <nav className="bottom-nav">
      <button className={tab === "home" ? "nav-btn active" : "nav-btn"} onClick={() => onChange("home")}>
        홈
      </button>
      <button className={tab === "search" ? "nav-btn active" : "nav-btn"} onClick={() => onChange("search")}>
        검색
      </button>
      <button className={tab === "community" ? "nav-btn active" : "nav-btn"} onClick={() => onChange("community")}>
        커뮤니티
      </button>
      <button className={tab === "profile" ? "nav-btn active" : "nav-btn"} onClick={() => onChange("profile")}>
        프로필
      </button>
    </nav>
  );
}
