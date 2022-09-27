abstract class ListState {}

class EmptyList extends ListState {}

class LoadingList extends ListState {}

class ErrorList extends ListState {}

class FruitList extends ListState {
  final List<String> fruits;

  FruitList(this.fruits);
}
