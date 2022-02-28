import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignUp Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Email is required'),
                      EmailValidator(errorText: 'enter a valid email address'),
                    ])),
                const SizedBox(height: 24),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    maxLength: 15,
                    obscureText: true,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(8,
                          errorText: 'password must be at least 8 digits long'),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                          errorText:
                              'passwords must have at least one special character')
                    ])),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        // use the email provided here
                      }
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
