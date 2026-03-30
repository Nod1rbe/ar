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

class BeePollinationPage extends StatefulWidget {
  const BeePollinationPage({super.key});

  @override
  State<BeePollinationPage> createState() => _BeePollinationPageState();
}

class _BeePollinationPageState extends State<BeePollinationPage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  
  ARNode? leftFlower;
  ARNode? rightFlower;
  ARNode? beeNode;
  
  bool _isFlying = false;
  double _beePositionX = -0.5;
  Timer? _flyTimer;

  final String flowerUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Avocado/glTF-Binary/Avocado.glb";
  final String beeUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Duck/glTF-Binary/Duck.glb";

  @override
  void dispose() {
    _flyTimer?.cancel();
    arSessionManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asalari Changlantirish'), backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ARView(onARViewCreated: onARViewCreated, planeDetectionConfig: PlaneDetectionConfig.horizontal),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                if (beeNode != null && !_isFlying)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    icon: const Icon(Icons.flight_takeoff, color: Colors.black),
                    label: const Text('Changlantirish', style: TextStyle(color: Colors.black, fontSize: 18)),
                    onPressed: _startFlying,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onARViewCreated(
    ARSessionManager session, ARObjectManager object, ARAnchorManager anchor, ARLocationManager location) {
    arSessionManager = session;
    arObjectManager = object;
    arSessionManager!.onInitialize(showFeaturePoints: false, showPlanes: true);
    arObjectManager!.onInitialize();
    _placeObjects();
  }

  Future<void> _placeObjects() async {
    leftFlower = ARNode(type: NodeType.webGLB, uri: flowerUrl, scale: math.Vector3(0.3, 0.3, 0.3), position: math.Vector3(-0.5, -0.5, -1.5));
    rightFlower = ARNode(type: NodeType.webGLB, uri: flowerUrl, scale: math.Vector3(0.3, 0.3, 0.3), position: math.Vector3(0.5, -0.5, -1.5));
    beeNode = ARNode(type: NodeType.webGLB, uri: beeUrl, scale: math.Vector3(0.1, 0.1, 0.1), position: math.Vector3(_beePositionX, 0.0, -1.5));

    await arObjectManager!.addNode(leftFlower!);
    await arObjectManager!.addNode(rightFlower!);
    await arObjectManager!.addNode(beeNode!);
    setState(() {});
  }

  void _startFlying() {
    setState(() => _isFlying = true);
    _flyTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_beePositionX >= 0.5) {
        timer.cancel();
        return;
      }
      _beePositionX += 0.05;
      if (beeNode != null) {
        arObjectManager!.removeNode(beeNode!);
        beeNode = ARNode(type: NodeType.webGLB, uri: beeUrl, scale: math.Vector3(0.1, 0.1, 0.1), position: math.Vector3(_beePositionX, 0.0, -1.5));
        arObjectManager!.addNode(beeNode!);
      }
    });
  }
}
