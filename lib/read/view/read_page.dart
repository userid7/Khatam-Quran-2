// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatam_quran_2/counter/counter.dart';
import 'package:khatam_quran_2/read/cubit/audio/audio_cubit.dart';
import 'package:khatam_quran_2/read/cubit/progress/progress_cubit.dart';
import 'package:khatam_quran_2/read/cubit/read/read_cubit.dart';
import 'package:khatam_quran_2/read/cubit/save/save_cubit.dart';
import 'package:khatam_quran_2/read/view/widgets/body_page.dart';
import 'package:khatam_quran_2/read/view/widgets/modal_bottom_sheet.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: ReadView(),
    );
  }
}

class ReadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveCubit(),
      child: BlocProvider<ReadCubit>(
        create: (context) => ReadCubit(
          2,
          BlocProvider.of<SaveCubit>(context),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProgressCubit>(
              create: (context) => ProgressCubit(
                BlocProvider.of<ReadCubit>(context),
              ),
            ),
            BlocProvider<AudioCubit>(
              create: (context) => AudioCubit(
                BlocProvider.of<ReadCubit>(context),
              ),
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Khatam Quran',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Navigator.pushNamed(context, '/report');
                  },
                ),
              ],
            ),
            body: const BodyPage(),
            floatingActionButton: const AudioButtonWidget(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const BottomAppBarWidget(),
          ),
        ),
      ),
    );
  }
}

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: <Widget>[
              SizedBox(
                height: 45.0,
                width: 45.0,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return BlocProvider.value(
                          value: BlocProvider.of<ReadCubit>(context),
                          child: const ModalBottomList(),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.playlist_play),
                ),
              ),
            ],
          ),
          BlocBuilder<SaveCubit, SaveState>(
            builder: (context, state) {
              return state.when(
                saved: () => IconButton(
                  icon: const Icon(Icons.star),
                  color: Colors.amber,
                  onPressed: () =>
                      BlocProvider.of<SaveCubit>(context).notSaved(),
                ),
                notSaved: () => IconButton(
                  icon: const Icon(Icons.star),
                  color: Colors.white12,
                  onPressed: () => BlocProvider.of<SaveCubit>(context).saved(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AudioButtonWidget extends StatelessWidget {
  const AudioButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(builder: (context, state) {
      return state.when(
        play: () => FloatingActionButton(
          onPressed: () {
            BlocProvider.of<AudioCubit>(context).stopAudio();
          },
          tooltip: 'Stop Audio',
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.stop,
            color: Colors.black,
          ),
        ),
        idle: () => FloatingActionButton(
          onPressed: () {
            BlocProvider.of<AudioCubit>(context).playAudio();
          },
          tooltip: 'Play Audio',
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
        ),
      );
    });
  }
}

class ReadTitleText extends StatelessWidget {
  const ReadTitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}
