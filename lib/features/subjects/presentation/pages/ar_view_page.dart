import 'package:ar_flutter_plugin_plus/ar_flutter_plugin_plus.dart';
import 'package:ar_flutter_plugin_plus/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_plus/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_plus/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:ar/features/subjects/domain/entities/subject.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class ARViewPage extends StatefulWidget {
  final SubjectEntity subject;

  const ARViewPage({super.key, required this.subject});

  @override
  State<ARViewPage> createState() => _ARViewPageState();
}

class _ARViewPageState extends State<ARViewPage> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARAnchorManager? arAnchorManager;

  bool _isLoadingModel = false;

  @override
  void dispose() {
    arSessionManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                if (_isLoadingModel)
                  const CircularProgressIndicator(color: Colors.blueAccent),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Modelni chaqirish xona o'rtasiga: \nInternetdan (${widget.subject.name}) yuklanmoqda...",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onARViewCreated(
    ARSessionManager arSessionManager,
    ARObjectManager arObjectManager,
    ARAnchorManager arAnchorManager,
    ARLocationManager arLocationManager,
  ) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager!.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      showWorldOrigin: true,
      handleTaps: false,
    );
    this.arObjectManager!.onInitialize();

    // Avtomatik ravishda modelni ekranga qo'shish
    _loadWebModel();
  }

  Future<void> _loadWebModel() async {
    setState(() {
      _isLoadingModel = true;
    });

    try {
      // Create a node with webGLB type fetched from the Internet
      var newNode = ARNode(
        type: NodeType.webGLB,
        uri: widget.subject.modelUrl,
        scale: math.Vector3(0.5, 0.5, 0.5),
        position: math.Vector3(0.0, 0.0, -1.0), // Z-o'qi bo'yicha 1 metr oldinga
      );

      bool? didAddNode = await arObjectManager!.addNode(newNode);
      
      if (mounted) {
        if (didAddNode != true) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Modelni qo'shib bo'lmadi!")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Model muvaffaqiyatli yuklandi!"), backgroundColor: Colors.green));
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Xatolik: $e")));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingModel = false;
        });
      }
    }
  }
}
