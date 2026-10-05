import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState
    extends State<AnimatedContainerScreen> {

  bool isLarge = false;

  void changeContainer() {
    setState(() {
      isLarge = !isLarge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'Animated Container',
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: isLarge ? 250 : 120,
                height: isLarge ? 250 : 120,
                decoration: BoxDecoration(
                  color: isLarge ? Colors.orange : Colors.blue,
                  borderRadius: BorderRadius.circular(
                    isLarge ? 50 : 10,
                  ),
                ), 
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: changeContainer,
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}