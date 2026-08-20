import 'package:firsttry/screens/container_test.dart';
import 'package:firsttry/screens/row_column_example.dart';
import 'package:firsttry/screens/stack_example.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(widget.title),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: SizedBox(
          width: MediaQuery.widthOf(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Examples : 2'),
              SizedBox(height: 10),
              _button(
                context: context,
                label: "Column & Row Examples",
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const RowColumnExample(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1.0, 0.0), // Right to left
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                      transitionDuration: const Duration(milliseconds: 600),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              _button(
                context: context,
                label: "Container Examples",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContainerTest()),
                  );
                },
              ),
              SizedBox(height: 10),
              _button(
                context: context,
                label: "Stack Examples",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StackExample()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _button({
  required BuildContext context,
  required String label,
  required VoidCallback onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.yellowAccent, Colors.orangeAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.orangeAccent.withOpacity(
            0.3,
          ), // Matched shadow to your new colors!
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max, // 1. Allow the row to take full width
        children: [
          Expanded(
            // 2. Wrap text so it pushes the icon to the far right
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors
                    .black87, // Changed to dark text so it's readable on yellow/orange!
                letterSpacing: 0.5,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            color: Colors.black87,
            size: 18,
          ),
        ],
      ),
    ),
  );
}
