import { request } from "../../shared/api/http";

type ApiEnvelope<T> = {
  data?: T;
  result?: T;
};

export type UserProfile = {
  userId?: number;
  userName?: string;
  userNickname?: string;
  userProfileImg?: string;
  userStatus?: string;
};

export async function getMyProfile(): Promise<UserProfile | null> {
  const response = await request<ApiEnvelope<UserProfile> | UserProfile>("/api/users/me", {
    auth: true,
  });

  if (!response || typeof response !== "object") {
    return null;
  }

  const maybeEnvelope = response as ApiEnvelope<UserProfile>;
  if (maybeEnvelope.data || maybeEnvelope.result) {
    return maybeEnvelope.data ?? maybeEnvelope.result ?? null;
  }

  return response as UserProfile;
}
