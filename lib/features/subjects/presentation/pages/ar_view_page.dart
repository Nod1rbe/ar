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
  bool _isModelPlaced = false;
  ARNode? _currentNode;

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
                if (_isLoadingModel) ...[
                  const CircularProgressIndicator(color: Colors.white),
                  const SizedBox(height: 10),
                  const Text(
                    "Model yuklanmoqda...",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ] else if (!_isModelPlaced) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Kamerani to'g'irlab, tugmani bosing",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FloatingActionButton.extended(
                    onPressed: _loadWebModel,
                    icon: const Icon(Icons.add_location_alt),
                    label: const Text("Shu yerga qo'yish"),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                ] else ...[
                  FloatingActionButton.extended(
                    onPressed: _removeModel,
                    icon: const Icon(Icons.delete_outline),
                    label: const Text("O'chirish va qayta joylash"),
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ],
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
      showWorldOrigin: false, // World origin ni o'chiramiz, xalaqit qilmasligi uchun
      handleTaps: false,
    );
    this.arObjectManager!.onInitialize();
  }

  Future<void> _removeModel() async {
    if (_currentNode != null) {
      await arObjectManager!.removeNode(_currentNode!);
      setState(() {
        _isModelPlaced = false;
        _currentNode = null;
      });
    }
  }

  Future<void> _loadWebModel() async {
    setState(() {
      _isLoadingModel = true;
    });

    try {
      math.Vector3 position = math.Vector3(0.0, 0.0, -1.0);
      try {
        Matrix4? cameraPose = await arSessionManager!.getCameraPose();
        position = math.Vector3(0, 0, -1);
        cameraPose?.transform3(position); // position o'zgaruvchisiga cameraPose qo'llaniladi
      } catch (e) {
        debugPrint("Camera pose olishda xatolik: $e");
      }

      var newNode = ARNode(
        type: NodeType.webGLB,
        uri: widget.subject.modelUrl,
        scale: math.Vector3(0.5, 0.5, 0.5),
        position: position,
      );

      bool? didAddNode = await arObjectManager!.addNode(newNode);
      
      if (mounted) {
        if (didAddNode != true) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Modelni qo'shib bo'lmadi!")));
        } else {
          setState(() {
            _isModelPlaced = true;
            _currentNode = newNode;
          });
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Model muvaffaqiyatli joylandi!"), backgroundColor: Colors.green));
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
