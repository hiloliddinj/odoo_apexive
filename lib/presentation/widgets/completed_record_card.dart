import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/utils/string_utils.dart';
import '../../domain/entities/form/completed_records_entity.dart';
import '../../domain/entities/timer/timer_entity.dart';

/// [CompletedRecordCard] is the completed record card.
class CompletedRecordCard extends StatelessWidget {
  /// [CompletedRecordCard] constructor.
  const CompletedRecordCard({
    super.key,
    required this.completedRecord,
    required this.timer,
  });

  /// Completed record entity.
  final CompletedRecordsEntity? completedRecord;

  /// Timer entity.
  final TimerEntity? timer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.check_circle),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        completedRecord?.getDay() ?? '',
                        style: context.theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        completedRecord?.getDate() ?? '',
                        style: context.theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        completedRecord?.getTime() ?? '',
                        style: context.theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Card(
                  shape: const StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      StringUtils.formatSeconds(completedRecord?.timer ?? 0),
                      style: context.theme.textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
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
