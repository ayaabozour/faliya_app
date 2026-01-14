import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/models/enums/account_type.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';
import 'package:show_up_app/providers/user_type_provider.dart';
import 'package:show_up_app/screens/auth_screens/attender_login_screen.dart';
import 'package:show_up_app/widgets/cards/account_type_card.dart';

class ChooseUserTypeScreen extends StatelessWidget {
  const ChooseUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SelectAccountTypeProvider, SharedPrefsProvider>(
      builder: (context, provider, prefsProvider, _) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Choose your account type",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "This helps us tailor the experience just for you",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 70),
                  SvgPicture.asset(
                    "assets/icons/choose_user_type.svg",
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 70),
                  AccountTypeCard(
                    title: "Event Manager",
                    description:
                        "Create, organize, and manage events professionally",
                    icon: Icons.event_rounded,
                    isSelected: provider.selectedType == AccountType.owner,
                    onTap: () => provider.selectType(AccountType.owner),
                  ),
                  const SizedBox(height: 20),
                  AccountTypeCard(
                    title: "Attendee",
                    description:
                        "Discover events, register easily, and enjoy experiences",
                    icon: Icons.people_alt_rounded,
                    isSelected: provider.selectedType == AccountType.attender,
                    onTap: () => provider.selectType(AccountType.attender),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: provider.canContinue
                          ? () async {
                              await provider.saveUserType(prefsProvider);
                              if (!context.mounted) return;

                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => const AttenderLoginScreen(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.onSurface,
                        elevation: 3,
                      ),
                      child: Text(
                        "Continue",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
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
