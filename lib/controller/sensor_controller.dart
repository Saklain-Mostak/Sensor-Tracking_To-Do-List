import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorController extends GetxController {
  var alertMessage = ''.obs;
  var gyroX = <double>[].obs;
  var gyroY = <double>[].obs;
  var gyroZ = <double>[].obs;

  var accelX = <double>[].obs;
  var accelY = <double>[].obs;
  var accelZ = <double>[].obs;

  @override
  void onInit() {
    super.onInit();

    // ignore: deprecated_member_use
    gyroscopeEvents.listen((event) {
      if (gyroX.length > 50) {
        gyroX.removeAt(0);
        gyroY.removeAt(0);
        gyroZ.removeAt(0);
      }
      gyroX.add(event.x);
      gyroY.add(event.y);
      gyroZ.add(event.z);
      checkForHighMovement();
    });

    // ignore: deprecated_member_use
    accelerometerEvents.listen((event) {
      if (accelX.length > 50) {
        accelX.removeAt(0);
        accelY.removeAt(0);
        accelZ.removeAt(0);
      }
      accelX.add(event.x);
      accelY.add(event.y);
      accelZ.add(event.z);
      checkForHighMovement();
    });
  }

  void checkForHighMovement() {
    double maxGyroX = gyroX.isNotEmpty ? gyroX.last : 0;
    double maxAccelX = accelX.isNotEmpty ? accelX.last : 0;

    double maxGyroY = gyroY.isNotEmpty ? gyroY.last : 0;
    double maxAccelY = accelY.isNotEmpty ? accelY.last : 0;

    if ((maxGyroX.abs() > 0.8 && maxAccelX.abs() > 0.8) ||
        (maxGyroY.abs() > 0.8 && maxAccelY.abs() > 0.8)) {
      alertMessage.value = "ALERT: High movement detected!";
    } else {
      alertMessage.value = '';
    }
  }
}
