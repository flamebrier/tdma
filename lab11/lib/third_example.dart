import 'package:flutter/material.dart';
import 'dart:math';

abstract class ListItem {}

class HeadingItem extends ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem extends ListItem {
  final String sender;
  final String body;
  final String imageUrl;

  MessageItem(this.sender, this.body, this.imageUrl);
}

class ThirdExample extends StatefulWidget {
  @override
  _ThirdExampleState createState() => _ThirdExampleState();
}

class _ThirdExampleState extends State<ThirdExample> {
  var items = <ListItem>[
    MessageItem(
        "Анна Анисимова: Гутя",
        "Так бывает - встречаются и начинают дружить удивительно непохожие люди.",
        "https://img4.labirint.ru/rc/f8c8e9d6218f4ed000859417e2c3738d/220x340/books77/764410/cover.png?1601223904"),
    MessageItem(
        "Басова, Минаев, Варденбург: Внутри что-то есть",
        "Как описать, что у тебя внутри? Смех, мысль, тревога, загадка - иногда и не скажешь, что именно. И тем важнее делиться этим с другими.",
        "https://img3.labirint.ru/rc/ee3f7bd620fed56769beb445f891de04/220x340/books70/699835/cover.png?1576322749"),
    MessageItem(
        "Хью Лофтинг: История доктора Дулиттла",
        "Вы, разумеется, слышали о докторе Дулиттле! Да-да, это тот самый добрый доктор, который живёт в маленьком городке Паддлби-на-Болоте и лечит зверей.",
        "https://img3.labirint.ru/rc/40fc973b444a6c57746b9b1d3477f47b/220x340/books77/764413/cover.png?1601223907"),
    MessageItem(
        "Басова, Игнатова, Дашевская: Чертополох у воды",
        "Иногда кажется, будто вся наша жизнь состоит из случайностей, счастливых или несчастливых. Оставленный кем-то на столике в кафе длинный магазинный чек с записанными на нем удивительными словами - случайность?",
        "https://img3.labirint.ru/rc/b7c1da0d0e1d8cb4beb1c47fb1429b45/220x340/books77/761561/cover.png?1600323904"),
    MessageItem(
        "Кэт Хау: Элла в сторонке",
        "Дурацкий первый день в новой школе. Дурацкая мамина зелёная кофта. Зачем вообще было переезжать в другой город?!",
        "https://img4.labirint.ru/rc/fac7a6386b8336b0cb815059ffe4534f/220x340/books78/773764/cover.png?1605191113")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Item(
              item: item,
              onLongTap: () {
                if (mounted)
                  setState(() {
                    items.removeAt(index);
                  });
              });
        });
  }
}

class Item extends StatefulWidget {
  final ListItem item;
  final VoidCallback onLongTap;

  const Item({Key key, this.item, this.onLongTap}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255), 0.25);
    if (widget.item is HeadingItem) {
      return ListTile(
        onLongPress: widget.onLongTap,
        title: Text(
          (widget.item as HeadingItem).heading,
          style: Theme.of(context).textTheme.headline4,
        ),
      );
    } else if (widget.item is MessageItem) {
      return ListTile(
        leading: Image.network((widget.item as MessageItem).imageUrl),
        title: Text((widget.item as MessageItem).sender),
        subtitle: Text((widget.item as MessageItem).body),
        tileColor: color,
        onLongPress: widget.onLongTap,
        onTap: () {
          setState(() {
            color = Color.fromRGBO(Random(0).nextInt(255),
                Random(0).nextInt(255), Random(0).nextInt(255), 0.25);
          });
        },
      );
    }
    return Container();
  }
}
