import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global_state/global_state.dart'; // Pastikan path impor sesuai dengan struktur proyek Anda.

void main() {
  group('GlobalState Tests', () {
    late GlobalState globalState;

    setUp(() {
      // Inisialisasi objek GlobalState sebelum setiap pengujian
      globalState = GlobalState();
    });

    test('Add counter should increase counters list size', () {
      expect(globalState.counters.length, 0); // Awalnya kosong
      globalState.addCounter(); // Tambahkan satu counter
      expect(globalState.counters.length, 1); // Harus ada satu elemen
    });

    test('Remove counter should decrease counters list size', () {
      globalState.addCounter();
      globalState.addCounter();
      expect(globalState.counters.length, 2); // Dua elemen
      globalState.removeCounter(0); // Hapus elemen pertama
      expect(globalState.counters.length, 1); // Harus tersisa satu elemen
    });

    test('Increment counter value should increase its value', () {
      globalState.addCounter(); // Tambahkan counter
      expect(globalState.counters[0].value, 0); // Nilai awal 0
      globalState.incrementCounter(0); // Tingkatkan nilai
      expect(globalState.counters[0].value, 1); // Harus menjadi 1
    });

    test('Decrement counter value should not go below zero', () {
      globalState.addCounter(); // Tambahkan counter
      expect(globalState.counters[0].value, 0); // Nilai awal 0
      globalState.decrementCounter(0); // Coba kurangi nilai
      expect(globalState.counters[0].value, 0); // Tidak boleh di bawah 0
    });

    test('Update counter color should change its color', () {
      globalState.addCounter(); // Tambahkan counter
      final newColor = Colors.red;
      globalState.updateCounterColor(0, newColor); // Perbarui warna
      expect(globalState.counters[0].color, newColor); // Warna harus berubah
    });

    test('Update counter label should change its label', () {
      globalState.addCounter(); // Tambahkan counter
      final newLabel = "New Label";
      globalState.updateCounterLabel(0, newLabel); // Perbarui label
      expect(globalState.counters[0].label, newLabel); // Label harus berubah
    });

    test('Reorder counters should change their positions', () {
      globalState.addCounter();
      globalState.addCounter();
      globalState.counters[0].label = "First";
      globalState.counters[1].label = "Second";

      globalState.reorderCounters(0, 1); // Geser elemen pertama ke posisi kedua
      expect(globalState.counters[0].label, "Second");
      expect(globalState.counters[1].label, "First");
    });
  });
}
