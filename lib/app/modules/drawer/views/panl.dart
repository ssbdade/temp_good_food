import 'package:flutter/material.dart';

class Panel extends StatefulWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  State<Panel> createState() => _PanelState();
}


class _PanelState extends State<Panel> {
  bool isSelected = false;
  bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {

    return ExpansionTile(
      title: Text("Parent Category 1"),
      leading: Icon(Icons.person), //add icon
      // childrenPadding: EdgeInsets.only(left:60), //children padding
      children: [
        ListTile(
          selected: isSelected,
          selectedTileColor: Colors.red,
          title: Padding(
            padding: EdgeInsets.only(left:60),
            child: Text("Child Category 1"),
          ),
          onTap: (){
            //action on press
          },
        ),

        ListTile(
          selected: isSelected2,
          title: Padding(
            padding: EdgeInsets.only(left:60),
            child: Text("Child Category 2"),
          ),
          onTap: (){
            //action on press
            setState(() {
              isSelected2 = true;
              isSelected = false;
            });
          },
        ),

        //more child menu
      ],
    );


      ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        data[index].isExpanded = !isExpanded;
        setState(() {

        });
      },
      children: data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: false,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: Column(
            children: [
              ListTile(
                selected: isSelected,
                  tileColor: Colors.yellow,
                  selectedTileColor: Colors.blue,
                  title: Text(item.expandedValue),
                  subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
                  trailing: const Icon(Icons.delete),
                  onTap: () {
                    isSelected = true;
                    isSelected2 = false;
                    setState(() {

                    });
                  }),
              ListTile(
                  selected: isSelected2,
                  title: Text(item.expandedValue),
                  tileColor: Colors.yellow,
                  selectedTileColor: Colors.blue,
                  subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
                  trailing: const Icon(Icons.delete),
                  onTap: () {
                    isSelected2 = true;
                    isSelected = false;
                    setState(() {

                    });
                  }),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<Item> data = generateItems(3);

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
