
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtopbytebank/components/container.dart';
import 'package:newtopbytebank/components/localization/i18n_container.dart';
import 'package:newtopbytebank/models/name.dart';

import '../dashboard.dart';

class DashboardContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit(""),
      child: I18NLoadingContainer(
        viewKey : "dashboard",
        creator: (messages) => DashboardView(DashboardViewLazyI18N(messages)),
      ),
    );
  }
}
