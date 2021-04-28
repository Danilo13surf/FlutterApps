import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtopbytebank/components/container.dart';
import 'package:newtopbytebank/components/localization/eager_localization.dart';
import 'package:newtopbytebank/components/localization/i18n_container.dart';
import 'package:newtopbytebank/components/localization/i18n_messages.dart';
import 'package:newtopbytebank/models/name.dart';
import 'package:newtopbytebank/screens/account_balance.dart';
import 'package:newtopbytebank/screens/name_container.dart';
import 'package:newtopbytebank/screens/transactions_list.dart';
import 'contacts_list.dart';

class DashboardContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit(''),
      child: I18NLoadingContainer(
        viewKey: "dashboard",
        creator: (messages) => DashboardView(DashboardViewLazyI18N(messages)),
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  final DashboardViewLazyI18N _i18n;

  DashboardView(this._i18n);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NameCubit, String>(
          builder: (context, state) => Text('Welcome $state'),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/logo.jpg'),
            ),
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _FeatureItem(
                  _i18n.contacts,
                  Icons.people,
                  onClick: () => _showContactsList(context),
                ),
                _FeatureItem(
                  _i18n.transactionFeed,
                  Icons.description,
                  onClick: () => _showTransactionList(context),
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _FeatureItem(
                  _i18n.accountBalance,
                  Icons.monetization_on,
                  onClick: () => _showAccountBalance(context),
                ),
                _FeatureItem(
                  _i18n.login,
                  Icons.login,
                  onClick: () => _showChangeName(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(
    this.name,
    this.icon, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            color: Colors.greenAccent,
            padding: EdgeInsets.all(8.0),
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 53.0,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showContactsList(BuildContext bloccontext) {
  push(bloccontext, ContactsListContainer());
}

void _showTransactionList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => TransactionsList(),
    ),
  );
}

void _showAccountBalance(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => AccountBalance(),
    ),
  );
}

void _showChangeName(BuildContext bloccontext) {
  Navigator.of(bloccontext).push(
    MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: BlocProvider.of<NameCubit>(bloccontext),
        child: NameContainer(),
      ),
    ),
  );
}

class DashboardViewLazyI18N {
  final I18NMessages messages;

  DashboardViewLazyI18N(this.messages);

  // String get transfer => _messages.get("Transfer");

  String get contacts => messages.get("contacts");

  String get accountBalance => messages.get("accountBalance");

  // _ é para constante. defina se você vai usar também para não constante!
  String get transactionFeed => messages.get("transactionFeed");

  String get login => messages.get("login");
}

class DashboardViewI18N extends ViewI18N {
  DashboardViewI18N(BuildContext context) : super(context);

  // String get transfer => localize({"pt-br": "Transferir", "en": "Transfer"});

  String get contacts => localize({"pt-br": "Contatos", "en": "Contacts"});

  String get accountBalance =>
      localize({"pt-br": "Saldo", "en": "Account Balance"});

  // _ é para constante. defina se você vai usar também para não constante!
  String get transactionFeed =>
      localize({"pt-br": "Transações", "en": "Transaction Feed"});

  String get login => localize({"pt-br": "Entrar", "en": 'Login'});
}
