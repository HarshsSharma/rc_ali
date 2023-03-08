import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/core/router.dart';
import 'package:phone_log/model/calls_log_model.dart';

import '../widget/default_info.dart';

class ContactDetails extends StatelessWidget {
  final CallsLogModel callsLogModel;
  const ContactDetails({super.key, required this.callsLogModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        title: const Text(
          'Contact Details',
          style: TextStyle(color: AppColors.black, fontSize: 22),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            )),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Edit',
                style: TextStyle(color: AppColors.black, fontSize: 18),
              )),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: AssetImage(callsLogModel.image),
                      fit: BoxFit.cover)),
            ),
            Text(
              callsLogModel.name,
              style: TextStyle(color: callsLogModel.color, fontSize: 22),
            ),
            const SizedBox(height: 5),
            const Text(
              'Nike LTD',
              style: TextStyle(color: AppColors.black60, fontSize: 13),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(25),
                      side: const BorderSide(
                          color: AppColors.borderLightGrey, width: 2),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Icon(
                      Icons.messenger_rounded,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)),
                      padding: const EdgeInsets.all(35),
                      side: const BorderSide(
                          color: AppColors.borderLightGrey, width: 2),
                      elevation: 5,
                      shadowColor: AppColors.shadowColor,
                      backgroundColor: AppColors.lightGreen,
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: AppColors.white,
                      size: 35,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(25),
                      side: const BorderSide(
                          color: AppColors.borderLightGrey, width: 2),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Icon(
                      Icons.email,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            DefaultInfo(
              onTap: () => Navigator.pushNamed(
                  context, AppRouterNames.contactAddresses,
                  arguments: [callsLogModel.addresses, callsLogModel.name]),
              title: 'Address',
              info: callsLogModel.addresses.first.info,
            ),
            DefaultInfo(
              onTap: () => Navigator.pushNamed(
                  context, AppRouterNames.contactPhones,
                  arguments: [callsLogModel.phones, callsLogModel.name]),
              title: 'Phone Number',
              info: callsLogModel.phones.first.info,
            ),
            DefaultInfo(
              onTap: () => Navigator.pushNamed(
                  context, AppRouterNames.contactEmails,
                  arguments: [callsLogModel.emails, callsLogModel.name]),
              title: 'Email',
              info: callsLogModel.emails.first.info,
            ),
          ],
        ),
      ),
    );
  }
}
