import 'package:ecommerce_app/src/shared/components/loading_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_Empty_Notification.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_notification_list.dart';
import '../provider/notification_provider.dart';

class NotificationTab extends ConsumerStatefulWidget {
  const NotificationTab({super.key});

  @override
  ConsumerState<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends ConsumerState<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    final notificationsAsync = ref.watch(notificationStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notifications),
        automaticallyImplyLeading: false,
      ),
      body: notificationsAsync.when(
        data: (notifications) {
          if (notifications.isEmpty) return const BuildEmptyNotification();
          return BuildNotificationList(notifications: notifications);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
