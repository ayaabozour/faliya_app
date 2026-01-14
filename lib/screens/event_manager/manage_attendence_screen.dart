import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' hide ShimmerEffect;
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:show_up_app/providers/attendence_provider.dart';
import 'package:show_up_app/widgets/tab_bar/custom_tab_bar.dart';

class AttendanceManagementScreen extends StatefulWidget {
  const AttendanceManagementScreen({super.key});

  @override
  State<AttendanceManagementScreen> createState() =>
      _AttendanceManagementScreenState();
}

class _AttendanceManagementScreenState extends State<AttendanceManagementScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Consumer<AttendanceProvider>(
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
            child: Column(
              children: [
                SizedBox(
                  height: 320,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(provider.eventImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withValues(alpha: 0.25),
                                  Colors.black.withValues(alpha: 0.05),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 48,
                        left: 24,
                        right: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              provider.eventTitle,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black38,
                                        blurRadius: 6,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                            ).animate().fadeIn(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 16,
                        right: 16,
                        child: Material(
                          elevation: 6,
                          shadowColor: Colors.black26,
                          borderRadius: BorderRadius.circular(32),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: CustomTabBar(
                              selectedIndex: selectedIndex,
                              tabs: const ["Pending", "Accepted"],
                              onTap: (index) {
                                setState(() {
                                  selectedIndex = index;
                                });
                                _tabController.animateTo(index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      buildAttendeesList(provider.pendingAttendees, provider),
                      buildAttendeesList(provider.acceptedAttendees, provider),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildAttendeesList(
    List<Map<String, String>> attendees,
    AttendanceProvider provider,
  ) {
    if (attendees.isEmpty) {
      return Center(
        child: Text(
          "No attendees",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      itemCount: attendees.length,
      itemBuilder: (context, index) {
        final attendee = attendees[index];
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(attendee['image']!),
                    backgroundColor: Colors.grey[200],
                  ).animate().fadeIn(delay: 100.ms).scale(),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          attendee['name']!,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          attendee['major']!,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[700]),
                        ),
                        if (attendee.containsKey('time')) ...[
                          const SizedBox(height: 2),
                          Text(
                            "Requested at ${attendee['time']}",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.grey[500]),
                          ),
                        ],
                      ],
                    ).animate().fadeIn(delay: 120.ms).slideY(),
                  ),
                  if (attendees == provider.pendingAttendees)
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => provider.acceptAttendee(index),
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () => provider.rejectAttendee(index),
                          icon: const Icon(Icons.cancel, color: Colors.red),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ).animate().fadeIn(delay: (index * 100).ms).slideX(begin: 0.2),
        );
      },
    );
  }
}
