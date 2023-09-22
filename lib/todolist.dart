import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:profile/task_controller.dart';
import 'main.dart';
import 'theme.dart';

class toDolist extends StatefulWidget {
  const toDolist({Key? key}) : super(key: key);

  @override
  State<toDolist> createState() => _toDolistState();
}

class _toDolistState extends State<toDolist> {
  int currentTab = 0;
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 0, top: 5),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 120, top: 10),
                          child: Text(
                            DateFormat.yMMMMd().format(
                              DateTime.now(),
                            ),
                            style: const TextStyle(
                              fontFamily: 'ft',
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Text(
                          "Today",
                          style: TextStyle(fontFamily: 'ft', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: const Color.fromARGB(255, 248, 163, 191),
                selectedTextColor: const Color.fromARGB(255, 0, 0, 0),
                dateTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
                onDateChange: (date) {
                  _selectedDate = date;
                },
              ),
            ),
            _showTasks(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 243, 71, 137),
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTaskPage()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard,
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Dashboarh',
                            style: TextStyle(
                                fontSize: 15,
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_half,
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Star',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.eco,
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Heathy',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.support_agent,
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Help',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
            backgroundColor: const Color.fromARGB(255, 4, 217, 241),
            child: ListView(children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 242, 104, 141),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 40,
                    ),
                    Text(
                      " To Do List ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'ft',
                          fontSize: 35,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.favorite,
                      size: 40,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Color.fromARGB(59, 0, 0, 0),
                  height: 1,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                ),
                title: const Text('My Favorite',
                    style: TextStyle(
                        fontFamily: 'ft', fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Color.fromARGB(59, 0, 0, 0),
                  height: 1,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.fmd_bad,
                ),
                title: const Text('Note',
                    style: TextStyle(
                        fontFamily: 'ft', fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Color.fromARGB(59, 0, 0, 0),
                  height: 1,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.local_florist),
                title: const Text("Information",
                    style: TextStyle(
                        fontFamily: 'ft', fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Color.fromARGB(59, 0, 0, 0),
                  height: 1,
                ),
              ),
              ListTile(
                  leading: const Icon(Icons.assignment_return),
                  title: const Text("Exits",
                      style: TextStyle(
                          fontFamily: 'ft', fontWeight: FontWeight.w500)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  }),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Color.fromARGB(58, 255, 0, 0),
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'W .Information business',
                  style: TextStyle(fontFamily: 'ft', fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Center(
                  child: Stack(children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/cvd.jpg'))),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: const Positioned(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.facebook,
                              size: 23,
                            ),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Phạm My',
                              style: TextStyle(
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                                color: Color.fromARGB(255, 240, 47, 22),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(9.0, 7.0, 0.0, 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.telegram,
                              size: 23,
                            ),
                            Text(
                              'Telegram :',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            Text('My8121653@egram.ebok.vn',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 240, 47, 22),
                                )),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.mark_email_read,
                              size: 23,
                            ),
                            Text(
                              'Gmail :',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                            Text('My49159@st.uda.eduy.vn',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 240, 47, 22),
                                )),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(9.0, 10.0, 0.0, 0.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 23,
                            ),
                            Text(
                              'Phone :',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                            Text('0343825995',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 240, 47, 22),
                                )),
                          ]),
                    ),
                  ]),
                ),
              )
            ])));
  }

  _appBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(80),
                bottomLeft: Radius.circular(80)),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/sky.jpg'), fit: BoxFit.fill),
              ),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              ' Task List ',
              style: TextStyle(
                  fontFamily: 'ft',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 245, 57, 5)),
            ),
          ),
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80))),
        ));
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, context) {
              print(_taskController.taskList.length);
              return Container(
                width: 100,
                height: 50,
                color: Colors.green,
              );
            });
      }),
    );
  }
}
