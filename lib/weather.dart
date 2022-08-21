import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_by_restapi/models/Weatherapi.dart';
import 'package:http/http.dart'as http;

class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  var data;
  Future<Weatherapi>updatewe()async {
    final response = await http.get(Uri.parse('	http://www.7timer.info/bin/api.pl?lon=113.17&lat=23.09&product=astro&output=json'));
     data=jsonDecode(response.body.toString());
     if(response.statusCode==200){

      return  Weatherapi.fromJson(data);


     }
     else{
      return Weatherapi.fromJson(data);
     }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text('weather update'),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder<Weatherapi>(
            future:updatewe(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.dataseries!.length,

                    itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      children: [
                        ReusbaleRow(title: 'Cloudcover', value: snapshot.data!.dataseries![index].cloudcover.toString()),
                      //  ReusbaleRow(title: 'liftedindex', value: snapshot.data!.dataseries![index].liftedIndex.toString()),
                     //   ReusbaleRow(title: 'seeing', value: snapshot.data!.dataseries![index].seeing.toString())





                      ],
                    ),
                  );
                });
              }
              else{
                return CircularProgressIndicator();
              }
            },
          ))
        ],
      ),
    );
  }
}
class ReusbaleRow extends StatelessWidget {
  String title , value ;
  ReusbaleRow({Key? key , required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value ),

        ],
      ),
    );
  }
}
