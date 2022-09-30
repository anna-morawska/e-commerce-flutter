# ecommerce_app

v1, work in progress
[![Preview](https://youtu.be/8b5Y4gAD0uQ)


- to install project packages:
  `flutter packages get`

- to open the project
  `flutter run`

## App Localizations

- add a new key-value pair to the `intl_en.arb` template file. When you save the file, those keys will be automatically available for auto-complete in Dart code
- add translations of the same message to the rest of the files in the `lib/i18n/` directory
- Reference the keys in Dart code, for example: `Text(T.of(context).error_message)`

`flutter_intl` extension generates and maintains files inside `lib/i18n/generated` folder which you should not edit manually. But these files should be kept in project repository.
