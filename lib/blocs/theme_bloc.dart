import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<bool, bool> {
  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(bool isDark) async* {
    yield isDark;
  }
}