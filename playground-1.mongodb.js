// db.collection1.insertMany([
//     { "name": "John", "age": 28 },
//     { "name": "Jane", "age": 32 },
//     { "name": "Mike", "age": 45 },
//     { "name": "Lucy", "age": 24 },
//     { "name": "Tomas", "age": 34 },
//     { "name": "Lara", "age": 29 },
//     { "name": "Nina", "age": 42 },
//     { "name": "Mark", "age": 31 },
//     { "name": "Olivia", "age": 27 },
//     { "name": "Daniel", "age": 36 },
//     { "name": "Chloe", "age": 41 },
//     { "name": "Alex", "age": 39 },
//     { "name": "Emily", "age": 22 },
//     { "name": "Ethan", "age": 30 },
//     { "name": "Sophia", "age": 35 },
//     { "name": "Ryan", "age": 40 },
//     { "name": "Bella", "age": 26 },
//     { "name": "Dylan", "age": 37 },
//     { "name": "Abigail", "age": 25 },
//     { "name": "Oscar", "age": 33 }
//   ]);

db.collection1.find({ "age": { $gt: 30 }})