part of 'pages.dart';

class Sendmail extends StatefulWidget {
  const Sendmail({ Key? key }) : super(key: key);

  @override
  _SendmailState createState() => _SendmailState();
}

class _SendmailState extends State<Sendmail> {

  @override
  void initState() {
    super.initState();
  }

  final ctrlEmail = TextEditingController();
  final _emailKey = GlobalKey<FormState>();

  @override
  void dispose(){
    super.dispose();
    ctrlEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Email Verification"),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                
                padding: EdgeInsets.all(8),
                child: Form(
                  key: _emailKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          labelText: "Email Address",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                        ),
                        controller: ctrlEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: ((value) {
                          return !EmailValidator.validate(value.toString()) ? 'You must input a valid email!' : null;
                        }),
                      )
                    ]),
                ),
              ),
              const Text(
                'Push the button to send the email!',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() async {
            if(_emailKey.currentState!.validate()){
            await Cirestsmtpservices.sendMail(ctrlEmail.text).then((value) {
              var result = json.decode(value.body);
              print(result);
              Fluttertoast.showToast(msg: (result['message'] == null ? result['error'] : result['message']), toastLength: Toast.LENGTH_SHORT, backgroundColor: (result['message'] == null ? Colors.red : Colors.green), textColor: Colors.white, fontSize: 14.0);
            });
            } else {
              Fluttertoast.showToast(msg: "Invalid email addresses or empty fields must be filled!", toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 14.0);
            }
          }),
          tooltip: 'Increment',
          child: const Icon(Icons.outgoing_mail),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}