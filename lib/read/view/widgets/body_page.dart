import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:khatam_quran_2/hive/models/hive_quran_model.dart';
import 'package:khatam_quran_2/hive/services/hive_history_repository.dart';
import 'package:khatam_quran_2/read/cubit/progress/progress_cubit.dart';
import 'package:khatam_quran_2/read/cubit/read/read_cubit.dart';

import 'package:khatam_quran_2/read/services/quran_repository.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hiveHistoryRepository = HiveHistoryRepository();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.amber[50]!,
              Colors.white,
            ]),
      ),
      child: Column(
        children: [
          const ProgressBarWidget(),
          Expanded(
            child: PageContentWidget2(
              initialPage: hiveHistoryRepository.getLastReadIndex(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 12.0,
        right: 12.0,
      ),
      child:
          BlocBuilder<ProgressCubit, ProgressState>(builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text('Juz ${state.juz}'),
            ),
            Expanded(
              flex: 6,
              child: LinearProgressIndicator(
                value: state.progress,
              ),
            ),
          ],
        );
      }),
    );
  }
}

// class PageContentWidget extends StatelessWidget {
//   const PageContentWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       onPageChanged: (index) {
//         BlocProvider.of<ReadCubit>(context).setIndex(index);
//       },
//       itemBuilder: (context, index) {
//         return Container(
//           margin: const EdgeInsets.all(20.0),
//           padding: const EdgeInsets.all(25.0),
//           decoration: BoxDecoration(
//             color: Colors.amber[100],
//             borderRadius: BorderRadius.circular(40.0),
//           ),
//           child: BlocBuilder<ReadCubit, ReadState>(
//             // buildWhen: (oldState, state) {
//             //   return state.index == index;
//             // },
//             builder: (context, state) {
//               return Column(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Text(
//                         '${state.data.surahName} - ${state.data.numOfAyah}'),
//                   ),
//                   const Divider(),
//                   Expanded(
//                     flex: 18,
//                     child: Center(
//                       child: SingleChildScrollView(
//                         child: Text(
//                           state.data.surahTextArab,
//                           style: const TextStyle(fontSize: 25.0),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class PageContentWidget2 extends StatelessWidget {
  const PageContentWidget2({
    Key? key,
    required this.initialPage,
  }) : super(key: key);

  final int initialPage;

  @override
  Widget build(BuildContext context) {
    var pageViewController = BlocProvider.of<ReadCubit>(context).pageController;

    return PageView.builder(
      controller: pageViewController,
      onPageChanged: (index) {
        print('pagechanged!');
        // BlocProvider.of<AudioCubit>(context).newAudio(index);
        BlocProvider.of<ReadCubit>(context).setIndex(index);
      },
      itemCount: 6238,
      itemBuilder: (context, index) {
        print('index');
        print(index);
        return index != 0
            ? index != 6237
                ? QuranPageWidget(index: index)
                : ClosingQuranWidget()
            : const OpeningQuranWidget();
      },
    );
  }
}

class ClosingQuranWidget extends StatelessWidget {
  const ClosingQuranWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Alhamdulillah, you already complete your khatam journey!',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Du'a Khatam Quran",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "أَللّٰهُمَّ ارْحَمْنِي بِالْقُرْآنِ, وَاجْعَلْهُ لِي إِمَاماً, وَنُوْراً, وَهُدًى وَرَحْمَةً, أَللّٰهُمَّ ذَكِّرْنِي مِنْهُ مَا نَسِيْتُ, وَعَلِّمْنِي مِنْهُ مَا جَهِلْتُ, وَارْزُقْنِي تِلَاوَتَهُ آناَءَ اللَّيْلِ, وَأَطْرَفَ النَّهَارِ , وَاجْعَلْهُ لِي حُجَّةً يَا رَبَّ الْعَالَمِيْنَ",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class OpeningQuranWidget extends StatelessWidget {
  const OpeningQuranWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Welcome to Khatam Quran App',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          Text(
            'Swipe right to start your khatam journey',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          // const Icon(
          //   Icons.arrow_right_alt_rounded,
          //   size: 100,
          // ),
        ],
      ),
    );
  }
}

class QuranPageWidget extends StatelessWidget {
  const QuranPageWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: FutureBuilder<QuranModel?>(
          future: Hive.lazyBox<QuranModel>('Quran').get(index.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('${data.surahName} - ${data.numOfAyah}'),
                    ),
                    const Divider(),
                    Expanded(
                      flex: 18,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Text(
                            data.surahTextArab,
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
