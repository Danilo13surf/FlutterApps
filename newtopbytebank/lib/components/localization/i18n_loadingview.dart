import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtopbytebank/components/errorview.dart';
import 'package:newtopbytebank/components/localization/i18n_cubit.dart';
import 'package:newtopbytebank/components/localization/i18n_messages.dart';
import 'package:newtopbytebank/components/localization/i18n_state.dart';
import 'package:newtopbytebank/components/progress/progress_view.dart';


typedef Widget I18NWidgetCreator(I18NMessages messages);

class I18NLoadingView extends StatelessWidget {
  final I18NWidgetCreator creator;

  I18NLoadingView(this.creator);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<I18NMessagesCubit, I18NMessagesState>(
      builder: (context, state) {
        if (state is InitI18NMessagesState ||
            state is LoadingI18NMessagesState) {
          return ProgressView(message: "Loading...");
        }
        if (state is LoadedI18NMessagesState) {
          final messages = state.messages;
          return creator.call(messages);
        }
        return ErrorView("Erro buscando mensagens da tela");
      },
    );
  }
}

