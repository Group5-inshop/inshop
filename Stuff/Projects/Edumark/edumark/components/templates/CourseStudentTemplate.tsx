import { View, Text } from "react-native";
import { styles } from "../../styles";
import { CourseStudentT } from "../../types";

export const CourseStudentTemplate = (props: CourseStudentT) => {
  return (
    <View className="px-4">
      <View className="px-4 py-2 bg-white border-[1px] border-gray-300 mb-2 flex-row justify-between items-center rounded">
        <View>
          <Text style={styles.boldText} className="capitalize text-md">
            {props.fullName}
          </Text>
          <Text style={styles.regularText} className="capitalize text-sm">
            {props.regNumber}
          </Text>
        </View>

        <View>
          <Text
            style={styles.regularText}
            className={`capitalize text-md ${
              props.attendanceStatus === "abscent"
                ? "text-red-500"
                : "text-sky-500"
            }`}
          >
            {props.attendanceStatus}
          </Text>
        </View>
      </View>
    </View>
  );
};
