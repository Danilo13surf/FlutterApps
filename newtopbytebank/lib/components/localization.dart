import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:newtopbytebank/components/progress/progress_view.dart';
import 'package:newtopbytebank/http/webcliente/i18n_webclient.dart';

import 'container.dart';
import 'error.dart';

class LocalizationContainer extends BlocContainer {
  final Widget child;

  LocalizationContainer({@required Widget this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentLocaleCubit>(
      create: (context) => CurrentLocaleCubit(),
      child: this.child,
    );
  }
}

class CurrentLocaleCubit extends Cubit<String> {
  CurrentLocaleCubit() : super("en");
}

class ViewI18N {
  String _language;

  ViewI18N(BuildContext context) {
    // o problema dessa abordagem
    // é o rebuild quando voce troca a lingua
    // o que vc quer reconstruir quando trocar o currentlocalecubit?
    // em geral, eh comum reinicializar o sistema. ou voltar pra tela inicial.
    this._language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  String localize(Map<String, String> values) {
    assert(values != null);
    assert(values.containsKey(_language));
    // voce pdoeria definir que o padrao eh mostrar em ingles ao inves de quebrar
    // a aplicacao

    return values[_language];
  }
}

@immutable
abstract class I18NMessagesState {
  const I18NMessagesState();
}

@immutable
class LoadingI18NMessagesState extends I18NMessagesState {
  const LoadingI18NMessagesState();
}

@immutable
class InitI18NMessagesState extends I18NMessagesState {
  const InitI18NMessagesState();
}

@immutable
class LoadedI18NMessagesState extends I18NMessagesState {
  final I18NMessages messages;

  const LoadedI18NMessagesState(this.messages);
}

class I18NMessages {
  final Map<String, dynamic> messages;

  I18NMessages(this.messages);

  String get(String key) {
    assert(key != null);
    assert(messages.containsKey(key));
    return messages[key];
  }
}

@immutable
class FatalErrorI18NMessagesState extends I18NMessagesState {
  const FatalErrorI18NMessagesState();
}

typedef Widget I18NWidgetCreator(I18NMessages messages);

class I18NLoadingContainer extends BlocContainer {
  I18NWidgetCreator creator;
  String viewKey;

  I18NLoadingContainer({
    @required String viewKey,
    @required I18NWidgetCreator creator,
  }) {
    this.creator = creator;
    this.viewKey = viewKey;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18NMessagesCubit>(
      create: (BuildContext context) {
        final cubit = I18NMessagesCubit(this.viewKey);
        cubit.reload(I18NWebClient(this.viewKey));
        return cubit;
      },
      child: I18NLoadingView(this.creator),
    );
  }
}

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
        return ErrorView("No found Messages");
      },
    );
  }
}

class I18NMessagesCubit extends Cubit<I18NMessagesState> {
  final LocalStorage storage =
      new LocalStorage('local_unsecure_version_1.json');
  final String viewKey;

  I18NMessagesCubit(this.viewKey) : super(InitI18NMessagesState());

  reload(I18NWebClient client) async {
    emit(LoadingI18NMessagesState());
    // await storage.ready;
    final items = storage.getItem(viewKey);
    print("Loaded $viewKey $items");
    if (items != null) {
      emit(LoadedI18NMessagesState(I18NMessages(items)));
      return;
    }
    client.findAll().then(saveAndRefresh);
  }

  saveAndRefresh(Map<String, dynamic> messages) {
    storage.setItem(viewKey, messages);
    print("saving $viewKey $messages");
    final state = LoadedI18NMessagesState(I18NMessages(messages));
    emit(state);
  }
}
