import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:flutter/material.dart';
import 'dart:async';

/// TODO.
class CustomARView extends StatefulWidget {
  CustomARView({Key key}) : super(key: key);
  @override
  _CustomARViewState createState() => _CustomARViewState();
}

class _CustomARViewState extends State<CustomARView> {
  ARSessionManager arSessionManager;
  ARObjectManager arObjectManager;
  ARAnchorManager arAnchorManager;

  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  bool _isAdded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Timer.periodic(Duration(seconds: 4), (timer) async {
        if (!_isAdded) {
          await onPlaneOrPointTapped([ARHitTestResult(ARHitTestResultType.plane, 0.1, Matrix4.identity())]);
          setState(() => _isAdded = true);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kutuyu Tanıt!')),
      body: Stack(
        children: [
          ARView(onARViewCreated: onARViewCreated, planeDetectionConfig: PlaneDetectionConfig.horizontal),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: onRemoveEverything, child: const Text("Temizle")),
                  ElevatedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/screen_calculation'),
                    child: const Text("Devam Et"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void onARViewCreated(ARSessionManager arSessionManager, ARObjectManager arObjectManager, ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager.onInitialize(
          showPlanes: true,
          handlePans: true,
          handleRotation: true,
          showWorldOrigin: true,
          showFeaturePoints: false,
          showAnimatedGuide: false,
          customPlaneTexturePath: "assets/triangle.png",
        );
    this.arObjectManager.onInitialize();

    this.arSessionManager.onPlaneOrPointTap = onPlaneOrPointTapped;
    this.arObjectManager.onPanStart = onPanStarted;
    this.arObjectManager.onPanChange = onPanChanged;
    this.arObjectManager.onPanEnd = onPanEnded;
    this.arObjectManager.onRotationStart = onRotationStarted;
    this.arObjectManager.onRotationChange = onRotationChanged;
    this.arObjectManager.onRotationEnd = onRotationEnded;
  }

  Future<void> onRemoveEverything() async {
    anchors.forEach((anchor) => arAnchorManager.removeAnchor(anchor));
    anchors = [];
  }

  Future<void> onPlaneOrPointTapped(List<ARHitTestResult> hitTestResults) async {
    ARHitTestResult singleHitTestResult =
        hitTestResults?.firstWhere((hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    if (singleHitTestResult != null) {
      var newAnchor = ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
      bool didAddAnchor = await arAnchorManager.addAnchor(newAnchor);
      if (didAddAnchor) {
        anchors.add(newAnchor);
        var newNode = ARNode(
          type: NodeType.webGLB,
          scale: math.Vector3(0.6, 0.6, 0.6),
          position: math.Vector3(0.05, -0.2, -0.6),
          rotation: math.Vector4(1.0, 0.0, 0.0, 0.0),
          uri: "https://github.com/fatihozkan-github/3Dmodels/raw/master/scene.glb",
        );
        bool didAddNodeToAnchor = await arObjectManager.addNode(newNode, planeAnchor: newAnchor);
        if (didAddNodeToAnchor) {
          nodes.add(newNode);
        } else {
          arSessionManager.onError("Adding Node to Anchor failed");
        }
      } else {
        arSessionManager.onError("Adding Anchor failed");
      }
    }
  }

  onPanStarted(String nodeName) => print("Started panning node " + nodeName);

  onPanChanged(String nodeName) => print("Continued panning node " + nodeName);

  onPanEnded(String nodeName, Matrix4 newTransform) => print("Ended panning node " + nodeName);
  // final pannedNode = this.nodes.firstWhere((element) => element.name == nodeName);
  // pannedNode.transform = newTransform;
  // }

  onRotationStarted(String nodeName) => print("Started rotating node " + nodeName);

  onRotationChanged(String nodeName) => print("Continued rotating node " + nodeName);

  onRotationEnded(String nodeName, Matrix4 newTransform) => print("Ended rotating node " + nodeName);
// final rotatedNode = this.nodes.firstWhere((element) => element.name == nodeName);
// }
}

// uri: "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
// uri: "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/ToyCar/glTF-Binary/ToyCar.glb",
///
