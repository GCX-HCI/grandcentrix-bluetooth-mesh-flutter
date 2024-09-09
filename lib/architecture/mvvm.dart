import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ViewModelCreate<T> = T Function(BuildContext context);

abstract class ViewModel<State> extends Cubit<State> {
  ViewModel(super.initialState);

  Future<void> init() async {
    // optional hook
  }
}

class ViewModelProvider<T extends ViewModel<Object?>> extends BlocProvider<T> {
  ViewModelProvider({
    required ViewModelCreate<T> create,
    super.key,
    super.child,
    super.lazy,
  }) : super(
          create: (BuildContext context) => create(context)..init(),
        );
}
