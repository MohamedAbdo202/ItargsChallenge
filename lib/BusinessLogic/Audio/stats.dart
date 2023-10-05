abstract class MyState {}

class InitialState extends MyState {}
class LoadingData extends MyState {}
class LoadedData extends MyState {}
class DataError extends MyState {

  final String errorMessage;

  DataError(this.errorMessage);
}

class LikeToggled extends MyState {}
class BottomNav extends MyState{}
