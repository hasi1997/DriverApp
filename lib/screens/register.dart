// ignore: unused_import
import 'dart:ffi';

import 'package:DriverApp/components/Dashboard.dart';
import 'package:DriverApp/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:loginpage/main.dart';
// import 'package:loginpage/models/Addcard.dart';
// import 'package:loginpage/screens/homepage.dart';
// import 'package:loginpage/screens/login.dart';
// import 'package:loginpage/services/auth.dart';
// ignore: unused_import
//import 'package:loginpage/shared/loading.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterPage extends StatefulWidget {
//final Function toggleView;
//RegisterPage({this.toggleView, Void Function() toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // TextEditingController _nameController,
  //     _emailController,
  //     _contactnumberController,
  //     _addressController;

  // DatabaseReference _ref;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _nameController = TextEditingController();
  //   _emailController = TextEditingController();
  //   _contactnumberController = TextEditingController();
  //   _addressController = TextEditingController();
  //   _ref = FirebaseDatabase.instance.reference().child('DriverRegistrations');
  // }

  String cityDropdownValue = 'Anuradhapura';
  final _firestore = Firestore.instance;

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String nametext,
      emailtext,
      passwordtext,
      confirmpasswordtext,
      addresstext,
      citytext;
  int contactnumber;

  String email;
  String password;
  bool showSpinner = false;

  // Future sendData() async {
  //   // ignore: unused_local_variable
  //   final db = Firestore.instance
  //       .collection("Userinfo")
  //       .add({'email': "hasitha@plymouth.ac.uk"});
  // }

  // ignore: unused_field
  // final AuthService _auth = AuthService();
  // final _formKey = GlobalKey<FormState>();

  // String email = "";
  // String password = "";
  // String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Register'),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.grey,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        actions: [
          IconButton(
            color: Colors.grey,
            icon: Icon(Icons.logout),
            onPressed: () {
              // Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      // ignore: missing_required_param
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          child: Column(
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 5.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'REGISTRATION',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 25.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  // controller: _nameController,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    // nametext = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'John Doe',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: Form(
                    // key: _formKey,
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                          // controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          // validator: (val) =>
                          //     val.isEmpty ? 'Enter an email' : null,
                          // onChanged: (val) {
                          //   setState(() => email = val);
                          // },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'johndoe@gmail.com',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ))))
                ])),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: Form(
                    // key: _formKey,
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            password = value;
                          },
                          // validator: (val) =>
                          //     val.length < 6 ? 'Enter password' : null,
                          // onChanged: (val) {
                          //   setState(() => password = val);
                          // },
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: '123456',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              )),
                          obscureText: true))
                ])),
              ),

              // Container(
              //     margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
              //     child: TextField(
              //       decoration: InputDecoration(
              //         labelText: 'Password',
              //         labelStyle: TextStyle(
              //           color: Colors.grey,
              //         ),
              //         focusedBorder: UnderlineInputBorder(
              //           borderSide: BorderSide(color: Colors.grey),
              //         ),
              //       ),
              //       obscureText: true,
              //     ),
              //   ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    // confirmpasswordtext = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                  child: TextField(
              // controller: _contactnumberController,

                    //   keyboardType: TextInputType.name,
                    // onChanged: (value){
                    //   contactnumber = ;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      hintText: '0712345678',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                  child: TextField(
              //  controller: _addressController,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      // addresstext = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: '123, kandy road, colombo',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30.0, top: 30.0),
                      child: Text(
                        'City:',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 16.0),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      margin: EdgeInsets.only(left: 15.0, top: 30.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        child: DropdownButton<String>(
                          value: cityDropdownValue,
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              cityDropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Anuradhapura',
                            'Colombo',
                            'Gampaha',
                            'Kurunegala',
                            'Jaffna',
                            'Galle',
                            'Kandy',
                            'Matara'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                  child: GestureDetector(
                    onTap: () async {
                      // _firestore.collection('Registration').add({
                      //   'Address': addresstext,
                      //   'City':citytext,
                      //   'Contactnumber':contactnumber,
                      //   'Email':emailtext,
                      //   'Name':emailtext,
                      //   'Password':passwordtext,
                      //   'confirmpassword':confirmpasswordtext,

                      // });
                    // register();
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => Home()));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    // onTap: () async {
                    //    if(_formKey.currentState.validate()){
                    //              dynamic result = await _auth
                    //               .registerWithEmailAndPassword(email, password);
                    //           if (result == null) {
                    //             setState(() => error = 'please enter valid email');

                    //           }

                    //           }

                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//   void register() {
 
// String name = _nameController.text;
// String email = _emailController.text;
// String contactnumber = _contactnumberController.text;
// String address = _addressController.text;

// Map<String, String> register = {
//   'name' : name,
//   'email' : email,
//   'contactnumber':contactnumber,
//   'address':address,
// };

// _ref.push().set(register).then((value){
//   Navigator.pop(context);

// });

// }
// }




