import 'package:flutter/material.dart';
import 'package:newtopbytebank/components/localization/eager_localization.dart';
import 'package:newtopbytebank/components/localization/i18n_messages.dart';

class DashboardViewLazyI18N {
  final I18NMessages messages;

  DashboardViewLazyI18N(this.messages);

  String get contacts => messages.get("contacts");

  String get transactionFeed => messages.get("transactionFeed");

  String get accountBalance => messages.get("accountBalance");

  // _ é para constante. defina se você vai usar também para não constante!

  String get login => messages.get("login");
}

class DashboardViewI18N extends ViewI18N {
  DashboardViewI18N(BuildContext context) : super(context);

  // String get transfer => localize({"pt-br": "Transferir", "en": "Transfer"});

  // _ é para constante. defina se você vai usar também para não constante!
  String get contacts => localize({"pt-br": "Contatos", "en": "Contacts"});

  String get transactionFeed =>
      localize({"pt-br": "Transações", "en": "Transaction Feed"});

  String get accountBalance =>
      localize({"pt-br": "Saldo", "en": "Account Balance"});

  String get login => localize({"pt-br": "Entrar", "en": 'Login'});
}
