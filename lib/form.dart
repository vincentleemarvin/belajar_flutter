import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    home: BelajarForm(),
  ));
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  double nilaiSlider = 85;
  bool checkBoy = false;
  bool switchBoy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(
                    hintText: "Masukan Nama Lengkap Anda",
                    labelText: "Nama Lengkap",
                    icon: Icon(Icons.people)),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: new InputDecoration(
                  hintText: "Masukan Password Anda",
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Masukan Telepon Anda",
                  labelText: "Telepon",
                ),
              ),
              CheckboxListTile(
                title: Text('Belajar Dasar Flutter'),
                subtitle: Text('Dart, widget, http'),
                value: checkBoy,
                activeColor: Colors.deepPurpleAccent,
                onChanged: (value) {
                  setState(() {
                    checkBoy = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Backend Programming'),
                subtitle: Text('Dart, Nodejs, PHP, Java, dll'),
                value: switchBoy,
                activeTrackColor: Colors.pink[100],
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    switchBoy = value;
                  });
                },
              ),
              Slider(
                value: nilaiSlider,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    nilaiSlider = value;
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellowAccent, // background
                  onPrimary: Colors.green, // foreground
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
              // tambahkan komponen seperti input field disini
            ],
          ),
        ),
      ),
    );
  }
}
