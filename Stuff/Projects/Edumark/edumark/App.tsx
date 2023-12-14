import "react-native-gesture-handler";
import { StatusBar } from "expo-status-bar";
import { SafeAreaView } from "react-native-safe-area-context";
import { NavigationContainer } from "@react-navigation/native";
import { RootNavigator } from "./navigators";
import { useEffect, useCallback, useState } from "react";
import * as SplashScreen from "expo-splash-screen";
import * as Font from "expo-font";
import {
  NunitoSansBold,
  NunitoSansLight,
  NunitoSansRegular,
  NunitoSansSemiBold,
} from "./assets/fonts";

// preventing the default splash screen behaviour
SplashScreen.preventAutoHideAsync();

export default function App() {
  const [loadScreens, setLoadScreens] = useState(false);

  useEffect(() => {
    const loadFonts = async () => {
      try {
        await Font.loadAsync({
          light: NunitoSansLight,
          regular: NunitoSansRegular,
          semibold: NunitoSansSemiBold,
          bold: NunitoSansBold,
        });
        await new Promise((resolve) => setTimeout(resolve, 1000));
      } catch (e) {
        console.warn(e);
      } finally {
        setLoadScreens(true);
      }
    };

    loadFonts();
  }, []);

  const onLayoutRootView = useCallback(async () => {
    if (loadScreens) {
      await SplashScreen.hideAsync();
    }
  }, [loadScreens]);

  if (!loadScreens) {
    return null;
  }

  return (
    <SafeAreaView className="h-full w-full" onLayout={onLayoutRootView}>
      <StatusBar style="dark" backgroundColor="#fff" />

      <NavigationContainer>
        <RootNavigator />
      </NavigationContainer>
    </SafeAreaView>
  );
}
