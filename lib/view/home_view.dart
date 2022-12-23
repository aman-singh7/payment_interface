import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:payment_interface/view/base_view.dart';
import 'package:payment_interface/viewmodels/home_viewmodel.dart';

import 'components/invite_component.dart';
import 'components/promotion_component.dart';
import 'components/user_list_component.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CircleAvatar(
            child: Icon(
              Icons.center_focus_weak,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            child: Icon(Icons.people),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 25,
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        const SizedBox(width: 100),
        const Icon(Icons.arrow_forward_ios, size: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            color: Colors.blue[700],
            child: Stack(
              children: [
                _buildHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 100, horizontal: 110),
                  child: Image.asset(
                    "assets/google_icon.png",
                    fit: BoxFit.contain,
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  minChildSize: 0.6,
                  builder: (context, controller) {
                    return ListView.builder(
                      controller: controller,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  height: 5,
                                  width: 40,
                                  margin: const EdgeInsets.only(
                                    top: 12,
                                    bottom: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              _buildSectionHeader('People'),
                              const SizedBox(height: 20),
                              UserListComponent(controller: controller),
                              Dash(
                                dashColor: Colors.grey[300]!,
                                dashLength: 3,
                                direction: Axis.horizontal,
                                length: MediaQuery.of(context).size.width - 60,
                                dashThickness: 2,
                                dashGap: 5,
                              ),
                              const SizedBox(height: 30),
                              _buildSectionHeader(
                                'Business and bill',
                                showTrailing: true,
                              ),
                              const SizedBox(height: 20),
                              UserListComponent(controller: controller),
                              Dash(
                                dashColor: Colors.grey[300]!,
                                dashLength: 3,
                                direction: Axis.horizontal,
                                length: MediaQuery.of(context).size.width - 60,
                                dashThickness: 2,
                                dashGap: 5,
                              ),
                              const SizedBox(height: 30),
                              _buildSectionHeader('Promotions'),
                              const SizedBox(height: 20),
                              PromotionData(promotions: model.promotions),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 50),
                                child: Column(
                                  children: [
                                    _buildActionTile("See all payment activity",
                                        Icons.history),
                                    const SizedBox(height: 15),
                                    _buildActionTile("Check account balance",
                                        Icons.account_balance),
                                  ],
                                ),
                              ),
                              const InviteComponent(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title, {bool showTrailing = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (showTrailing)
            Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.blue[600],
                      size: 20,
                    ),
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
