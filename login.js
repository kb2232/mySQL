//this is advisee database
var mysql = require('mysql');
//create a connection to database

/*create connection:takes 3 parameters:
1. host
2. user
3. password*/
var con = mysql.createConnection
(
    {
        host:'localhost',
        user:'root',
        password:'<enter password>',
        database:'<your database name>'
    }
);

/*this creates an object con which we can use to actually connect */
//connect can take error function to check proper connection
con.connect(function(err)
{
    if(err)
    {
        throw err;
        return;
    }
    console.log("Connected to MySQL!!!");
    con.query("select @@hostname",(err,result)=>
    {
        if(err) throw err;
        console.log(result);
    });
    /*"to QUERY" means to read from (or write to) a database.
    The query method takes a mysql statements as a parameter 
    and returns the result. 
    */
    ////////////////////////////////////////////////////////////////////////////////////
    var db = "SHOW DATABASES";
    con.query(db,(err,result)=>{
        if(err) throw err;
        console.log("\n---------------databases---------------");
        console.log(result);
    });
    //use the databses
    con.query("USE Advisees",(err)=>{
        if(err) throw err
        else console.log("---Using Advisee----");
    });
////////////////////////////////////////////////////////////////////////////////////
    //show table
    
    var table = "SHOW TABLES";
    con.query(table,(err,result)=>{
        if(err) throw err;
        console.log("\n---------------Tables---------------");
        console.log(result);
    });
    
//////////////////////////////////////////////////////////////////////////////////////
    //columns of the table
    var tablename = "enterTableName";
    var columns = "SHOW COLUMNS FROM"+tablename;
    con.query(columns,(err,result)=>{
        if(err) throw err;
        console.log("\n---------------Columns---------------");
        console.log(result);
    });

    ////////////////////////////////////////////////////////////////////////////////////
    var tab_content = "SELECT * FROM"+tablename;
    con.query(tab_content,(err,result)=>{
        if(err) throw err;
        console.log("\n--------------Table Content---------------");
        console.log(result);
    });

    ////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////////////
});
    
   

    

