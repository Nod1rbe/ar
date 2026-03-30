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

class ChemicalReactionPage extends StatefulWidget {
  const ChemicalReactionPage({super.key});

  @override
  State<ChemicalReactionPage> createState() => _ChemicalReactionPageState();
}

class _ChemicalReactionPageState extends State<ChemicalReactionPage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  
  ARNode? flask1;
  ARNode? flask2;
  ARNode? explosionNode;
  
  bool _isMixed = false;

  final String flaskUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Fox/glTF-Binary/Fox.glb"; // Fake flask
  final String explosionUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Duck/glTF-Binary/Duck.glb"; // Fake explosion

  @override
  void dispose() {
    arSessionManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kimyoviy Reaksiya'), backgroundColor: Colors.transparent, elevation: 0),
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
                if (flask1 != null && !_isMixed)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    icon: const Icon(Icons.flash_on, color: Colors.white),
                    label: const Text('Aralashtirish (Reaksiya)', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onPressed: _mixChemicals,
                  ),
                if (_isMixed)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                    child: const Text("Reaksiya ketmoqda! Olov yoki rang o'zgarishi.", style: TextStyle(color: Colors.white)),
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
    _placeFlasks();
  }

  Future<void> _placeFlasks() async {
    flask1 = ARNode(type: NodeType.webGLB, uri: flaskUrl, scale: math.Vector3(0.02, 0.02, 0.02), position: math.Vector3(-0.3, -0.5, -1.0));
    flask2 = ARNode(type: NodeType.webGLB, uri: flaskUrl, scale: math.Vector3(0.02, 0.02, 0.02), position: math.Vector3(0.3, -0.5, -1.0));

    await arObjectManager!.addNode(flask1!);
    await arObjectManager!.addNode(flask2!);
    setState(() {});
  }

  void _mixChemicals() {
    setState(() => _isMixed = true);
    
    // Simulating nodes moving towards each other and then replacing them with an explosion node.
    Timer(const Duration(milliseconds: 1000), () async {
      arObjectManager!.removeNode(flask1!);
      arObjectManager!.removeNode(flask2!);
      
      explosionNode = ARNode(type: NodeType.webGLB, uri: explosionUrl, scale: math.Vector3(0.3, 0.3, 0.3), position: math.Vector3(0.0, -0.5, -1.0));
      await arObjectManager!.addNode(explosionNode!);
    });
  }
}
