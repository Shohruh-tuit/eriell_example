import 'package:example_eriell/presentation/components/chart.dart';
import 'package:example_eriell/presentation/styles/app_style_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../services/user_data_model.dart';
import '../components/indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<UserData> userBox;

  final styleT = const TextStyle(fontSize: 18, color: CupertinoColors.white);

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
  void initState() {
    super.initState();
    userBox = Hive.box('user_data');
  }

  Widget _portraitMode() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 50.h,
                  left: 10.w,
                  right: 10.w,
                ),
                child: Column(
                  children: [
                    const PieChartSample2(),
                    Center(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        semanticChildCount: 6,
                        addSemanticIndexes: true,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          crossAxisCount: 2,
                          childAspectRatio: 8,
                        ),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Indicator(
                            color: colors[index],
                            text: text[index],
                            isSquare: true,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _landscapeMode() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              left: 10.w,
              right: 10.w,
            ),
            child: Center(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                semanticChildCount: 6,
                addSemanticIndexes: true,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  crossAxisCount: 2,
                  childAspectRatio: 8,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Indicator(
                    color: colors[index],
                    text: text[index],
                    isSquare: true,
                  );
                },
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Home page"),
      ),
      backgroundColor: CupertinoColors.white,
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _portraitMode();
          } else {
            return _landscapeMode();
          }
        },
      ),
    );
  }
}
