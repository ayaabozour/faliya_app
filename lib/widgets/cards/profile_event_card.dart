import 'package:flutter/material.dart';
import 'package:show_up_app/widgets/buttons/primary_button.dart';

class ProfileEventCard extends StatelessWidget {
  const ProfileEventCard({
    super.key,
    required this.image,
    required this.eventName,
    required this.eventDate,
    required this.eventAttendee,
    required this.eventLocation,
    this.onPressed,
  });

  final String image;
  final String eventName;
  final String eventDate;
  final String eventLocation;
  final String eventAttendee;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.date_range, size: 16),
                    const SizedBox(width: 6),
                    Text(eventDate),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 6),
                    Text(eventLocation),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.people, size: 16),
                    const SizedBox(width: 6),
                    Text("$eventAttendee attendees"),
                  ],
                ),
                const SizedBox(height: 14),
                PrimaryButton(
                  text: 'Manage attendance',
                  onPressed: () {
                    onPressed!();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
