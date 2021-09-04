import 'package:flutter/widgets.dart';
import 'package:praxis/models/app_state.dart';
import 'package:praxis/models/load.dart';
import 'package:praxis/selectors/selectors.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Loading extends StatelessWidget {

  final Widget Function(BuildContext context, Load? load) builder;

  Loading({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Load?>(
      distinct: true,
      converter: (Store<AppState> store) => stoLoad(store),
      builder: builder,
    );
  }
}
