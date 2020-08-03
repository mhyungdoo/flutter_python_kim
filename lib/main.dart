import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '버튼',
    home: Scaffold(
      appBar: AppBar(
        title: Text('버튼'),
      ),
      body: MyButton(),
    ),
  ));
}

class MyButton extends StatefulWidget {
  @override
  State createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  var backColor = Colors.black;
  var count = 0;
  String sipro_selected = 'assets/sipro_logo.PNG';
  String stard_selected = 'assets/stard_logo.PNG';
  String selected = 'assets/issuecon.jpg';
  String inputs ='';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text('버튼 색깔 변경'),
              onPressed: () {
                // 에러는 아니지만, 배경색을 바꿀 수 없음
                // backColor = Colors.lightBlue;

                setState(() {
                  backColor = (backColor == Colors.black)
                      ? Colors.lightBlue
                      : Colors.black;
                });
              },
              textColor: Colors.white,
              color: backColor,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '$count',
                style: TextStyle(fontSize: 60),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('더하기'),
                  onPressed: () {
                    count++;
                    setState(() {
                      Text('$count');
                    });
                  },
                  textColor: Colors.white,
                  color: backColor,
                ),
                RaisedButton(
                  child: Text('빼기'),
                  onPressed: () {
                    count--;
                    setState(() {
                      Text('$count');
                    });
                  },
                  textColor: Colors.white,
                  color: backColor,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('Sipro'),
                  onPressed: () {
                    selected = sipro_selected;
                    setState(() {});
                  },
                ),
                RaisedButton(
                  child: Text('Stard'),
                  onPressed: () {
                    selected = stard_selected;
                    setState(() {});
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 85,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(selected),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/issuecon.jpg',
                  fit: BoxFit.fitWidth,
                  height: 100,
                ),
                Image.asset(
                  'assets/sipro_logo.PNG',
                  fit: BoxFit.fitWidth,
                  height: 100,
                ),
                Image.asset(
                  'assets/stard_logo.PNG',
                  fit: BoxFit.fitWidth,
                  height: 100,
                ),
              ],
            ),

            FlatButton(
              child: Text('FlatButton', style: TextStyle(fontSize: 24)),
              onPressed: () {},
              color: Colors.green,
              textColor: Colors.white,
            ),

            IconButton(
              icon: Icon(Icons.print),
              onPressed: (){},
            ),

            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){},
            ),

            // InkWell은 버튼을 누를 때 잉크가 번지는 듯한 애니메이션 효과가 있는 버튼임.
            InkWell(
              child: Text('InkWell', style: TextStyle(fontSize: 60),),
              onTap: (){},
            ),

            Container(
              child: TextField(
                style: TextStyle(fontSize: 20, color: Colors.red),
                maxLength: 300,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '입력해주세요'),
                onChanged: (String str){
                  setState(() {
                    inputs = str;
                  });
                },
                cursorWidth: 10,
              ),
              width: 300,  //TextField Size는 Container로 감싸서 설정
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                inputs,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),

//화면이동, 플러터에서는 화면을 route라고 부릅니다.
            RaisedButton(
              child: Text('Go to Second Route',
              style: TextStyle(fontSize: 20),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,
//                    MaterialPageRoute<void>(builder: (BuildContext context){
//                      return Second();
                    MaterialPageRoute(builder: (context) => Second()),  // 위 코드보다 단순해짐
                );
                },
              ),

    //세번째 페이지로 이동
            RaisedButton(
              child: Text('Go to Third Route',
                style: TextStyle(fontSize: 20),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,
//                    MaterialPageRoute<void>(builder: (BuildContext context){
//                      return Second();
                  MaterialPageRoute(builder: (context) => Third()),  // Third 라우트로 이동
                );
              },
            ),


             ],
            ),
        ),
      );
  }
}



// 두 번째 Route는 화면 이동과 상단 탭바 한 페이지에 구현
class Second extends StatelessWidget {
  final choices = ['STARD','SIPRO','FUN.D','Issuecon','Reliab'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
           title: Text('Second Route'),
           bottom: TabBar(        //앱바 하단에 탭바를 추가, title 부분에 탭바를 넣는 것도 가능
             tabs: choices.map((String choice){
               return Tab(text: choice);
             }).toList(),
             isScrollable: true,  //항목이 많을 경우 횡스크롤
           ),),

        body: TabBarView(
            children: choices.map((String choice){
          return Center(
           child: RaisedButton(
                child: Text('Go to First Route', style: TextStyle(fontSize: 20)),
                color: Colors.green,
                onPressed: (){
                Navigator.pop(context);
                  },
              ),
             );
         }).toList(),
      )
      ),
    );
  }
}


// 세번째 라우트는 ListView에 관한 내용입니다.

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Route'),
      ),


      body: ListView(
        children: <Widget>[
          ListTile(                           // 2. 리스트 항목 추가하면 끝!
            leading: Icon(Icons.map),
            title: Text('지도'),
            onTap: () => _showDialog(context, '지도'),
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('사진'),
            onTap: () => _showDialog(context, '사진'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('전화'),
            enabled: false,                             // 비활성
            onTap: () => _showDialog(context, '전화'),
          ),

        ],
        ),
      );

  }
}

// API에 있는 showDialog 함수와 이름이 같아서 밑줄(_) 접두사(private 함수)
void _showDialog(BuildContext context, String text) {
  // 경고창을 보여주는 가장 흔한 방법.
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('선택 완료!'),
          content: Text('$text 항목을 선택했습니다.'),
          // 주석으로 막아놓은 actions 매개변수도 확인해 볼 것.
          // actions: <Widget>[
          //     FlatButton(child: Text('확인'), onPressed: () => Navigator.pop(context)),
          // ],
        );
      }
  );
}


