

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';


import 'package:path_provider/path_provider.dart';


class RecordingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: MyTheme.white,
      appBar: AppBar(
        elevation:0,
        backgroundColor: MyTheme.primaryColor,
        automaticallyImplyLeading: false,
       
        title:Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: MyTheme.secondryColor,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),

            Text("RECORDINGS", style: TextStyle(
              color: MyTheme.secondryColor,
            ),),
          ],

        )
      ),
      
      body: RecordingsForm(),
      
    );
  }
}


class RecordingsForm extends StatefulWidget {
  
  @override
  _RecordingsFormState createState() => _RecordingsFormState();
}

class _RecordingsFormState extends State<RecordingsForm> {
   AudioPlayer advancedPlayer = AudioPlayer();
 
    AudioCache audioCache = AudioCache();
  List<Record> recordinds = [
    Record(
      audioAsset: "assets/audios/country.mp3",
      title: "URGENT ALERT",
      duration: "4:30",
      addedTime: "2 hours",
      isPlaying: false
    ),
    Record(
      audioAsset: "assets/audios/country2.mp3",
      title: "URGENT ALERT",
      duration: "4:30",
      addedTime: "4 hours",
      isPlaying: false
    ),
    Record(
      audioAsset: "assets/audios/electronic.mp3",
      title: "URGENT ALERT",
      duration: "4:30",
      addedTime: "6 hours",
      isPlaying: false
    ),
    Record(
      audioAsset: "assets/audios/hiphop.mp3",
      title: "URGENT ALERT",
      duration: "4:30",
      addedTime: "10 hours",
      isPlaying: false
    ),
    Record(
       audioAsset: "assets/audios/horn.mp3",
      title: "URGENT ALERT",
      duration: "4:30",
      addedTime: "16 hours",
      isPlaying: false
    ),
     Record(
        audioAsset: "assets/audios/instrumental.mp3",
      title: "URGENT ALERT",
      duration: "4:30",
      addedTime: "18 hours",
      isPlaying: false
    ),
    Record(
      audioAsset: "assets/audios/pop.mp3",
      title: "URGENT ALERT",
      duration: "4:30",
      addedTime: "1 day",
      isPlaying: false
    ),

  ];
  int myIndex=0;

  @override
    void dispose() {
    
      super.dispose();
      advancedPlayer.stop();
     
    }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //  padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: recordinds.length,
        itemBuilder: (context, index){
          return ListTile(
            trailing:recordinds[index].isPlaying
              ?Image.asset("assets/icons/playing.png",
                  height: 20,width: 20,
                )
              :PopupMenuButton(
                
               elevation: 3,
                child: Image.asset("assets/icons/verticle_menu.png",
                  height: 20,width: 20,),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(
                    height: 10,
                    
                      child: Row(children: [
                        Text("DELETE", style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width:4),
                        Image.asset("assets/icons/delete.png",
                          height: 13,width: 13,
                        ),
                          

                      ],)
                  )    
                ],
                onSelected: (val){
                  
                }
              ),
             
            contentPadding: const EdgeInsets.only(top:10, left: 10, right: 10),
            leading:  InkWell(
              onTap: (){
                setState(() {
                 
                  recordinds[index].isPlaying = !recordinds[index].isPlaying;
                  //  _audioPlaying(recordinds[index].audioAsset);
                  
                  //  recordinds[myIndex].isPlaying = false;
                  //   myIndex = index;
                  //   recordinds[index].isPlaying = !recordinds[index].isPlaying;
                });
                if(recordinds[index].isPlaying){
                  _audioPlaying(recordinds[index].audioAsset);
                  

                }else{
                  advancedPlayer.stop();
                  // advancedPlayer.play(recordinds[index].audioAsset, isLocal: true);
                  //  audioCache.play(recordinds[index].audioAsset);
                  
                }
              },
              child: Image.asset("assets/icons/record.png", height: 60, width: 60,)),
              title:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(recordinds[index].title, style: TextStyle(
                color: MyTheme.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height:2),
              Text("Duration ${recordinds[index].duration} min",
                style: TextStyle(
                  fontSize: 11, 
                  color: MyTheme.black,  
                  fontWeight: FontWeight.bold),
              ),
              SizedBox(height:2),
              Text("${recordinds[index].addedTime} ago",
                style: TextStyle(
                  fontSize: 11, 
                  color: MyTheme.grey,  
                  fontWeight: FontWeight.bold),
              ),
           

                ],
              )
           
          );
        })
    );
  }
  _audioPlaying(String audioAsset)async{
    
    final ByteData data = await rootBundle.load(audioAsset);
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/demo.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
   var mp3Uri = tempFile.uri.toString();
     if (mp3Uri != null) {
      advancedPlayer.play(mp3Uri, isLocal: true);
    }
    print('finished loading, uri=$mp3Uri');
  
  }
}




class AudioPlaying extends StatefulWidget {
  final String audioAsset;
  const AudioPlaying({Key key, this.audioAsset}) : super(key: key);

  @override
  _AudioPlayingState createState() => _AudioPlayingState();
}

class _AudioPlayingState extends State<AudioPlaying> {
  AudioPlayer audioPlugin = AudioPlayer();
  String mp3Uri;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<Null> _load() async {
    final ByteData data = await rootBundle.load(widget.audioAsset);
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/demo.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
    
    print('finished loading, uri=$mp3Uri');
  }

  void _playSound() {
    if (mp3Uri != null) {
      audioPlugin.play(mp3Uri, isLocal: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player Demo Home Page'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: _playSound,
        tooltip: 'Play',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}


class Record{
  String audioAsset;
  String title;
  String duration;
  String addedTime;
  bool isPlaying;
  Record({this.audioAsset,this.title, this.duration, this.addedTime, this.isPlaying});

}