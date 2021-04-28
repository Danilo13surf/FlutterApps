import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtopbytebank/components/container.dart';
import 'package:newtopbytebank/models/name.dart';
import 'package:newtopbytebank/screens/account_balance.dart';
import 'package:newtopbytebank/screens/contacts_list.dart';
import 'package:newtopbytebank/screens/dashboard/dashboard_feature_item.dart';
import 'package:newtopbytebank/screens/dashboard/dashboard_i18n.dart';
import 'package:newtopbytebank/screens/name_container.dart';
import 'package:newtopbytebank/screens/transactions_list.dart';

class DashboardView extends StatelessWidget {
  final DashboardViewLazyI18N _i18n;

  DashboardView(this._i18n);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // misturando um blocbuilder (que é um observer de eventos) com UI
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
                FeatureItem(
                    _i18n.contacts,
                    Icons.people,
                    onClick: () => _showContactsList(context),
                ),
                FeatureItem(
                  _i18n.accountBalance,
                  Icons.description,
                  onClick: () => _showTransactionsList(context),
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                FeatureItem(
                  _i18n.accountBalance,
                  Icons.monetization_on,
                  onClick: () => _showAccountBalance(context),
                ),
                FeatureItem(
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

  void _showContactsList(BuildContext blocContext) {
    push(blocContext, ContactsListContainer());
  }

  void _showChangeName(BuildContext blocContext) {
    Navigator.of(blocContext).push(
      MaterialPageRoute(
        builder: (context) =>
            BlocProvider.value(
              value: BlocProvider.of<NameCubit>(blocContext),
              child: NameContainer(),
            ),
      ),
    );
  }

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}
void _showAccountBalance(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => AccountBalance(),
    ),
  );
}
