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
        password:'KB1988@nyu',
        database:'Advisees'
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
    /*
    con.query("CREATE DATABASE Advisees",(err,result)=>
    {
        if(err) throw err;
        console.log("\nDatabase Created!!!!");
    });
    */
     ////////////////////////////////////////////////////////////////////////////////////
     /*
    con.query("DROP DATABASE mysql",(err,result)=>{
        if(err) console.error(err.stack);
        console.log("\nmysql Database dropped");
        console.log(result);
    });
    */
    //////////////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////////////
    //create a basic table;
    /*
    var sql = `CREATE TABLE adv_table (
        ID INT NOT NULL,
        NAME varchar(200) NOT NULL,
        TALENT varchar(200),
        AGE INT NOT NULL,
        GRADE INT NOT NULL,
        PRIMARY KEY(ID)
    );`
    con.query(sql,(err,result)=>{
        if(err) throw err;
        console.log("-----Table Created!!!-----");
    });
*/
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

    var columns = "SHOW COLUMNS FROM adv_table";
    con.query(columns,(err,result)=>{
        if(err) throw err;
        console.log("\n---------------Columns---------------");
        console.log(result);
    });

    ////////////////////////////////////////////////////////////////////////////////////
    //insert into tables
/*
    var sql = "INSERT INTO adv_table (ID, NAME, TALENT,AGE, GRADE) VALUES('215262015','Jada Mcgruder','Photography','15','10')";
    con.query(sql,(err,result)=> {
        if(err)
        {
            throw err;
            return;
        } else console.log("\n1 record inserted");
    });
*/

    ////////////////////////////////////////////////////////////////////////////////////
//Insert multiple values;
/*
   var sql = "INSERT INTO adv_table VALUES?";
   var values = [['215588575','Corey Cheek','Computer Science','15','10'],
                ['217130699','Zifiniyah Washington','Debate AND Photography','13','9'],
                ['220095434','Elliot Deutou James','Chess','13','9'],
                ['217009786','Adams Sanoko','Basketball','14','9']];
   con.query(sql,[values],(err,result)=> {
    if(err)
    {
        throw err;
        return;
    } else console.log("\nNumber of records inserted:"+result.affectedRows);
});
*/

    ////////////////////////////////////////////////////////////////////////////////////
    //contents of table

    var tab_content = "SELECT * FROM adv_table";
    con.query(tab_content,(err,result)=>{
        if(err) throw err;
        console.log("\n--------------Table Content---------------");
        console.log(result);
    });

    ////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////////////
});
    
   

    

