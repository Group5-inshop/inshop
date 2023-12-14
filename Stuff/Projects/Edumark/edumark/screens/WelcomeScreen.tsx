// creating a welcome screen interface
import { edumarkLogo2 } from "../assets/images";
import { Text, View, Image, TouchableOpacity } from "react-native";
import { useNavigation } from "@react-navigation/native";
import { styles } from "../styles";
// adding features to the welcome screen
export const WelcomeScreen = () => {
  const navigation = useNavigation();

  return (
    <View className="h-screen bg-sky-500 relative py-6 px-4 justify-between">
      <View className=" pl-50 z-20">
        <Image
          source={edumarkLogo2}
          resizeMode="contain"
          className="w-[170px]"
          style={{ width: 80, height: 50 }}
        />
      </View>

      <View className="gap-y-8">
        <View className="gap-y-2">
          <Text className="text-white text-4xl" style={styles.boldText}>
            Welcome To Edumark!
          </Text>

          <Text className="text-white text-sm" style={styles.lightText}>
            An online exam attendance management system
          </Text>
        </View>

        <View className="gap-y-3">
          <TouchableOpacity
            className="bg-white p-2 rounded border-2 border-white"
            onPress={() => navigation.navigate("login")}
          >
            <Text
              className="text-sky-500 text-center text-xl"
              style={styles.boldText}
            >
              Login
            </Text>
          </TouchableOpacity>

          <TouchableOpacity
            className="bg-transparent p-2 rounded border-2 border-white"
            onPress={() => navigation.navigate("register")}
          >
            <Text
              className="text-white text-center text-xl"
              style={styles.boldText}
            >
              Register
            </Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  );
};
