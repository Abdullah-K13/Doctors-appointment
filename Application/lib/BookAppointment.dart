import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screen_1/Appforsomeoneelse.dart';
import 'package:screen_1/BrowseDoctors.dart';
import 'package:screen_1/DoctorsInfo.dart';
import 'package:screen_1/Payment.dart';
import 'package:screen_1/apifunctions.dart';
import 'package:intl/intl.dart';
List<String> timeSlotsforthispage = [];
List<String> newalltimeslots = [];
 var reason;
var selectedDate = '2027-02-13';
//List<String> timefromdata=[];
//time jo fethc ho k api se arhy wo add kaha krwa rhy ho wo dkehae
DateTime newtimeOfVisit = DateTime.parse('2026-02-02 02:00:00.000');
List<DateTime> getNext10Days() {
  List<DateTime> dates = [];
  DateTime today = DateTime.now();
  for (int i = 0; i < 10; i++) {
    dates.add(today.add(Duration(days: i)));
  }

  return dates;
}

class BookAppointment extends StatefulWidget{
 var shiftStart;
 var shiftend; 

 BookAppointment(this.shiftStart,this.shiftend);

  @override
  State<BookAppointment> createState() => _BookAppointmentstate(this.shiftStart,this.shiftend);
}

class _BookAppointmentstate extends State<BookAppointment> {
 
 var newshiftStart;
 var newshiftend; 
String? selectedAge;
String? selectedappointment;
var age;
var name;
var app_time;
var app_date;
var gender;
var complain = 'None';
  List<int> selecteddateindices = [];
 // List<int> selectedtimeindices = [];


List<String> bookedTimeSlots = [];
var selectedtime;
 _BookAppointmentstate(this.newshiftStart,this.newshiftend);

  @override
  void initState() {
    super.initState();
    // Call function to fetch and display available time slots
  //  fetchAvailableTimeSlots();
  }
var type = 'myself';
List<String> appointmentfor = ['Myself', 'SomeoneElse'];
 int selectedtestIndex = -1;
 int _selectedIndex = -1;
int selecteddate = -1;
//  TextEditingController namecontroller = TextEditingController();
  TextEditingController complaincontroller = TextEditingController();
var selectedgender ;
List<DateTime> next10Days = getNext10Days();


