import 'package:flutter/material.dart';

void addIfNonNull(Widget child, List children) {
  if (child != null) {
    children.add(child);
  }
}
