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
If you simply write the provider with Riverpod annotation, and write it like a function, then automatically g.dart file will be created like a below<br><br>

`g.dart`

```
final gStateProvider = AutoDisposeProvider<String>(
  gState,
  name: r'gStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gStateHash,
);
```
Surprisingly, we could see that the provider created is available on the screen in the example above. what a surprise!<br>
Also, if you want to use another provider, such as a future provider or state notifier, can use it by writing down the corresponding elements.
<details>
<summary>
futureProvider
</summary>

```
@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}
```
</details>
<details>
<summary>
stateNotifier
</summary>

```
class GStateNotifier extends _$GStateNotifier {
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
```
</details><br>

`Note` that the default value of automatically generated provider is `AutoDispose`, so if you want to keep it even if the screen is moved, you can write down `KeepAlive` as shown in the example.
<details>
<summary>
example
</summary>

```
@Riverpod(
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}
```
</details>

## 2. Parameter Class
Previously, additional data was available through the Family Modifier (multiple data must be added as a list or map). <br>
You can now use multiple data with Parameter Class inserting it into a family modifier
<details>
<summary>
here is the example:
</summary>

`provider`

```
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.number1 * parameter.number2,
);

@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}
```
`screen`
```
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));

     Text(
        'State4: $state4',
        textAlign: TextAlign.center,
    ),
```
</details>

## 3. Consumer Widget
The original storyline was to rebuild the entire screen when the status changes. However, if you implement the consumer widget on the screen, when the data in the consumer widget changes `build only the consumer widget`, not the entire screen resource.<br><br>
→Widget that allows you to see only locally changed states<br><br>

Let me see the example. Here, as a provider, I'm going to use the state-notifier that I've previously presented as an example and then, i tried putting it in the consumer widget on screen.

<details>
<summary>
example:
</summary>

`provider`
```
@riverpod
class GStateNotifier extends _$GStateNotifier {
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
```

`screen`
```
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    ...
          Consumer(
            builder: (context, ref, child) {
              print('builder build');
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Staet5: $state5'),
                  if (child != null) child,
                ],
              );
            },
            // child: Text('Hello'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('Increment'),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('Decrement'),
              )
            ],
          ),
```
</details>

When I pressed the increment button and the decrement button here, it was confirmed that only the consumer widget part was built separately, considering that the `builder build`, not the `build`, was displayed on the console.


