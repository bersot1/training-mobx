import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'item.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  _ItemModelBase({this.title, this.check = false});

  @observable
  String title;

  @observable
  bool check;

  @action
  setTitle(String value) => title = value;

  @action
  setClicked(bool value) => check = value;
}
