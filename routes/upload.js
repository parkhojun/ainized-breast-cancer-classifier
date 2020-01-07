let express = require('express');
let multer = require('multer');

let router = express.Router();
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, __dirname + '/sample_data/images/')
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname)
    }
})

var upload = multer({ storage: storage });

/* GET home page. */
router.post('/', upload.single('file'), (req, res) => {
    const { file } = req;
    console.log(file);
    if (!file) { res.json({ "status": false }); }
    else { res.json({ "status": true }); }

});

module.exports = router;