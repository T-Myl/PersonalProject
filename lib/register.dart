 import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "LOGIN PROFILE",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const editPro(),
  );
}

class editPro extends StatefulWidget {
  const editPro({super.key});

  @override
  State<editPro> createState() => _editProState();
}

class _editProState extends State<editPro> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Center(
          child: Text('  REGISTER ',
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
          onPressed: () {
            Navigator.pop(context);
          },
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
                            image: AssetImage('images/avt1.jpg'))),
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
              buildTextField('Họ và tên', 'Nhập tên', false),
              buildTextField('Email', 'Nhập email', false),
              buildTextField('Mật khẩu', 'Nhập mật khẩu', true),
              buildTextField('Điền lại mật khẩu', 'Nhập mật khẩu', false),
              buildTextField('Độ tuổi', 'Nhập độ tuổi', false),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Làm mới',
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Thông báo !'),
                          content: const Text('Đăng ký thành công'),
                          actions: [
                            TextButton(
                              child: const Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: Image(
                    image: AssetImage(
                  'images/flutter.png',
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: [
                  Text(
                    ' Thông tin Admin : ',
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              const Column(
                children: [
                  Text(
                    ' Số điện thoại: 0333825995 ',
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              const Column(
                children: [
                  Text(
                    ' Email: congthachtr@gmail.com ',
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              const Column(
                children: [
                  Text(
                    ' GIT: Myl@Ebook.vn ',
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              )
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
