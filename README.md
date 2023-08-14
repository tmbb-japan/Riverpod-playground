# Theorem of riverpod:V2

This repository is for learning, using, and organizing additional features created by the `version 2` update of Riverpod.

<details>
  <summary>state-management</summary>
    I leave here a basic reference about state-management for myself in the future that I may have forgotten.  <br><br>
StateManagement refers to how to manage the data and UI status of the app.<br>
The flutter app consists of several UI elements and various elements such as user input and network requests. <br>
These elements require changing and updating the status of an app.<br><br>

**StateManagement here deals with how to efficiently track changes in data and reflect changes in the UI**.<br>

The following patterns and tools are typically used to make stateManagement more effective:

1. setState()
2. Provider
3. `riverpod`
4. GetX
5. BLoC<br>
etc...<br>

Among of these, the tool that we're dealing with in this repository is **riverpod**
</details><br>

Most of the features added to `V2` are intended to increase the convenience of code generation, and here are these **three** things.

1. CodeGeneration
2. Parameter Class
3. Consumer Widget

## 1. CodeGeneration
Riverpod determines which provider to choose so that `you don't have to worry about which provider to use during code generation.`<br>

<details>
  <summary>Here is the example : </summary>
  
`provider`
```
final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}
```
`screen`
```
class CodeGenerationScreen extends ConsumerWidget {
    const CodeGenerationScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final state1 = ref.watch(gStateProvider);
        return DefaultLayout(
            title: 'CodeGenerationScreen',
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    'State1 : $state1',
                    textAlign: TextAlign.center,
                ),
```
</details>