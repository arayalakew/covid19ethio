import 'package:flutter/material.dart';
import 'package:covid19ethio/res/colors.dart';
import 'package:covid19ethio/res/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:covid19ethio/widget/covidCard.dart';
import 'package:covid19ethio/widget/input_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19ethio/widget/button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

bool _saving = false;
String signUpFailedMessage = ' ';

class ReportCase extends StatefulWidget {
  @override
  _ReportCaseState createState() => _ReportCaseState();
}

class _ReportCaseState extends State<ReportCase> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String selectedGender = 'Male';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
            title: Text('COVID19 ETHIOPIA'),
            elevation: 6.0,
          ),
          body: GestureDetector(

              // close keyboard on outside input tap
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Builder(
                builder: (context) => ListView(
                  padding: Constants.padding,
                  children: <Widget>[
                    // header text
                    SizedBox(height: 10),
                    // header text
                    Container(
                      height: 100,
                      child: Image.asset(
                        'assets/moh.jpeg',
                      ),
                    ),
                    // first name input
                    signUpFailedMessage != ' '
                        ? Text(signUpFailedMessage)
                        : Text(''),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: InputField(
                          text: 'ስም / First Name',
                          controller: firstNameController),
                    ),

                    // first name input
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: InputField(
                          text: 'የአባት ስም / Last Name',
                          controller: lastNameController),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: InputField(
                          text: 'የመግብያ ስም / Username',
                          controller: userNameController),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: InputField(
                          text: 'አድራሻ / Address',
                          email: true,
                          controller: emailController),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: InputField(
                          text: 'ስልክ / Phone Number',
                          controller: phoneController),
                    ),
                    // password input
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: InputField(
                        text: 'እድሜ  / Age',
                        controller: passwordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CovidCard(
                        //padding: 8,
                        //padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            // male
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'Male';
                                  //widget.onChanged(widget.selectedGender);
                                });
                              },
                              child: Container(
                                  //width: blockSize * 50,

                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.male,
                                    color: selectedGender == 'Male'
                                        ? Color(ColorsRes.colorAccent)
                                        : Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Male',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: selectedGender == 'Male'
                                          ? Color(ColorsRes.colorAccent)
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              )),
                            ),

                            // female
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'Female';
                                  //widget.onChanged(widget.selectedGender);
                                });
                              },
                              child: Container(
                                  //width: blockSize * 50,

                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.female,
                                    color: selectedGender == 'Female'
                                        ? Color(ColorsRes.colorAccent)
                                        : Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: selectedGender == 'Female'
                                          ? Color(ColorsRes.colorAccent)
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // email input

                    // submit button
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Button(
                        widget: Text(
                          'እርዳታ እፈልጋለሁ',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(ColorsRes.colorAccent),

                        // add your on tap handler here
                        onTap: () async {
                          /*
                          setState(() {
                            _saving = true;
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String signUpResult = await currentUser.signUp(
                              firstNameController.text.toString(),
                              lastNameController.text.toString(),
                              userNameController.text.toString(),
                              emailController.text.toString(),
                              phoneController.text.toString(),
                              passwordController.text.toString(),
                              selectedGender.toString());
                          if (signUpResult == 'success') {
                            currentUser.loggedIn = true;
                            await prefs.setInt(
                                'loggedInUserId', currentUser.userInfo.id);
                            await data.fetchHome();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                  fullscreenDialog: true),
                            );
                          } else {
                            setState(() {
                              showAlertDialog(context, lang(signUpResult));
                              //signUpFailedMessage = ;
                              _saving = false;
                            });
                          }
                          */
                        },
                      ),
                    ),

                    // back to login button
                  ],
                ),
              ))),
      inAsyncCall: _saving,
      progressIndicator: SpinKitWave(
        color: Color(ColorsRes.colorAccent),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String message) {
  // set up the button

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    //title: Text("My title"),
    content: Text(message),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
