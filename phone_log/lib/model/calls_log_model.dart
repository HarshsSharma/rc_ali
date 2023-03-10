import 'package:flutter/material.dart';
import 'package:phone_log/core/constant/app_assets.dart';
import 'package:phone_log/core/constant/app_colors.dart';

class CallsLogModel {
  final String name;
  final String status;
  final Color color;
  final List<Info> phones;
  final List<Info> emails;
  final List<Info> addresses;
  final String image;
  final String subject;
  final String reasong;
  final String proprity;
  final String category;

  CallsLogModel(
      this.name,
      this.status,
      this.color,
      this.phones,
      this.emails,
      this.addresses,
      this.image,
      this.subject,
      this.reasong,
      this.proprity,
      this.category);
}

class Info {
  final String label;
  final String info;

  Info(this.label, this.info);
}

List<CallsLogModel> callsLogs = [
  CallsLogModel(
    'Ali Hassan',
    'New'.toUpperCase(),
    AppColors.babyBlue,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Nike LTD',
    'To confirm deadlines.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Completed'.toUpperCase(),
    AppColors.black,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Warner Bros.'
        'Nike LTD',
    'To confirm deadlines.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Completed'.toUpperCase(),
    AppColors.babyBlue,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Warner Bros.',
    'Discovering potential business opportunities.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'New'.toUpperCase(),
    AppColors.green,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Warner Bros.',
    'Discovering potential business opportunities.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Future call'.toUpperCase(),
    AppColors.babyBlue,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'To confirm deadlines.',
    'Atlantic Records',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'New'.toUpperCase(),
    AppColors.black,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Atlantic Records',
    'Negotiate deal fees and other financials.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Future call'.toUpperCase(),
    AppColors.darkred,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'To confirm deadlines.',
    'Atlantic Records',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Left Word'.toUpperCase(),
    AppColors.green,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Universal Studio',
    'Negotiate deal fees and other financials.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'New'.toUpperCase(),
    AppColors.black,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Universal Studio',
    'Discovering potential business opportunities.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Left Word'.toUpperCase(),
    AppColors.darkred,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Universal Studio',
    'Discovering potential business opportunities.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'New'.toUpperCase(),
    AppColors.black,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Warner Bros.',
    'To confirm deadlines.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Completed'.toUpperCase(),
    AppColors.babyBlue,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Warner Bros.',
    'Negotiate deal fees and other financials.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'New'.toUpperCase(),
    AppColors.darkred,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Nike LTD',
    'Discovering potential business opportunities.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Left Word'.toUpperCase(),
    AppColors.babyBlue,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Nike LTD',
    'Discovering potential business opportunities.',
    'Low',
    'category 1',
  ),
  CallsLogModel(
    'Ali Hassan',
    'Future call'.toUpperCase(),
    AppColors.green,
    [
      Info('Office Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
      Info('Mobile Phone', '+1 995 123 7541'),
    ],
    [
      Info('Business Email', '+1 995 123 7541'),
      Info('Personal Email', '+1 995 123 7541'),
      Info('Other Email', '+1 995 123 7541'),
    ],
    [
      Info('Office Address', '+1 995 123 7541'),
      Info('Home Address', '+1 995 123 7541'),
    ],
    AppAssets.person,
    'Warner Bros.',
    'To confirm deadlines.',
    'Low',
    'category 1',
  ),
];
