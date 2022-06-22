// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<http.Response> _responseFuture;

  @override
  void initState() {
    super.initState();
    _responseFuture = http.get(Uri.parse(
        'https://testapi.devaseva.com/api/campaigns/getFeaturedCampaigns/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Campaigns",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins"),
        ),
      ),
      body: FutureBuilder(
        future: _responseFuture,
        builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
          if (!response.hasData) {
            return const Center(
              child: Text(
                'Loading.....',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins"),
              ),
            );
            // return Center(child: CircularProgressIndicator(color: Colors.deepOrange,));
          } else if (response.data!.statusCode != 200) {
            return const Center(
              child: Text('Error loading data'),
            );
          } else {
            List<dynamic> json = jsonDecode(response.data!.body);
            return MyExpansionTileList(json);
          }
        },
      ),
    );
  }
}

class MyExpansionTileList extends StatelessWidget {
  final List<dynamic> elementList;

  const MyExpansionTileList(this.elementList, {Key? key}) : super(key: key);

  List<Widget> _getChildren() {
    List<Widget> children = [];
    elementList.forEach((element) {
      children.add(
        MyExpansionTile(element['id'], element['name']),
      );
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getChildren(),
    );
  }
}

class MyExpansionTile extends StatefulWidget {
  final int did;
  final String name;
  const MyExpansionTile(this.did, this.name);
  @override
  State createState() => MyExpansionTileState();
}

class MyExpansionTileState extends State<MyExpansionTile> {
  late PageStorageKey _key;
  late Future<http.Response> _responseFuture;

  @override
  void initState() {
    super.initState();
    _responseFuture = http.get(Uri.parse(
        'https://testapi.devaseva.com/api/campaigns/GetAllSevas/${widget.did}'));
  }

  @override
  Widget build(BuildContext context) {
    _key = PageStorageKey('${widget.did}');
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100, blurRadius: 36.0, spreadRadius: 2),
          ]),
      margin: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 2.0,
        top: 14.0,
      ),
      child: ExpansionTile(
        leading: const Icon(
          Icons.temple_buddhist,
          color: Colors.deepOrange,
          size: 25,
        ),
        key: _key,
        title: Text(
          widget.name,
          style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        children: <Widget>[
          FutureBuilder(
            future: _responseFuture,
            builder:
                (BuildContext context, AsyncSnapshot<http.Response> response) {
              if (!response.hasData) {
                return const Center(
                  child: Text('Loading...'),
                );
              } else if (response.data!.statusCode != 200) {
                return const Center(
                  child: Text('Error loading data'),
                );
              } else {
                List<dynamic> json = jsonDecode(response.data!.body);
                List<Widget> sevasList = [];
                json.forEach((element) {
                  print(element.toString());

                  sevasList.add(Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.people_rounded,
                            color: Colors.green,
                            size: 20,
                          ),
                          title: Text(
                            "${element['name']}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                      // Divider()
                    ],
                  ));
                });
                return sevasList.isEmpty
                    ? ListTile(
                        leading: Icon(
                          Icons.info_outline_rounded,
                          color: Colors.red[900],
                          size: 20,
                        ),
                        dense: true,
                        title: Text(
                          "No Sevas found",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: "Poppins"),
                        ),
                      )
                    : Column(children: sevasList);
              }
            },
          )
        ],
      ),
    );
  }
}
