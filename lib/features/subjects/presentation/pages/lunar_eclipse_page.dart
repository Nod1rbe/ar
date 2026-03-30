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

class LunarEclipsePage extends StatefulWidget {
  const LunarEclipsePage({super.key});

  @override
  State<LunarEclipsePage> createState() => _LunarEclipsePageState();
}

class _LunarEclipsePageState extends State<LunarEclipsePage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  
  ARNode? moonNode;
  
  bool _isEclipse = false;
  double _moonPosX = 0.8;
  Timer? _moveTimer;

  final String earthUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Duck/glTF-Binary/Duck.glb"; 
  final String moonUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Avocado/glTF-Binary/Avocado.glb"; 

  @override
  void dispose() {
    _moveTimer?.cancel();
    arSessionManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Oy Tutilishi'), backgroundColor: Colors.transparent, elevation: 0),
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
                if (moonNode != null && !_isEclipse)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    icon: const Icon(Icons.dark_mode, color: Colors.white),
                    label: const Text('Tutilishni Boshlash', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onPressed: _startEclipse,
                  ),
                if (_isEclipse)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                    child: const Text("Oy Quyosh va Yer o'rtasidan aylanmoqda...", style: TextStyle(color: Colors.white)),
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
    var earthNode = ARNode(type: NodeType.webGLB, uri: earthUrl, scale: math.Vector3(0.2, 0.2, 0.2), position: math.Vector3(0.0, 0.0, -1.5));
    moonNode = ARNode(type: NodeType.webGLB, uri: moonUrl, scale: math.Vector3(0.05, 0.05, 0.05), position: math.Vector3(_moonPosX, 0.0, -1.0));

    await arObjectManager!.addNode(earthNode);
    await arObjectManager!.addNode(moonNode!);
    setState(() {});
  }

  void _startEclipse() {
    setState(() => _isEclipse = true);
    _moveTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_moonPosX <= -0.8) {
        timer.cancel();
        return;
      }
      _moonPosX -= 0.02; // Move left
      if (moonNode != null) {
        arObjectManager!.removeNode(moonNode!);
        moonNode = ARNode(type: NodeType.webGLB, uri: moonUrl, scale: math.Vector3(0.05, 0.05, 0.05), position: math.Vector3(_moonPosX, 0.0, -1.0));
        arObjectManager!.addNode(moonNode!);
      }
    });
  }
}
