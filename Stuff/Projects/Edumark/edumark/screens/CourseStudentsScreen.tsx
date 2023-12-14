import { View, ScrollView } from "react-native";
import { CourseStudentTemplate, QRCodeScannerModal } from "../components";
import { useState } from "react";

export const CourseStudentsScreen = () => {
  const [showModal, setShowModal] = useState(true);

  return (
    <View className="mt-3">
      <ScrollView className="h-screen w-screen" showsHorizontalScrollIndicator={false}>
        <CourseStudentTemplate fullName="Bheki Thandani" regNumber="BSC-40-20" attendanceStatus="present" />
        <CourseStudentTemplate fullName="Bheki Thandani" regNumber="BSC-40-20" attendanceStatus="abscent" />
        <CourseStudentTemplate fullName="Bheki Thandani" regNumber="BSC-40-20" attendanceStatus="abscent" />
        <CourseStudentTemplate fullName="Bheki Thandani" regNumber="BSC-40-20" attendanceStatus="present" />
        <CourseStudentTemplate fullName="Bheki Thandani" regNumber="BSC-40-20" attendanceStatus="abscent" />
        <CourseStudentTemplate fullName="Bheki Thandani" regNumber="BSC-40-20" attendanceStatus="abscent" />
        <CourseStudentTemplate fullName="Bheki Thandani" regNumber="BSC-40-20" attendanceStatus="present" />
      </ScrollView>

      <QRCodeScannerModal
        visible={showModal}
        onRequestClose={() => setShowModal(false)}
        onDismiss={() => setShowModal(false)}
      />
    </View>
  );
};
