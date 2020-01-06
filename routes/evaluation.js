let express = require('express');
let exec = require('sync-exec');
let router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {

    const out1 = exec('bash run_test.sh');
    const out2 = exec('bash run_single.sh "sample_data/images/0_L_CC.png" "L-CC"');
    res.json({ "eval": out1 });
    res.json({ "eval": out2 });
});

module.exports = router;