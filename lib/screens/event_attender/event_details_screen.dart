import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_up_app/widgets/buttons/custom_back_button.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => EventDetailsScreenState();
}

class EventDetailsScreenState extends State<EventDetailsScreen> {
  bool expandedAbout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 330.h,
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.surface,
            leading: const CustomBackButton(),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              collapseMode: CollapseMode.pin,
              titlePadding: const EdgeInsets.only(left: 56, bottom: 16),
              title: Text(
                'Design Conference 2026',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ).animate().fadeIn(duration: 300.ms),
              background:
                  Image.network(
                        'https://images.unsplash.com/photo-1503428593586-e225b39bddfe',
                        fit: BoxFit.cover,
                      )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .scale(begin: const Offset(1.06, 1.06)),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -26),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Design Conference 2026',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.25),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            '12 Feb 2026 • 6:00 PM',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sarah Johnson',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Event Manager',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.2),
                      const SizedBox(height: 24),
                      Text(
                        'Schedule',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ).animate().fadeIn(delay: 400.ms),
                      const SizedBox(height: 8),
                      Text(
                        '• Day 1: UX & Product Design\n'
                        '• Day 2: UI Systems & Branding\n'
                        '• Day 3: Design Leadership',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(height: 1.6),
                      ).animate().fadeIn(delay: 450.ms).slideY(begin: 0.1),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'About the Event',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                expandedAbout = !expandedAbout;
                              });
                            },
                            child: Text(
                              expandedAbout ? 'Show less' : 'Read more',
                            ),
                          ),
                        ],
                      ).animate().fadeIn(delay: 500.ms),
                      AnimatedSize(
                        duration: 300.ms,
                        curve: Curves.easeInOut,
                        child: Text(
                          'This conference brings together top designers, '
                          'product leaders, and creatives to explore the future '
                          'of design, user experience, and innovation. '
                          'You will attend workshops, talks, panels, and '
                          'networking sessions with industry experts from '
                          'around the world.',
                          maxLines: expandedAbout ? 20 : 6,
                          overflow: TextOverflow.fade,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                      ).animate().fadeIn(delay: 550.ms),
                      const SizedBox(height: 24),
                      Text(
                        'What You’ll Gain',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ).animate().fadeIn(delay: 600.ms),
                      const SizedBox(height: 8),
                      Text(
                        '• Practical design frameworks\n'
                        '• Networking with industry leaders\n'
                        '• Real-world case studies\n'
                        '• Career growth insights',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(height: 1.6),
                      ).animate().fadeIn(delay: 650.ms).slideY(begin: 0.1),
                      const SizedBox(height: 34),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child:
                            ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Enroll Now',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                                .animate()
                                .fadeIn(delay: 750.ms)
                                .scale(begin: const Offset(0.96, 0.96)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
