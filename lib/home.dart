import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _oneController = TextEditingController();
  final TextEditingController _twoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Enter First Number'),
                  keyboardType: TextInputType.number,
                  validator: (str) => str == null || str.isEmpty
                      ? 'ဖြည့်ရန်လိုအပ်ပါသည်။'
                      : null),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter Second Number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (str) => str == null || str.isEmpty
                      ? 'ဖြည့်ရန်လိုအပ်ပါသည်။'
                      : null),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  var validate = _formKey.currentState!.validate();
                  if(!validate) return;

                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  var validate = _formKey.currentState!.validate();
                  if(!validate) return;
                },
                child: const Text('Sub'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
