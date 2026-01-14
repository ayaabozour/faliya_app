import 'base_provider.dart';

class EventOwnerProvider extends BaseProvider {
  String name = 'Sarah Johnson';
  String description =
      'Experienced event manager specializing in technology, design, and startup communities.';
  String? imageUrl;

  int eventsCount = 12;
  int followersCount = 1840;

  List<Map<String, dynamic>> events = [
    {
      'title': 'Tech Future Summit',
      'image':
          'https://images.unsplash.com/photo-1503428593586-e225b39bddfe',
      'date': '12 Feb 2026',
      'location': 'Berlin, Germany',
      'attendees': 320,
    },
    {
      'title': 'Startup Pitch Night',
      'image':
          'https://images.unsplash.com/photo-1551836022-d5d88e9218df',
      'date': '22 Mar 2026',
      'location': 'London, UK',
      'attendees': 180,
    },
    {
      'title': 'UX Design Workshop',
      'image':
          'https://images.unsplash.com/photo-1521737604893-d14cc237f11d',
      'date': '10 Apr 2026',
      'location': 'Amsterdam, NL',
      'attendees': 95,
    },
  ];
}
