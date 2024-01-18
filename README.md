
# Base Project Flutter with Bloc Pattern




# Packages 

- [Bloc Pattern: flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [Navigation: auto_route](https://pub.dev/packages/auto_route)
- [DI: get_it](https://pub.dev/packages/get_it)
- [Network: dio](https://pub.dev/packages/dio)
- [Localization: easy_localization](https://pub.dev/packages/easy_localization)
- [Flavors: production, dev, staging](https://docs.flutter.dev/deployment/flavors)
- [Model generator: Freezed](https://pub.dev/packages/freezed)
- [Dio client generator: retrofit](https://pub.dev/packages/retrofit)
-  ...



# Installation

Generate code command: 

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```
    
# Project structure
```
 
│
└───base // contains base (bloc, state, ...) & network config
│    
└───common // contains app theme, config, extensions, common widgets ...
│   
└───di 
│   
└───features 
│   
└───routes // navigation
│   
└───main.dart
```

Feature structure
---
Use CLEAN architecture

![App Screenshot](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?ssl=1)
```
│
└───data
│   └─── service
│   └─── model
│   └─── repository (impl) + repository
│  
│   
└───presentation
│   └─── bloc
│   └─── pages
│   └─── widgets
```

# Generate Model using tool Freezed or Json Annotation: 

- [Json Converter](https://convert-json-888.web.app/)


# Must use BaseScaffold and BaseAppBar!!!
eg:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(),
      body: Column(),
    );
  }
}

```

# How to use pagination
- in bloc
**Init the paging controller**, add **BaseCommonMethodMixin** mixin to bloc.

```dart
class xxxBloc extends BaseBloc<E, S> with BaseCommonMethodMixin{
    ...
    final PagingController<int, Player> pagingController =
      PagingController(firstPageKey: 0);
    ...


    //on fetch data
    Future onGetData(
      Emitter<ExampleState> emit, List<Player> players, int offset) async {

    final res = await _coreUseCase.getData(offset: offset, limit: 25);

    pagingControllerOnLoad(offset, pagingController, res);
    
  }
}
```

- in view
**addPageRequestListener in initState** then use CustomListViewSeparated or another which match the case. See in paging_list_view.dart
```dart
class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState
    extends BaseState<ExamplePage, ExampleEvent, ExampleState, ExampleBloc> {
  @override
  void initState() {
    super.initState();
    bloc.pagingController.addPageRequestListener(
      (pageKey) => bloc.add(
        ExampleEvent.getPlayers(
          players: bloc.state.players,
          offset: pageKey,
        ),
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomListViewSeparated<Player>(
              separatorBuilder: (c, i) => const Divider(),
              controller: bloc.pagingController,
              builder: (c, item, i) => PlayerItem(
                data: item,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```


# How to use EventBus : listeners to subscribe for events and publishers to fire events

## Declare event
- at common/event_bus
- Create class for declare event to use
```dart
class Event{
  const Event({this.param});
  final String? param;
}
```

## Subcribe for events
- at onInit lifecycle function
```dart
late Streamsubcription _event;
@override
void initState(){
  super.initState();
  _event = getIt<EventBus>().on<Event>().listen((event){
    // event.param
    // run fuction after event listener
  });
}

```
## Fire Event 
- at position where to send event to screen listener
```dart
getIt<EventBus>().fire(Event(param: newParam));
```


# Dialog & bottomsheet
- at common/utils/
# Common widgets (button, textfield)
- at common/widgets/



# Flavor
Using
- [Flutter dotenv](https://pub.dev/packages/flutter_dotenv)
  

Config env in
```
│
└───assets
│   └─── evn
```
In Android
----------- 
Add google_services.json to
```
│
└───android
│   └─── app
│            └─── dev 
│            └─── staging
│            └─── production
```
Change applicationId & App name in android/app/build.gradle
```
    flavorDimensions "app"

    productFlavors {
        dev {
            dimension "app"
            resValue "string","app_name"," Dev Flutter Core"
            applicationId "com.example.flutter_core.dev"
        }
        staging {
            dimension "app"
            resValue "string","app_name"," Staging Flutter Core"
            applicationId "com.example.flutter_core.staging"
        }
        production {
            dimension "app"
            resValue "string", "app_name", "Flutter Core"
        }

    }
```

```
    applicationId "com.example.flutter_core"
```
In IOS
------
Add google google_services.plist to
```
│
└───Runner
│   └─── config
│            └─── dev 
│            └─── staging
│            └─── production
```
Change Product Bundle Identifier in Runner/Targets/Runner/Build Setting/Product Bundle Identifier
Change App Display Name in Runner/Targets/Runner/Build Setting/User-Defined/APP_DISPLAY_NAME

# Push Notification
Using
- [Firebase Messing](https://pub.dev/packages/firebase_messaging)

Initial Firebase Message
```dart
    Future<void> initialize({Function(String)? handleNotificationOnTap,})
```

Listen onMessage
```dart
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        
    });
```
Listen onBackgroundMessage
```dart
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
```
Listen onMessage when App opened & handle onTap notification
```dart
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          
    });
```

# Local Notification
Using
- [Flutter Local Notification](https://pub.dev/packages/flutter_local_notifications)


Init local Notification
```dart
    Future<void> init()
```


Show Notification
```dart
    Future<void> showNotification({
    required String title,
    required String body,
    String channelId = NotificationConfig.highChannelId,
    String? payload,
    Importance? importance,
    Priority? priority,
  }){}
```

Hanlde onTap Notification
```dart
    Future<dynamic> selectNotification(String? payload) async {
    }
```
