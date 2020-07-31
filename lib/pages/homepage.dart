import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:study_mobx/controller/home.dart';
import 'package:study_mobx/model/item.dart';
import 'package:study_mobx/widget/itemList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController _homeControler = HomeController();

    _dialog() {
      var item = ItemModel();

      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Adicionar Item"),
            content: TextField(
              onChanged: item.setTitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Novo Item",
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Adicionar"),
                onPressed: () {
                  _homeControler.addItemList(item);
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: _homeControler.setFilter,
          decoration: InputDecoration(labelText: "Pesquisar....."),
        ),
        actions: <Widget>[
          IconButton(
            icon: Observer(
              builder: (_) {
                return Text("${_homeControler.totalChecked}");
              },
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _homeControler.listFilterd.length,
            itemBuilder: (_, index) {
              var item = _homeControler.listFilterd[index];
              return ItemList(
                item: item,
                func: () {
                  _homeControler.removeItemList(item);
                },
              );
            },
          );
        },
      ),
    );
  }
}
