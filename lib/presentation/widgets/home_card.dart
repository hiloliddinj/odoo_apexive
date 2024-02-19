// ignore_for_file: member_ordering
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:odoo_apexive/presentation/bloc/home_bloc/home_bloc.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/router/app_routes.dart';
import '../../core/utils/string_utils.dart';
import '../../domain/entities/timer/timer_entity.dart';
import 'card_list_tile.dart';

/// [HomeCard] is the card of the home screen.
class HomeCard extends StatefulWidget {
  /// [HomeCard] constructor.
  const HomeCard({
    super.key,
    required this.timer,
  });

  /// [timer] is the timer entity.
  final TimerEntity? timer;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (widget.timer?.projectEntity?.countdownEntity?.isTicking ?? false) {
          context.read<HomeBloc>().add(HomeTickEvent(widget.timer));
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTicking =
        widget.timer?.projectEntity?.countdownEntity?.isTicking ?? false;

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoutes.timerDetail,
          extra: {'timer': widget.timer},
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                height: 85,
                child: VerticalDivider(
                  color: context.theme.colorScheme.onSurfaceVariant,
                  thickness: 2,
                ),
              ),
              _CenterCard(timer: widget.timer),
              Align(
                alignment: Alignment.centerRight,
                child: Card(
                  shape: const StadiumBorder(),
                  color: isTicking
                      ? context.theme.canvasColor
                      : context.theme.cardColor,
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        StringUtils.formatSeconds(
                          widget.timer?.projectEntity?.countdownEntity
                                  ?.seconds ??
                              0,
                        ),
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          color: isTicking
                              ? context.theme.colorScheme.onSurface
                              : context.theme.canvasColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.pause,
                          color: isTicking
                              ? context.theme.colorScheme.onSurface
                              : context.theme.canvasColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CenterCard extends StatelessWidget {
  const _CenterCard({
    required this.timer,
  });

  final TimerEntity? timer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardListTile(
            text: timer?.projectEntity?.name ?? '',
            iconData:
                (timer?.isFavorite ?? false) ? Icons.star : Icons.star_outline,
            isTitle: true,
          ),
          const SizedBox(height: 10),
          CardListTile(
            text: timer?.taskEntity?.title ?? '',
            iconData: Icons.work_outline,
          ),
          const SizedBox(height: 10),
          CardListTile(
            text: timer?.description ?? '',
            iconData: Icons.av_timer_outlined,
          ),
        ],
      ),
    );
  }
}
