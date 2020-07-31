import 'package:mobx/mobx.dart';
import 'package:study_mobx/model/item.dart';
part 'home.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> list = [
    ItemModel(title: "Item 1", check: true),
    ItemModel(title: "Item 2", check: false),
    ItemModel(title: "Item 3", check: false),
  ].asObservable();

  @computed
  int get totalChecked => list.where((element) => element.check == true).length;

  @computed
  List<ItemModel> get listFilterd {
    if (filter.isEmpty) {
      return list;
    } else {
      return list
          .where((element) =>
              element.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @action
  addItemList(ItemModel item) {
    list.add(item);
  }

  @action
  removeItemList(ItemModel item) {
    list.removeWhere((element) => element.title == item.title);
  }
}
