import 'package:bloc_example/calculate_bloc.dart';
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
  final CalculateBloc _calculateBloc = CalculateBloc();

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
                  controller: _oneController,
                  decoration:
                      const InputDecoration(labelText: 'Enter First Number'),
                  keyboardType: TextInputType.number,
                  validator: (str) => str == null || str.isEmpty
                      ? 'ဖြည့်ရန်လိုအပ်ပါသည်။'
                      : null),
              TextFormField(
                  controller: _twoController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Second Number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (str) => str == null || str.isEmpty
                      ? 'ဖြည့်ရန်လိုအပ်ပါသည်။'
                      : null),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  var validate = _formKey.currentState!.validate();
                  if (!validate) return;
                  int numOne = int.parse(_oneController.text);
                  int numTwo = int.parse(_twoController.text);

                  _calculateBloc.add(numOne, numTwo);
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  var validate = _formKey.currentState!.validate();
                  if (!validate) return;
                  int numOne = int.parse(_oneController.text);
                  int numTwo = int.parse(_twoController.text);

                  _calculateBloc.sub(numOne, numTwo);
                },
                child: const Text('Sub'),
              ),
              StreamBuilder<int>(
                  stream: _calculateBloc.getCalculateStream(),
                  initialData: 0,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                            fontSize: 30, color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return const Text(
                        '0',
                        style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      );
                    }
                  }),
              StreamBuilder<String>(
                  stream: _calculateBloc.getMethodStream(),
                  initialData: '',
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.green),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return const Text(
                        '',
                        style: TextStyle(fontSize: 30, color: Colors.green),
                        textAlign: TextAlign.center,
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calculateBloc.dispose();
    super.dispose();
  }
}
