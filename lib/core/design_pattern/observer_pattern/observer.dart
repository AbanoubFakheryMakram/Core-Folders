import 'observable.dart';

abstract class Observer {
  Observable? observable;
  void onUpdate();
}