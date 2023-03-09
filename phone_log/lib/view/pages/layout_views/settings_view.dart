import 'package:flutter/material.dart';
import 'package:phone_log/controller/layout_view_model.dart';
import 'package:phone_log/core/constant/app_assets.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/core/shared/enums.dart';
import 'package:phone_log/view/widget/default_info.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight,
        backgroundColor: AppColors.scaffoldBG,
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: AppColors.white),
        ),
        actions: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout_outlined,
                  color: AppColors.white,
                ),
                label: const Text(
                  'Log out',
                  style: TextStyle(color: AppColors.white),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                showLanguagesDialog(context);
              },
              title: const Text(
                'Grid Information',
                style: TextStyle(color: AppColors.darkGrey, fontSize: 16),
              ),
              subtitle: Consumer<LayoutViewModel>(
                builder: (context, value, child) => Text(
                  value.gridType,
                  style: const TextStyle(color: AppColors.black, fontSize: 18),
                ),
              ),
            ),
            DefaultInfo(
                title: 'Notification Preferences',
                info: 'All Enabled',
                onTap: () {}),
            const Divider(
              height: 20,
              color: AppColors.borderLightGrey,
              thickness: 20,
            ),
            ListTile(
              title: const Text(
                'Ali Hassan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: const Text(
                'Agent',
              ),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(AppAssets.person),
                        fit: BoxFit.cover)),
              ),
            ),
            DefaultInfo(
                title: 'Address',
                info: '3966 Tibbs Avenue, Dallas, TX, 75845',
                onTap: () {}),
            DefaultInfo(
                title: 'Phone Number',
                info: '(212) - 960 - 0000',
                onTap: () {}),
            DefaultInfo(
                title: 'Email', info: 'timothy.snow@wme.com', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

showLanguagesDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.white,
                  )),
              const Text('Grid Inforamtion'),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.black,
                  )),
            ],
          ),
          const Divider(
            color: AppColors.scaffoldBG,
          ),
          Column(
              children: GridType.values.map((e) {
            final isSelected =
                e.name == context.watch<LayoutViewModel>().gridType;
            return ListTile(
                onTap: () {
                  context.read<LayoutViewModel>().changeGridType(e.name);
                },
                title: Text(e.name),
                trailing: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: isSelected
                          ? null
                          : Border.all(color: AppColors.darkGrey),
                      color: isSelected ? AppColors.babyBlue : AppColors.white,
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.check,
                    size: 20,
                    color: AppColors.white,
                  ),
                ));
          }).toList())
        ],
      );
    },
  );
}
