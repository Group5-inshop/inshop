import {
  View,
  Text,
  TextInput,
} from "react-native";
import { styles } from "../styles";
import { useState } from "react";
import { InputEventT } from "../types";
import { CourseActionsHeader } from "../components";

export const JoinCourseScreen = () => {
  const [classCode, setClassCode] = useState("");

  // api request to join class
  const joinClass = async () => {
    
  };

  return (
    <View className="h-screen w-screen bg-white">
      <CourseActionsHeader
        headerTitle="Create Course"
        buttonTitle="Create"
        inputValue={classCode}
        onPressButton={joinClass}
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
          Do you have a class code? Enter it here!
        </Text>

        <View className="mt-4">
          <TextInput
            placeholder="Class Code"
            className="px-4 h-14 text-gray-900 border-[1px] border-gray-300 focus:border-2 focus:border-sky-600 rounded"
            cursorColor={"#0284c7"}
            value={classCode}
            onChange={({ nativeEvent }: InputEventT) => {
              setClassCode(nativeEvent.text);
            }}
            maxLength={6}
            style={styles.regularText}
          />
        </View>
      </View>
    </View>
  );
};
