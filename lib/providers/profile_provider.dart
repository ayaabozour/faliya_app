import 'package:show_up_app/providers/base_provider.dart';

class ProfileProvider extends BaseProvider {
  ProfileProvider(super.api);

  String name = '';
  String description = '';
  String? imageUrl;

  int eventsCount = 0;
  int followersCount = 0;

  List<Map<String, dynamic>> events = [];

  bool _loaded = false;

  Future<void> loadOwnerProfile() async {
    if (_loaded) return;
    _loaded = true;

    setLoading(true);
    setError(null);

    await Future.delayed(const Duration(milliseconds: 800));

    name = 'John Doe';
    description =
        'Event organizer passionate about creating unforgettable experiences.';

    imageUrl = '';

    events = [
      {
        'id': 1,
        'title': 'Tech Conference 2026',
        'date': '2026-03-20',
        'location': 'Dubai World Trade Center',
        'attendees': 500,
        'image': 'https://images.unsplash.com/photo-1503428593586-e225b39bddfe',
      },
      {
        'id': 2,
        'title': 'Startup Pitch Night',
        'date': '2026-04-10',
        'location': 'Innovation Hub',
        'attendees': 120,
        'image': 'https://images.unsplash.com/photo-1521737604893-d14cc237f11d',
      },
      {
        'id': 3,
        'title': 'Music & Arts Festival',
        'date': '2026-05-01',
        'location': 'Open Air Arena',
        'attendees': 2000,
        'image': 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
      },
    ];

    eventsCount = events.length;
    followersCount = 1842;

    setLoading(false);
  }
}