  Future<void> fetchAvailableTimeSlots(List<dynamic> data) async {
    newalltimeslots = [];
    bookedTimeSlots = [];
    print('fetched time slots are');
    print(data);
    print('in the fetchtime func');
    bookedTimeSlots = [];
   
    // Call API or database query to retrieve shift start and end times for the doctor
   // print(newshiftStart);
    DateTime shiftStart = DateTime.parse('2024-04-30 $newshiftStart'); // Fetch shift start time from database
    DateTime shiftEnd = DateTime.parse('2024-04-30 $newshiftend'); // Fetch shift end time from database
//    String formattedTime = DateFormat('HH:mm:ss').format(shiftStart);
// print(formattedTime);
// 
// //print(shiftStart);

    // Generate list of all possible time slots within shift start and end times with 1-hour interval
    List<DateTime> allTimeSlots = [];
    DateTime currentTime = shiftStart;
    while (currentTime.isBefore(shiftEnd)) {
      allTimeSlots.add(currentTime);
      currentTime = currentTime.add(Duration(hours: 1));
    }
    print('all of the time slots are');
print(allTimeSlots);

//yh alla time slot yaha add hone k bad kaha save krwa rhy ho dkeah kasie rhy ho 
print('all data is:');
 print(data);
//generate booked lists

for(int i = 0;i< allTimeSlots.length;i++){
  String formattedTime = DateFormat('h:mm a').format(allTimeSlots[i]);
newalltimeslots.add(formattedTime);
}
print('new all time slots are');
print(newalltimeslots);
for ( var item in data)
{
  print(item['TimeOfVisit']);
  var test = item['TimeOfVisit'];
  try{
//   DateTime time_Str = DateTime.parse('2024-04-30 $test'); // Fetch shift end time from database
//   print(time_Str);
//   String formattedTime = DateFormat('h:mm a').format(time_Str);
//  print(formattedTime);
//   //String formattedTime = convertTimeFormat(time_Str);
  bookedTimeSlots.add(test);
  }
  catch(Exception){
    print('error');
  }
}
print('the booked time slots are:');
print(bookedTimeSlots);

//remove avaialbel time slots
setState(() {
   for (String timeSlot in bookedTimeSlots) {
  newalltimeslots.remove(timeSlot);
}
});

print('the new time slots are');
print(newalltimeslots);
//main all time slots main say booked time slots remove karwa rha

 timeSlotsforthispage = [];
 print('the time slots for this page is');
print(allTimeSlots);
 for (DateTime timeSlot in allTimeSlots) {
  String formattedTime = DateFormat('h:mm a').format(timeSlot);
 
      timeSlotsforthispage.add(formattedTime);

//yh line c

//// 
  //yaha ab wo time arhy ha ijo avialne hain righrt?
  // jee yahan arha hai
  //yh methiond jb call hota hai jb ap date select krty ho?
  //jee jab date select karta tab hota 
  /// ab yh dekho yh jo timeslorforthis page hai isme ame apka main dathai time ka ap aisko sestate krwana hai 
  /// 
}
print(timeSlotsforthispage);

  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 217, 217),
      body: Container(
        color: const Color.fromARGB(255, 73, 59, 59),
       // height: 100,
        child: Container(
      color: Color.fromARGB(255, 218, 217, 217),
      //height: 100,
     child:
      
       SingleChildScrollView(
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
               
                                'Book Your Appointment',
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
         FutureBuilder<List<dynamic>>(
  future: apifunction().getTimesByDates(DrID, selectedDate),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      // Display an error message if fetching data failed
      //idher horha call
      return Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
      // Extract the data from the snapshotas
       final List<dynamic> data = snapshot.data!;

   //   fetch avaialbe wala method me jao 
   print('i was here');

      return 
          Column(
              children: [
                  Container(
                      height: 150,
                      width: double.infinity,
                    // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       Padding(
                  padding: const EdgeInsets.only(left: 15,top: 10),
                  child: Text(
                            'May, 2024',
                                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontFamily: 'nunito-extrabold',
                              fontWeight: FontWeight.w800,
                              height: 0,
                              letterSpacing: -0.32,
                                          )),
                       ),
                       SizedBox(height: 9,)
                       
                       , SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                         child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           
                                     children:
                                     
                                      List.generate(10, (index)  {
                                       bool isSelected = selecteddateindices.contains(index);
                                    //  var item = data[index];
                           return GestureDetector(
                           onTap: () async {
                             print('in the gesture');
                             selectedDate = DateFormat('yyyy-MM-dd').format(next10Days[index]);
                             // print(selectedDate);
                         
                             setState(()  {
                               if (isSelected)
                               {}
                              //   selecteddateindices.remove(index);
                               else
                                 selecteddateindices = [index];
                               fetchAvailableTimeSlots(data);
                         
                             });
                         
                             // Call fetchAvailableTimeSlots directly after updating selecteddateindices
                           },
                         
                         
                             child: Padding(
                                       padding: const EdgeInsets.only(left:12.0),
                                       child: Container(
                                         width: 70, // Adjust the width as needed
                                         height: 95, // Adjust the height as needed
                                         decoration: BoxDecoration(
                                         color:isSelected? Color(0xFF3E64FF): const Color.fromARGB(255, 252, 252, 252),
                                         borderRadius: BorderRadius.circular(15)
                                           
                                         ),
                                         child: Center(
                                           child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                                    DateFormat('d').format(next10Days[index]),
                                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: isSelected? const Color.
                                        fromARGB(255, 255, 255, 255): const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 33,
                                        fontFamily: 'museo500',
                                       // fontWeight: FontWeight.w800,
                                        height: 0,
                                        letterSpacing: -0.32,
                                                    )),
                             
                                                    SizedBox(height: 5,),
                                                    Text(
                                                    DateFormat('EE').format(next10Days[index]),
                                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: isSelected? const Color.fromARGB(255, 255, 255, 255): const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16,
                                        fontFamily: 'actor',
                                       // fontWeight: FontWeight.w800,
                                        height: 0,
                                        letterSpacing: -0.32,
                                                    )),
                              ],
                                           ),
                                         ),
                                       ),
                             ),
                           );
                                     }),
                                      
                           ),
                       )
                     
                       
                    
                        ],
                      ),
                      
                      ),
   Container(
                             width: MediaQuery.of(context).size.width,
                     //   color: Colors.lightGreen,
                             
                             child: 
                               
                 GridView.count(
                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         crossAxisCount: 4,
                         childAspectRatio: 2.2,
                         padding: const EdgeInsets.all(16.0),
                         mainAxisSpacing: 16.0,
                         crossAxisSpacing: 10.0,
                         children: newalltimeslots.asMap().entries.map((entry)
                         {
                           //sorry yeh timeslotsforthispage hai

                           final index = entry.key;
                         final testtimeslot = entry.value; 

                           return GestureDetector(
                  onTap: () {
                    
                    selectedtime = testtimeslot;
                    print('the selected time is ');
                    print(selectedtime);
                    print(selectedDate);
                    setState(() {
                     // removeTimeslots();// Handle onTap event
                     selectedtestIndex = index;
                    });

                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: selectedtestIndex == index ? Color(0xFF3E64FF): Colors.white, // Adjust color based on your condition
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        testtimeslot,
                        
                        style: TextStyle(
                          fontFamily: 'museo500',
                          color: selectedtestIndex == index ? Colors.white : Colors.black, // Adjust color based on your condition
                          fontWeight: FontWeight.w100,
                          fontSize: 18,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                           );
                         }).toList(),
                       )
                             
                               
                               
                  // } else {
                  //   // Display a loading indicator while waiting for data
                  //   return CircularProgressIndicator();
                  // }
                             
                             
                             
                   )
       
              ],
            );
    }
    else
      return CircularProgressIndicator();
      }
         ),
         
   
   
               Container(
          width: double.infinity,
        //       color: const Color.fromARGB(255, 30, 169, 233),
               child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Text(
                      'Patient Details',
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
                 
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                child: Text(
                      'Booking for?',
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
            width: 380,
            decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)
          
            ),
            child:

DropdownButton<String>(
  
  value: selectedappointment,
  items: appointmentfor.map<DropdownMenuItem<String>>((String value2) {
    return DropdownMenuItem<String>(
      value: value2,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10,),
          Text(value2),
          SizedBox(width: 240), // Add a gap between the text and the icon
          //Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedappointment = newValue!;
      print(selectedappointment);
    if(selectedappointment == 'myself'){
     // print('imhere232');
    }
    });

  },
),)
              
               ),
                  Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 0),
                child: Text(
                      'Reason for Checkup',
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
           padding: const EdgeInsets.only(top: 20),
           child: Center(
             child: Container(
             height: 150,
             width: 380,
             decoration: BoxDecoration(
             color :Colors.white,
             borderRadius: BorderRadius.circular(10)
             
             ),
             child: RoundedTextField('Enter any additional comments',complaincontroller ),
             ),
           ),
         ),
         
         Padding(
           padding: const EdgeInsets.only(top: 10,bottom: 20),
           child: Center(
             child: Container(
              height: 60,
              width: 300,
              child:  ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: const Color(0xFF0E67B8),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(35.0),
                   ),
                 ),
                 onPressed: () {
                  var test;
                   complain = complaincontroller.text;
                   reason = complaincontroller.text;
                      print(selecteddateindices);
                      print(selectedtime);
                      if(selecteddateindices.isNotEmpty){
                        if(selectedtime != null){
                          print('you are good to go');
                          if(selectedappointment == 'Myself' || selectedappointment == 'SomeoneElse'){
                            if(complain.isNotEmpty){
                                   if(selectedappointment == 'Myself'){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>Payment(type,selectedDate,selectedtime,complain)),
  );                      }
                   else{
                     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>appointmentforsomeoneelse('appointments',selectedDate,selectedtime,3 )),
  );     
                   }
                 //apifunction().postDataToApi('2024-12-13','13:36:28.094Z',name,age,gender,complain);
                            }
                            else{
                                   final snackBar = SnackBar(
                backgroundColor: Color(0xFF800020), // Customize the background color
                content: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.white), // Warning icon
                    SizedBox(width: 8),
                    Text(
                      'Please Enter reasons for checkup',
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
                      'Please Choose Who you booking for',
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
                      'Please Choose Time',
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
                      'Please Select date first',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                 
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
            ),
       )
       

        ),


    )
    );
  }
}

class someoneelse extends StatelessWidget{

  
   @override
  Widget build(BuildContext context) {
  print('i am in someoneelses class');
  
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.green,
    );
  
  }
}


class RoundedTextField extends StatelessWidget {
  final String hintText;
  TextEditingController controller;

  // const RoundedTextField({Key? key, required this.hintText,this.icondata}) : super(key: key);

RoundedTextField(this.hintText,this.controller);
  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: null,
      // Set the keyboardType to TextInputType.multiline
      keyboardType: TextInputType.multiline,
      //maxLength: 10,
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

