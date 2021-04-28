import 'package:flutter/material.dart';
import 'package:newtopbytebank/components/localization/locale.dart';
import 'package:newtopbytebank/models/balance.dart';
import 'package:newtopbytebank/screens/dashboard.dart';
import 'package:provider/provider.dart';

import 'models/transfers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Balance(0),
        ),
        ChangeNotifierProvider(
          create: (context) => Transfers(),
        ),
      ],
      child: BytebankApp(),
    ),
  );
}
//
// class LogObserver extends BlocObserver {
//   @override
//   void onChange(Cubit cubit, Change change) {
//     print("${cubit.runtimeType} > $change");
//     super.onChange(cubit, change);
//   }
// }

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // na prática evitar log do genero, pois pode vazar informações sensíveis para o log
    // Bloc.observer = LogObserver();

    return MaterialApp(
      theme: ThemeData.dark(),
      home: LocalizationContainer(
        child: DashboardContainer(),
      ),
    );
  }
}
