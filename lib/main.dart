import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global_state.dart';
import 'color_picker.dart';

void main() => runApp(GlobalStateApp());

class GlobalStateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('Chaiden - Flutter Provider')),
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

    return ReorderableListView.builder(
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex -= 1;
        globalState.reorderCounters(oldIndex, newIndex);
      },
      itemCount: globalState.counters.length,
      itemBuilder: (context, index) {
        final counter = globalState.counters[index];
        return AnimatedContainer(
          key: ValueKey(counter),
          duration: Duration(milliseconds: 300),
          color: counter.color,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
            subtitle: Text('Value: ${counter.value}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => globalState.incrementCounter(index),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => globalState.decrementCounter(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => globalState.removeCounter(index),
                ),
              ],
            ),
            leading: IconButton(
              icon: Icon(Icons.color_lens),
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
        );
      },
    );
  }
}

class AddCounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context, listen: false);

    return FloatingActionButton(
      onPressed: globalState.addCounter,
      child: Icon(Icons.add),
    );
  }
}
