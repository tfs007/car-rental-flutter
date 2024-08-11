import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;
import 'package:flutter_lusso2/widget/From_datetime_picker_widget.dart';
import 'package:flutter_lusso2/widget/Until_datetime_picker_widget.dart';
import 'cardetail.dart';
import 'Car.dart';

class HomePagea extends StatefulWidget {
  @override
  _HomePageaState createState() => _HomePageaState();
}

class _HomePageaState extends State<HomePagea> {
  //################ Silver app bar
   double changingHeight;
   double appBarHeight;
   bool appBarSearchShow = false;
   final TextEditingController _filter = new TextEditingController();
  //#########

  final String url = "https://api.lusso.asia/api/v1/cars/";
  List data;

  //List<String> itemList = [];

  @override
  void initState(){ 
    super.initState();
    this.getJsonData();
  } 

Future<String> getJsonData() async{ 
    var response = await http.get( 
     //encode url 
     Uri.encodeFull(url), 
     //accept json response
     headers: {"Accept": "application/json"}
    ); 
    print(response.body); 
    setState(() {
      var convertDataToJson = jsonDecode(response.body); 
      data = convertDataToJson["data"];

    }); 
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    //#### Silver app bar
    appBarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
   
    //#####
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
       body:NestedScrollView(
       headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
       return <Widget> [createSilverAppBar()];
       },
       body: Container( 
         child: Stack (
         children: [ 
           Container(child:getBody()),
          //  SizedBox(height: 90,),
          //  Container(child:getCalender())
          ],
           ),
           ), 
           
    ),
    );
  }
  //########

  Widget getBody() {
    //var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [    
        // SizedBox(
        //   height: 40,
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Featured",
                  style:
                  //Theme.of(context).textTheme.headline5,
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black,)
                  ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
          child: Row(
           
          children: List.generate(data?.length ?? 0, (index) {
            int id = data[index]['id'];
            String brand = data[index]['brand'];
            String description = data[index]['description'];
            String carEngineSize = data[index]['car_engine_size'];
            int price = data[index]['price'];
            String availablity = data[index]['availablity'];
            String imageUrl = 'https://api.lusso.asia' + data[index] ['image_main'];
            Car _car = Car(id, brand, description,carEngineSize,imageUrl,price,availablity);
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child:Card(
                color: Colors.black,
                child: InkWell( 
                      onTap: (){ 

                                Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MainCarDetail(_car),

                                ), 
                              );
                      },
                child:Padding(
                  padding: const EdgeInsets.only(left: 0),
                child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                   // padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(100)
                    ),
                    //child: Icon(MyFlutterApp.star1,color: Colors.pinkAccent),
                    child: Icon(Icons.star,color: Colors.deepPurpleAccent),
                    
                    ),),
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage('https://api.lusso.asia' + data[index] ['image_main']),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 140,
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                      child:Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]['brand'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17,
                              height: 1.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "RM" + data[index]['price'].toString(),
                          style: Theme.of(context).textTheme.headline5,
                          
                          // TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.grey,
                          //     height: 1.5),
                        ),
                        SizedBox(
                    height: 3,
                  ),
                      ],
                    ),),
                    
                  )
                  
                ],
              ),),),),
            );
          })),),),
        
        SizedBox(
          height: 40,
        ),
        Card(
                  elevation: 20,
                  child:Column( 
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 

                    Container(
                      child:Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Where', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18.0,
                              height: 1.5),),
                      CupertinoTextField(
                                
                                keyboardType: TextInputType.text,
                                placeholder: 'State or City',
                                placeholderStyle: TextStyle(
                                color: Color(0xffC4C6CC),
                                fontSize: 14.0,
                                fontFamily: 'Brutal',
                                ),
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey[200],
                                ),
                                ),
                      ],),),
                    ),  

                    Container(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        FromDatetimePickerWidget(),
                       //const SizedBox(height: 24),
                       ],
                      ),
                     ),
                     SizedBox(
                          height: 20,
                    ),
                     Container(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        UntilDatetimePickerWidget(),
                       //const SizedBox(height: 24),
                       ],
                      ),
                     ),
                     ConstrainedBox(
                     constraints: BoxConstraints.tightFor(width: 1000),
                     child:Padding(
                       padding: EdgeInsets.fromLTRB(0,2,0,2),
                     child:ElevatedButton(
                        onPressed: () {},
                        style: 
                        ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        ),primary: Colors.black,),
                        child: Text('Search for Cars'),

                      ),),),
      ],
      ),
      ),
      
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
          child: Column(
           
          children: List.generate(data?.length ?? 0, (index) {
            int id = data[index]['id'];
            String brand = data[index]['brand'];
            String description = data[index]['description'];
            String carEngineSize = data[index]['car_engine_size'];
            int price = data[index]['price'];
            String availablity = data[index]['availablity'];
            String imageUrl = 'https://api.lusso.asia' + data[index] ['image_main'];
            Car _car = Car(id, brand, description,carEngineSize,imageUrl,price,availablity);
            return Padding(
              padding: const EdgeInsets.only(left:4, right: 0),
              child:Card(
                color: Colors.black,
                child: InkWell( 
                      onTap: (){ 

                                Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MainCarDetail(_car),

                                ), 
                              );
                      },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 340,
                    height: 200,
                    
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage('https://api.lusso.asia' + data[index] ['image_main']),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 140,
                    child:Padding(padding:const EdgeInsets.only(left: 16.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]['brand'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                              height: 1.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data[index]['category'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Text(
                        //   data[index]['availablity'].toString(),
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.grey,
                        //       height: 1.5),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                        children: [
                          Text(data[index]['price'].toString(),
                          style: Theme.of(context).textTheme.headline5,
                          // style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.grey,
                          //     height: 1.5),
                        ),
                        Text(' MYR /per day', style: Theme.of(context).textTheme.headline5,
                        
                        // TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.grey,
                        //       height: 1.5),
                        ),

                        ],),
                        SizedBox(
                          height: 20,
                        ),
                        
                      ],
                    ),),
                    
                  ),
                  // Padding(
                  //         padding:const EdgeInsets.only(left: 200, bottom: 20,),
                  //       child:Row(
                  //       children: [
                  //         Text(data[index]['price'].toString(),
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.grey,
                  //             height: 1.5),
                  //       ),
                  //       Text(' MYR /per day', style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.grey,
                  //             height: 1.5),),
                  //       ],),),
                          
                ],
              ),
              ),
              ),
            );
          })),),)
      // ConstrainedBox(
      //                constraints: BoxConstraints(maxWidth: 240),
      // child:Container(
      //               width: 20,
      //               height: 40,
      //                   child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                   CarPage(),
      //                  //const SizedBox(height: 24),
      //                  ],
      //                 ),
      //                ),),

      ],
      );
  }


