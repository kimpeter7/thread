import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  Icon(Icons.arrow_back_ios,
                      color: Colors.white, size: 24),
                  // Silent mode icon
                  Transform.rotate(
                    angle: 45 * 3.14 / 180,
                    child: Icon(Icons.music_off,
                        color: Colors.white, size: 24),
                  ),
                  // Camera flip icon
                  Icon(Icons.flip_camera_ios,
                      color: Colors.white, size: 24),
                ],
              ),
            ),

            // Camera preview space (expanded)
            Expanded(
              child: Container(
                color: Colors.black,
              ),
            ),

            // Bottom controls
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Shutter button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // Bottom tab bar
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Camera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        'Library',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Usage:
void main() {
  runApp(MaterialApp(
    home: CameraScreen(),
    theme: ThemeData.dark(),
  ));
}