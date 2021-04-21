import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:khatam_quran_2/report/cubit/cubit/report_cubit.dart';
import 'package:khatam_quran_2/report/models/report_model.dart';
import 'package:khatam_quran_2/report/services/report_repository.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _reportRepository = ReportRepository();

    final theme = Theme.of(context);
    var boxDecoration = BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black38,
          offset: Offset.fromDirection(1.5),
          // spreadRadius: 1,
          blurRadius: 1,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Progress',
          style: theme.textTheme.headline4,
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outlined),
            onPressed: () {},
            color: Colors.black54,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(4.0),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Colors.green,
          //       Colors.green[900]!,
          //     ]),
          color: Colors.amber[100],
        ),
        child: BlocProvider(
          create: (context) => ReportCubit(),
          child: ReportBuilder(
              reportRepository: _reportRepository,
              boxDecoration: boxDecoration,
              theme: theme),
        ),
      ),
    );
  }
}

class ReportBuilder extends StatelessWidget {
  const ReportBuilder({
    Key? key,
    required ReportRepository reportRepository,
    required this.boxDecoration,
    required this.theme,
  })   : _reportRepository = reportRepository,
        super(key: key);

  final ReportRepository _reportRepository;
  final BoxDecoration boxDecoration;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(builder: (context, state) {
      return state.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        data: (data) {
          return Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      // number of days
                      flex: 1,
                      child: Container(
                        // color: Colors.blue,
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: boxDecoration,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              FittedBox(
                                child: Container(
                                  margin: const EdgeInsets.all(30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'days',
                                        style: theme.textTheme.headline6,
                                      ),
                                      Text(
                                        '${data.numberOfDays}',
                                        style: theme.textTheme.headline4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.restore,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: Text('Reset'),
                                        content: Text(
                                            'Are you sure want to reset your record? all your read record will be delete and cannot be retrive again.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text('Reset'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('cancel'),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // last surah
                      flex: 2,
                      child: Container(
                        // color: Colors.red,
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: boxDecoration,
                          child: FittedBox(
                            child: Container(
                              margin: const EdgeInsets.all(30),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Last Read',
                                      style: theme.textTheme.headline6,
                                    ),
                                    Text(
                                      '${data.lastRead.surahName} - ${data.lastRead.numOfAyah} / Juz 30',
                                      style: theme.textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.green,
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: boxDecoration,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: FittedBox(
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Average',
                                        style: theme.textTheme.bodyText1,
                                      ),
                                      Text(
                                        '${data.averagePerDays} ayah / days',
                                        style: theme.textTheme.headline6,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Target',
                                        style: theme.textTheme.bodyText1,
                                      ),
                                      Text(
                                        '${data.targetPerDays} ayah / days',
                                        style: theme.textTheme.headline6,
                                      ),
                                      Text(
                                        '${DateFormat('d/LLL/yyyy').format(data.targetDate)}',
                                        style: theme.textTheme.bodyText2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.calendar_today_rounded),
                            onPressed: () {
                              var date = data.targetDate;
                              return showMaterialDatePicker(
                                title: 'Pick a date',
                                confirmText: 'Set',
                                cancelText: 'Cancel',
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2050, 12, 31),
                                context: context,
                                selectedDate: date,
                                onChanged: (selectedDate) {
                                  BlocProvider.of<ReportCubit>(context)
                                      .setTargetDate(selectedDate);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 200,
                  // color: Colors.orange,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Report',
                      //   style: theme.textTheme.headline6,
                      // ),
                      Expanded(
                        child: Container(
                          decoration: boxDecoration,
                          child: Center(
                            child: BarChartWidget(
                              last7Days: data.last5Days,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
      //     FutureBuilder<ReportModel>(
      //         future: _reportRepository.getReport(),
      //         builder: (context, snapshot) {
      //           if (snapshot.hasData) {
      //             return Column(
      //               children: <Widget>[
      //                 Expanded(
      //                   flex: 1,
      //                   child: Row(
      //                     crossAxisAlignment: CrossAxisAlignment.stretch,
      //                     children: <Widget>[
      //                       Expanded(
      //                         // number of days
      //                         flex: 1,
      //                         child: Container(
      //                           // color: Colors.blue,
      //                           padding: const EdgeInsets.all(10),
      //                           child: Container(
      //                             decoration: boxDecoration,
      //                             child: Stack(
      //                               fit: StackFit.expand,
      //                               children: [
      //                                 FittedBox(
      //                                   child: Container(
      //                                     margin: const EdgeInsets.all(30),
      //                                     child: Column(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.center,
      //                                       children: [
      //                                         Text(
      //                                           'days',
      //                                           style: theme.textTheme.headline6,
      //                                         ),
      //                                         Text(
      //                                           '${snapshot.data!.numberOfDays}',
      //                                           style: theme.textTheme.headline4,
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ),
      //                                 ),
      //                                 Positioned(
      //                                   top: 0,
      //                                   right: 0,
      //                                   child: IconButton(
      //                                     icon: const Icon(
      //                                       Icons.restore,
      //                                     ),
      //                                     onPressed: () {
      //                                       showDialog(
      //                                         context: context,
      //                                      ;
      //   },
      // )   builder: (_) => AlertDialog(
      //                                       title: Text('Reset'),
      //                                       content: Text(
      //                                           'Are you sure want to reset your record? all your read record will be delete and cannot be retrive again.'),
      //                                       actions: [
      //                                         TextButton(
      //                                           onPressed: () {},
      //                                           child: const Text('Reset'),
      //                                         ),
      //                                         TextButton(
      //                                           onPressed: () {
      //                                             Navigator.of(context).pop();
      //                                           },
      //                                           child: const Text('cancel'),
      //                                         )
      //                                       ],
      //                                     ),
      //                                   );
      //                                 },
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   Expanded(
      //                     // last surah
      //                     flex: 2,
      //                     child: Container(
      //                       // color: Colors.red,
      //                       padding: const EdgeInsets.all(10),
      //                       child: Container(
      //                         decoration: boxDecoration,
      //                         child: FittedBox(
      //                           child: Container(
      //                             margin: const EdgeInsets.all(30),
      //                             child: Center(
      //                               child: Column(
      //                                 mainAxisAlignment: MainAxisAlignment.center,
      //                                 crossAxisAlignment:
      //                                     CrossAxisAlignment.start,
      //                                 children: [
      //                                   Text(
      //                                     'Last Read',
      //                                     style: theme.textTheme.headline6,
      //                                   ),
      //                                   Text(
      //                                     '${snapshot.data!.lastRead.surahName} - ${snapshot.data!.lastRead.numOfAyah} / Juz 30',
      //                                     style: theme.textTheme.bodyText1,
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Expanded(
      //               flex: 1,
      //               child: Container(
      //                 // color: Colors.green,
      //                 padding: const EdgeInsets.all(10),
      //                 child: Container(
      //                   decoration: boxDecoration,
      //                   child: Stack(
      //                     fit: StackFit.expand,
      //                     children: [
      //                       Row(
      //                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                         children: [
      //                           Expanded(
      //                             child: FittedBox(
      //                               child: Container(
      //                                 margin: const EdgeInsets.all(20),
      //                                 child: Column(
      //                                   mainAxisAlignment:
      //                                       MainAxisAlignment.center,
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: [
      //                                     Text(
      //                                       'Average',
      //                                       style: theme.textTheme.headline6,
      //                                     ),
      //                                     Text(
      //                                       '${snapshot.data!.averagePerDays} ayah / days',
      //                                       style: theme.textTheme.bodyText1,
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                           Expanded(
      //                             child: FittedBox(
      //                               child: Container(
      //                                 margin: const EdgeInsets.all(20),
      //                                 child: Column(
      //                                   mainAxisAlignment:
      //                                       MainAxisAlignment.center,
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: [
      //                                     Text(
      //                                       'Target',
      //                                       style: theme.textTheme.headline6,
      //                                     ),
      //                                     Text(
      //                                       '${snapshot.data!.targetPerDays} ayah / days',
      //                                       style: theme.textTheme.bodyText2,
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       Positioned(
      //                         top: 0,
      //                         right: 0,
      //                         child: IconButton(
      //                           icon: const Icon(Icons.calendar_today_rounded),
      //                           onPressed: () {
      //                             var date = snapshot.data!.targetDate;
      //                             return showMaterialDatePicker(
      //                               title: 'Pick a date',
      //                               confirmText: 'Set',
      //                               cancelText: 'Cancel',
      //                               firstDate: DateTime(1990, 1, 1),
      //                               lastDate: DateTime(2050, 12, 31),
      //                               context: context,
      //                               selectedDate: date,
      //                               onChanged: (selectedDate) {},
      //                             );
      //                           },
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 2,
      //               child: Container(
      //                 height: 200,
      //                 // color: Colors.orange,
      //                 padding: const EdgeInsets.all(10),
      //                 child: Column(
      //                   // mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     // Text(
      //                     //   'Report',
      //                     //   style: theme.textTheme.headline6,
      //                     // ),
      //                     Expanded(
      //                       child: Container(
      //                         decoration: boxDecoration,
      //                         child: Center(
      //                           child: BarChartWidget(
      //                             last7Days: snapshot.data!.last5Days,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         );
      //       } else {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //     });
    });
  }
}

class BarChartWidget extends StatefulWidget {
  BarChartWidget({
    Key? key,
    required this.last7Days,
  }) : super(key: key);

  final Map<DateTime, int> last7Days;

  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final Color barBackgroundColor = Colors.black38;
  final Duration animDuration = const Duration(milliseconds: 250);

  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text(
            'Report',
            style: TextStyle(
                color: Color(0xff0f4a3c),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          // Text(
          //   'Grafik ayat harian',
          //   style: TextStyle(
          //       color: const Color(0xff379982),
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(
          //   height: 38,
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                mainBarData(widget.last7Days),
                swapAnimationDuration: animDuration,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
    double yMax = 20,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: yMax,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(Map<DateTime, int> _last7Days) {
    var listOfValue = _last7Days.entries.map((e) => e.value).toList();
    var maxValue = listOfValue.reduce(max);
    var yMax = (maxValue + (maxValue / 4).round()).toDouble();

    return List.generate(7, (i) {
      var value = listOfValue[6 - i].toDouble();
      return makeGroupData(i, value, isTouched: i == touchedIndex, yMax: yMax);
      // switch (i) {
      //   case 0:
      //     return makeGroupData(0, value,
      //         isTouched: i == touchedIndex, yMax: yMax);
      //   case 1:
      //     return makeGroupData(1, value,
      //         isTouched: i == touchedIndex, yMax: yMax);
      //   case 2:
      //     return makeGroupData(2, value,
      //         isTouched: i == touchedIndex, yMax: yMax);
      //   case 3:
      //     return makeGroupData(3, value,
      //         isTouched: i == touchedIndex, yMax: yMax);
      //   case 4:
      //     return makeGroupData(4, value,
      //         isTouched: i == touchedIndex, yMax: yMax);
      //   case 5:
      //     return makeGroupData(5, value,
      //         isTouched: i == touchedIndex, yMax: yMax);
      //   case 6:
      //     return makeGroupData(6, value,
      //         isTouched: i == touchedIndex, yMax: yMax);
      //   default:
      //     return makeGroupData(0, value,
      //         isTouched: i == touchedIndex, yMax: yMax);
      // }
    });
  }

  BarChartData mainBarData(Map<DateTime, int> _last7Days) {
    var formatter = DateFormat('EEEE');
    var listOfDays =
        _last7Days.entries.map((e) => formatter.format(e.key)).toList();
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              var weekDay = listOfDays[6 - group.x];

              return BarTooltipItem(
                '$weekDay\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 16,
          getTitles: (double value) {
            return listOfDays[6 - value.toInt()][0];
            // switch (value.toInt()) {
            //   case 0:
            //     return 'M';
            //   case 1:
            //     return 'T';
            //   case 2:
            //     return 'W';
            //   case 3:
            //     return 'T';
            //   case 4:
            //     return 'F';
            //   case 5:
            //     return 'S';
            //   case 6:
            //     return 'S';
            //   default:
            //     return '';
            // }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(widget.last7Days),
    );
  }
}
