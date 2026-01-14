import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/providers/bottom_nav_provider.dart';
import 'package:show_up_app/screens/event_manager/my_events_screen.dart';
import 'package:show_up_app/screens/event_manager/profile_screen.dart';

class ManagerBottomNav extends StatefulWidget {
  const ManagerBottomNav({super.key});

  @override
  State<ManagerBottomNav> createState() => _ManagerBottomNavState();
}

class _ManagerBottomNavState extends State<ManagerBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _managerScreens[provider.currentIndex],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 4,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            onPressed: () {},
            child: const Icon(Icons.add, color: Colors.white),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ManagerNavItem(
                    icon: Icons.event_note_rounded,
                    isSelected: provider.currentIndex == 0,
                    onTap: () => provider.changeIndex(0),
                  ),
                  _ManagerNavItem(
                    icon: Icons.person_rounded,
                    isSelected: provider.currentIndex == 1,
                    onTap: () => provider.changeIndex(1),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

final _managerScreens = [ManagerEventScreen(), EventOwnerProfileScreen()];

class _ManagerNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ManagerNavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: isSelected ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Icon(
          icon,
          size: 26,
          color: isSelected
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}
