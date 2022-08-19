import 'package:example_eriell/presentation/styles/app_style_library.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  List<Color> colors = const [
    Color(0xff0293ee),
    Color(0xfff8b250),
    Color(0xff845bef),
    Color(0xff13d38e),
    Color.fromARGB(255, 0, 6, 10),
    Color.fromARGB(255, 39, 129, 145),
    Color.fromARGB(255, 173, 19, 211),
    Color.fromARGB(255, 219, 219, 219),
  ];
  List<String> text = const [
    "Fruit",
    "Protein",
    "Vegetables",
    "Dairy",
    "Grains",
    "Herbs",
    "meat",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 80,
                        sections: showingSections(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(8, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 25,
            title: '25%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 0, 6, 10),
            value: 8,
            title: '8%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 39, 129, 145),
            value: 12,
            title: '12%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        case 6:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 173, 19, 211),
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 7:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 219, 219, 219),
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}
