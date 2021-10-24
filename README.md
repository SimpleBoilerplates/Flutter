# Flutter Boilerplate

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

---

This is a very simple Boilerplate application, this has following features.

  - User can Sign In and Up
  - After signing in he can see a list of items

It uses a mock json server which doesn't store or validate, so for sign in/up any email, password will simply work.
  
## Getting Started 🚀

You can go through this [Flutter Starter Pack](https://sadmansamee.github.io/flutter_starter_pack).

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Flutter Boilerplate works on iOS, Android, and Web._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Avoid writing scripts with Derry

You can run all these scripts manually or could use [Derry](https://pub.dev/packages/derry) and maintain a yaml file, where you can define all those scripts and run with derry in a very convinient way. All the scripts for this project is defined [here](https://github.com/SimpleBoilerplates/Flutter/blob/master/derry.yaml)

Example: 

instead of running 

```sh
flutter pub run build_runner watch --delete-conflicting-outputs
``` 
you could simply use `derry watch`

or use `build_apk_dev` instead of 

```sh
flutter build apk --flavor development -t lib/main_development.dart 
``` 


## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:flutter_boilerplate/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

### Same implementation in other platforms
   - [iOS](https://github.com/simpleboilerplates/BooksDemoiOS) 
   - [Android](https://github.com/SimpleBoilerplates/Android) 
   - [React Native](https://github.com/SimpleBoilerplates/React-Native) 
   - [NodeJS backend](https://github.com/simpleboilerplates/BooksDemoNode)

### TODO
- Updating it on daily basis as much as possible, work in progess[WIP].

### Found this project useful :heart:
* Support by clicking the :star: button on the upper right of this page. :v:

### Let's become friend
- [LinkedIn](https://www.linkedin.com/in/sadmansamee/)
- [Github](https://github.com/Sadmansamee)
- [Blog](https://sadmansamee.github.io/)
- [Twitter](https://twitter.com/SameeSadman)

## License
[![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](https://creativecommons.org/publicdomain/zero/1.0/)


[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
