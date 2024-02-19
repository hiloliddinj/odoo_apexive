import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/context_extension.dart';
import '../../domain/entities/form/project_entity.dart';
import '../../domain/entities/form/task_entity.dart';
import '../base/base_view.dart';
import '../bloc/create_timer_bloc/create_timer_bloc.dart';
import '../widgets/form/app_check_box_list_tile.dart';
import '../widgets/form/app_drop_down_button_form_field.dart';
import '../widgets/form/app_elevated_button.dart';
import '../widgets/form/app_text_form_field.dart';

/// [CreateTimerScreen] is the create timer screen of the application.
class CreateTimerScreen extends StatefulWidget {
  /// [CreateTimerScreen] constructor.
  const CreateTimerScreen({super.key});

  @override
  State<CreateTimerScreen> createState() => _CreateTimerScreenState();
}

class _CreateTimerScreenState extends State<CreateTimerScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTimerBloc()..add(CreateTimerLoadEvent()),
      child: BlocListener<CreateTimerBloc, CreateTimerState>(
        listener: (context, state) {
          if (state is CreateTimerLoading) {
            EasyLoading.show();
          } else if (state is CreateTimerNavigate) {
            context.pop();
          } else {
            EasyLoading.dismiss();
          }
        },
        child: Builder(
          builder: (context) => BaseView(
            isScrollabe: false,
            appBar: AppBar(
              title: Text(context.localization.createTimer),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: BlocBuilder<CreateTimerBloc, CreateTimerState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              AppDropDownButtonFormField<ProjectEntity?>(
                                items: state.projects,
                                hintText: context.localization.project,
                                onChanged: (value) {
                                  context
                                      .read<CreateTimerBloc>()
                                      .add(DropdownProjectChanged(value));
                                },
                              ),
                              AppDropDownButtonFormField<TaskEntity?>(
                                items: state.tasks,
                                hintText: context.localization.tasks,
                                onChanged: (value) {
                                  context
                                      .read<CreateTimerBloc>()
                                      .add(DropdownTaskChanged(value));
                                },
                              ),
                              AppTextFormField(
                                onChanged: (value) {
                                  context
                                      .read<CreateTimerBloc>()
                                      .add(TextFieldChanged(value));
                                },
                              ),
                              AppCheckBoxListTile(
                                text: context.localization.makeFavorite,
                                value: state.isChecked,
                                onChanged: (bool? value) {
                                  context.read<CreateTimerBloc>().add(
                                        CheckBoxChanged(value: value ?? false),
                                      );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      final isValidate =
                          _formKey.currentState?.validate() ?? false;
                      if (!isValidate) return;
                      context
                          .read<CreateTimerBloc>()
                          .add(CreateTimerCreateEvent());
                    },
                    child: context.localization.createTimer,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    EasyLoading.dismiss();
    super.dispose();
  }
}
