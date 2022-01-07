import 'dart:ui';

import 'package:oi_app/utils/appTheme.dart';

import 'model/card_details.dart';
import 'model/user_profile.dart';

UserProfile myProfile=UserProfile();
List<CardDetails> cardDetails;

List<String> spendPoints=[
  'At checkout',
  'Gift cards',
  'Cover charges',
  'Travel',
  'Shop with members'
];
Color darkColor=const Color(0xFF222A36);
Color lightColor=const Color(0xFFF4F5F9);
Color purpleColor=const Color(0xFF9D5FFD);
Color blue=HexColor('#232A36');