import 'package:flutter/cupertino.dart';
import 'package:placess_2021/src/core/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  const BaseWidget({Key? key, required this.model, required this.builder}) : super(key: key);

  final T model;
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}

