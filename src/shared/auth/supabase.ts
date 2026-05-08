import { createClient } from "@supabase/supabase-js";
import { env } from "../config/env";

const missingConfigMessage =
  "Supabase 설정이 누락되었습니다. .env 파일에 VITE_SUPABASE_URL, VITE_SUPABASE_ANON_KEY를 입력해 주세요.";

if (!env.supabaseUrl || !env.supabaseAnonKey) {
  // Early throw to fail fast in development.
  throw new Error(missingConfigMessage);
}

export const supabase = createClient(env.supabaseUrl, env.supabaseAnonKey, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
  },
});
