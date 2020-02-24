import 'package:flutter/material.dart';
import 'wp-api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fests.info Demo'),),
      body: Container(
        child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];
                  var imageurl = wppost['jetpack_featured_media_url'];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:0,right: 0, top: 5, bottom: 10),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/loading.gif',
                              image: imageurl,
                            ),
                          ),
                          Text(
                            wppost['title']['rendered'],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent
                            )
                          )
                        ],
                    )
                  )
                  );
                }
              );
            }
            return CircularProgressIndicator();
          },
        )
      ),
    );
  }
}