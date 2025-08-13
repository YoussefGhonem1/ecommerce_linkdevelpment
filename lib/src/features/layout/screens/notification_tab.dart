import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/layout/models/notification_model.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_Empty_Notification.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_notification_list.dart';
import 'package:ecommerce_app/src/shared/components/loading_screen.dart';
import 'package:flutter/material.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({super.key});

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate loading delay
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
      final List<NotificationModel> notificationList = [
    NotificationModel(
      title: AppLocalizations.of(context)!.orderShipped,
      isRead: true,
    ),
    NotificationModel(
      title:AppLocalizations.of(context)!.orderGilbertConfirmed,
      isRead: false,
    ),
    NotificationModel(title:AppLocalizations.of(context)!.itemOutForDelivery, isRead: false),
    NotificationModel(
      title: AppLocalizations.of(context)!.orderCanceled,
      isRead: true,
    ),
    NotificationModel(title: AppLocalizations.of(context)!.discountsOnSelectedItems, isRead: true),
  ];
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title:  Text( AppLocalizations.of(context)!.notifications),
          automaticallyImplyLeading: false,
        ),
        body:
            notificationList.isEmpty
                ? const BuildEmptyNotification()
                : BuildNotificationList(notifications: notificationList),
      ),
    );
  }
}
