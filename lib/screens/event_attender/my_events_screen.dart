import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/widgets/buttons/custom_back_button.dart';
import 'package:show_up_app/widgets/cards/upcoming_event_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:show_up_app/providers/my_events_provider.dart';

class AttenderEventScreen extends StatelessWidget {
  const AttenderEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Events',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        leading: CustomBackButton(),
      ),
      body: Consumer<MyEventsProvider>(
        builder: (context, provider, _) {
          return Skeletonizer(
            enabled: provider.isLoading,
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              itemCount: provider.events.length,
              itemBuilder: (context, index) {
                return EventCard();
              },
            ),
          );
        },
      ),
    );
  }
}
