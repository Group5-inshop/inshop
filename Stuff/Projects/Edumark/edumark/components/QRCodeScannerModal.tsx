import {
  View,
  Text,
  Modal,
  ModalProps,
  Image,
  Pressable,
  Alert,
} from "react-native";
import {
  CameraType,
  Camera as ExpoCamera,
  BarCodeScanningResult,
} from "expo-camera";
import { useState } from "react";
import { styles } from "../styles";
import { qrCode } from "../assets/images";

type Props = Pick<ModalProps, "visible" | "onDismiss" | "onRequestClose">;

export const QRCodeScannerModal = (props: Props) => {
  const [scan, setScan] = useState(false);
  const [permission, requestPermission] = ExpoCamera.useCameraPermissions();
  const [setScannerStatus, setSetScannerStatus] = useState(undefined);

  const scannedStudentId = ({ data: regNumber }: BarCodeScanningResult) => {
    setScan(false);

    Alert.alert("ID DETAILS", `${regNumber}`, [
      {
        text: "Ok",
        style: "default",
        onPress: props.onDismiss,
      },
    ]);
  };
  // states for the camera access to scan QR Code
  if (!permission) {
    return (
      <Text style={styles.regularText}>
        Requesting for camera permission...
      </Text>
    );
  }
  if (!permission.granted) {
    return (
      <View className="bg-black/50 absolute top h-screen w-screen items-center justify-center">
        <Text style={styles.regularText}>
          We don't have access to your camera
        </Text>
        <Pressable
          android_ripple={{ color: "white" }}
          className="bg-sky-500 px-6 py-3 rounded w-[200px] mt-6"
          onPress={requestPermission}
        >
          <Text style={styles.semiboldText} className="text-white text-center">
            Grant Access
          </Text>
        </Pressable>
      </View>
    );
  }

  return (
    <Modal
      visible={props.visible}
      animationType="slide"
      transparent
      onRequestClose={props.onRequestClose}
    >
      <View className="h-screen w-screen bg-black/50 justify-center px-4 relative">
        <View className="bg-white rounded py-8 px-4">
          <Text style={styles.boldText} className="text-center text-xl mb-4">
            Scan the Student ID
          </Text>

          <View className="w-full">
            {scan ? (
              <ExpoCamera
                className="w-full h-[250px] object-cover"
                type={CameraType.back}
                onBarCodeScanned={scannedStudentId}
                autoFocus={true}
                ratio="16:16"
              />
            ) : (
              <View className="items-center">
                <Image
                  source={qrCode}
                  resizeMode="contain"
                  className="w-full h-[230px]"
                />
                <Pressable
                  android_ripple={{ color: "white" }}
                  className="bg-sky-500 px-6 py-3 rounded w-[200px] mt-6"
                  onPress={() => setScan(true)}
                >
                  <Text
                    style={styles.semiboldText}
                    className="text-white text-center"
                  >
                    Scan Now
                  </Text>
                </Pressable>
              </View>
            )}
          </View>
        </View>
      </View>
    </Modal>
  );
};
