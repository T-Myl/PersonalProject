import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profile/clr.dart';
import 'package:profile/input_field.dart';
import 'package:get/get.dart';
import 'package:profile/task_controller.dart';
import 'package:profile/todolist.dart';

import 'task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = 'Trống';
  List<String> repeatList = ['Trống', 'Hàng ngày', 'Hàng tuần', "Hàng tháng"];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Expanded(
          child: MyInputField(
        title: " Giờ bắt đầu",
        hint: _startTime,
        widget: IconButton(
          onPressed: () {
            _getTimeFromUser(isStarTime: true);
          },
          icon: const Icon(
            Icons.access_time_rounded,
            color: Colors.grey,
          ),
        ),
      )),
      const SizedBox(
        width: 12,
      ),
      Expanded(
          child: MyInputField(
        title: " Giờ kết thúc",
        hint: _endTime,
        widget: IconButton(
          onPressed: () {
            _getTimeFromUser(isStarTime: false);
          },
          icon: const Icon(
            Icons.access_time_rounded,
            color: Colors.grey,
          ),
        ),
      ))
    ];
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/o1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                  child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Color.fromARGB(59, 0, 0, 0),
                    height: 30,
                  ),
                ),
                const Text(
                  '_Add *Task _',
                  style: TextStyle(
                      fontFamily: 'ft',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 240, 33, 33)),
                ),
                MyInputField(
                  title: 'Title',
                  hint: 'Enter your title',
                  controller: _titleController,
                ),
                MyInputField(
                  title: 'Note',
                  hint: 'Enter your note',
                  controller: _noteController,
                ),
                MyInputField(
                  title: "Date",
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    onPressed: () {
                      print("Hi there");
                      _getDateFromUser();
                    },
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  children: children2,
                ),
                MyInputField(
                  title: "Remind",
                  hint: "$_selectedRemind minutes early",
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),
                MyInputField(
                  title: "Repeat",
                  hint: "$_selectedRepeat ",
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value!,
                            style: const TextStyle(color: Colors.grey)),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    _colorPallete(),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 80),
                      child: ElevatedButton(
                        onPressed: () => _validateDate(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 239, 28, 109),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text(
                          'Create Tasks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 180),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 245, 93, 16),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Exit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                  ),
                )
              ])),
            )
          ],
        ),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2123));
    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
        print(_selectedDate);
      });
    } else {
      print("Error");
    }
  }

  _getTimeFromUser({required bool isStarTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time cancel");
    } else if (isStarTime == true) {
      setState(() {
        _startTime = formatedTime;
      });
    } else {
      if (isStarTime == false) {
        setState(() {
          _endTime = formatedTime;
        });
      }
    }
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      //add to databse
      _addTaskToDb();
      Get.to(const toDolist());
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        "Yêu cầu",
        'Vui lòng điền thông tin đầy đủ !',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr,
      );
      icon:
      const Icon(
        Icons.warning_amber_rounded,
        color: Colors.red,
      );
    }
  }

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )),
        const SizedBox(
          height: 8.0,
        ),
        Wrap(
            children: List<Widget>.generate(3, (int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = index;
                print('$index');
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkClr
                          : yellowClr,
                  child: _selectedColor == index
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container()),
            ),
          );
        }))
      ],
    );
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          //_strarTime

          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(':')[1].split('')[0]),
        ));
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
            note: _noteController.text,
            title: _titleController.text,
            date: DateFormat.yMd().format(_selectedDate),
            startTime: _startTime,
            endTime: _endTime,
            remind: _selectedRemind,
            repeat: _selectedRepeat,
            color: _selectedColor,
            isCompleted: 0));
    print("Mã của em là " "$value");
  }
}
