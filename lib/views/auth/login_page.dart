import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_pjt/connector/auth_connector.dart';
import 'package:personal_pjt/views/auth/SignUp.dart';
import 'package:personal_pjt/views/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences pref;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  @override
  void initState() {
    super.initState();
    chkForSavedUser();
  }

  chkForSavedUser() async {
    pref = await _prefs;
    if (pref.getStringList("user") != null) {
      final List<String>? user = pref.getStringList("user");
      _emailController.text = user![0];
      _passwordController.text = user[1];
    }
  }

  var email;
  var password;
  var phone;
  String? msg;
  bool passVisible = false;
  final instance = FirebaseAuth.instance;

  void loginUserWithEmail(context) async {
    try {
      await instance.signInWithEmailAndPassword(
          email: email, password: password);
      //_users.get({email: email});

      setState(() {
        msg = "Login Success";
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return HomePage();
      }));
      if (_chkBox) {
        pref.setStringList("user", [email, password]);
      } else {
        pref.setStringList("user", ["", ""]);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          msg = 'No user found for that email.';
        });
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setState(() {
          msg = 'Wrong password provided for that user.';
        });
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Hi User"),
        content: Text("$msg"),
      ),
    );
  }

  var _chkBox = false;
  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext context, AuthViewModel model) {
        print(model.isLoginError);
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Welcome Back Developer",
                            style: GoogleFonts.inter(
                                fontSize: 17, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Log In",
                            style: GoogleFonts.inter(
                                fontSize: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your mail id",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 189, 103),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.green)),
                            ),
                            validator: (val) {
                              if (val!.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(fontFamily: "Poopins"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: passVisible ? false : true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                  icon: (passVisible)
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passVisible = !passVisible;
                                    });
                                  }),
                              hintText: "Enter your Password",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 189, 103),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.green)),
                            ),
                            validator: (val) {
                              if (val!.length == 0) {
                                return "Enter a valid password";
                              } else if (val.length < 8) {
                                return "Password length must be greater than 8";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(fontFamily: "Poopins"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      value: _chkBox,
                                      onChanged: (newVal) {
                                        setState(() {
                                          _chkBox = newVal!;
                                        });
                                      }),
                                  Text("Remember me"),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return const SignUp();
                                    },
                                  ));
                                },
                                child: Text(
                                  "Dont have an account?",
                                  maxLines: 2,
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          model.isLoading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () async {
                                    var result;
                                    email = _emailController.text;
                                    password = _passwordController.text;
                                    final form = _formKey.currentState;
                                    if (form!.validate()) {
                                      form.save();
                                      //_formKey.currentState?.validate
                                      //loginUserWithEmail(context);
                                      model.loginWithPassword(email, password, (
                                        String successMsg,
                                      ) {
                                        model.loggedInmail(email);
                                        _emailController.text = "";
                                        _passwordController.text = "";
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return HomePage();
                                            },
                                          ),
                                        );
                                        print(successMsg);
                                      }, (String errorMsg) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Hi User"),
                                            content: Text("$msg"),
                                          ),
                                        );
                                        print(errorMsg);
                                      });

                                      result = model.isLoginError;
                                      print("Edittt $result");
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    primary: Color.fromARGB(255, 255, 189, 103),
                                  ),
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
