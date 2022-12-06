

import 'package:new_sulution_test/featuers/main/domain/entities/Event.dart';
import 'featuers/auth/domain/entities/users.dart';
import 'featuers/main/domain/entities/funerals.dart';

List<Event> events =  [
  Event(
      id: "ASD",
      title: "first Event",
      startTime: "8 PM",
      endTime: "12 PM",
      details: "This is the fist event and it asasd l ."),
  Event(
      id: "asdddsad",
      title: "first Event",
      startTime: "8 PM",
      endTime: "12 PM",
      details: "This is the fist event and it asasd l ."),
  Event(
      id: "dfghg",
      title: "first Event",
      startTime: "8 PM",
      endTime: "12 PM",
      details: "This is the fist event and it asasd l ."),
];

var users = <Users>[
] ;

var funeralsData = <Funerals>[
  Funerals(
      id: 1,
      name: "abed ullahauyman",
      imageUrl: "https://images.unsplash.com/photo-1542596768-5d1d21f1cf98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      day: "Friday",
      month: "January",
      date: "13",
      users: [
        Users(id: 'id', name: 'name', email: 'email', password: 'password',
            imageUrl: "https://images.unsplash.com/photo-1542596768-5d1d21f1cf98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
             phone: 'phone', dateOfBirth: 'dateOfBirth', gender: 'gender', location: 'location')
      ]),
  Funerals(
      id: 1,
      name: "abed ahmedasd",
      imageUrl: "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      day: "Friday",
      month: "January",
      date: "13",
      users: [],
  ),
  Funerals(
      id: 1,
      name: "abed",
      imageUrl: "https://images.unsplash.com/photo-1542596768-5d1d21f1cf98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      day: "Sunday",
      month: "January",
      date: "15",
      users: users),
  Funerals(
      id: 1,
      name: "abed ullah",
      imageUrl: "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      day: "Friday",
      month: "January",
      date: "13",
      users: users),
];