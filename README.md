# DW9 Delivery App

[![Flutter](https://amandacleto.github.io/images-for-projects/public/images/github-readme/icon-flutter.svg)](https://flutter.dev/)
[![Dart](https://amandacleto.github.io/images-for-projects/public/images/github-readme/icon-dart.svg)](https://dart.dev/)


>Dw9 is an online free event made by Rodrigo Rahman, totally focused to build an entire application by teaching concepts of IT architecture, project patterns and more.


For the first time I participated in the Dart Week, in its 9th edition, and here is my experience with:

<br>

## 📷 Illustrative gif of the project:
![](https://amandacleto.github.io/images-for-projects/public/images/github-readme/dw9-delivery-app/app.gif)


## 🎇 Apprenticeship:
This project was made by using ``Bloc`` pattern, one pattern that I haven't used until than;

>BLOC: The gist of BLoC is that everything in the app should be represented as stream of events: widgets submit events; other widgets will respond. BLoC sits in the middle, managing the conversation. It will be created separately from the view, isolating the logic of the code.

At first I thought that Bloc was an over complicated package, but after using it in here, now I find it very elegant actually. It is a powerful way to structure your project, maintaining an easy maintainable architecture for the future, and giving developers full control of the state management of the pages.
Each page is composed by a name_state file, where is composed by the state of the page, with your possible status, and a name_controller file, where we can emit when the state must change and to witch status must be changed.

<br>

To help with the reduction of 'if/elses' of our views, we also used the ``Match`` pattern, that together with Bloc, was the "icing on the cake"; For that, we use the match package:

>MATCH: This library contains @match annotation for generating custom match and matchAny extensions and extension methods for dart builtin types.

That was the elegant way, to show dialogs and make some treatments on our views;

<br>

Some other cool packages that were used on the project, such as: loading_animation_widget for loading; top_snackbar_flutter for snackbar; and flutter_awesome_select for selection button.

<br>

But I guess.. the main victory goes to ``json_rest_server``, this package created by "Academia do Flutter" is amazing for those who don't want to make a whole backend project just to practice your frontend;

>JSON_REST_SERVER: A RESTful server based on JSON With this package you can have a fully functional RESTful server with auth, pagination and all the necessaries services do build an application

<br>

Despite all this packages, dw9 presented lots of concepts very useful for the daily work, such as the usage of singletons and the repository pattern;


<br>



## 🚀 How to execute the project:
To run and view the project, you will need to follow the next steps.
  * Firstly you **must have Flutter installed in your machine**, to know more about this, see the doc: https://flutter.dev/docs/get-started/install;

<br>

### Creating your backend

For this project we used json_rest_server as our backend. To create the api you must install it in your machine and then, create your backend project by running the command:
   ```sh
   json_rest_server create ./name_backend_api
   ```

After creation, write down in ``config.yaml`` file, in urlSkip:
```
  urlSkip:
      - /users:
         method: post
      - /products:
         method: get
      - /products/{*}:
          method: get
```
Inside ``database.json``, paste the following json and feel free to populate ``"payment-types"`` and ``"products"``, as you wish, following the structure below:

```
{
    "users": [],
    "payment-types": [
        {
            "id": 1,
            "name": "title",
            "acronym": "acronym",
            "enabled": true
        }

    ],
    "products": [
        {
            "id": 1,
            "name": "title",
            "description": "description",
            "price": 15.0,
            "image": "https://image"
        }

    ],
    "orders": []
}
```

<br>

### Defining BACKEND_BASE_URL variable:

After creating the backend, you must call it inside your frontend. Here in this project, create the ```.env``` file beside ```.env_example``` file and define your api key from your server

<br>

### Installing dependencies:
Run the command to install the project dependencies.
   ```sh
   flutter pub get
   ```
<br>

   ```sh
   flutter create .
   ```

### Running the project:
The scripts below run the project.
   ```sh
   flutter run
   ```


After following the previous steps, the project is running in **development mode**.

<br>

## 👍 Conclusion:
I really enjoyed this event, and even though I already have experience with Flutter, I could learn a lot with DW9, since some new concepts and patterns, to some libraries and a different way of structuring a project.

It is a very massive week, but it totally worth it.

Waiting for DW10 :)

<br>


---
## 🌐 Links:
***Flutter:***<br>
[<ins>Flutter docs</ins>](https://docs.flutter.dev/)<br>

***Dart:***<br>
[<ins>Dart docs</ins>](https://dart.dev/guides/)<br>

***Rodrigo Rahman:***<br>
[<ins>Youtube Channel</ins>](https://www.youtube.com/@rodrigorahman)<br>
