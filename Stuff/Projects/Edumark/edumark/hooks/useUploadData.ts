import { useState } from "react";
import { AxiosApi } from "../config";

export const useUploadData = <T, K = never>() => {
  const [resData, setResData] = useState<K | null>(null);

  const uploadData = async (endpoint: string, data: T) => {
    try {
      const res = await AxiosApi.post(`/${endpoint}`, data);
    } catch (error) {}
  };

  return { uploadData, resData };
};
