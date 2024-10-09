import 'package:flutter/material.dart';

//counter calss was changed from StatefulWidget to StatelessWidget
class Counter extends StatelessWidget {
  // this is the callback function from the  Counter widget 
  final VoidCallback onIncrement;
  final int count; // The count is now passed from the parent widget.

  const Counter({
    required this.onIncrement,
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Callback function when button was pressed
        ElevatedButton(
          onPressed: onIncrement, // notify the parent widget when the button is pressed.
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        // The UI is updated based on the count passed by the parent widget.
        Text('Count: $count'),
      ],
    );
  }
}

// The parent widget handles the state and sends it to the Counter widget.
class CounterContainer extends StatefulWidget {
  @override
  _CounterContainerState createState() => _CounterContainerState();
}

// Step 1: Identify the state
// The state is moved from the Counter widget to the parent (CounterContainer).
class _CounterContainerState extends State<CounterContainer> {
  int _counter = 0;

  // Step 2: Remove the state
  // Renamed the increment method from _incrementCounter to _handleIncrement.
  void _handleIncrement() {
    setState(() {
      _counter++; // Increments the state when the button is pressed.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Step 5: Pass the callback function and state value to the child (Counter widget).
        child: Counter(
          onIncrement: _handleIncrement, // Passes the callback to the child widget.
          count: _counter, // Passes the current state to the child widget.
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: CounterContainer(), // The parent widget is the main entry point.
    ),
  );
}
