const fallbackApiBaseUrl = "http://localhost:8080";

export const env = {
  apiBaseUrl: (import.meta.env.VITE_API_BASE_URL as string | undefined) ?? fallbackApiBaseUrl,
  apiTimeoutMs: Number(import.meta.env.VITE_API_TIMEOUT_MS ?? 10000),
  supabaseUrl: (import.meta.env.VITE_SUPABASE_URL as string | undefined) ?? "",
  supabaseAnonKey: (import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined) ?? "",
};
