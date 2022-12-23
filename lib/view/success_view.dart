import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payment_interface/view/base_view.dart';
import 'package:payment_interface/viewmodels/success_viewmodel.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({required this.amount, super.key});
  final String amount;

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SuccessViewModel>(
      builder: (context, model, child) {
        _animationController.addListener(() {
          // when animation is completed
          if (_animationController.isCompleted) {
            model.animationCompleted = true;
          }
        });

        return Scaffold(
          backgroundColor: Colors.blue[800],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: Lottie.asset(
                  'assets/lottie.json',
                  repeat: false,
                  onLoaded: (LottieComposition composition) {
                    _animationController
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
              if (model.animationCompleted)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  child: Column(
                    children: [
                      Text(
                        '₹${widget.amount} paid',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Max Life Pharma',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'mlp19230@upi',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white38,
                        ),
                      ),
                      const SizedBox(height: 25),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.blue[900],
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
