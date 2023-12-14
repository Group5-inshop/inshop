import { View, Text, TextInput, Alert } from "react-native";
import { styles } from "../styles";
import { useState } from "react";
import { InputEventT } from "../types";
import { CourseActionsHeader } from "../components";

export const CreateCourseScreen = () => {
  const [courseTitle, setCourseTitle] = useState("");

  // create the course
  const createCourse = async () => {};

  // disclaimer for creating the course
  const createCourseDisclaimer = () => {
    Alert.alert(
      "Create Course",
      `Are you sure you want to create ${courseTitle}?`,
      [
        {
          text: "Cancel",
          onPress: () => null,
          style: "cancel",
        },
        { text: "Continue", onPress: createCourse },
      ],
      { cancelable: true }
    );
  };

  return (
    <View className="h-screen w-screen bg-white">
      <CourseActionsHeader
        headerTitle="Create Course"
        buttonTitle="Create"
        inputValue={courseTitle}
        onPressButton={createCourseDisclaimer}
      />

      <View className="py-5 mx-5 border-b-[1px] border-gray-300">
        <Text style={styles.regularText}>Your're currently signed in as</Text>

        <View className="mt-4">
          <Text style={styles.semiboldText} className="text-lg">
            Thandiwe Ng'oma
          </Text>
          <Text style={styles.regularText} className="text-gray-500">
            bsc-40-20@unima.ac.mw
          </Text>
        </View>
      </View>

      <View className="py-3 px-5">
        <Text style={styles.regularText} className="text-xs">
          Enter the course title here!
        </Text>

        <View className="mt-4">
          <TextInput
            placeholder="Course Title"
            className="px-4 h-14 text-gray-900 border-[1px] border-gray-300 focus:border-2 focus:border-sky-600 rounded"
            cursorColor={"#0284c7"}
            value={courseTitle}
            onChange={({ nativeEvent }: InputEventT) => {
              setCourseTitle(nativeEvent.text);
            }}
            maxLength={6}
            style={styles.regularText}
          />
        </View>
      </View>
    </View>
  );
};
