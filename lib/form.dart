import 'package:flutter/material.dart';
import 'dart:convert';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {



final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String name,email,phonenumber,city;
  
@override
  Widget build(BuildContext context) {
 
    return Scaffold(
           appBar: PreferredSize( 
        preferredSize: Size.fromHeight(189),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
      // appBar: AppBar( 
      //   title: Text('Home Page'),
      // ),
      // title: appTitle,
     
      
      ),
    
      ),
 

  body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    //controller: firstname,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText:"Name"),
                    validator: (value) => value.isEmpty ? 'Name cannot be blank':null,
                       onSaved: (value) => name = value,
                  ),
                ), 
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    //controller: email,
                    keyboardType: TextInputType.text,
                    decoration:InputDecoration(labelText:"Email"),
                    // validator: (input) => !input.contains('@') ? 'Not a valid Email' : null,
                    // onSaved: (input) => email = input,
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please enter a valid Email';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      email = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                   // controller: phonenumber,
                    keyboardType: TextInputType.text,
                    decoration:InputDecoration(labelText:"Phone Number"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please enter phone number ';
                      }
                      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = new RegExp(pattern);
                      if (value.length == 0) {
                            return 'Please enter phone number';
                      }
                      else if (!regExp.hasMatch(value)) {
                            return 'Please enter valid phone number';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      phonenumber = value;
                    },
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                   // controller: city,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Town/City"),
                    validator: (value) => value.isEmpty ? 'City cannot be blank':null,
                       onSaved: (value) => city = value,
                  ),
                ), 
      

                SizedBox(
                  width: 120,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    onPressed: (){ 
                      // Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) => MyBookingPage(),
                      //            ), );

                      if(_formkey.currentState.validate())
                      { 
                        _formkey.currentState.save();
                        print(email);
                        print(name);
                        print(city);
                        print(phonenumber);
                        //BookingCar();
                        print("successful");

                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        //side: BorderSide(color: Colors.blue,width: 2)
                    ),
                    textColor:Colors.white,child: Text("Submit")
                    
                    
                    ,

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    
    );
  }
  }