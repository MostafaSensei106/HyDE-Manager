import 'package:flutter/material.dart';
import 'package:hydemanager/core/widgets/lottie_component/lottie_component.dart';

void errorScreen() {
  ErrorWidget.builder = (details) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LottieComponent(
                text: 'Something went wrong',
                lottiePath: '',
              ),
              const SizedBox(height: 8),
              Text(
                details.exception.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  };
}
