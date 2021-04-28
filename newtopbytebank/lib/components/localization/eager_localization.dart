
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtopbytebank/components/localization/locale.dart';

class ViewI18N {
  String language;

  ViewI18N(BuildContext context) {
    // o problema dessa abordagem
    // é o rebuild quando voce troca a lingua
    // o que vc quer reconstruir quando trocar o currentlocalecubit?
    // em geral, eh comum reinicializar o sistema. ou voltar pra tela inicial.
    this.language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  String localize(Map<String, String> values) {
    assert(values != null );
    assert(values.containsKey(language));
    // voce pdoeria definir que o padrao eh mostrar em ingles ao inves de quebrar
    // a aplicacao

    return values[language];
  }
}
