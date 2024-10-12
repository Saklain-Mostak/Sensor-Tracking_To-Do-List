import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:todo/controller/sensor_controller.dart';
import 'package:todo/screen/entry_page.dart';

class SensorDataGraphPage extends StatelessWidget {
  final SensorController sensorController = Get.put(SensorController());

  SensorDataGraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sensor Tracking'),
          leading: IconButton(
              onPressed: () {
                Get.off(() => const EntryScreen());
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Obx(
              () => Text(
                sensorController.alertMessage.value,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Gyroscope Data (rad/s)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Obx(
                        () => LineChart(
                          LineChartData(
                            gridData: const FlGridData(show: true),
                            titlesData: const FlTitlesData(show: true),
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: sensorController.gyroX
                                    .asMap()
                                    .entries
                                    .map((e) =>
                                        FlSpot(e.key.toDouble(), e.value))
                                    .toList(),
                                isCurved: true,
                                color: Colors.red,
                                barWidth: 2,
                                dotData: const FlDotData(show: false),
                              ),
                              LineChartBarData(
                                spots: sensorController.gyroY
                                    .asMap()
                                    .entries
                                    .map((e) =>
                                        FlSpot(e.key.toDouble(), e.value))
                                    .toList(),
                                isCurved: true,
                                color: Colors.green,
                                barWidth: 2,
                                dotData: const FlDotData(show: false),
                              ),
                              LineChartBarData(
                                spots: sensorController.gyroZ
                                    .asMap()
                                    .entries
                                    .map((e) =>
                                        FlSpot(e.key.toDouble(), e.value))
                                    .toList(),
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 2,
                                dotData: const FlDotData(show: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Accelerometer Data (m/s²)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Obx(
                        () => LineChart(
                          LineChartData(
                            gridData: const FlGridData(show: true),
                            titlesData: const FlTitlesData(show: true),
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: sensorController.accelX
                                    .asMap()
                                    .entries
                                    .map((e) =>
                                        FlSpot(e.key.toDouble(), e.value))
                                    .toList(),
                                isCurved: true,
                                color: Colors.orange,
                                barWidth: 2,
                                dotData: const FlDotData(show: false),
                              ),
                              LineChartBarData(
                                spots: sensorController.accelY
                                    .asMap()
                                    .entries
                                    .map((e) =>
                                        FlSpot(e.key.toDouble(), e.value))
                                    .toList(),
                                isCurved: true,
                                color: Colors.purple,
                                barWidth: 2,
                                dotData: const FlDotData(show: false),
                              ),
                              LineChartBarData(
                                spots: sensorController.accelZ
                                    .asMap()
                                    .entries
                                    .map((e) =>
                                        FlSpot(e.key.toDouble(), e.value))
                                    .toList(),
                                isCurved: true,
                                color: Colors.cyan,
                                barWidth: 2,
                                dotData: const FlDotData(show: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
