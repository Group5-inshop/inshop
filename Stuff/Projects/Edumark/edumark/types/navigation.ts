import type { NativeStackScreenProps } from "@react-navigation/native-stack";

export type RootStackParamsList = {
  welcome: undefined;
  home: undefined;
  login: undefined;
  register: undefined;
  joinCource: undefined;
  createCource: undefined;
  courseStudents: { courseTitle?: string };
};

export type RootStackScreenProps<T extends keyof RootStackParamsList> =
  NativeStackScreenProps<RootStackParamsList, T>;

declare global {
  namespace ReactNavigation {
    interface RootParamList extends RootStackParamsList {}
  }
}
