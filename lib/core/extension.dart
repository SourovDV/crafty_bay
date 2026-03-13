

import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension AppLocalizatation on BuildContext{
  AppLocalizations get localizations{
    return AppLocalizations.of(this)!;
}
}