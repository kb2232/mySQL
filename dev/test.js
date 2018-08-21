





var express = require('express');
var sql = require('mysql');
var bodyParser  = require("body-parser");
var app = express();
require('dotenv').config();


app.use(bodyParser.urlencoded({extended: true}));
app.set("view engine", "ejs");
/////////CONNECTON///////////////////////////////////////
var con = sql.createConnection({
	host: process.env.DB_HOST,
	user: process.env.DB_USER,
	password: process.env.DB_PASS,
	database: process.env.DB_NAME,
});
////////////////////////////create connnection////////////////////////////
// con.connect(function(err) 
// {
// 	if (err) {
// 		throw err;
// 		return;
// 	}
// 	console.log('Connected to MySQL!!!');

// 	con.query('select @@hostname', (err, result) => {
// 		if (err) throw err;
// 		console.log(result);
// 	});

// 	// user1.createTable(con);
//   // user1.insertValues(con);
// 	//user1.printALL(con);
// });
/////////////////////////////SERVER/////////////////////////////////////////////
//server
app.get('/',(req,res)=>{
	//total items we have in database
	var q = "SELECT COUNT(*) AS 'count' FROM test";
	con.query(q,(err,result)=>{
		if (err) throw err;
		var count = result[0].count;
		res.render("home",{ data: count } );
		//res.send("We have "+count+" items in our database");
	});
});
app.post('/register',function(req,res){
	console.log("REQs = "+req);
	res.redirect("/");
});
//////////////////////////DATABASE-CLASS////////////////////////////////////////////////
// database class
// class BAMAZON 
// {
// 	constructor(table, id, units) 
// 	{
// 		this.table = table;
// 		this.id = id;
// 		this.units = units;

// 	}
// 	createTable(con) {
// 		const db = 'SHOW DATABASES';
// 		con.query(db, (err, result) => {
// 			if (err) throw err;
// 			console.log('\n---------------databases---------------');
// 			console.log(result);
// 		});
// 		//use the databses
// 		con.query(`USE ${process.env.DB_NAME}`, err => {
// 			if (err) throw err;
// 			else console.log(`---Using ${process.env.DB_NAME}----`);
// 		});
// 		var sqlT = `CREATE TABLE ${this.table} (
//     item_id INT NOT NULL AUTO_INCREMENT,
//     prod_name varchar(200) NOT NULL,
//     department_name varchar(200) NOT NULL,
//     price Float NOT NULL,
//     stock_quantity INT NOT NULL,
//     PRIMARY KEY(item_id)
// );`;
// 		con.query(sqlT, (err, result) => {
// 			if (err) throw err;
// 			console.log('-----Table Created!!!-----');
// 		});
// 	}

//   insertValues(con) 
//   {
// 		//Insert multiple values;

// 		var sqlV = `INSERT INTO ${this.table}(prod_name, department_name, price, stock_quantity) VALUES?`;
// 		var values = [
// 			['cheese', 'food', '1.35', '10'],
// 			['steve maddan shoes item 221', 'shoes', '234.78', '2'],
// 			['burger', 'food', '3.43', '19'],
//       ['nba 2k18', 'games', '140', '50'],
//       ['meat', 'food', '15.35', '11'],
// 			['clippers', 'accessories', '24.78', '28'],
// 			['flashdrive', 'electronics', '30.43', '119'],
//       ['battery', 'accessories', '3.99', '52'],
//       ['soda', 'beverage', '1.43', '100'],
// 			['pillow', 'housing', '32.99', '22'],
// 		];
// 		con.query(sqlV, [values], (err, result) => {
// 			if (err) {
// 				throw err;
// 			} else console.log('\nNumber of records inserted:' + result.affectedRows);
// 		});
//   }
  
//   printALL(con)
//   {
//     let sql = `SELECT * FROM ${this.table}`;
//     con.query(sql,(err,result)=>{
//       if(err) throw err;
//       else console.log(result);
//     })
// 	}
// }

// //the connection is slow enough that this wil create first
// user1 = new BAMAZON('test');

var PORT = process.env.PORT || 8080;
app.listen(PORT,()=>{
  console.log(`Server listening on PORT:${PORT}`);
});
