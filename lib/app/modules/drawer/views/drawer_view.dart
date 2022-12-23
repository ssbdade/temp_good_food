import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/drawer/controllers/drawer_page_controller.dart';
import 'package:temp_good_food/app/routes/app_pages.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

class DrawerView extends GetView<DrawerPageController> {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Người dùng'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListPanel(),
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
    required this.panelIndex,
    required this.panelTitle,
    required this.titleList,
    required this.isSelected,
    required this.onTap,
    required this.routes,
    // required this.callback
  }) : super(key: key);
  final int panelIndex;
  final bool isSelected;
  final String panelTitle;
  final List<String> titleList;
  final List<String> routes;
  final Function(int value) onTap;
  // final VoidCallback callback;

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
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
  DrawerPageController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // List<Widget> listItem = List.generate(3, (index) => ListTile(
    //     selected: controller.selectedIndex == [index, widget.panelIndex],
    //     selectedTileColor: Colors.red,
    //     title: Padding(
    //       padding: EdgeInsets.only(left:60),
    //       child: Text("Child Category $index}"),
    //     ),
    //     onTap: (){
    //       //action on press
    //       print(index);
    //       setState(() {
    //         controller.selectedIndex = [index, widget.panelIndex];
    //         print([index, widget.panelIndex]);
    //       });
    //       // widget.callback();
    //     },
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.black.withOpacity(0.1),
          width: 1,
        )),
      ),
      child: ExpansionTile(
        title: Text(widget.panelTitle),
        leading: Icon(Icons.person), //add icon
        // childrenPadding: EdgeInsets.only(left:60), //children padding
        children: List.generate(
          widget.titleList.length,
          (index) => Obx(
            () => Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: controller.selected[0] == widget.panelIndex && controller.selectedIndex.value == index
                          ? BorderSide(color: Color(0xFF240066), width: 4)
                          : BorderSide.none,
                      bottom: BorderSide(
                        color: Colors.black.withOpacity(0.1),
                        width: 1,
                      ))),
              child: ListTile(
                  selected: controller.selected[0] == widget.panelIndex && controller.selectedIndex.value == index,
                  selectedTileColor: const Color(0xFF4D7FF8).withOpacity(0.1),
                  selectedColor: HexColor('#1E3161'),
                  title: Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      widget.titleList[index],
                    ),
                  ),
                  onTap: () {
                    widget.onTap(index);
                    controller.update();
                    print(controller.selected);
                    Routes.toNamed(widget.routes[index]);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class ListPanel extends StatefulWidget {
  const ListPanel({Key? key}) : super(key: key);

  @override
  State<ListPanel> createState() => _ListPanelState();
}

class _ListPanelState extends State<ListPanel> {
  DrawerPageController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(drawerTitle.length, (index) {
        if (drawerTitle[index]['list'] == 'none') {
          return Obx(
            () => Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: controller.selected[0] == index
                          ? const BorderSide(color: Color(0xFF240066), width: 4)
                          : BorderSide.none,
                      bottom: BorderSide(
                        color: Colors.black.withOpacity(0.1),
                        width: 1,
                      ))),
              child: ListTile(
                  leading: Icon(Icons.person),
                  selected: controller.selected[0] == index,
                  selectedTileColor: const Color(0xFF4D7FF8).withOpacity(0.1),
                  selectedColor: HexColor('#1E3161'),
                  title: Text(
                    drawerTitle[index]['name'],
                  ),
                  onTap: () {
                    controller.update();
                    controller.selected[0] = index;
                    print(controller.selected);
                    Routes.toNamed(drawerTitle[index]['routes']);
                  }),
            ),
          );
        } else {
          return Obx(
            () => Panel(
              isSelected: controller.selected[0] == index && controller.selected[1] == controller.selectedIndex.value,
              panelIndex: index,
              panelTitle: drawerTitle[index]['name'],
              titleList: drawerTitle[index]['list'],
              routes: drawerTitle[index]['routes'],
              onTap: (value) {
                controller.selectedIndex.value = value;
                controller.selected.value = [index, value];
                // print(controller.selected);
              },
            ),
          );
        }
      }),
    );
  }
}

List<dynamic> drawerTitle = [
  {
    'name': 'Khách hàng',
    'list': [
      'Quản lý khách hàng',
      'Quản lý database',
      'Quản lý dịch vụ',
    ],
    'routes': [
      '/customer_manager',
      '/database_manager',
      '/service_manager',
    ]
  },
  {
    'name': 'Biểu đồ',
    'list': 'none',
    'routes': '/stats',
  },
  {
    'name': 'Người dùng',
    'list': 'none',
    'routes': '/customer',
  },
  {
    'name': 'Health check',
    'list': [
      'Tạo báo báo',
      'Quản lý báo cáo',
    ],
    'routes': [
      '/hc_create_report',
      '/hc_report_manager',
    ]
  },
  {
    'name': 'Daily check',
    'list': [
      'Tạo báo cáo',
      'Quản lý báo cáo',
      'Xem dữ liệu',
      'Quản lý log',
      'Báo cáo tăng trưởng',
    ],
    'routes': ['/daily_create_report', '/daily_report_manager', '/stats', '/log_manager', '/grew_report']
  }
];
