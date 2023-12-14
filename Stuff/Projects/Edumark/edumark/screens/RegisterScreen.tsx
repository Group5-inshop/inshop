// creating a register screen interface
import {
  View,
  Text,
  TouchableOpacity,
  TextInput,
  ScrollView,
  Image,
} from "react-native";
import { Entypo } from "@expo/vector-icons";
import { useState } from "react";
import { useNavigation } from "@react-navigation/native";
import { FontAwesome5 } from "@expo/vector-icons";
import { SimpleLineIcons } from "@expo/vector-icons";
import { Ionicons } from "@expo/vector-icons";
import { wave2 } from "../assets/images";
import { InputEventT, RegisterDataT } from "../types";
import { styles } from "../styles";
// adding features to the register screen
export const RegisterScreen = () => {
  const [showPassword, setShowPassword] = useState(false);
  const [loginData, setLoginData] = useState<RegisterDataT>({
    fullName: "",
    regNumber: "",
    password: "",
  });
  const navigation = useNavigation();

  return (
    <ScrollView className="h-screen bg-sky-500">
      <View className="h-screen justify-between">
        <View className="pt-4 pl-6">
          <TouchableOpacity onPress={() => navigation.goBack()}>
            <Entypo name="chevron-small-left" size={34} color="white" />
          </TouchableOpacity>

          <View className="mt-[15%]">
            <Text className="text-white text-4xl" style={styles.boldText}>
              Student
            </Text>
            <Text className="text-white text-4xl mt-1" style={styles.boldText}>
              Register
            </Text>
          </View>
        </View>

        <View className="px-5 py-6 bg-white relative">
          <View className="mb-4 relative">
            <View className="absolute z-10 top-[7.5px] left-2">
              <FontAwesome5 name="user" size={24} color="#94a3b8" />
            </View>

            <TextInput
              placeholder="Fullname"
              className="pl-10 pr-5 h-10 text-sky-600 border-b-[1px] border-gray-300 focus:border-b-2 focus:border-sky-500"
              cursorColor={"#0ea5e9"}
              value={loginData.fullName}
              onChange={({ nativeEvent }: InputEventT) => {
                setLoginData((prevState) => ({
                  ...prevState,
                  fullName: nativeEvent.text,
                }));
              }}
              style={styles.regularText}
            />
          </View>

          <View className="mb-4 relative">
            <View className="absolute z-10 top-[7.5px] left-2">
              <SimpleLineIcons name="graduation" size={24} color="#94a3b8" />
            </View>

            <TextInput
              placeholder="Registration Number"
              className="pl-10 pr-5 h-10 text-sky-600 border-b-[1px] border-gray-300 focus:border-b-2 focus:border-sky-500"
              cursorColor={"#0ea5e9"}
              value={loginData.fullName}
              onChange={({ nativeEvent }: InputEventT) => {
                setLoginData((prevState) => ({
                  ...prevState,
                  regNumber: nativeEvent.text,
                }));
              }}
              style={styles.regularText}
            />
          </View>

          <View className="mb-4 relative">
            <View className="absolute z-10 top-[7.5px] left-2">
              <Ionicons
                name="ios-lock-closed-outline"
                size={24}
                color="#94a3b8"
              />
            </View>

            <TextInput
              placeholder="Password"
              className="pl-10 pr-5 h-10 text-sky-600 border-b-[1px] border-gray-300 focus:border-b-2 focus:border-sky-500"
              cursorColor={"#0ea5e9"}
              secureTextEntry={!showPassword}
              value={loginData.password}
              onChange={({ nativeEvent }: InputEventT) => {
                setLoginData((prevState) => ({
                  ...prevState,
                  password: nativeEvent.text,
                }));
              }}
              style={styles.regularText}
            />

            {loginData.password && (
              <TouchableOpacity
                activeOpacity={0.7}
                className="absolute right-2 bg-gray-200 top-[10px] px-2 py-1 rounded-full"
                onPress={() => setShowPassword((prevState) => !prevState)}
              >
                <Text className="text-[8px]" style={styles.semiboldText}>
                  {showPassword ? "Hide" : "Show"}
                </Text>
              </TouchableOpacity>
            )}
          </View>

          <View className="mt-6">
            <TouchableOpacity
              className="bg-sky-500 p-2 rounded"
              onPress={() => navigation.navigate("home")}
            >
              <Text
                className="text-white text-center text-xl"
                style={styles.boldText}
              >
                Register
              </Text>
            </TouchableOpacity>

            <View className="mt-5 text-[17px] flex-row items-center">
              <Text className="text-gray-500" style={styles.lightText}>
                Already have an account?
              </Text>

              <TouchableOpacity onPress={() => navigation.navigate("login")}>
                <Text
                  className="text-sky-500 ml-2"
                  style={styles.boldText}
                >
                  Login!
                </Text>
              </TouchableOpacity>
            </View>

            {/* <View className="mt-4">
              <View className="relative mb-4">
                <View className="h-[1px] w-full bg-gray-300"></View>
                <Text className="font-bold text-lg text-gray-400 text-center absolute left-1/2 -top-[13px] bg-white px-2">
                  or
                </Text>
              </View>

              <TouchableOpacity
                className="bg-transparent p-2 rounded border-2 border-gray-300"
                onPress={() => navigation.navigate("login")}
              >
                <Text className="text-gray-500 text-center text-xl font-semibold">
                  Login
                </Text>
              </TouchableOpacity>
            </View> */}
          </View>

          <Image
            source={wave2}
            resizeMode="cover"
            className="w-screen h-[75px] absolute -top-[26%] left-0"
          />
        </View>
      </View>
    </ScrollView>
  );
};
