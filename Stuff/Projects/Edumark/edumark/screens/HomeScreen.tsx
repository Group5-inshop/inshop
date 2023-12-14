import { View, Text, ScrollView, Alert, BackHandler } from "react-native";
//creating the home screen interface
import { EvilIcons } from "@expo/vector-icons";
import { styles } from "../styles";
import { CourseTemplate, FAB } from "../components";
import { StatusBar } from "expo-status-bar";
import { useCallback } from "react";
import { useFocusEffect } from "@react-navigation/native";

// adding the home screen features
export const HomeScreen = () => {
  // Exit app disclaimer
  useFocusEffect(
    useCallback(() => {
      const backButtonPress = () => {
        Alert.alert(
          "Exit",
          "Are you sure you want to exit edumark?",
          [
            {
              text: "Cancel",
              onPress: () => null,
              style: "cancel",
            },
            { text: "Exit", onPress: () => BackHandler.exitApp() },
          ],
          { cancelable: true }
        );
        return true;
      };

      const backHandler = BackHandler.addEventListener(
        "hardwareBackPress",
        backButtonPress
      );

      return () => backHandler.remove();
    }, [])
  );

  return (
    <View className="relative h-screen">
      <StatusBar style="light" backgroundColor="#0ea5e9" />

      <View className="bg-sky-500 flex-row px-3 py-2 justify-between items-center border-b-[1px] border-gray-300">
        <Text
          className="text-white text-xl tracking-widest"
          style={styles.boldText}
        >
          EduMark
        </Text>
        <EvilIcons name="user" size={40} color="white" />
      </View>

      <ScrollView className="h-screen bg-gray-100">
        <View>
          <View className="w-screen px-4 py-5">
            <CourseTemplate />
            <CourseTemplate />
            <CourseTemplate />
            <CourseTemplate />
            <CourseTemplate />
            <CourseTemplate />
            <CourseTemplate />
          </View>
        </View>
      </ScrollView>

      <FAB />
    </View>
  );
};
