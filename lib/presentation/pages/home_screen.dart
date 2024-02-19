// ignore_for_file: avoid_non_null_assertion
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odoo_apexive/data/models/timer/db/timer_db_model.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/router/app_routes.dart';
import '../base/base_view.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../widgets/appbar_item.dart';
import '../widgets/home_card.dart';
import '../widgets/home_empty_view.dart';

/// [HomeScreen] is the home screen of the application.
class HomeScreen extends StatelessWidget {
  /// [HomeScreen] constructor.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadEvent()),
      child: BaseView(
        isScrollabe: false,
        appBar: AppBar(
          centerTitle: false,
          title: Text(context.localization.timesheets),
          actions: [
            AppBarItem(
              iconData: Icons.add,
              onPressed: () async {
                await context.pushNamed(AppRoutes.createTimer);
              },
            ),
            const SizedBox(width: 15),
          ],
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Builder(
              builder: (context) {
                if (state is HomeLoaded) {
                  return ValueListenableBuilder<Box<TimerDbModel?>?>(
                    valueListenable: state.stream!,
                    builder: (context, box, child) {
                      if (box == null) {
                        return const HomeEmptyView();
                      }

                      final timerDbModel = box.values.toList().firstOrNull;

                      if (timerDbModel == null ||
                          timerDbModel.timers == null ||
                          timerDbModel.timers!.isEmpty) {
                        return const HomeEmptyView();
                      }

                      return HomeLoadedView(timerDbModel: timerDbModel);
                    },
                  );
                }

                return const HomeEmptyView();
              },
            );
          },
        ),
      ),
    );
  }
}

/// [HomeLoadedView] is the loaded view of the home screen.
class HomeLoadedView extends StatelessWidget {
  /// [HomeLoadedView] constructor.
  const HomeLoadedView({super.key, required this.timerDbModel});

  /// [HomeLoaded] state.
  final TimerDbModel? timerDbModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Text(
            context.localization.youHavexTimers(
              timerDbModel?.timers?.length ?? 0,
            ),
            style: context.theme.textTheme.labelLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: timerDbModel?.timers?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final timer = timerDbModel?.timers?[index];

              return HomeCard(timer: timer?.toEntity());
            },
          ),
        ),
      ],
    );
  }
}
