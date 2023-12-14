import { TouchableOpacity } from "react-native";
import { MaterialIcons } from "@expo/vector-icons";
import { useNavigation } from "@react-navigation/native";

export const FAB = () => {
  const navigation = useNavigation();
  return (
    <TouchableOpacity
      activeOpacity={0.6}
      className="absolute bg-sky-500 rounded-full p-4 bottom-5 right-5"
      onPress={() => navigation.navigate("joinCource")}
    >
      <MaterialIcons name="add" size={24} color="white" />
    </TouchableOpacity>
  );
};
