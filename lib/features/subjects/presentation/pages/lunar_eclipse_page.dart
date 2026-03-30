import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class LunarEclipsePage extends StatelessWidget {
  const LunarEclipsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quyosh va Oy Tutilishi'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white, 
          fontSize: 20, 
          fontWeight: FontWeight.bold
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            // color: const Color(0xff121212),
            child: const ModelViewer(
              backgroundColor: Color(0xff121212),
              src: 'assets/models/eclipse_lunar.glb',
              alt: "A 3D model of the Eclipse",
              ar: true,
              autoRotate: true,
              autoPlay: true,
              cameraControls: true,
              disableZoom: false,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white24, width: 1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.touch_app, color: Colors.amberAccent, size: 28),
                  const SizedBox(height: 8),
                  const Text(
                    "Tutilish hodisasini 3D o'lchamda tomosha qiling, uni barmoq yordamida aylantirishingiz yoki kattalashtirishingiz mumkin. 'AR' rejimiga o'tish uchun ekrandagi maxsus tugmani bosing.",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
