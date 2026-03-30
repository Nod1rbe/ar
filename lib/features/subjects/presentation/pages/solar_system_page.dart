import 'dart:async';
import 'dart:math' as dart_math;
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

class SolarSystemPage extends StatefulWidget {
  const SolarSystemPage({super.key});

  @override
  State<SolarSystemPage> createState() => _SolarSystemPageState();
}

class _SolarSystemPageState extends State<SolarSystemPage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARNode? planetNode;
  
  double _orbitSpeed = 10.0;
  Timer? _orbitTimer;
  double _angle = 0.0;

  final String sunUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Duck/glTF-Binary/Duck.glb"; 
  final String planetUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Avocado/glTF-Binary/Avocado.glb"; 

  @override
  void dispose() {
    _orbitTimer?.cancel();
    arSessionManager?.dispose();
    super.dispose();
  }

  void _startOrbit() {
    _orbitTimer?.cancel();
    _orbitTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (planetNode == null) return;
      _angle += (_orbitSpeed / 500.0);
      
      double radius = 0.8;
      double newX = radius * dart_math.cos(_angle);
      double newZ = -2.0 + (radius * dart_math.sin(_angle));
      
      arObjectManager!.removeNode(planetNode!);
      planetNode = ARNode(
        type: NodeType.webGLB,
        uri: planetUrl,
        scale: math.Vector3(0.05, 0.05, 0.05),
        position: math.Vector3(newX, 0.0, newZ),
      );
      arObjectManager!.addNode(planetNode!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quyosh Sistemasi'), backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ARView(onARViewCreated: onARViewCreated, planeDetectionConfig: PlaneDetectionConfig.horizontal),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                   Text("Aylanish tezligi: ${_orbitSpeed.toInt()} km/s", style: const TextStyle(color: Colors.white, fontSize: 16)),
                  Slider(
                    value: _orbitSpeed,
                    min: 1,
                    max: 100,
                    activeColor: Colors.amberAccent,
                    onChanged: (val) => setState(() => _orbitSpeed = val),
                  ),
                ],
              ),
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
    _placeSunSystem();
  }

  Future<void> _placeSunSystem() async {
    var fixedSunNode = ARNode(type: NodeType.webGLB, uri: sunUrl, scale: math.Vector3(0.2, 0.2, 0.2), position: math.Vector3(0, 0, -2.0));
    planetNode = ARNode(type: NodeType.webGLB, uri: planetUrl, scale: math.Vector3(0.05, 0.05, 0.05), position: math.Vector3(0.8, 0, -2.0));
    
    await arObjectManager!.addNode(fixedSunNode);
    await arObjectManager!.addNode(planetNode!);
    _startOrbit();
  }
}
