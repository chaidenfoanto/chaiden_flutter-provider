import 'package:flutter/material.dart';
import 'counter_data.dart';

class GlobalState extends ChangeNotifier {
  List<CounterData> counters = [];

  void addCounter() {
    counters.add(CounterData());
    notifyListeners();
  }

  void removeCounter(int index) {
    counters.removeAt(index);
    notifyListeners();
  }

  void incrementCounter(int index) {
    counters[index].value++;
    notifyListeners();
  }

  void decrementCounter(int index) {
    if (counters[index].value > 0) {
      counters[index].value--;
      notifyListeners();
    }
  }

  void updateCounterColor(int index, Color color) {
    counters[index].color = color;
    notifyListeners();
  }

  void updateCounterLabel(int index, String label) {
    counters[index].label = label;
    notifyListeners();
  }

  void reorderCounters(int oldIndex, int newIndex) {
    final item = counters.removeAt(oldIndex);
    counters.insert(newIndex, item);
    notifyListeners();
  }
}
