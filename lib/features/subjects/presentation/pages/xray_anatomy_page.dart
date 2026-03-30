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

class XrayAnatomyPage extends StatefulWidget {
  const XrayAnatomyPage({super.key});

  @override
  State<XrayAnatomyPage> createState() => _XrayAnatomyPageState();
}

class _XrayAnatomyPageState extends State<XrayAnatomyPage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARNode? bodyNode;
  
  bool _isXray = false;

  final String normalUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Fox/glTF-Binary/Fox.glb";
  final String xrayUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Duck/glTF-Binary/Duck.glb"; // Fake Xray representation

  @override
  void dispose() {
    arSessionManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anatomiya (X-Ray)'), backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ARView(onARViewCreated: onARViewCreated, planeDetectionConfig: PlaneDetectionConfig.horizontal),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("X-Ray (Shaffof) Rejimi", style: TextStyle(color: Colors.white, fontSize: 16)),
                  Switch(
                    value: _isXray,
                    activeColor: Colors.blueAccent,
                    onChanged: (val) {
                      setState(() => _isXray = val);
                      _updateModel();
                    },
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
    _placeBodyNode();
  }

  Future<void> _placeBodyNode() async {
    bodyNode = ARNode(type: NodeType.webGLB, uri: normalUrl, scale: math.Vector3(0.02, 0.02, 0.02), position: math.Vector3(0, -0.5, -1.5));
    await arObjectManager!.addNode(bodyNode!);
  }

  Future<void> _updateModel() async {
    if (bodyNode != null) {
      arObjectManager!.removeNode(bodyNode!);
      bodyNode = ARNode(
        type: NodeType.webGLB,
        uri: _isXray ? xrayUrl : normalUrl,
        scale: _isXray ? math.Vector3(0.2, 0.2, 0.2) : math.Vector3(0.02, 0.02, 0.02), // Ducks default is larger than fox
        position: math.Vector3(0, -0.5, -1.5),
      );
      await arObjectManager!.addNode(bodyNode!);
    }
  }
}
