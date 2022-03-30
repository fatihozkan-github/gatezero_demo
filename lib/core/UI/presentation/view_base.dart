import 'package:flutter/material.dart';
import 'package:gatezero_demo/core/UI/presentation/view_model_base.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatelessWidget {
  final T model;
  final Widget child;
  final Widget Function(BuildContext context, T value, Widget child) builder;

  const BaseView({Key key, this.builder, this.model, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: child,
      builder: (context, child) => Consumer<T>(builder: builder ?? (context, value, child) => Container()),
    );
  }
}
