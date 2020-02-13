const mongoose = require('mongoose');
const mysql = require('mysql');
const { promisify } = require('util');

const {database} = require('./keys');

const pool = mysql.createPool(database);

mongoose.connect('mongodb://localhost:27017/softwareeducativo',{
    user: "admin",
    pass: "1234",
    useCreateIndex: true,
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false
})
.then(db => console.log('DB Json is connected'))
.catch(err => console.error(err));

pool.getConnection((err, connection)=>{
    if (err){
        if (err.code === 'PROTOCOL_CONNECTION_LOST'){
            console.error('DATABASE CONNECTION WAS CLOSED');
        }
        if (err.code === 'ER_CON_COUNT_ERROR'){
            console.error('DATABASE HAS TO MANY CONNECTIONS');
        }
        if (err.code === 'ECONNREFUSED'){
            console.error('DATABASE CONNECTION WAS REFUSED');
        }
    }
    if (connection)connection.release();
    console.log('DB SQL is Connected');
    return;
});

//Promisify Pool Query
pool.query = promisify(pool.query);

module.exports = pool;