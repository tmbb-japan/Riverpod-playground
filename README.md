# theory_rvp

This repository is a playground for putting the riverpod in my head.

## what is the riverpod
To understand the intent of this question, you need to know what **statementManagement** is.  <br>
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

The primary concept behind Riverpod is the `Providers`. Provider is the object that holds some piece of state and allows widgets to access and listen to that state.<br>
This enables you to separate the UI and the business logic more effectively, making the codebase cleaner and easier to maintain.

`The following is a list of provider types used by this repository.`

* StateProvider
* StateNotifierProvider
* FutureProvider
* StreamProvider
  
Other features `other than provider` will also be introduced later. Please keep it up!

## StateProvider

