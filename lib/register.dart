import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text('Name'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
              ),

              //space in between name and surname
              const SizedBox(
                height: 10,
              ),

              TextField(
                controller: surnameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Surname'),
              ),

              //space between surname and email
              const SizedBox(
                height: 10,
              ),
              const Text('Email'),
              const SizedBox(
                height: 5,
              ),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                ),
              ),

              // space email and password
              const SizedBox(
                height: 10,
              ),
              const Text('Password'),
              const SizedBox(
                height: 5,
              ),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Password'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('ConfimPassword'),
              const SizedBox(
                height: 5,
              ),

              TextField(
                controller: confirmpasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Confirm Password',
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //create button for register
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
