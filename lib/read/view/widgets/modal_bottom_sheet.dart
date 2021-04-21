import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:khatam_quran_2/hive/models/hive_quran_model.dart';
import 'package:khatam_quran_2/hive/services/hive_history_repository.dart';
import 'package:khatam_quran_2/hive/services/hive_quran_repository.dart';
import 'package:khatam_quran_2/hive/services/hive_surahlist_repository.dart';
import 'package:khatam_quran_2/read/cubit/read/read_cubit.dart';
import 'package:khatam_quran_2/read/services/quran_repository.dart';

class ModalBottomList extends StatelessWidget {
  const ModalBottomList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CurrentSurahTile(),
          const Divider(),
          const ListTile(
            dense: true,
            title: Text(
              'Find Surah',
            ),
          ),
          const Divider(),
          const ListOfSurahTiles2(),
        ],
      ),
    );
  }
}

class CurrentSurahTile extends StatelessWidget {
  const CurrentSurahTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _hiveQuranRepository = HiveQuranRepository();
    var _hiveHistoryRepository = HiveHistoryRepository();
    // var _index = BlocProvider.of<ReadCubit>(context).state.index;
    var _index = _hiveHistoryRepository.getLastReadIndex();

    return FutureBuilder<QuranModel?>(
      future: _hiveQuranRepository.get(_index),
      builder: (context, snapshot) {
        var _data = snapshot.data;
        return snapshot.hasData
            ? _data != null
                ? Column(
                    children: [
                      const ListTile(
                        dense: true,
                        title: Text(
                          'Your Surah',
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: Text('${_data.surahName}'),
                        // subtitle: Text(''),
                        trailing: Text('${_data.numOfAyah}'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                : Container()
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ListOfSurahTiles extends StatelessWidget {
  const ListOfSurahTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _quranRepository = QuranApi();

    return Expanded(
      child: FutureBuilder<List<QuranModel>>(
        future: _quranRepository.getAllSurah(),
        // DefaultAssetBundle.of(context)
        //     .loadString('asset/loadjson/surah.json'),
        builder: (context, snapshot) {
          // var listOfSurah = json.decode(snapshot.data.toString());
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: 114,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${snapshot.data![index + 1].surahName}'),
                      // subtitle: Text('${snapshot.data![index].surahName}'),
                      trailing: Text('${snapshot.data![index + 1].totalAyah}'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ListOfSurahTiles2 extends StatelessWidget {
  const ListOfSurahTiles2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _hiveSurahListRepository = HiveSurahListRepository();

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 114,
        itemBuilder: (context, index) {
          var data = _hiveSurahListRepository.get(index + 1)!;
          return ListTile(
            title: Text('${data.surahName ?? ''}'),
            // subtitle: Text('${snapshot.data![index].surahName}'),
            trailing: Text('${data.totalAyah ?? ''}'),
            onTap: () {
              return showMaterialNumberPicker(
                context: context,
                title: 'Pick Ayah',
                maxNumber: data.totalAyah,
                minNumber: 1,
                selectedNumber: 1,
                onChanged: (value) {
                  BlocProvider.of<ReadCubit>(context)
                      .setIndexExternally(index + 1, value);
                  Navigator.pop(context);
                },
              );
              //
            },
          );
        },
      ),
    );
  }
}
