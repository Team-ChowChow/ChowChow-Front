import { request } from "../../shared/api/http";

type ApiEnvelope<T> = {
  data?: T;
  result?: T;
  content?: T;
};

export type Pet = {
  petId: number;
  petName: string;
  petType?: string;
  breedName?: string;
  petProfileImageUrl?: string;
  allergyIds?: number[];
};

export async function getMyPets(): Promise<Pet[]> {
  const response = await request<ApiEnvelope<Pet[]> | Pet[]>("/api/pets", {
    auth: true,
  });

  if (Array.isArray(response)) {
    return response;
  }

  return response.data ?? response.result ?? response.content ?? [];
}
