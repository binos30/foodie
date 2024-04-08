import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void setPageTitle(String title, BuildContext context) {
  SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(
      label: title != ''
          ? '${AppLocalizations.of(context)!.appTitle} | $title'
          : AppLocalizations.of(context)!.appTitle,
      primaryColor: Theme.of(context).primaryColor.value,
    ),
  );
}
