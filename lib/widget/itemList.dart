import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:study_mobx/model/item.dart';

class ItemList extends StatelessWidget {
  final ItemModel item;
  final Function func;

  const ItemList({Key key, @required this.item, @required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(item.title),
          leading: Checkbox(
            onChanged: item.setClicked,
            value: item.check,
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: func,
          ),
        );
      },
    );
  }
}
