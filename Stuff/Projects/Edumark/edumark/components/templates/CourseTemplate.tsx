import { Text, View, ImageBackground, TouchableOpacity } from "react-native";
import { course1 } from "../../assets/images";
import { styles } from "../../styles";
import { useNavigation } from "@react-navigation/native";

export const CourseTemplate = () => {
  const navigation = useNavigation();

  return (
    <TouchableOpacity
      activeOpacity={0.7}
      onPress={() =>
        navigation.navigate("courseStudents", {
          courseTitle: "COM313: COMPUTER SECURITY",
        })
      }
      className="w-full h-[150px] mb-4"
    >
      <ImageBackground
        source={course1}
        resizeMode="cover"
        className="w-full h-full relative rounded-lg overflow-hidden"
      >
        <View className="h-full py-4 px-3 relative z-10 justify-between">
          <Text style={styles.boldText} className="text-white/80 text-xl">
            COM313: COMPUTER SECURITY
          </Text>
          <Text style={styles.semiboldText} className="text-white/80 text-xs">
            Thandiwe Ng'oma
          </Text>
        </View>

        <View className="absolute h-full w-full bg-black/30 bottom-0 left-0"></View>
      </ImageBackground>
    </TouchableOpacity>
  );
};
