import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' hide ShimmerEffect;
import 'package:provider/provider.dart';
import 'package:show_up_app/providers/event_owner_provider.dart';
import 'package:show_up_app/screens/event_manager/manage_attendence_screen.dart';
import 'package:show_up_app/widgets/buttons/primary_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EventOwnerProfileScreen extends StatelessWidget {
  const EventOwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<EventOwnerProvider>(
        builder: (context, provider, _) {
          return Skeletonizer(
            enabled: provider.isLoading,
            effect: ShimmerEffect(
              baseColor: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.15),
              highlightColor: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.05),
              duration: const Duration(milliseconds: 1200),
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 260,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 56),
                        Container(
                              width: 104,
                              height: 104,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: provider.imageUrl == null
                                    ? Theme.of(context).colorScheme.onSurface
                                          .withValues(alpha: 0.1)
                                    : null,
                                image: provider.imageUrl != null
                                    ? DecorationImage(
                                        image: NetworkImage(provider.imageUrl!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: provider.imageUrl == null
                                  ? Text(
                                      provider.name[0].toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                          ),
                                    )
                                  : null,
                            )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .scale(begin: const Offset(0.9, 0.9)),
                        const SizedBox(height: 12),
                        Text(
                          provider.name,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ).animate().fadeIn(delay: 120.ms).slideY(begin: 0.2),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Text(
                            provider.description,
                            textAlign: TextAlign.center,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                                ),
                          ),
                        ).animate().fadeIn(delay: 220.ms).slideY(begin: 0.2),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildStat(context, provider.eventsCount, 'Events'),
                        buildStat(
                          context,
                          provider.followersCount,
                          'Followers',
                        ),
                      ],
                    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.3),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: provider.events.length,
                      (context, index) {
                        final event = provider.events[index];

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
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    child: Image.network(
                                      event['image'],
                                      height: 160,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event['title'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.date_range,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(event['date']),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(event['location']),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(Icons.people, size: 16),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${event['attendees']} attendees',
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 14),
                                        PrimaryButton(
                                          text: 'Manage attendance',
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (_) =>
                                                    AttendanceManagementScreen(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .animate()
                            .fadeIn(delay: (index * 120).ms)
                            .slideX(begin: 0.2);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget buildStat(BuildContext context, int value, String label) {
  final theme = Theme.of(context);

  return Column(
    children: [
      Text(
        value.toString(),
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    ],
  );
}
