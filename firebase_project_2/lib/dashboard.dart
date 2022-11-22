
import 'dart:io';
//import 'dart:html';
import 'package:firebase_project_2/1/constants.dart';
import 'package:firebase_project_2/1/login_page.dart';
import 'package:firebase_project_2/1/portfolio.dart';
import 'package:firebase_project_2/1/profile_update.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';   
import "package:open_file/open_file.dart"; 
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

//import 'profile_update.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState'

    init=  FlutterDownloader.initialize();

    super.initState();

  }
var init;
  final mainReference = FirebaseDatabase.instance.reference().child('Database');
  var store= FirebaseStorage.instance;
  UploadTask? task;
  File? file;
   Future<Directory> appDocDir =  getApplicationDocumentsDirectory();
  File downloadfile =File("");
  String url1 = "";
  double h=0;
    int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: Drawer(
        child: Container(child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              CircleAvatar(
                radius: 70,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile_Update()));
                  },
                  child: CircleAvatar(
                    radius: 68,
                    backgroundImage: NetworkImage("https://i.forfun.com/jqt2oy13.jpeg"),
                    child: Text("Update Profile",style: TextStyle(decoration: TextDecoration.underline,shadows: [Shadow(color: Colors.white,blurRadius: 3.0)]),)
                  ),
                ),)
            ],),
          ),
          Container(width: MediaQuery.of(context).size.width,
            child: RaisedButton(onPressed: (){
              Prefernece.pref!.remove("mail");
              Prefernece.pref!.remove("pass");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            },
            child: Text("Logout"),
            ),
          )
        ],),),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("My Dashboard",),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.blueGrey,
              child: CircleAvatar(
                radius: 20.0,
                 backgroundImage: NetworkImage("https://i.forfun.com/jqt2oy13.jpeg"),
              ),
            ),
          ),
        ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Expanded(
               child: Stepper(
                 type: stepperType,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue:  continued,
                  onStepCancel: cancel,
                  steps: [
                    Step(
                      title: Text("Select & Upload"),
                      content: Column(
                        children: [
                          SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.elliptical(10, 20),bottomLeft: Radius.elliptical(10, 20))),
                  color: Colors.white,
                  onPressed: (){
                    selectFile();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.file_copy_outlined),
                      SizedBox(width: 20,),
                      Text("Select File"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.elliptical(10, 20),bottomLeft: Radius.elliptical(10, 20))),
                  color: Colors.white,
                  onPressed: (){
                     uploadFile();
                     setState(() {
                       h= 0.025;
                     });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file),
                      SizedBox(width: 20,),
                      Text("Upload File"),
                    ],
                  ),
                ),
              ),
              //SizedBox(height: 20,),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: MediaQuery.of(context).size.height*h,
                //color: Colors.white,
                child: task!= null? buildUploadStatus(task!): Container()),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: Text("Open & Dowload"),
                      content: Column(
                        children: [
                          SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: RaisedButton(onPressed: (){
                  OpenFile.open(file!.path);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.elliptical(10, 20),bottomLeft: Radius.elliptical(10, 20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.open_in_new),
                    SizedBox(width: 20,),
                    Text("Open File"),
                  ],),
                )
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.elliptical(10, 20),bottomLeft: Radius.elliptical(10, 20))),
                onPressed: ()async{
                    url1=await task!.snapshot.ref.getDownloadURL();
                    _launchURL();
                    
                  // print("url $downloadfile");
              
                  // try {
                  //  
                  
                  // } catch (e) {
                  //   print("exp $e");
                  // }
                  
                },
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.download),
                    SizedBox(width: 20,),
                    Text("Download File"),
                  ],
                ),
                ),
              ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(title: Text("Track & Sqlite"), content: Column(children: [
                      SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: RaisedButton(onPressed: (){
                setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Portfolio()));  
                });},
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.elliptical(10, 20),bottomLeft: Radius.elliptical(10, 20))),
                  child: Text("Track Order"),
                )
              ),
              SizedBox(height: 20,),
              RaisedButton(onPressed: (){
              setState(() {
                
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sqlite()));  
              });},
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.elliptical(10, 20),bottomLeft: Radius.elliptical(10, 20))),
                child: Text("Sqlite"),
              ),
             
          
                    ],),
                    isActive: _currentStep >= 0,
                      state: _currentStep >= 2 ?
                      StepState.complete : StepState.disabled,
                    )
                  ],
               ),
             ),
           ],
            
          ),
        ),
    );
  }
switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
        setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
        setState(() => _currentStep -= 1) : null;
  }
  void _launchURL() async {
  
  try{
    await launch(url1);
  }
catch(e){
  print("Exp $e");
}
  
  
}

  // Future downloadFile()async{
  //                try {
  //                   url1=await task!.snapshot.ref.getDownloadURL();
  //                   print(url1);
  //                   Directory dir = await getApplicationDocumentsDirectory();
                    
  //                   final taskId = await init.enqueue(
  //                     url: url1,
  //                     savedDir: '${dir.path}',
  //                     showNotification: true, // show download progress in status bar (for Android)
  //                     openFileFromNotification: true, // click on notification to open downloaded file (for Android)
  //                   );

  //                 } catch(e){
  //                   print("exp $e");
  //                 }
  // }
  
  Future selectFile()async {
    final result= await FilePicker.platform.pickFiles();
    if (result== null) return;
    print(result);
    final path =result.files.single.path;
    setState(() {
      file = File(path!);
    });
  }
  Future uploadFile() async{
   if (file == null) return;
   final destination ='files/${file!.path.toString().split("/").last}';
   task = FirebaseApi.uploadFile(destination,file!);
   setState(() { });
   if (task==null) return;
   final snapshot = await task!.whenComplete((){});
   final urlDownload = await snapshot.ref.getDownloadURL();
   
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot){
      if (snapshot.hasData) {
        final snap= snapshot.data!;
        final progress=snap.bytesTransferred/snap.totalBytes;
        final percentage = (progress*100).toStringAsFixed(0);
        return Text("$percentage %",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,));
      }else{
        return Container();
      }
    },
  );

  
  }
class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file){
    try {
    final ref = FirebaseStorage.instance.ref(destination);
    return ref.putFile(file);
    
     }on FirebaseException catch (e) {
       print("exp $e");
    }
  }
  static UploadTask? uploadBytes(String destination, Uint8List data){
    try {
    final ref = FirebaseStorage.instance.ref(destination);
    return ref.putData(data);
     }on FirebaseException catch (e) {
       print("exp $e");
    }
  }
  /*static Future<List<FirebaseFile>> listAll(String path) async{
    final ref= FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await _getDownloadLinks(result.items); 
    return urls
       .asMap()
       .map((index, url){
          final ref = result.items[index];
          final anme = ref.name;
          final file = FirebaseFile(ref: ref)
       })
       .values
       .toList();
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) {
    Future.wait(refs.map((ref)=> ref.getDownloadURL()).toList());
      

  }*/
}
