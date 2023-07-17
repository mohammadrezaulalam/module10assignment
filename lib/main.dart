import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Orientation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrientationLayout(),
    );
  }
}

class OrientationLayout extends StatelessWidget {

  var myItems = [
    {"img":"https://cdn.pixabay.com/photo/2018/01/07/15/25/sunset-3067567_640.jpg",},
    {"img":"https://cdn.pixabay.com/photo/2018/01/07/15/25/sunset-3067567_640.jpg",},
    {"img":"https://cdn.pixabay.com/photo/2018/01/07/15/25/sunset-3067567_640.jpg",},
    {"img":"https://cdn.pixabay.com/photo/2018/01/07/15/25/sunset-3067567_640.jpg",},
    {"img":"https://cdn.pixabay.com/photo/2018/01/07/15/25/sunset-3067567_640.jpg",},
    {"img":"https://cdn.pixabay.com/photo/2018/01/07/15/25/sunset-3067567_640.jpg",},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return buildPortraitLayout(constraints);
              } else {
                return buildLandscapeLayout(constraints);
              }
            },
          );
        },
      ),
    );
  }

  Widget buildPortraitLayout(BoxConstraints constraints) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.5,
              width: double.infinity,
              //color: Colors.blue,
              child: const SizedBox(
                height: 300,
                width: 300,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://watermark.lovepik.com/photo/20211121/large/lovepik-camera-picture_500584614.jpg',),
                  backgroundColor: Colors.white,
              ),
              ),
            ),

              const SizedBox(height: 15,),
              const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, incididunt amet consectetur adipiscing elit, sed do sit amet eiusmod tempor incididunt ut labore et dolore.',
                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                    ),
                    itemCount: myItems.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: double.infinity,
                          height: 300,
                          child: Image.network(myItems[index]['img']!, fit: BoxFit.fill,),
                        ),
                      );
                    }
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildLandscapeLayout(BoxConstraints constraints) {
    return Row(
      children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: SizedBox(
              height: 300,
              width: constraints.maxWidth * 0.4,
              child: const SizedBox(
              height: 300,
              width: 300,
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://watermark.lovepik.com/photo/20211121/large/lovepik-camera-picture_500584614.jpg',),
                backgroundColor: Colors.white,
              ),
            ),
            ),
          ),

          SingleChildScrollView(
            child: SizedBox(
              width: constraints.maxWidth * 0.6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10,),
                  const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29, vertical: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                      style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),

                  SizedBox(
                    width: 400,
                    height: 300,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: myItems.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: 400,
                              height: 300,
                              child: Image.network(myItems[index]['img']!, fit: BoxFit.fill,),
                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
