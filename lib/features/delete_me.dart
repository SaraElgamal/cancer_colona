import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/features/bottom_sheet.dart';
import 'package:flutter/material.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DefaultButton(
                text: "Bottom sheet",
                onPressed: () {
                  scaffoldKey.currentState!.showBottomSheet(
                      backgroundColor: Colors.transparent,
                      (context) => Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              BottomSheetBody(
                                  titleController: titleController,
                                  descriptionController: descriptionController,
                                  formKey: formKey,
                                  mediaQuery: mediaQuery,
                                  theme: theme),
                            ],
                          ));
                }),
          )
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home)),
      //     BottomNavigationBarItem(icon: Icon(Icons.search)),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined)),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings)),
      //   ],
      // ),
    );
  }
}
