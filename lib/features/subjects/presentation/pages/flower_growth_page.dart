import 'dart:async';
import 'package:ar_flutter_plugin_plus/ar_flutter_plugin_plus.dart';
import 'package:ar_flutter_plugin_plus/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_plus/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_plus/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class FlowerGrowthPage extends StatefulWidget {
  const FlowerGrowthPage({super.key});

  @override
  State<FlowerGrowthPage> createState() => _FlowerGrowthPageState();
}

class _FlowerGrowthPageState extends State<FlowerGrowthPage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARNode? flowerNode;
  
  bool _isWatered = false;
  double _currentScale = 0.05;
  Timer? _growthTimer;

  // Fake URL for prototyping (Will be replaced with real flower .glb later)
  final String flowerModelUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Avocado/glTF-Binary/Avocado.glb";

  @override
  void dispose() {
    _growthTimer?.cancel();
    arSessionManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gul O\'sishi'), backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontal,
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                if (flowerNode != null && !_isWatered)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    icon: const Icon(Icons.water_drop, color: Colors.white),
                    label: const Text('Suv quyish', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onPressed: _startGrowing,
                  ),
                if (_isWatered)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                    child: const Text("Gul o'smoqda... (Scale o'zgarishi)", style: TextStyle(color: Colors.white)),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager arAnchorManager,
    ARLocationManager arLocationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;

    arSessionManager!.onInitialize(showFeaturePoints: false, showPlanes: true);
    arObjectManager!.onInitialize();
    
    _placeInitialSeed();
  }

  Future<void> _placeInitialSeed() async {
    flowerNode = ARNode(
      type: NodeType.webGLB,
      uri: flowerModelUrl,
      scale: math.Vector3(_currentScale, _currentScale, _currentScale),
      position: math.Vector3(0.0, -0.5, -1.0),
    );

    await arObjectManager!.addNode(flowerNode!);
    setState(() {});
  }

  void _startGrowing() {
    setState(() => _isWatered = true);
    
    _growthTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_currentScale >= 0.5) { // Max scale
        timer.cancel();
        return;
      }
      
      _currentScale += 0.01;
      
      // Node o'lchamini kattalashtirish
      if (flowerNode != null) {
        // Agar arObjectManager da aniq transform bo'lsa uni ishlatish kerak.
        // Hozircha oddiy yangilik sifatida scale ni o'zgartiramiz:
        var newScale = math.Vector3(_currentScale, _currentScale, _currentScale);
        
        // Note: Simple replacing or modifying parameter depending on plugin version.
        // We will just re-add it or depend on memory reference update if plugin supports it.
        // As a robust baseline, we remove and add to simulate animation if direct `scale` setter is not working visually.
        arObjectManager!.removeNode(flowerNode!);
        
        flowerNode = ARNode(
          type: NodeType.webGLB,
          uri: flowerModelUrl,
          scale: newScale,
          position: math.Vector3(0.0, -0.5, -1.0),
        );
        arObjectManager!.addNode(flowerNode!);
      }
    });
  }
}
