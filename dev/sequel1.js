var express = require('express');
var sql = require('mysql');
var bodyParser  = require("body-parser");
var app = express();
require('dotenv').config();


app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));
app.set("view engine", "ejs");
app.use(function(req, res, next) {
	next();
});

/////////CONNECTON///////////////////////////////////////
var con = sql.createConnection({
	host: process.env.DB_HOST,
	user: process.env.DB_USER,
	password: process.env.DB_PASS,
	database: process.env.DB_NAME,
});
////////////////////////////create connnection////////////////////////////
con.connect(function(err) 
{
	if (err) {
		throw err;
		return;
	}
	console.log('Connected to MySQL!!!');

	con.query('select @@hostname', (err, result) => {
		if (err) throw err;
		console.log(result);
	});

	// user1.createTable(con);
  // user1.insertValues(con);
	// user1.printALL(con);
	// user2.createTable(con);
	// user2.insertValues(con);
	// user2.printALL(con);
});
/////////////////////////////SERVER/////////////////////////////////////////////
//server
app.get('/',(req,res,next)=>
{
	var c = `SELECT COUNT(*) AS 'count' FROM ${tableName}`;
	var q = `SELECT prod_name, department_name, price, stock_quantity
	FROM ${tableName}
	ORDER BY item_id
	ASC`;
	con.query(q,(err,result)=>
	{
		if(err) throw err;
		var tes = " ";
		for(let x = result.length-1; x<result.length; x++)
		{
			let res = result[x].prod_name+"--"+result[x].department_name+"--"+result[x].price+"--"+result[x].stock_quantity+"\n|\n";
			tes +=res;
		}
		res.render("home",
		{ 
			data: tes,
			len: result.length
		});
	});
});

app.get("/joinus",(req,res)=>{
		//total items we have in database
		var q = `SELECT COUNT(*) AS 'count' FROM ${tableName}`;
		con.query(q,(err,result)=>{
			if (err) throw err;
			var count = result[0].count;
			res.render("joinus",{ count: count } );
		});
});
app.post('/register',function(req,res){
	var newItem = {
		prod_name : req.body.name,
		department_name : req.body.department,
		price : req.body.price,
		stock_quantity : req.body.quantity
	}
	con.query(`INSERT INTO ${tableName} SET ?`,newItem,(err,result)=>{
		if (err) throw err;
		res.redirect("/");
	});
});
//BUY FROM US 
app.get('/buyfromus',(req,res)=>
{
	let q = `SELECT item_id, stock_quantity
	FROM ${tableName}`;
	let output = "\n";
	con.query(q,(err,result)=>{
		if(err) throw err;
		for(let i = 0; i<result.length; i++)
		{
			output += result[i].item_id +
								"------"+result[i].stock_quantity +
								" ||||||||| ";
		}
		res.render("buyfromus",{
			data: output
		});
	});
});

app.post('/buynow',(req,res,next)=>
{
	var newItem = {
		item_id : req.body.item_id,
		stock_quantity : req.body.quantity
	}
	con.query(`SELECT * FROM ${tableName}
	WHERE item_id=${newItem.item_id}`,(err,result)=>
	{
		var response="...";
		if (err) throw err;
		if(result[0]===undefined) {
			response="Item Id does not exist!!!";
			console.log(response);
		}
		else if(result[0].stock_quantity < newItem.stock_quantity) {
			response="Insufficient amount of product";
			console.log(response);
		}
		else {	
			response="Item-"+result[0].item_id+":\nYou purchased "+req.body.quantity+" "+result[0].prod_name+" from the "+result[0].department_name+" department\n"; 
			console.log("item EXIST!!!");
			next();
			let q = `UPDATE ${tableName}
			SET stock_quantity=${result[0].stock_quantity}-${req.body.quantity}
			WHERE item_id=${result[0].item_id}`
			con.query(q,(err,result)=>{
				if(err) throw err;
			})
		};
		res.render("buynow",{
			response: response
		});

	})
});
//////////////////////////DATABASE-CLASS////////////////////////////////////////////////
// database class
class BAMAZON 
{
	constructor(table, id, units) 
	{
		this.table = table;
		this.id = id;
		this.units = units;

	}
	createTable(con) 
	{
		const db = 'SHOW DATABASES';
		con.query(db, (err, result) => 
		{
			if (err) throw err;
			console.log('\n---------------databases---------------');
			console.log(result);
		});
		//use the databses
		con.query(`USE ${process.env.DB_NAME}`, err => {
			if (err) throw err;
			else console.log(`---Using ${process.env.DB_NAME}----`);
		});
		var sqlT = `CREATE TABLE ${this.table} (
    item_id INT NOT NULL AUTO_INCREMENT,
    prod_name varchar(200) NOT NULL,
    department_name varchar(200) NOT NULL,
    price Float NOT NULL,
    stock_quantity INT NOT NULL,
    PRIMARY KEY(item_id)
);`;
		con.query(sqlT, (err, result) => {
			if (err) throw err;
			console.log('-----Table Created!!!-----');
		});
	}

  insertValues(con) 
  {
		//Insert multiple values;

		var sqlV = `INSERT INTO ${this.table}(prod_name, department_name, price, stock_quantity) VALUES?`;
		var values = [
			['stake', 'food', '1.35', '10'],
			['steve maddan shoes item 221', 'shoes', '234.78', '2'],
			['burger and fries', 'food', '3.43', '19'],
      ['nba 2k18', 'games', '140', '50'],
      ['mutton', 'food', '15.35', '11'],
			['clippers', 'accessories', '24.78', '28'],
			['flashdrive', 'electronics', '30.43', '119'],
      ['battery', 'accessories', '3.99', '52'],
      ['coke', 'beverage', '1.43', '100'],
			['pillow', 'housing', '32.99', '22'],
		];
		con.query(sqlV, [values], (err, result) => {
			if (err) {
				throw err;
			} else console.log('\nNumber of records inserted:' + result.affectedRows);
		});
  }
  
  printALL(con)
  {
    let sql = `SELECT * FROM ${this.table}`;
    con.query(sql,(err,result)=>{
      if(err) throw err;
      else console.log(result);
    })
	}
}

//the connection is slow enough that this wil create first
var table1 = "test";
var table2 = "test2";
var tableName = table1;
user1 = new BAMAZON(table1);
user2 = new BAMAZON(table2);

var PORT = process.env.PORT || 8080;
app.listen(PORT,()=>{
  console.log(`Server listening on PORT:${PORT}`);
});
