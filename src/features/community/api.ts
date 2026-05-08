import { request } from "../../shared/api/http";

type ApiEnvelope<T> = {
  data?: T;
  result?: T;
  content?: T;
};

export type CommunityPost = {
  postId: number;
  userId?: number;
  postTitle?: string;
  postContent?: string;
  postContentPreview?: string;
  postImageUrl?: string;
  postCategory?: string;
  likeCount?: number;
  commentCount?: number;
  createdAt?: string;
};

export async function getCommunityPosts(): Promise<CommunityPost[]> {
  const response = await request<
    ApiEnvelope<CommunityPost[]> | { content?: CommunityPost[] } | CommunityPost[]
  >("/api/community/posts", { auth: true });

  if (Array.isArray(response)) {
    return response;
  }

  const mapped = response as ApiEnvelope<CommunityPost[]> & { content?: CommunityPost[] };
  return mapped.content ?? mapped.data ?? mapped.result ?? [];
}
