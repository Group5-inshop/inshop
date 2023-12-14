export type LoginDataT = {
  email: string;
  password: string;
};

export type RegisterDataT = Pick<LoginDataT, "password"> & {
  fullName: string;
  regNumber: string;
};
