const express = require('express');
const router = express.Router();
const Carousel = require('../models/carousel');

router.get('/', async (req, res) => {
    const carousel = await Carousel.find();
    res.render('index', {carousel});
});

module.exports = router;