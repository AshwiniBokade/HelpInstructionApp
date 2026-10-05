import 'package:flutter/material.dart';
import 'package:help_instruction_app/screens/animations/animated_container_screen.dart';
import 'package:help_instruction_app/screens/animations/animated_controller_screen.dart';
import 'package:help_instruction_app/screens/animations/animated_opacity_screen.dart';

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final demos = [
      (title: 'Animated Container', color: Colors.pinkAccent),
      (title: 'Animated Opacity', color: Colors.teal),
      (title: 'Animated Rotation', color: Colors.amber),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animations',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: demos.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final demo = demos[index];
          return Hero(
            tag: demo.title,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () { 
                // get the title details of the selected demo 
                if (demo.title == 'Animated Container') {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedContainerScreen())); 
                } else if (demo.title == 'Animated Opacity') {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedOpacityScreen())); 
                } else if (demo.title == 'Animated Rotation') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnimationControllerScreen())); 
                } 
              },
              child: Container(
                height: 100,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: demo.color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  demo.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
  