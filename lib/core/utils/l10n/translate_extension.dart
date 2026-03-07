import 'package:flutter/material.dart';
import 'package:guidedtour/core/utils/l10n/app_localizations.dart';

extension TranslateX on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;
}
