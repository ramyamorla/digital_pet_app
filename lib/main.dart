import 'package:flutter/material.dart';

void main() {
  runApp(DigitalPetApp());
}

class DigitalPetApp extends StatefulWidget {
  const DigitalPetApp({super.key});

  @override
  _DigitalPetAppState createState() => _DigitalPetAppState();
}

class _DigitalPetAppState extends State<DigitalPetApp> {
  int happinessLevel = 50; // Happiness starts at 50

  // Function to feed the pet
  void feedPet() {
    setState(() {
      happinessLevel += 10;
      if (happinessLevel > 100) happinessLevel = 100;
    });
  }

  // Function to play with the pet dog
  void playWithPet() {
    setState(() {
      happinessLevel += 15;
      if (happinessLevel > 100) happinessLevel = 100;
    });
  }

  // Function to put the pet dog to sleep
  void putPetToSleep() {
    setState(() {
      happinessLevel -= 10;
      if (happinessLevel < 0) happinessLevel = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Digital Pet')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Make sure the path here matches the asset folder in pubspec.yaml
            Image.asset('assets/puppy.jpeg',
                height: 150), // Pet image from assetsss
            const SizedBox(height: 20),
            Text(
              'Happiness: $happinessLevel%',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Progress bar indicating happiness level
            LinearProgressIndicator(
              value: happinessLevel / 100,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 10,
            ),
            const SizedBox(height: 30),
            // Buttons to interact with the pet
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: feedPet,
                  child: const Text('Feed'),
                ),
                ElevatedButton(
                  onPressed: playWithPet,
                  child: const Text('Play'),
                ),
                ElevatedButton(
                  onPressed: putPetToSleep,
                  child: const Text('Sleep'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
