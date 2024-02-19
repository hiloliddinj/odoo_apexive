// ignore_for_file: no_magic_number
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_apexive/core/extensions/context_extension.dart';
import 'package:odoo_apexive/domain/entities/timer/timer_entity.dart';
import 'package:odoo_apexive/presentation/base/base_view.dart';

import '../bloc/timer_detail_bloc/timer_detail_bloc.dart';
import 'timer_detail/timer_detail_view.dart';
import 'timer_detail/timesheets_view.dart';

/// [TimerDetailScreen] is the detail view of the timer.
class TimerDetailScreen extends StatefulWidget {
  /// [TimerDetailScreen] constructor.
  const TimerDetailScreen({super.key, required this.timer});

  /// [timer] is the timer entity.
  final TimerEntity? timer;

  @override
  State<TimerDetailScreen> createState() => _TimerDetailScreenState();
}

class _TimerDetailScreenState extends State<TimerDetailScreen>
    with SingleTickerProviderStateMixin {
  // ignore: avoid_late_keyword
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      isScrollabe: false,
      isScreenPaddingEnabled: false,
      appBar: AppBar(
        title: const Text('Timer Detail'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: context.localization.timesheets),
            Tab(text: context.localization.details),
          ],
        ),
      ),
      child: BlocProvider(
        create: (context) => TimerDetailBloc(),
        child: TabBarView(
          controller: _tabController,
          children: [
            TimesheetsView(timer: widget.timer),
            TimerDetailView(timer: widget.timer),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
