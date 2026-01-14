import 'package:flutter/material.dart';

enum EventStatus {
  upcoming,
  live,
  past,
}

extension EventStatusExtension on EventStatus {
  String get label {
    switch (this) {
      case EventStatus.upcoming:
        return 'Upcoming';
      case EventStatus.live:
        return 'Live';
      case EventStatus.past:
        return 'Past';
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case EventStatus.upcoming:
        return Theme.of(context).colorScheme.primary;
      case EventStatus.live:
        return Colors.green;
      case EventStatus.past:
        return Theme.of(context)
            .colorScheme
            .onSurface
            .withValues(alpha: 0.5);
    }
  }
}
