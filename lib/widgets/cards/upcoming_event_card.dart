import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_app/screens/event_attender/event_details_screen.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          _buildEventImage(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDateRow(),
                const SizedBox(height: 8),
                const Text(
                  'Design Conference 2026',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                _buildManagerRow(),
                const SizedBox(height: 12),
                const Text(
                  'Join industry leaders to explore the future of design, UX, and creativity.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                _buildEnrollButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Image.network(
        'https://images.unsplash.com/photo-1503428593586-e225b39bddfe',
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDateRow() {
    return Row(
      children: const [
        Icon(Icons.calendar_month, size: 16, color: Colors.grey),
        SizedBox(width: 6),
        Text(
          '12 Feb • 6:00 PM',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildManagerRow() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 14,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Hosted by Sarah Johnson',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildEnrollButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => EventDetailsScreen()),
          );
        },
        child: const Text(
          'View details',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
