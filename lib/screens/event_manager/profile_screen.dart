import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' hide ShimmerEffect;
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:show_up_app/providers/auth_provider.dart';
import 'package:show_up_app/providers/profile_provider.dart';
import 'package:show_up_app/screens/auth_screens/choose_user_type_screen.dart';
import 'package:show_up_app/screens/event_manager/manage_attendence_screen.dart';
import 'package:show_up_app/theme/color/color_manager.dart';
import 'package:show_up_app/widgets/buttons/custom_back_button.dart';
import 'package:show_up_app/widgets/cards/profile_event_card.dart';

class EventOwnerProfileScreen extends StatelessWidget {
  const EventOwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Consumer<ProfileProvider>(
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
                  leading: const CustomBackButton(),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: ColorManager.instance.error,
                      ),
                      tooltip: 'Logout',
                      onPressed: () async {
                        final authProvider = context.read<AuthProvider>();
                        await authProvider.logout();
                        if (!context.mounted) return;
                        Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => const ChooseUserTypeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  flexibleSpace: FlexibleSpaceBar(
                    background: SafeArea(
                      bottom: false,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                    width: 104,
                                    height: 104,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.1),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      provider.name[0].toUpperCase(),

                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                          ),
                                    ),
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms)
                                  .scale(begin: const Offset(0.9, 0.9)),

                              const SizedBox(height: 12),

                              Text(
                                provider.name,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ).animate().fadeIn(delay: 120.ms),

                              const SizedBox(height: 6),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28,
                                ),
                                child: Text(
                                  provider.description,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withValues(alpha: 0.6),
                                      ),
                                ),
                              ).animate().fadeIn(delay: 220.ms),
                            ],
                          ),
                        ),
                      ),
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
                  sliver: provider.events.isEmpty
                      ? const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(child: Text('No events yet')),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: provider.events.length,
                            (context, index) {
                              final evt = provider.events[index];
                              return ProfileEventCard(
                                    eventAttendee: (evt['attendees'] ?? '')
                                        .toString(),
                                    eventName: evt['title'] ?? '',
                                    eventLocation: evt['location'] ?? '',
                                    eventDate: evt['date'] ?? '',
                                    image: evt['image'] ?? '',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (_) =>
                                              AttendanceManagementScreen(),
                                        ),
                                      );
                                    },
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
  return Column(
    children: [
      Text(
        value.toString(),
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    ],
  );
}
