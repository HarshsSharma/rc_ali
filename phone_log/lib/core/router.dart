import 'package:flutter/material.dart';
import 'package:phone_log/controller/add_new_entry_view_model.dart';
import 'package:phone_log/controller/auth_view_model.dart';
import 'package:phone_log/controller/layout_view_model.dart';
import 'package:phone_log/model/calls_log_model.dart';
import 'package:phone_log/view/pages/add_new_entry.dart';
import 'package:phone_log/view/pages/contact_adresses.dart';
import 'package:phone_log/view/pages/contact_details.dart';
import 'package:phone_log/view/pages/contact_emails.dart';
import 'package:phone_log/view/pages/contact_phones.dart';
import 'package:phone_log/view/pages/layout_page.dart';
import 'package:phone_log/view/pages/login_page.dart';
import 'package:provider/provider.dart';

class AppRouterNames {
  static const String layout = '/layout_screen';
  static const String addNewEntry = '/add_new_entry';
  static const String contactDetails = '/contact_details';
  static const String contactPhones = '/contact_phones';
  static const String contactEmails = '/contact_emails';
  static const String contactAddresses = '/contact_addresses';
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                create: (context) => AuthViewModel(),
                child: const LoginPage()));
      case AppRouterNames.layout:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                create: (context) => LayoutViewModel(),
                child: const LayoutPage()));
      case AppRouterNames.addNewEntry:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                create: (context) => AddNewEntryViewMOdel(),
                child: const AddNewEntry()));
      case AppRouterNames.contactDetails:
        CallsLogModel logModel = settings.arguments as CallsLogModel;
        return MaterialPageRoute(
            builder: (_) => ContactDetails(
                  callsLogModel: logModel,
                ));
      case AppRouterNames.contactEmails:
        List arguments = settings.arguments! as List;
        List<Info> infoList = arguments[0];
        String name = arguments[1];
        return MaterialPageRoute(
            builder: (_) => ContactEmailsScreen(
                  infoList: infoList,
                  name: name,
                ));
      case AppRouterNames.contactAddresses:
        List arguments = settings.arguments! as List;
        List<Info> infoList = arguments[0];
        String name = arguments[1];
        return MaterialPageRoute(
            builder: (_) => ContactAddressesScreen(
                  infoList: infoList,
                  name: name,
                ));
      case AppRouterNames.contactPhones:
        List arguments = settings.arguments! as List;
        List<Info> infoList = arguments[0];
        String name = arguments[1];
        return MaterialPageRoute(
            builder: (_) => ContactPhonesScreen(
                  infoList: infoList,
                  name: name,
                ));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Unknown route'),
            ),
          ),
        );
    }
  }
}
