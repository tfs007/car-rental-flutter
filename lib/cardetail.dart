import 'package:flutter/material.dart';
import 'Car.dart';
import 'Sign_up.dart';




class MainCarDetail extends StatelessWidget {
 // final int myNumber;
  //final String myName;
  final Car _car;
  MainCarDetail(this._car);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int id = _car.id;
    String brand = _car.brand;  
    String imageUrl = _car.imageUrl;
    String carEngineSize = _car.carEngineSize;
    int price = _car.price;
    String desc = _car.description;
    String availablity = _car.availablity;

    return Scaffold(

   body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
             // mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 200.0,
                  //color: Colors.grey[200],
                  decoration: BoxDecoration(
    //color: const Color(0xff7c94b6),
                  image:  DecorationImage(
                  image: NetworkImage('$imageUrl'),
                  fit: BoxFit.cover,
    ),
    
  ),
                ),
                Container( 
                  padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text('$brand',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black54,),
                        ),
                ],
              ),
              
            ), 
            Divider(color: Colors.black, thickness: 3,indent: 12,endIndent:97),
            Container(
             // margin: EdgeInsets.all(11.0),
              padding: EdgeInsets.fromLTRB(15,20,10,0.0),
              child: Row(
                children: [
                  Text('Rental Price :' + '$price',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,),),
                ],
              ),
            ),
            Container(
             // margin: EdgeInsets.all(11.0),
              padding: EdgeInsets.fromLTRB(15,20,10,2),
              child: Row(
                children: [
                  Text('Engine Cap :' + '$carEngineSize',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,),),
                ],
              ),
            ), 
            Container(
             // margin: EdgeInsets.all(11.0),
              padding: EdgeInsets.fromLTRB(15,20,10,20),
              child: Row(
                children: [
                  Text('Status : ' + '$availablity',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,),),
                ],
              ),
            ), 
            Container(
             // margin: EdgeInsets.all(11.0),
              padding: EdgeInsets.fromLTRB(15,20,10,20),
              child: Row(
                children: [
                  Text('ACCESSORIES',
                  
                  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        
                         fontSize: 20,
                        color: Colors.black54,),
                        maxLines:4,
                        ),
                ],
              ),
            ), 
            Container(
             // margin: EdgeInsets.all(11.0),
              padding: EdgeInsets.fromLTRB(15,0,10,20),
              child: Row(
                children: [
                  Expanded(child: Text('$desc',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                        fontWeight: FontWeight.bold,
                         fontSize: 14,
                        color: Colors.black54,),
                        maxLines: 10, 
                        overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ],
              ),
            ), 
            ConstrainedBox(
                     constraints: BoxConstraints.tightFor(width: 1000),
                     child:Padding(
                       padding: EdgeInsets.fromLTRB(35,2,35,2),
                     child:ElevatedButton(
                        onPressed: () { 
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginSignupScreen(),
                                 ), );
                        },
                        style: 
                        ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        ),primary: Colors.black,),
                        child: Text('Book'),

                      ),),),
            
           
              ] 
                  
          ),
                      
        ),
   ),

    );


  }
}
