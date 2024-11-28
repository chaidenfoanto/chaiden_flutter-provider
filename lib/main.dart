import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:global_state/global_state.dart';
import 'color_picker.dart';

void main() => runApp(GlobalStateApp());

class GlobalStateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Chaiden - Flutter Provider'),
            centerTitle: true,
          ),
          body: CounterList(),
          floatingActionButton: AddCounterButton(),
        ),
      ),
    );
  }
}

class CounterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ReorderableListView.builder(
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex -= 1;
          globalState.reorderCounters(oldIndex, newIndex);
        },
        itemCount: globalState.counters.length,
        itemBuilder: (context, index) {
          final counter = globalState.counters[index];
          return Card(
            key: ValueKey(counter),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: counter.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: ListTile(
                title: TextField(
                  controller: TextEditingController(text: counter.label),
                  decoration: InputDecoration(
                    labelText: 'Label',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (value) {
                    globalState.updateCounterLabel(index, value);
                  },
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Value: ${counter.value}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                trailing: Wrap(
                  spacing: 5,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.green),
                      onPressed: () => globalState.incrementCounter(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.red),
                      onPressed: () => globalState.decrementCounter(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.grey),
                      onPressed: () => globalState.removeCounter(index),
                    ),
                  ],
                ),
                leading: IconButton(
                  icon: Icon(Icons.color_lens, color: counter.color),
                  onPressed: () async {
                    Color? selectedColor = await showDialog(
                      context: context,
                      builder: (context) => ColorPickerDialog(currentColor: counter.color),
                    );
                    if (selectedColor != null) {
                      globalState.updateCounterColor(index, selectedColor);
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddCounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context, listen: false);

    return FloatingActionButton.extended(
      onPressed: globalState.addCounter,
      icon: Icon(Icons.add),
      label: Text('Add Counter'),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }
}
