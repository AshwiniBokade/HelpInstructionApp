import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() =>
      _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState
    extends State<AnimatedOpacityScreen> {

  bool isVisible = true;

  void changeOpacity() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Hello Flutter!',
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
              onPressed: changeOpacity,
              child: const Text('Fade'),
            ),
          ],
        ),
      ),
    );
  }
}