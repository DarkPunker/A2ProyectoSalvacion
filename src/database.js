const mongoose = require('mongoose');
const mysql = require('mysql');
const { promisify } = require('util');

const {database} = require('./keys');

const pool = mysql.createPool(database);

mongoose.connect('mongodb://admin:1234@softwareeducativojson-shard-00-00-tzliv.mongodb.net:27017,softwareeducativojson-shard-00-01-tzliv.mongodb.net:27017,softwareeducativojson-shard-00-02-tzliv.mongodb.net:27017/test?replicaSet=SoftwareEducativoJson-shard-0&ssl=true&authSource=admin',{
    /* user: "admin", */
    /* pass: "1234", */
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