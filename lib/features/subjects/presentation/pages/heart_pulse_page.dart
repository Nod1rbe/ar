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

class HeartPulsePage extends StatefulWidget {
  const HeartPulsePage({super.key});

  @override
  State<HeartPulsePage> createState() => _HeartPulsePageState();
}

class _HeartPulsePageState extends State<HeartPulsePage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARNode? heartNode;
  
  double _heartRate = 60.0; // urish daqiqasiga
  Timer? _pulseTimer;
  bool _isExpanded = false;

  final String heartUrl = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/BarramundiFish/glTF-Binary/BarramundiFish.glb"; // Fake Heart

  @override
  void dispose() {
    _pulseTimer?.cancel();
    arSessionManager?.dispose();
    super.dispose();
  }

  void _updatePulseTimer() {
    _pulseTimer?.cancel();
    // 60bpm = 1 urish 1000ms da.
    int delay = (60000 / _heartRate).round();
    
    _pulseTimer = Timer.periodic(Duration(milliseconds: delay), (timer) {
      if (heartNode == null) return;
      _isExpanded = !_isExpanded;
      
      double scaleRate = _isExpanded ? 0.25 : 0.2; // Yurak kengayishi va qisqarishi
      arObjectManager!.removeNode(heartNode!);
      heartNode = ARNode(
        type: NodeType.webGLB,
        uri: heartUrl,
        scale: math.Vector3(scaleRate, scaleRate, scaleRate),
        position: math.Vector3(0, 0, -1.0),
      );
      arObjectManager!.addNode(heartNode!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yurak Urishi'), backgroundColor: Colors.transparent, elevation: 0),
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
                  Text("Tezlik: ${_heartRate.toInt()} zarba / daq", style: const TextStyle(color: Colors.white, fontSize: 16)),
                  Slider(
                    value: _heartRate,
                    min: 40,
                    max: 180,
                    activeColor: Colors.redAccent,
                    onChanged: (val) {
                      setState(() => _heartRate = val);
                      _updatePulseTimer();
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
    _placeHeart();
  }

  Future<void> _placeHeart() async {
    heartNode = ARNode(type: NodeType.webGLB, uri: heartUrl, scale: math.Vector3(0.2, 0.2, 0.2), position: math.Vector3(0, 0, -1.0));
    await arObjectManager!.addNode(heartNode!);
    _updatePulseTimer();
  }
}
