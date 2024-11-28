import 'package:flutter/material.dart';

class ColorPickerDialog extends StatelessWidget {
  final Color currentColor;

  ColorPickerDialog({required this.currentColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick a color'),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: currentColor,
          onColorChanged: (color) {
            Navigator.of(context).pop(color);
          },
        ),
      ),
    );
  }
}

class BlockPicker extends StatelessWidget {
  final Color pickerColor;
  final Function(Color) onColorChanged;

  BlockPicker({required this.pickerColor, required this.onColorChanged});

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.cyan,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: colors
          .map((color) => GestureDetector(
                onTap: () => onColorChanged(color),
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
