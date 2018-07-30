var mysql = require('mysql');
var con = mysql.createConnection(
  {
    host:'localhost',
    user:'root',
    password:'KB1988@nyu'
});
con.connect((err)=>{
  if(err)
    {
        console.error(err.message);
        return;
    }
    console.log("Connected to MySQL!!!");
});

con.end();