import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../domain/entities/timer/timer_entity.dart';

/// [TimerDetailView] is the detail view of the timer.
class TimerDetailView extends StatelessWidget {
  /// [TimerDetailView] constructor.
  const TimerDetailView({super.key, required this.timer});

  /// [timer] is the timer entity.
  final TimerEntity? timer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localization.project,
                    style: context.theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        child: VerticalDivider(
                          color: context.theme.colorScheme.onSurfaceVariant,
                          thickness: 2,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          timer?.projectEntity?.name ?? '',
                          style: context.theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.localization.deadline,
                    style: context.theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    timer?.taskEntity?.getDate() ?? '',
                    style: context.theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.localization.assignedTo,
                    style: context.theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    timer?.taskEntity?.assignedTo ?? '',
                    style: context.theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Card(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.localization.description,
                      style: context.theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      timer?.taskEntity?.description ?? '',
                      style: context.theme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
