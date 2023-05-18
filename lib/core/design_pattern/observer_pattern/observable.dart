import 'observer.dart';

mixin class Observable {
  List<Observer> observers = [];

  void attach(Observer observer) {
    observers.add(observer);
  }

  void detach(Observer observer) {
    observers.remove(observer);
  }

  bool contains(Observer observer) {
    return observers.contains(observer);
  }

  void notifyListeners() {
    for (var element in observers) {
      element.onUpdate();
    }
  }
}