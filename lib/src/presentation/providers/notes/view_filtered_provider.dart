import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notes_view_options.dart';

final filterNotesProvider = ChangeNotifierProvider(
  (ref) => NotesFilterProvider(NotesViewOptions.inbox),
);

class NotesFilterProvider extends ValueNotifier<NotesViewOptions> {
  NotesFilterProvider(NotesViewOptions filter) : super(filter);

  toggle() {
    value = value == NotesViewOptions.inbox
        ? NotesViewOptions.archived
        : NotesViewOptions.inbox;
  }
}
