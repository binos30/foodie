import 'package:flutter/painting.dart';

enum Importance {
  low,
  medium,
  high,
}

class GroceryItem {
  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;
  int? index;

  GroceryItem({
    required this.id,
    required this.name,
    required this.importance,
    required this.color,
    required this.quantity,
    required this.date,
    this.isComplete = false,
    this.index,
  });

  /// Copies and creates a completely new instance of [GroceryItem].
  GroceryItem copyWith({
    String? id,
    String? name,
    Importance? importance,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isComplete,
    int? index,
  }) {
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      importance: importance ?? this.importance,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      isComplete: isComplete ?? this.isComplete,
      index: index ?? this.index,
    );
  }

  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
      id: json['id'],
      name: json['name'],
      importance: Importance.values.byName(json['importance']),
      color: Color(int.parse(json['color'])),
      quantity: int.parse(json['quantity']),
      date: DateTime.parse(json['date']),
      isComplete: bool.parse(json['isComplete']),
      index: int.parse(json['index'] ?? '0'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'importance': importance.name,
      'color': color.value.toString(),
      'quantity': quantity.toString(),
      'date': date.toString(),
      'isComplete': isComplete.toString(),
      'index': index.toString(),
    };
  }
}
