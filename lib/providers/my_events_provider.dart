import 'package:show_up_app/models/enums/event_status.dart';
import 'package:show_up_app/providers/base_provider.dart';

class MyEventsProvider extends BaseProvider {
  List<Map<String, dynamic>> events = [];

  MyEventsProvider(super.api);

  void loadEvents() async {
    setLoading(true);

    await Future.delayed(const Duration(milliseconds: 800));

    events = [
      {
        'title': 'Tech Meetup',
        'date': '20 Oct 2026',
        'location': 'Tripoli',
        'attendees': 120,
        'image': 'https://picsum.photos/400/300',
        'status': EventStatus.upcoming,
      },
      {
        'title': 'Startup Pitch',
        'date': '12 Sep 2026',
        'location': 'Benghazi',
        'attendees': 80,
        'image': 'https://picsum.photos/401/300',
        'status': EventStatus.live,
      },
      {
        'title': 'AI Conference',
        'date': '01 Aug 2026',
        'location': 'Misrata',
        'attendees': 240,
        'image': 'https://picsum.photos/402/300',
        'status': EventStatus.past,
      },
    ];

    setLoading(false);
  }
}
