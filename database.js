import mysql from 'mysql'

const connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : 'Wori2022!',
    database : 'txjl'
});

connection.connect(function(er){
    if(er){
        throw er
    }else{
        console.log('可以了！')
    }
});

module.exports = 
