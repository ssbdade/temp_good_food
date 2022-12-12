import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/drawer/controllers/drawer_page_controller.dart';
import 'package:temp_good_food/app/modules/drawer/views/panl.dart';

class DrawerView extends GetView<DrawerPageController> {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.pages[controller.index.value].toString())),
        centerTitle: true,
      ),
      drawer: Drawer(
        child:  ListView(
          children: [
            ListPanel(),
            // Panel(),
            // Panel(),
            // Panel(),
            // ExpansionTile(
            //     collapsedTextColor: Colors.blue,
            //     childrenPadding: const EdgeInsets.all(8.0),
            //     leading: Icon(
            //       Icons.account_box,
            //     ),
            //     title: ListTile(
            //       leading: Text(
            //         'Introduction',
            //         style: Theme.of(context).textTheme.headline6,
            //       ),
            //     ),
            //     children: [
            //       ListTile(
            //         selected: true,
            //         selectedColor: Colors.red,
            //         selectedTileColor: Colors.red,
            //         title: Text(
            //           'Introduction',
            //           style: Theme.of(context).textTheme.headline6,
            //         ),
            //       ),
            //       ListTile(
            //         title: Text(
            //           'Introduction2',
            //           style: Theme.of(context).textTheme.headline6,
            //         ),
            //       ),
            //       ListTile(
            //         title: Text(
            //           'Introduction3',
            //           style: Theme.of(context).textTheme.headline6,
            //         ),
            //       ),
            //     ] // Some list of List Tile's or widget of that kind,
            // ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 3, color: Colors.blue),
                ),
                color: Colors.blueAccent.withOpacity(0.2),
              ),
              child: ListTile(
                title: const Text(
                  'Khách hàng',
                ),
                onTap: () {
                  controller.onTapDrawerItem(0);
                },
                leading: const Icon(
                  Icons.account_box,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Customer page',
              ),
              onTap: () {
                controller.onTapDrawerItem(0);
              },
            ),
            ListTile(
              title: const Text(
                'Database page',
              ),
              onTap: () {
                controller.onTapDrawerItem(1);
              },
            ),
          ],
        ),
      ),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}

class Panel extends StatefulWidget {
   const Panel({
    Key? key,
     required this.itemIndex,
     // required this.callback
  }) : super(key: key);
 final int itemIndex;
 // final VoidCallback callback;



  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  List<int> selectedIndex = [];

  // @override
  // void didUpdateWidget(covariant Panel oldWidget) {
  //
  //   debugPrint('oldWidget :${widget.isSelect}');
  //  if(!widget.isSelect){
  //    selectedIndex=-1;
  //    itemIndex=-1;
  //  }
  //
  //   super.didUpdateWidget(oldWidget);
  // }
  @override
  Widget build(BuildContext context) {
    List<Widget> listItem = List.generate(3, (index) => ListTile(
      selected: selectedIndex == [index, widget.itemIndex],
      selectedTileColor: Colors.red,
      title: Padding(
        padding: EdgeInsets.only(left:60),
        child: Text("Child Category $index}"),
      ),
      onTap: (){
        //action on press
        print(index);
        setState(() {
          selectedIndex = [index, widget.itemIndex];
          print(selectedIndex);
          print([index, widget.itemIndex]);
        });
        // widget.callback();
      },
    ),);
    return ExpansionTile(

      title: Text("Parent Category 1"),
      leading: Icon(Icons.person), //add icon
      // childrenPadding: EdgeInsets.only(left:60), //children padding
      children: listItem,
    );
  }
}

class ListPanel extends StatefulWidget {
  const ListPanel({Key? key}) : super(key: key);

  @override
  State<ListPanel> createState() => _ListPanelState();
}

class _ListPanelState extends State<ListPanel> {
  int selected= 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => Panel(
         itemIndex: index,
      )),
    );
  }
}




