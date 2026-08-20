import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/counter_notifier.dart';
import 'package:riverpod_example/name_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = ref.read(nameProvider);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void _updateName() {
    if (nameController.text.isEmpty) return;
    ref.read(nameProvider.notifier).updateName(nameController.text);
    nameController.clear();
  }

  void _resetName() {
    ref.read(nameProvider.notifier).resetName();
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Riverpod Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Hello, $name!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Text('Counter: $counter'),
            Divider(color: Colors.grey, thickness: 1.0, height: 32.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                //onChanged: (_) => _updateName(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _updateName,
                child: const Text('Update Name'),
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _resetName,
                child: const Text('Reset Name'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).decrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).reset(),
            tooltip: 'Reset',
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
