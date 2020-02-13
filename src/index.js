const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const flash = require('connect-flash');
const session = require('express-session');
const mysqlstore = require('express-mysql-session');
const { database } = require('./keys');
const passport = require('passport');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');


//initilazation
const app = express();
require('./lib/passport');

//settings
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));

const hbs = exphbs.create({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
});
app.engine('.hbs', hbs.engine);
app.set('view engine', '.hbs');

//middlewares
app.use(session({
    secret: 'texto',
    resave: false,
    saveUninitialized: false,
    store: new mysqlstore(database)
}));
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(methodOverride('_method'));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
}));

//global variables
app.use((req, res, next) => {
    app.locals.success = req.flash('success');
    app.locals.message = req.flash('message');
    app.locals.user = req.user;
    next();
});

//routes
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/profile', require('./routes/profile'));
app.use('/carrera', require('./routes/carrera'));
app.use('/curso', require('./routes/curso'));
app.use('/modulo', require('./routes/modulo'));
app.use('/unidad', require('./routes/unidad'));
app.use('/tema', require('./routes/tema'));
app.use('/clase', require('./routes/clase'));
app.use('/multimedia', require('./routes/multimedia'));
app.use('/admin', require('./routes/admin'));

//public
app.use(express.static(path.join(__dirname, 'public')));

//starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});