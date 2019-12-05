var inquirer = require("inquirer");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",

    port: 3306,

    user: "root",

    password: "",
    database: "products_DB"
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId + "\n");
    start();
});

function start() {
    inquirer
        .prompt({
            name: "Store",
            type: "list",
            message: 'Would you like to shop?',
            choices: ['YES!', 'No']
        })
        .then(function (answer) {
            if (answer.Store === "YES!") {
                showProducts();
                openStore();
            }
            else {
                console.log('\nThank you come again!\n');
                connection.end();
            }
        })
};

function showProducts() {
    console.log("Selecting all products...\n");
    connection.query("SELECT * FROM products", function (err, rows) {
        if (err) throw err;

        rows.forEach(function (results) {
            console.log('Id:', results.id, '-', results.product_name, '-', 'Price: ', + results.price);
        });

    });

};

function openStore() {
    connection.query("SELECT * FROM products", function (err, res) {
        if (err) throw err;

        inquirer
            .prompt([
                {
                    name: "item",
                    type: "input",
                    message: "Please enter the ID of the item you would like to buy!"
                },
                {
                    name: "amount",
                    type: "input",
                    message: "how many would you like?"
                }
            ])
            .then(function (answer) {
                var query = "SELECT id, product_name, price, stock_quantitiy FROM products WHERE ?";
                connection.query(query, { id: answer.item }, function (err, res) {
                    for (var i = 0; i < res.length; i++) {
                        if (parseInt(answer.amount) > parseInt(res[i].stock_quantitiy)) {

                            console.log("\n Not enough left in stock! \n");
                            start();

                        } else {
                            var newInv = parseInt(res[i].stock_quantitiy) - parseInt(answer.amount);
                            var total = parseInt(res[i].price) * parseInt(answer.amount);

                            var query = connection.query(
                                "UPDATE products SET ? WHERE ?",
                                [
                                    {
                                        stock_quantitiy: newInv
                                    },
                                    {
                                        id: res[i].id
                                    }
                                ]
                            );
                            console.log("\nYou purchased " + answer.amount + res[i].product_name + " at the price of $ " + res[i].price);
                            console.log("\nThank you for your purchase your total is $ " + total + "\n");

                            start();
                        }
                    }

                });
            });

    })
}




