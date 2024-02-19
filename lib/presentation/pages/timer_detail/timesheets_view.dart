// ignore_for_file: avoid_non_null_assertion, cyclomatic_complexity
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odoo_apexive/domain/entities/form/completed_records_entity.dart';
import 'package:odoo_apexive/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:odoo_apexive/presentation/bloc/timer_detail_bloc/timer_detail_bloc.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/string_utils.dart';
import '../../../data/models/timer/db/timer_db_model.dart';
import '../../../domain/entities/timer/timer_entity.dart';
import '../../widgets/completed_record_card.dart';

/// [TimesheetsView] is the timesheets view of the timer detail.
class TimesheetsView extends StatelessWidget {
  /// [TimesheetsView] constructor.
  const TimesheetsView({super.key, required this.timer});

  /// [timer] is the timer entity.
  final TimerEntity? timer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          return BlocBuilder<TimerDetailBloc, TimerDetailState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: _TimerCard(timer: timer, homeState: homeState),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        context.localization.completedRecords,
                        style: context.theme.textTheme.titleMedium,
                      ),
                      if (homeState is HomeLoaded)
                        ValueListenableBuilder<Box<TimerDbModel?>?>(
                          valueListenable: homeState.stream!,
                          builder: (context, value, child) {
                            if (value == null) {
                              return const SizedBox();
                            }

                            final timerDbModel =
                                value.values.toList().firstOrNull;
                            final localTimer =
                                timerDbModel?.timers?.firstWhereOrNull(
                              (element) => element?.id == timer?.id,
                            );

                            return _CompletedRecords(
                              timer: localTimer?.toEntity(),
                            );
                          },
                        )
                      else
                        _CompletedRecords(timer: timer),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CompletedRecords extends StatelessWidget {
  const _CompletedRecords({
    required this.timer,
  });

  final TimerEntity? timer;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: timer?.projectEntity?.completedRecords?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final completedRecord = timer?.projectEntity?.completedRecords?[index];

        return CompletedRecordCard(
          completedRecord: completedRecord,
          timer: timer,
        );
      },
    );
  }
}

class _TimerCard extends StatelessWidget {
  const _TimerCard({
    required this.timer,
    required this.homeState,
  });

  final TimerEntity? timer;
  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              timer?.projectEntity?.getDay() ?? '',
              style: context.theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 5),
            Text(
              timer?.projectEntity?.getDate() ?? '',
              style: context.theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text(
              timer?.projectEntity?.getTime() ?? '',
              style: context.theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            if (homeState is HomeLoaded)
              ValueListenableBuilder<Box<TimerDbModel?>?>(
                valueListenable: (homeState as HomeLoaded).stream!,
                builder: (context, value, child) {
                  if (value == null) {
                    return const SizedBox();
                  }

                  final timerDbModel = value.values.toList().firstOrNull;
                  final localTimer = timerDbModel?.timers?.firstWhereOrNull(
                    (element) => element?.id == timer?.id,
                  );

                  return _Timer(timer: localTimer?.toEntity());
                },
              )
            else
              _Timer(timer: timer),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.localization.description,
                    style: context.theme.textTheme.bodySmall,
                  ),
                ),
                const Icon(Icons.edit),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              timer?.description ?? '',
              style: context.theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Timer extends StatelessWidget {
  const _Timer({
    required this.timer,
  });

  final TimerEntity? timer;

  @override
  Widget build(BuildContext context) {
    final isTicking = timer?.projectEntity?.countdownEntity?.isTicking ?? false;

    return Row(
      children: [
        Expanded(
          child: Text(
            StringUtils.formatSeconds(
              timer?.projectEntity?.countdownEntity?.seconds ?? 0,
            ),
            style: context.theme.textTheme.displaySmall,
          ),
        ),
        const SizedBox(width: 15),
        Card(
          shape: const StadiumBorder(),
          child: IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () {
              if (timer == null) return;
              context.read<TimerDetailBloc>().add(
                    CompleteRecord(
                      timerEntity: timer!,
                      completedRecordsEntity: CompletedRecordsEntity(
                        description: timer?.description,
                        time: timer?.projectEntity?.time,
                        timer:
                            timer?.projectEntity?.countdownEntity?.seconds ?? 0,
                      ),
                    ),
                  );
            },
          ),
        ),
        const SizedBox(width: 15),
        Card(
          color:
              isTicking ? context.theme.canvasColor : context.theme.cardColor,
          shape: const StadiumBorder(),
          child: IconButton(
            icon: isTicking
                ? Icon(
                    Icons.pause,
                    color: context.theme.colorScheme.onPrimaryContainer,
                  )
                : const Icon(Icons.play_arrow),
            onPressed: () {
              if (timer == null) return;
              context.read<HomeBloc>().add(
                    HomeSetTickEvent(
                      timer: timer,
                      value: true,
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}
