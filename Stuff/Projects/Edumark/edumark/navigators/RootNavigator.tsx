import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { RootStackParamsList } from "../types";
import {
  CourseStudentsScreen,
  CreateCourseScreen,
  HomeScreen,
  JoinCourseScreen,
  LoginScreen,
  RegisterScreen,
  WelcomeScreen,
} from "../screens";

const RootStack = createNativeStackNavigator<RootStackParamsList>();

export const RootNavigator = () => {
  return (
    <RootStack.Navigator
      initialRouteName="welcome"
      screenOptions={{
        headerShown: false,
        animation: "fade_from_bottom",
        animationDuration: 800,
        headerShadowVisible: false,
      }}
    >
      <RootStack.Group>
        <RootStack.Screen
          name="home"
          component={HomeScreen}
          options={{
            animation: "slide_from_right",
          }}
        />
        <RootStack.Screen name="login" component={LoginScreen} />
        <RootStack.Screen name="register" component={RegisterScreen} />
        <RootStack.Screen name="welcome" component={WelcomeScreen} />
        <RootStack.Screen
          name="courseStudents"
          component={CourseStudentsScreen}
          options={({ route }) => ({
            title: route.params?.courseTitle,
            headerShown: true,
            animation: "default",
            headerTintColor: "white",
            headerStyle: {
              backgroundColor: "#0ea5e9",
            },
            headerTitleStyle: {
              fontSize: 16
            },
          })}
        />
        <RootStack.Screen
          name="joinCource"
          component={JoinCourseScreen}
          options={{
            animation: "slide_from_right",
          }}
        />
        <RootStack.Screen name="createCource" component={CreateCourseScreen} />
      </RootStack.Group>
    </RootStack.Navigator>
  );
};
