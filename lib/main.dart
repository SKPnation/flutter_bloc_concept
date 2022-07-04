import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/counter_cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(

      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state){
                if(state.counterValue < 0){
                  return Text(
                    "NEGETIVE: ${state.counterValue}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                }
                else if(state.counterValue % 2 == 0){
                  return Text(
                    "YAAY!! ${state.counterValue}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                }
                else{
                  return Text(
                    state.counterValue.toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                }
              },
              listener:  (context, state){
                if(state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Incremented"),
                        duration: Duration(milliseconds: 300),
                      )
                  );
                }
                else if(state.wasIncremented == false){
                  Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Decremented"),
                        duration: Duration(milliseconds: 300),
                      )
                  );
                }
              },
            ),

            FloatingActionButton(
              onPressed: (){
                BlocProvider.of<CounterCubit>(context).increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),


            FloatingActionButton(
              onPressed: (){
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
