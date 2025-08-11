import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  Future<Map<String, dynamic>?> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    final doc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
    return doc.data();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("User data not found."));
          }

          final userData = snapshot.data!;
          final first = userData['firstName'] ?? '';
          final last = userData['lastName'] ?? '';
          final name = '$first $last'.trim();
          final email = userData['email'] ?? 'Email';
          final phone = userData['phone'] ?? 'Phone';
          final photoUrl = userData['photoUrl'] ?? '';

          return SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),

                // Profile Image Above
                CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                  backgroundImage:
                      photoUrl.isNotEmpty ? NetworkImage(photoUrl) : null,
                  child:
                      photoUrl.isEmpty
                          ? Icon(
                            Icons.person,
                            size: 40,
                            color: AppColors.primaryColor,
                          )
                          : null,
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SizedBox(
                      height: 100,
                      child: Stack(
                        children: [
                          Align(
                            alignment:
                                isRtl
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment:
                                  isRtl
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (name.isNotEmpty) ...[
                                  Text(name, style: textTheme.headlineSmall),
                                  const SizedBox(height: 12),
                                ],
                                Text(email, style: textTheme.bodySmall),
                                const SizedBox(height: 12),
                                Text(phone, style: textTheme.bodySmall),
                              ],
                            ),
                          ),

                          Align(
                            alignment:
                                isRtl
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                // TODO: Navigate to Edit Page
                              },
                              child: Text(
                                local.edit,
                                style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                _buildSettingsTile(
                  context,
                  icon: Icons.location_on,
                  label: local.address,
                  onTap: () async {
                    final userId = FirebaseAuth.instance.currentUser?.uid;
                    if (userId == null) return;

                    final snapshot =
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(userId)
                            .collection('addresses')
                            .get();

                    if (snapshot.docs.isEmpty) {
                      Navigator.pushNamed(context, Routes.addAddressPage);
                    } else {
                      Navigator.pushNamed(context, Routes.addressPage);
                    }
                  },
                ),
                _buildSettingsTile(
                  context,
                  icon: Icons.favorite,
                  label: local.myFavorites,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.myFavourites);
                  },
                ),
                _buildSettingsTile(
                  context,
                  icon: Icons.payment,
                  label: local.settings_payment,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.paymentScreen);
                  },
                ),
                _buildSettingsTile(
                  context,
                  icon: Icons.help_outline,
                  label: local.settings_help,
                  onTap: () {
                    //TODO : Nacigate to Help Page
                  },
                ),
                _buildSettingsTile(
                  context,
                  icon: Icons.support_agent,
                  label: local.settings_support,
                  onTap: () {
                    //TODO : Nacigate to Support Page
                  },
                ),

                const Spacer(),

                Center(
                  child: TextButton(
                    onPressed: () async {
                      await GoogleSignIn().signOut();
                      await FirebaseAuth.instance.signOut();
                      if (context.mounted) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.signInEmail,
                          (route) => false,
                        );
                      }
                    },
                    child: Text(
                      local.settings_signOut,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          leading: Icon(icon, color: theme.iconTheme.color),
          title: Text(label, style: theme.textTheme.bodyMedium),
          trailing: Icon(
            Icons.chevron_right,
            size: 40,
            color: theme.iconTheme.color,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
