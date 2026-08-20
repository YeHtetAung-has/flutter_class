import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget {
  const ContainerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Container Examples"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          // side: BorderSide(
          //   color: Colors.orange,
          //   width: 2
          // ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        // 1. Simplified padding syntax
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: 150,
        // Removed hardcoded height to allow natural expansion if text sizes change

        // 2. Forces children to respect your rounded borders if you add images/inkwells later
        clipBehavior: Clip.antiAlias,

        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: const Border(
            bottom: BorderSide(color: Colors.orangeAccent, width: 3),
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: const Text(
          "Container Examples",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }
}

// Container(
// width: 150,
// height: 150,
// padding: EdgeInsetsGeometry.all(10),
// margin: EdgeInsetsGeometry.all(20),
// transform: Matrix4.identity()
// ..setEntry(3, 2, 0.001) // Adds a subtle 3D perspective depth
// ..rotateX(-0.2)         // Tilts it backward slightly
// ..rotateY(0.2)          // Turns it slightly sideways
// ..rotateZ(-0.1),        // Gives it a stylish slant
//
// transformAlignment: Alignment.center,
// decoration: BoxDecoration(
// color: Colors.yellowAccent,
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(20),
// bottomLeft: Radius.circular(20)
// ),
// border: BoxBorder.all(
// color: Colors.orangeAccent,
// width: 2,
// strokeAlign: BorderSide.strokeAlignInside,
// ),
// backgroundBlendMode: BlendMode.color,
// boxShadow: [
// BoxShadow(
// color: Colors.yellow.withValues(alpha: 0.5), // Using opacity makes the glow look much smoother
// blurRadius: 15.0,                      // The softness of the shadow
// spreadRadius: 2.0,                      // Extends the shadow further out before blurring
// offset: const Offset(0, 4),             // Moves shadow down (x: 0, y: 4)
// ),
// ],
// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// colors: [
// Colors.yellow,
// Colors.orange,
// ],
// ),
// //shape: BoxShape.rectangle
// ),
// child: Center(
// child: Text(
// 'Hello',
// style: TextStyle(),
// ),
// ),
// ),

//ai code
// Container(
//           width: 160,
//           height: 160,
//           padding: const EdgeInsets.all(12),
//           margin: const EdgeInsets.all(24),

//           // 1. Skew and Rotate the container for a dynamic, 3D gaming/cyberpunk look
//           transform: Matrix4.identity()
//             ..setEntry(3, 2, 0.001) // Adds a subtle 3D perspective depth
//             ..rotateX(-0.2) // Tilts it backward slightly
//             ..rotateY(0.2) // Turns it slightly sideways
//             ..rotateZ(-0.1), // Gives it a stylish slant
//           // 2. Pivot perfectly from the center
//           transformAlignment: Alignment.topLeft,

//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(30), // Exaggerated asymmetric corners
//               bottomRight: Radius.circular(30),
//             ),
//             border: Border.all(
//               color: Colors.white.withValues(
//                 alpha: 0.6,
//               ), // Glowing white border edge
//               width: 2.5,
//               strokeAlign: BorderSide.strokeAlignInside,
//             ),

//             // 3. Multi-layered neon glow effect
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.orangeAccent.withValues(alpha: 0.6),
//                 blurRadius: 25.0,
//                 spreadRadius: 2.0,
//                 offset: const Offset(0, 8),
//               ),
//               BoxShadow(
//                 color: Colors.yellowAccent.withValues(alpha: 0.4),
//                 blurRadius: 40.0,
//                 spreadRadius: -4.0,
//               ),
//             ],

//             // 4. Vibrant electric gradient
//             gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFFFFE000), // Electric bright yellow
//                 Color(0xFFFF3131), // Neon hot red/orange
//               ],
//             ),
//           ),
//           child: Center(
//             child: Text(
//               'HELLO',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.w900, // Extra bold weight
//                 letterSpacing: 4.0, // Widely spaced futuristic tracking
//                 shadows: [
//                   Shadow(
//                     color: Colors.black.withValues(alpha: 0.5),
//                     offset: const Offset(2, 2),
//                     blurRadius: 4,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
