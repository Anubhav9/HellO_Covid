import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),

                        ),
                        gradient: LinearGradient(

                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: [Color(0xff2193b0),Color(0xff6dd5ed)]
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,50,0,0),
                        child: Column(
                          children: [
                            Text("HELL'o CoViD",
                              style: TextStyle(fontFamily: 'Patua_One',color: Colors.white,fontSize: 30),),
                            Text('A Coronavirus Tracker App',
                              style: TextStyle(fontSize: 22,color: Colors.yellow[500],fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                Image.asset('thankyou.jpg'),
                Column(
                  children: [
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => data_one()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.red[400],
                        child: Center(child: Text('Get the current data',style: TextStyle(fontSize: 22,color: Colors.white),)),

                      ),
                    )

                  ],
                ),
                Column(
                  children: [
                    Text('Symptoms of CoViD 19',style: TextStyle(fontSize: 22,color: Colors.blue,fontFamily: 'rt'),)
                  ],

                ),
                Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset('cough.png',
                          height: 130,
                          width: 130,),
                          Image.asset('fever.jpg',
                          height: 130,
                          width: 130,),
                          Image.asset('bp.jpg',
                          height: 100,
                          width: 100,),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text('  Dry Cough      ',style: TextStyle(fontSize: 16,color: Colors.blue,fontFamily: 'rt'),),
                          Text('          Fever ',style: TextStyle(fontSize: 16,color: Colors.blue,fontFamily: 'rt'),),
                          Text('        Shortness of Breath',style: TextStyle(fontSize: 10,color: Colors.blue,fontFamily: 'rt'),),

                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Text('How to stay safe from this Deadly Disease',style: TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold,fontFamily: 'coda'),),
                    Row(
                      children: [
                        Image.asset('mask.jpg',
                        height: 130,
                        width: 130,),
                        Text('Wear face mask everytime',style: TextStyle(fontSize: 15,color: Colors.orange,fontFamily: 'coda'),)

                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('wh.jpg',
                        height: 130,
                        width: 130,),
                        Text(' Wash your hands frequently',style: TextStyle(fontSize: 15,color: Colors.orange,fontFamily: 'coda'),)
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('sd.jpg',
                        height: 130,
                        width: 130,),
                        Text('Maintain Social Distancing',style: TextStyle(fontSize: 15,color: Colors.orange,fontFamily: 'coda'),)
                      ],

                    )
                  ],

                )





            ]),




      ),
    );



  }
}
String country_name;
class data_one extends StatefulWidget {
  @override
  _data_oneState createState() => _data_oneState();
}
String country;
String cname;
String dname;
Future<Map> getDataCountry() async {
  String url = 'https://corona.lmao.ninja/v2/countries/$country';
  http.Response response = await http.get(url);
  return jsonDecode(response.body);
}
String country_n;
int cases;
int death;
int recovered;
int active;
int tpm;
int d_active;
int d_deceaded;
int d_cases;
int d_recovered;
class _data_oneState extends State<data_one> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  height: 1300,
                  color: Colors.blue[100],

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12,40,0,0),
                        child: Text('Get to know details of your Country',style: TextStyle(fontSize: 22,color: Colors.blue[700],fontFamily: 'ConcertOne'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,24,0,0),
                        child: Image.asset('stay.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12,50,12,0),
                        child: TextField(

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: 'Enter Country Name',
                            hintStyle: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),




                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22,color: Colors.blue[800],fontWeight: FontWeight.bold),
                          onChanged: (value)
                          {
                            country=value;
                          },



                        ),

                      ),
                      FlatButton(
                        color: Colors.blue[700],
                        textColor: Colors.white,
                        onPressed: () async
                        {
                          final response= await http.get('https://corona.lmao.ninja/v2/countries/$country');
                          Map data=jsonDecode(response.body);
                          country_n=data['country'];
                          cases=data['cases'];
                          active=data['active'];
                          recovered=data['recovered'];
                          death=data['deaths'];
                          tpm= data['testsPerOneMillion'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => data_one()),
                          );
                        }
                        ,
                        child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 22),),


                      ),
                      Text('Country: $country_n',style: TextStyle(fontSize: 22,color: Colors.purple,fontFamily: 'st'),),
                      Text('Cases: $cases',style: TextStyle(fontSize: 22,color: Colors.teal,fontFamily: 'st'),),
                      Text('Active: $active',style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: 'st'),),
                      Text('Recovered: $recovered',style: TextStyle(fontSize: 22,color: Colors.green,fontWeight: FontWeight.bold,fontFamily: 'st'),),
                      Text('Deaths: $death',style: TextStyle(fontSize: 22,color: Colors.red,fontWeight: FontWeight.bold,fontFamily: 'st'),),
                      Text('Tests Per One Million: $tpm',style: TextStyle(fontSize: 22,color: Colors.pinkAccent[200],fontFamily: 'st'),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,40,0,0),
                        child: Text('Get the data from your City',style: TextStyle(fontSize: 22,color: Colors.blue[700],fontFamily: 'st',fontWeight: FontWeight.bold),),
                      ),
                      Text('Works only for Indian Cities',style: TextStyle(fontSize: 22,color: Colors.blue[700],fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,12,0),
                        child: TextField(

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: 'Enter State Name',
                            hintStyle: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),

                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22,color: Colors.blue[800],fontWeight: FontWeight.bold),
                          onChanged: (value)
                          {
                            cname=value;
                          },

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12,10,12,0),
                        child: TextField(

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: 'Enter District Name',
                            hintStyle: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),

                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22,color: Colors.blue[800],fontWeight: FontWeight.bold),
                          onChanged: (value)
                          {
                            dname=value;
                          },

                        ),
                      ),

                      FlatButton(
                        color: Colors.blue[700],
                        textColor: Colors.white,
                        onPressed: () async
                        {
                          final response= await http.get('https://api.covid19india.org/state_district_wise.json');
                          Map data=jsonDecode(response.body);
                          d_cases=data['$cname']['districtData']['$dname']['confirmed'];
                          d_active=data['$cname']['districtData']['$dname']['active'];
                          d_deceaded=data['$cname']['districtData']['$dname']['deceased'];
                          d_recovered=data['$cname']['districtData']['$dname']['recovered'];

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => data_one()),
                          );
                        }
                        ,
                        child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 22),),


                      ),
                      Text('State: $cname',style: TextStyle(fontSize: 22,color: Colors.purple,fontFamily: 'st'),),
                      Text('District: $dname',style: TextStyle(fontSize: 22,color: Colors.purple,fontFamily: 'st'),),
                      Text('Cases: $d_cases',style: TextStyle(fontSize: 22,color: Colors.teal,fontWeight: FontWeight.bold,fontFamily: 'st'),),
                      Text('Active: $d_active',style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: 'st'),),
                      Text('Recovered: $d_recovered',style: TextStyle(fontSize: 22,color: Colors.green,fontWeight: FontWeight.bold,fontFamily: 'st'),),
                      Text('Deceased: $d_deceaded',style: TextStyle(fontSize: 22,color: Colors.red,fontWeight: FontWeight.bold,fontFamily: 'st'),),
                    ],



                  ),
                ),
              ],
            )

      ),
    );


  }
}








void main () async
{


  runApp(MaterialApp(
    home: homepage(),
  ));
}
