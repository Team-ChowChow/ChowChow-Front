import { clearAccessToken, request, setAccessToken } from "../../shared/api/http";
import { supabase } from "../../shared/auth/supabase";

type ApiEnvelope<T> = {
  data?: T;
  result?: T;
  message?: string;
  accessToken?: string;
  token?: string;
};

export type LoginPayload = {
  email: string;
  password: string;
};

export async function login(payload: LoginPayload): Promise<void> {
  const { data, error } = await supabase.auth.signInWithPassword({
    email: payload.email,
    password: payload.password,
  });
  if (error) {
    throw new Error(error.message);
  }

  const token = data.session?.access_token;
  if (!token) {
    throw new Error("Supabase access token을 가져오지 못했습니다.");
  }
  setAccessToken(token);

  await request<ApiEnvelope<unknown>>("/api/auth/sync", {
    method: "POST",
    auth: true,
  });
}

export async function logout(): Promise<void> {
  try {
    await supabase.auth.signOut();
    await request("/api/auth/logout", {
      method: "POST",
      auth: true,
    });
  } finally {
    clearAccessToken();
  }
}