//######## Silverappbar
SliverAppBar createSilverAppBar() {
return SliverAppBar(
backgroundColor: Colors.white,
expandedHeight: 250,
floating: false,
pinned: true,
flexibleSpace: LayoutBuilder(
builder: (BuildContext context, BoxConstraints constraints) {
if (constraints.biggest.height == appBarHeight) {
appBarSearchShow = true;
} else {
appBarSearchShow = false;
}
return FlexibleSpaceBar(
collapseMode: CollapseMode.parallax,
titlePadding: EdgeInsets.only(bottom: 10),
centerTitle: true,
title: constraints.biggest.height != appBarHeight
? Container(
//margin: EdgeInsets.symmetric(horizontal: 10),
constraints: BoxConstraints(minHeight: 30, maxHeight: 30),
width: 220,
decoration: BoxDecoration(
boxShadow: <BoxShadow> [
BoxShadow(
color: Colors.grey.withOpacity(0.6),
offset: const Offset(1.1, 1.1),
blurRadius: 5.0),
],
),
child: CupertinoTextField(
controller: _filter,
keyboardType: TextInputType.text,
placeholder: 'Search',
placeholderStyle: TextStyle(
color: Color(0xffC4C6CC),
fontSize: 14.0,
fontFamily: 'Brutal',
),
prefix: Padding(
padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
child: Icon(
Icons.search,
size: 18,
),
),
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8.0),
color: Colors.white,
),
),
)
: Container(),
background: Container(
//height: constraints.maxHeight - 15,
color: Colors.white,
margin: EdgeInsets.only(bottom: 30),
child: Image(image:AssetImage('assets/images/LussoBanner.jpeg'),fit: BoxFit.cover),
),
);
}),
);
}
}