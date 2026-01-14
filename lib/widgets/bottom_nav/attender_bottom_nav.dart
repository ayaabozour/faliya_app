import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/providers/bottom_nav_provider.dart';
import 'package:show_up_app/screens/event_attender/discover_screen.dart';
import 'package:show_up_app/screens/event_attender/my_events_screen.dart';
import 'package:show_up_app/screens/event_attender/profile_screen.dart';

class AttenderBottomNav extends StatefulWidget {
  const AttenderBottomNav({super.key});

  @override
  State<AttenderBottomNav> createState() => _AttenderBottomNavState();
}

class _AttenderBottomNavState extends State<AttenderBottomNav> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavProvider(),
      child: Consumer<BottomNavProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _screens[provider.currentIndex],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withValues(alpha: 0.08),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => _NavItem(
                    icon: _icons[index],
                    label: _labels[index],
                    isSelected: provider.currentIndex == index,
                    onTap: () => provider.changeIndex(index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final _screens = [
  DiscoverScreen(),
  AttenderEventScreen(),
  AttenderProfileScreen(),
];

final _icons = [
  Icons.explore_rounded,
  Icons.event_available_rounded,
  Icons.person_rounded,
];

final _labels = ['Discover', 'My Events', 'Profile'];

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
