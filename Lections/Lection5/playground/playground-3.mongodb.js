// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use('sample2');

// for (let i = 1; i <= 20; i++) {
//     db.collection2.insertOne({
//         name: "Ім'я " + i,
//         age: Math.floor(Math.random() * 50) + 20, // Генеруємо випадковий вік в діапазоні від 20 до 70 років
//         email: "email" + i + "@example.com"
//     });
// }


// db.collection2.find(
//     {age: {$gt:60}}
// )

db.collection2.aggregate([
    {
        $group: {
            _id: {
                $subtract: [
                    { $trunc: { $divide: ["$age", 5] } },
                    { $mod: [{ $trunc: { $divide: ["$age", 5] } }, 1] }
                ]
            },
            count: { $sum: 1 }
        }
    },
    {
        $project: {
            ageGroup: {
                $concat: [
                    { $toString: { $multiply: ["$_id", 5] } },
                    " - ",
                    { $toString: { $add: [{ $multiply: ["$_id", 5] }, 4] } }
                ]
            },
            count: 1,
            _id: 0
        }
    },
    {
        $sort: { "ageGroup": -1 } // Сортуємо по зростанню кількості документів
    }
]);
