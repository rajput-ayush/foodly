import 'package:flutter/material.dart';
import 'package:foodly/models/foods_model.dart';

class FetchFood {
  final List<FoodsModel> data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;


  FetchFood({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}