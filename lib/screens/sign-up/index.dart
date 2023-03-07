
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  String _chosenUserType = "admin";
  
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(' CREATE ACCOUNT ON ETicket'),
        // centerTitle: true,
        //backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sign up',
            style: TextStyle(
                fontSize: 35, color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          border: OutlineInputBorder()),
                      onChanged: (String Value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'please enter email' : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter password',
                          border: OutlineInputBorder()),
                      onChanged: (String Value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'please enter password' : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          labelText: 'Confirm password',
                          hintText: 'Enter again the password to confirm',
                          border: OutlineInputBorder()),
                      onChanged: (String Value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'please enter password' : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                  child:   DropdownButton(
                    items: items,
                    onChanged: setUserType,
                    value: items.firstWhere((element) => element.value == _chosenUserType).value ?? items[0].value,
                    isExpanded: true,
                  ),),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {},
                      child: Text('Sing up'),
                      color: Colors.teal,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }

  final items = [
    const DropdownMenuItem(
      value: "admin",
      child: Text("Admin"),
    ),
    const DropdownMenuItem(
      value: "user",
      child: Text("User"),
    )
  ];

  void setUserType(String? chosenVale) {
    if (chosenVale is String) {
      setState(() {
        _chosenUserType = chosenVale;
      });
    }
  }
}
