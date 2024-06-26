import 'package:flutter/material.dart';
import 'package:screen_1/BookAppointment.dart';
import 'package:screen_1/Payment.dart';
import 'package:screen_1/Paymentfortests.dart';
import 'package:screen_1/apifunctions.dart';

class appointmentforsomeoneelse extends StatefulWidget{
var selecteddate;
var from;
var selecetedtime;
var testid;
appointmentforsomeoneelse(this.from,this.selecteddate,this.selecetedtime,this.testid);


  @override
  State<appointmentforsomeoneelse> createState() => _appointmentforsomeoneelseState(this.from,this.selecteddate,this.selecetedtime,this.testid);
}

class _appointmentforsomeoneelseState extends State<appointmentforsomeoneelse> {
 TextEditingController namecontroller = TextEditingController();
 TextEditingController Contact_Number = TextEditingController();
 TextEditingController email_address = TextEditingController();
 TextEditingController emergencycontact = TextEditingController();
TextEditingController age = TextEditingController();
var type = 'visitor';
var testid;

var selecteddate;
var from;
var selecetedtime;
_appointmentforsomeoneelseState(this.from,this.selecteddate,this.selecetedtime,this.testid);


List<String> ages = ['10-20', '21-30', '31-40', '41-50', '51-60', '61-70', '71-80', '81-90', '91-100'];
String? selectedAge;
 int _selectedIndex = -1;

var selectedgender;


@override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Color.fromARGB(255, 207, 206, 206),
        child:   SingleChildScrollView(
           child: Column(
            children: [
      
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                            color: Color(0xFF3E64FF),
                 
                ),
                child:
                 Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 70,right: 0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30,bottom: 55),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                          width: 48,
                                          height: 48,
                                          padding: const EdgeInsets.all(12),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                              
                                            ),
                                          ),
                                          child:Icon(Icons.arrow_back,color: Colors.white,) ,
                              ),
                            ),
                          ),
                       
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        width:225 ,
                        child: Text(
                            textAlign: TextAlign.center,
                 
                                  'Enter Information',
                                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'nunito-extrabold',
                      fontWeight: FontWeight.w800,
                      height: 0,
                      letterSpacing: -0.32,
                      
                                  )),
                      ),
                    ),
                   
                        ],
                      )
                  ),       
              
                  ]
                )
            
              )
            ,
        Container(
          width: double.infinity,
        //  height: 1000,
         // color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
                  child: Text(
                        'Full Name',
                                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontFamily: 'nunito-extrabold',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.32,
                                      )),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 370,
                  decoration:BoxDecoration(
                      color: Colors.white,
                  borderRadius: BorderRadius.circular(18)
                  ) ,
                  
                    child: RoundedTextField('Enter your name', namecontroller)),
                )
           ,
            Padding(
                  padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
                  child: Text(
                        'Contact Number',
                                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontFamily: 'nunito-extrabold',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.32,
                                      )),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 370,
                  decoration:BoxDecoration(
                      color: Colors.white,
                  borderRadius: BorderRadius.circular(18)
                  ) ,
                  
                    child: RoundedTextField('Enter Contact Number', Contact_Number)),
                ),
           
            Padding(
                  padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
                  child: Text(
                        'Email Address',
                                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontFamily: 'nunito-extrabold',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.32,
                                      )),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 370,
                  decoration:BoxDecoration(
                      color: Colors.white,
                  borderRadius: BorderRadius.circular(18)
                  ) ,
                  
                    child: RoundedTextField('Enter your Email address', email_address)),
                ),


              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                child: Text(
                      'Age',
                                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontFamily: 'nunito-extrabold',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.32,
                                    )),
              ),
           Center(
          child: Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(18)
          
            ),
           child:
           RoundedTextField('Enter Age', age),
 ) 
               ),

          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
            child: Text(
                      'Gender',
                                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontFamily: 'nunito-semibold',
                        fontWeight: FontWeight.w800,
                        height: 0,
                        letterSpacing: -0.32,
                                    )),
          ),
         
         Row(
           children: [
            SizedBox(width: 20,),
             GestureDetector(
               onTap: () {
          setState(() {
            if (_selectedIndex == -1 || _selectedIndex == 2){
                _selectedIndex = 0;
                selectedgender ='Male';
            }
           
          });
          print(selectedgender);
               },
             
               child: Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: _selectedIndex == 0 ? Color(0xFF3E64FF) : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child:  Center(
            child: Text(
                    "Male",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: _selectedIndex == 0 ? Colors.white : Colors.black,
                      fontFamily: "nunito-semibold",
                      fontSize: 18,
                    ),
              ),
          ),
             ),
             
             ),
          SizedBox(width: 10,),
             GestureDetector(
               onTap: () {
                print('i am tapped');
          setState(() {

            if (_selectedIndex == -1 || _selectedIndex == 0){
             _selectedIndex = 2;
                selectedgender = 'Female';
            }
         
          
               
          });
          print(selectedgender);
               },
             
               child: Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: _selectedIndex == 2 ? Color(0xFF3E64FF) : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child:  Center(
            child: Text(
                    "Female",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: _selectedIndex == 2 ? Colors.white : Colors.black,
                      fontFamily: "nunito-semibold",
                      fontSize: 18,
                    ),
              ),
          ),
             ),
             
             ),
           ],
         ),   
      
      
                  Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 0),
                child: Text(
                      'Emergency Contact',
                                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontFamily: 'nunito-extrabold',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.32,
                                    )),
              ),
         Padding(
             padding: const EdgeInsets.only(top: 10,bottom: 10),
             child: Center(
             child: Container(
             height: 50,
            width: 370,
             decoration: BoxDecoration(
             color :Colors.white,
             borderRadius: BorderRadius.circular(18)
             
             ),
             child: RoundedTextField('Enter Emergency Contact no',emergencycontact ),
             ),
           ),
         ),
             
         Padding(
           padding: const EdgeInsets.only(top: 10,bottom: 20),
           child: Center(
             child: Container(
             height: 50,
            width: 300,
              child:  ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: const Color(0xFF0E67B8),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(35.0),
                   ),
                 ),
                 onPressed: () {
                      print(reason);

                    if(isValidName(namecontroller.text)){
                      print('name is valid');
                      if(isValidPhoneNumber(Contact_Number.text)){

                          if(isEmail(email_address.text)){
                              if(isValidAge(age.text)){
                                if(selectedgender == 'Male' || selectedgender == 'Female'){
                                    if(isValidPhoneNumber(emergencycontact.text)){
                                        if(from == 'test'){
 apifunction().postunregisteredtests(testid,namecontroller.text, age.text, selectedgender, email_address.text, Contact_Number.text, emergencycontact.text,selecteddate,selecetedtime);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>Paymentfortests(type,selecteddate,selecetedtime)),
  );   
            

           }
           else{
            apifunction().postVisitorsdata(namecontroller.text, age.text, selectedgender, email_address.text, Contact_Number.text,emergencycontact.text);
          //apifunction().postVisitsBill('asdasd');
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>Payment(type,selecteddate,selecetedtime,reason)),
  );    
          }

                                    }
                                    else{
                                      final snackBar = SnackBar(
                backgroundColor: Color(0xFF800020), // Customize the background color
                content: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.white), // Warning icon
                    SizedBox(width: 8),
                    Text(
                      'Invalid Emergency contact',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);    
                                    }
                                }
                                else{
 final snackBar = SnackBar(
                backgroundColor: Color(0xFF800020), // Customize the background color
                content: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.white), // Warning icon
                    SizedBox(width: 8),
                    Text(
                      'Select gender',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);                                  }
                              }
                              else{
                                 final snackBar = SnackBar(
                backgroundColor: Color(0xFF800020), // Customize the background color
                content: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.white), // Warning icon
                    SizedBox(width: 8),
                    Text(
                      'Invalid Age',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);   
                              }
                          }
                          else{
                             final snackBar = SnackBar(
                backgroundColor: Color(0xFF800020), // Customize the background color
                content: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.white), // Warning icon
                    SizedBox(width: 8),
                    Text(
                      'Invalid Email',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);   
                          }
                      }
                      else{
                        final snackBar = SnackBar(
                backgroundColor: Color(0xFF800020), // Customize the background color
                content: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.white), // Warning icon
                    SizedBox(width: 8),
                    Text(
                      'Invalid Contact number',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);    
                      }
                    }
                    else{
final snackBar = SnackBar(
                backgroundColor: Color(0xFF800020), // Customize the background color
                content: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.white), // Warning icon
                    SizedBox(width: 8),
                    Text(
                      'Invalid Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);                    }

           // print(selectedgender);
//          
       
            
                 },
                 child: Row(
                   children: [
                     SizedBox(width: 80,),
                     const Text('Proceed',style: TextStyle(fontFamily: 'nunito-extrabold',fontSize: 20,color: Colors.white),),
                  SizedBox(width: 10,),
                  Image.asset('assets/icons/arrowforward.png')
                   ],
                 ),
               ),
             ),
           ),
         )
            ],
          ),
        )
            ]
           )
        )
      ),
    );

  }
  
