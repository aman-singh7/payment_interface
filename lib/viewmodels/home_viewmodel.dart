import 'package:flutter/material.dart';
import 'package:payment_interface/viewmodels/base_viewmodel.dart';

class HomeViewModel extends BaseModel {
  final promotions = [
    {'color': Colors.orange, 'title': 'Rewards', 'icon': Icons.emoji_events},
    {'color': Colors.red[700], 'title': 'Offers', 'icon': Icons.local_offer},
    {'color': null, 'title': 'Referrals', 'icon': Icons.share_outlined},
  ];
}
