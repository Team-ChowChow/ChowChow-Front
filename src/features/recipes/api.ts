import { request } from "../../shared/api/http";

type ApiEnvelope<T> = {
  data?: T;
  result?: T;
  content?: T;
};

export type Recipe = {
  recipeId: number;
  recipeTitle: string;
  recipeDescription?: string;
  recipePurpose?: string;
  isAiGenerated?: boolean;
  isPublic?: boolean;
  createdAt?: string;
};

export async function getRecipes(): Promise<Recipe[]> {
  const response = await request<ApiEnvelope<Recipe[]> | Recipe[]>("/api/v1/recipes", {
    auth: true,
  });

  if (Array.isArray(response)) {
    return response;
  }

  return response.data ?? response.result ?? response.content ?? [];
}
