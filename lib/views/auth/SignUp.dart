// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:personal_pjt/connector/auth_connector.dart';
// import 'package:personal_pjt/views/auth/login_page.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _mobileNoController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _cPasswordController = TextEditingController();
//   final TextEditingController _fnController = TextEditingController();
//   final TextEditingController _lnController = TextEditingController();

//   var phone;
//   var email;
//   var password;
//   var msg;
//   var passVisible = false, cPassVisible = false;
//   var list = ["Male", "Female"];
//   String? dropDownValue;

//   List<DropdownMenuItem<String>> get dropDowdnItems {
//     List<DropdownMenuItem<String>> menuItems = [
//       DropdownMenuItem(
//         child: Text("Male"),
//         value: "Male",
//       ),
//       DropdownMenuItem(
//         child: Text("Female"),
//         value: "Female",
//       )
//     ];
//     return menuItems;
//   }

//   final instance = FirebaseAuth.instance;
//   final CollectionReference _users =
//       FirebaseFirestore.instance.collection("users");

//   void createUserInFirebase() async {
//     try {
//       await instance.createUserWithEmailAndPassword(
//           email: email, password: password);
//       setState(() {
//         msg = "Account created";
//       });
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "weak-password") {
//         print("The password is very weak");
//         setState(() {
//           msg = "The password is very weak";
//         });
//       } else if (e.code == "email-already-in-use") {
//         setState(() {
//           msg = "Email already in use";
//         });
//         print("Account already exists");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   var _chkBox = false;
//   @override
//   Widget build(BuildContext context) {
//     return AuthConnector(
//       builder: (BuildContext context, AuthViewModel model) {
//         return Scaffold(
//           body: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(30),
//                 child: Form(
//                   key: _formKey,
//                   child: Center(
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.1,
//                           ),
//                           Text(
//                             "Hello Developer",
//                             style: GoogleFonts.inter(
//                                 fontSize: 17, color: Colors.black),
//                           ),

//                           const SizedBox(
//                             height: 8,
//                           ),
//                           Text(
//                             "Sign UP",
//                             style: GoogleFonts.inter(
//                                 fontSize: 23,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.1,
//                           ),

//                           //Name
//                           TextFormField(
//                             controller: _fnController,
//                             decoration: InputDecoration(
//                               labelText: "First Name",
//                               hintText: "Enter your First Name",
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 255, 189, 103),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(color: Colors.green)),
//                             ),
//                             validator: (val) {
//                               if (val!.length == 0) {
//                                 return "Name cannot be empty";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             style: TextStyle(fontFamily: "Poopins"),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             controller: _lnController,
//                             decoration: InputDecoration(
//                               labelText: "Last Name",
//                               hintText: "Enter your Last Name",
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 255, 189, 103),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(color: Colors.green)),
//                             ),
//                             validator: (val) {
//                               if (val!.length == 0) {
//                                 return "Name cannot be empty";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             style: TextStyle(fontFamily: "Poopins"),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),

//                           TextFormField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               labelText: "Email",
//                               hintText: "Enter your mail id",
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 255, 189, 103),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(color: Colors.green)),
//                             ),
//                             validator: (val) {
//                               if (val!.length == 0) {
//                                 return "Email cannot be empty";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             keyboardType: TextInputType.emailAddress,
//                             style: TextStyle(fontFamily: "Poopins"),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             controller: _mobileNoController,
//                             decoration: InputDecoration(
//                               labelText: "Mobile",
//                               hintText: "Enter your Mobile Number",
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 255, 189, 103),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(color: Colors.green)),
//                             ),
//                             validator: (val) {
//                               if (val!.length == 0) {
//                                 return "Mobile cannot be empty";
//                               } else if (val.length != 10) {
//                                 return "Enter a valid phone number";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             keyboardType: TextInputType.phone,
//                             style: TextStyle(fontFamily: "Poopins"),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           //Row(chilrendr
//                           DropdownButton(
//                             value: dropDownValue,
//                             style: TextStyle(
//                                 color: Colors.blueAccent, fontSize: 15),
//                             onChanged: (String? value) {
//                               setState(() {
//                                 dropDownValue = value;
//                               });
//                             },
//                             items: dropDowdnItems,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             controller: _passwordController,
//                             obscureText: passVisible ? false : true,
//                             decoration: InputDecoration(
//                               labelText: "Password",
//                               suffixIcon: IconButton(
//                                   icon: (passVisible)
//                                       ? Icon(
//                                           Icons.visibility,
//                                         )
//                                       : Icon(
//                                           Icons.visibility_off,
//                                         ),
//                                   onPressed: () {
//                                     setState(() {
//                                       passVisible = !passVisible;
//                                     });
//                                   }),
//                               hintText: "Enter your Password",
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 255, 189, 103),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(color: Colors.green)),
//                             ),
//                             validator: (val) {
//                               if (val!.length == 0) {
//                                 return "Enter a valid password";
//                               } else if (val.length < 8) {
//                                 return "Password length must be greater than 8";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             keyboardType: TextInputType.visiblePassword,
//                             style: TextStyle(fontFamily: "Poopins"),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             controller: _cPasswordController,
//                             obscureText: cPassVisible ? false : true,
//                             decoration: InputDecoration(
//                               labelText: "Confirm Password",
//                               suffixIcon: IconButton(
//                                   icon: (cPassVisible)
//                                       ? Icon(
//                                           Icons.visibility,
//                                         )
//                                       : Icon(
//                                           Icons.visibility_off,
//                                         ),
//                                   onPressed: () {
//                                     setState(() {
//                                       cPassVisible = !cPassVisible;
//                                     });
//                                   }),
//                               hintText: "Enter your Password again",
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 255, 189, 103),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(color: Colors.green)),
//                             ),
//                             validator: (val) {
//                               if (val!.length == 0) {
//                                 return "Enter a valid password";
//                               } else if (val.length < 8) {
//                                 return "Password length must be greater than 8";
//                               } else if (val != _passwordController.text) {
//                                 return "Password mismatch";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             keyboardType: TextInputType.visiblePassword,
//                             style: TextStyle(fontFamily: "Poopins"),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Checkbox(
//                                       value: _chkBox,
//                                       onChanged: (newVal) {
//                                         setState(() {
//                                           _chkBox = newVal!;
//                                         });
//                                       }),
//                                   Text("Agree to RQ's T/C"),
//                                 ],
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (BuildContext context) {
//                                       return const LoginPage();
//                                     },
//                                   ));
//                                 },
//                                 child: Text(
//                                   "Have an account?",
//                                   maxLines: 2,
//                                   style: TextStyle(color: Colors.blue),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 35,
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               phone = _mobileNoController.text;
//                               email = _emailController.text;
//                               password = _passwordController.text;
//                               //model.loginWithPassword(email, password);
//                               final form = _formKey.currentState;
//                               if (form!.validate()) {
//                                 if (_chkBox == true) {
//                                   form.save();
//                                   //_formKey.currentState?.validate

//                                   createUserInFirebase();
//                                   _users.doc().set({
//                                     "email": email,
//                                     "phone": phone,
//                                     "password": password
//                                   });
//                                   form.reset();
//                                 } else {
//                                   setState(() {
//                                     msg = "Please agree to RQ's T/C";
//                                   });
//                                 }
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) => AlertDialog(
//                                     title: Text("Hello Dev"),
//                                     content: Text("$msg"),
//                                   ),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//                               primary: Color.fromARGB(255, 255, 189, 103),
//                             ),
//                             child: Text(
//                               "SIGN IN",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
