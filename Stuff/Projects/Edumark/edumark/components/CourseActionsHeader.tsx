import { View, Text, Pressable, TouchableOpacity } from "react-native";
import { styles } from "../styles";
import { Ionicons } from "@expo/vector-icons";
import { useNavigation } from "@react-navigation/native";
import { CourseActionsHeaderT } from "../types";

export const CourseActionsHeader = (props: CourseActionsHeaderT) => {
  const navigation = useNavigation();

  return (
    <View className="flex-row justify-between items-center p-3 border-b-[1px] border-gray-300">
      <View className="flex-row items-center">
        <Pressable
          android_ripple={{ color: "#d1d5db" }}
          onPress={() => navigation.goBack()}
          className="-mb-1"
        >
          <Ionicons name="close" size={26} color="#6b7280" />
        </Pressable>

        <Text
          style={styles.regularText}
          className="text-base ml-3 tracking-wide"
        >
          {props.headerTitle}
        </Text>
      </View>
      <View>
        <TouchableOpacity
          activeOpacity={0.7}
          className={`${
            props.inputValue.length < 4 ? "bg-gray-200" : "bg-sky-600"
          }  px-6 py-3 rounded`}
          disabled={props.inputValue.length < 4}
          onPress={props.onPressButton}
        >
          <Text
            style={styles.semiboldText}
            className={`${
              props.inputValue.length < 4 ? "text-gray-400" : "text-white"
            } text-xs tracking-wide`}
          >
            {props.buttonTitle}
          </Text>
        </TouchableOpacity>
      </View>
    </View>
  );
};
