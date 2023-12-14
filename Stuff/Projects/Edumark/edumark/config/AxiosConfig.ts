import axios from "axios";

const AxiosApi = axios.create({ baseURL: "http://192.168.43.64:8080" });

AxiosApi.interceptors.response.use(
  (response) => response,
  (error) => Promise.resolve(error.response.data)
);

export { AxiosApi };
