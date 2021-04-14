import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Video Player "),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          SizedBox(height: 15,),
          Card(
            child: Padding(padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Mindfulness Meditation', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                    color: Colors.teal),),
                SizedBox(
                  height: 20,
                ),
                Text('Can help relieve stress, treat heart disease, lower blood pressure,'
                    ' reduce chronic pain, improve sleep, and alleviate gastrointestinal difficulties',
                    style: TextStyle(fontWeight: FontWeight.w500,color: Colors.teal[300])
                ),
                SizedBox(
                  height: 15,
                ),
                Videos(videoPlayerController: VideoPlayerController.asset("videos/mindfulness.mp4"),
                  looping: true,
                )

              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}
class Videos extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  final bool looping;

   Videos({Key key, @required this.videoPlayerController, this.looping}) : super(key: key);
  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<Videos> {
  ChewieController _chewieController;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _chewieController=ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context,errorMessage){
        return Center(
          child: Text(errorMessage,style: TextStyle(
            color: Colors.black
          ),),
        );
      }
    );


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8.0),
    child: Chewie(
      controller: _chewieController,
    ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}


