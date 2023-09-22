import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/register.dart';
import 'package:profile/todolist.dart';

import 'db/db_helper.dart';

Future<void> main() async {
  await DBHelper.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LOGIN PROFILE",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Center(
          child: Text('  LOGIN',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.amber)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          // A widget phats hieenj cuwr chir .
          onTap: () {
            FocusScope.of(context).unfocus();
            // annr keyboard , khi cham vao baat cu choox naof (cac widget con)
          },
          child: ListView(
            children: [
              Center(
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
                            image: AssetImage('images/avt.jpg'))),
                  ),
                  Positioned(
                    // tạo một widget điều khiển vị trí con của Stack.
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Colors.blue),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              buildTextField('Tên đăng nhập', 'Nhập email / SĐT', false),
              buildTextField('Mật khẩu', 'Nhập mật khẩu', true),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const toDolist()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Đăng nhập',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const editPro()));
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Image(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    image: const AssetImage(
                      'images/best.jpg',
                    )),
              ),
              Positioned(
                bottom: 30,
                child: Column(
                  children: [
                    Container(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height: 30,
                              width: 30,
                              image: AssetImage('images/1.jpg')),
                          Text(
                            'Instagram:',
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.normal),
                          ),
                          Text(
                            'Công Thạch.',
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.normal),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Image(
                              height: 30,
                              width: 30,
                              image: AssetImage('images/FB.jpg')),
                          Text(
                            'Facebook :',
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.normal),
                          ),
                          Text(
                            'Huỳnh Myl ',
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height: 30,
                              width: 30,
                              image: AssetImage('images/3.png')),
                          Text(
                            'Github:',
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.normal),
                          ),
                          Text(
                            'Myl T',
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.normal),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Image(
                              height: 50,
                              width: 50,
                              image: AssetImage('images/4.jpg')),
                          Text(
                            'TikTok :',
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.normal),
                          ),
                          Text(
                            'Thạch Công ',
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? true : false,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    })
                : null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontStyle: FontStyle.italic, fontSize: 16, color: Colors.grey)),
      ),
    );
  }
}
