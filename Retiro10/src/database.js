let mysql = require('mysql');

let conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'retiro10%'
});

conn.connect(function(err){
    if(err){
        console.log(err);
        return;
    }else{
        console.log('Conectado!');
    }

});

module.exports = conn;
