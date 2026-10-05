import 'package:flutter/material.dart';

class AnimationControllerScreen extends StatefulWidget {
  const AnimationControllerScreen({super.key});

  @override
  State<AnimationControllerScreen> createState() =>
      _AnimationControllerScreenState();
}

class _AnimationControllerScreenState
    extends State<AnimationControllerScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(controller);
  }

  void startAnimation() {
    controller.forward(from: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: animation.value,
                  child: child,
                );
              },
              child: Container(
                width: 150,
                height: 150,
                color: Colors.purple,
                child: const Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: startAnimation,
              child: const Text('Rotate'),
            ),
          ],
        ),
      ),
    );
  }
}