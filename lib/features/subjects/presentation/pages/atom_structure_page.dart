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

class AtomStructurePage extends StatefulWidget {
  const AtomStructurePage({super.key});

  @override
  State<AtomStructurePage> createState() => _AtomStructurePageState();
}

class _AtomStructurePageState extends State<AtomStructurePage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARNode? electronNode;
  
  double _electronSpeed = 20.0;
  Timer? _orbitTimer;
  double _angle = 0.0;

  // Fake models
  final String coreUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/BarramundiFish/glTF-Binary/BarramundiFish.glb"; // Nucleus
  final String electronUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Duck/glTF-Binary/Duck.glb"; // Electron moving around

  @override
  void dispose() {
    _orbitTimer?.cancel();
    arSessionManager?.dispose();
    super.dispose();
  }

  void _startOrbit() {
    _orbitTimer?.cancel();
    _orbitTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (electronNode == null) return;
      _angle += (_electronSpeed / 1000.0);
      
      // Orbiting around Z and X axis
      double radius = 0.5;
      double newX = radius * dart_math.cos(_angle);
      double newZ = -1.5 + (radius * dart_math.sin(_angle));
      
      arObjectManager!.removeNode(electronNode!);
      electronNode = ARNode(
        type: NodeType.webGLB,
        uri: electronUrl,
        scale: math.Vector3(0.05, 0.05, 0.05),
        position: math.Vector3(newX, 0.0, newZ),
      );
      arObjectManager!.addNode(electronNode!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Atom Konstruktori'), backgroundColor: Colors.transparent, elevation: 0),
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
                  Text("Elektron harakat tezligi: ${_electronSpeed.toInt()}", style: const TextStyle(color: Colors.white, fontSize: 16)),
                  Slider(
                    value: _electronSpeed,
                    min: 1,
                    max: 100,
                    activeColor: Colors.tealAccent,
                    onChanged: (val) => setState(() => _electronSpeed = val),
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
    _placeNucleus();
  }

  Future<void> _placeNucleus() async {
    var fixedCoreNode = ARNode(type: NodeType.webGLB, uri: coreUrl, scale: math.Vector3(0.2, 0.2, 0.2), position: math.Vector3(0, 0, -1.5));
    electronNode = ARNode(type: NodeType.webGLB, uri: electronUrl, scale: math.Vector3(0.05, 0.05, 0.05), position: math.Vector3(0.5, 0, -1.5));
    
    await arObjectManager!.addNode(fixedCoreNode);
    await arObjectManager!.addNode(electronNode!);
    _startOrbit();
  }
}