bool isValidName(String name) {
  // Check if the name is empty
  if (name.isEmpty) {
    return false;
  }

  // Check if the name contains only alphabetic characters and spaces
  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
    return false;
  }

  // If all criteria are met, the name is considered valid
  return true;
}

bool isValidAge(String ageString) {
  try {
    // Convert the string to an integer
    int age = int.parse(ageString);

    // Check if the age is within the valid range (0 to 149)
    if (age >= 0 && age < 150) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    // If parsing fails (e.g., the string is not a valid integer), return false
    return false;
  }
}

bool isValidPhoneNumber(String phoneNumber) {
  // Regular expression pattern for matching common phone number formats
  final RegExp phoneNumberRegex = RegExp(
    r'^\+?[\d()-.\s]+$',
    caseSensitive: false,
    multiLine: false,
  );

  // Check if the input string matches the phone number pattern
  return phoneNumberRegex.hasMatch(phoneNumber);
}
bool isEmail(String input) {
  // Regular expression pattern for matching email addresses
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );
  
  // Check if the input string matches the email pattern
  return emailRegex.hasMatch(input);
}
}

class RoundedTextField extends StatelessWidget {
  final String hintText;
  TextEditingController controller;


RoundedTextField(this.hintText,this.controller);
  @override
  Widget build(BuildContext context) {
    return TextField(
     
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      controller: controller,
      
      decoration: InputDecoration(
      border: UnderlineInputBorder(borderSide: BorderSide.none),

        hintText: hintText, hintStyle: TextStyle(
          color: Color.fromARGB(255, 31, 29, 29),
          fontFamily: 'actor'
          
          ),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),

      ),
    );
  }
}

