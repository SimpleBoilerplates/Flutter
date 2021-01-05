// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "already_user" : MessageLookupByLibrary.simpleMessage("Already a user"),
    "email_hint" : MessageLookupByLibrary.simpleMessage("Email"),
    "error" : MessageLookupByLibrary.simpleMessage("Error"),
    "name_hint" : MessageLookupByLibrary.simpleMessage("Name"),
    "new_user" : MessageLookupByLibrary.simpleMessage("A new user?"),
    "no_results" : MessageLookupByLibrary.simpleMessage("No results"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "password_hint" : MessageLookupByLibrary.simpleMessage("Password"),
    "please_wait" : MessageLookupByLibrary.simpleMessage("Please Wait..."),
    "sign_in" : MessageLookupByLibrary.simpleMessage("Sign In"),
    "sign_up" : MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signup_success" : MessageLookupByLibrary.simpleMessage("Successfully signed up, please Sign In"),
    "user_name_hint" : MessageLookupByLibrary.simpleMessage("User Name")
  };
}
