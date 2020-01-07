let express = require('express');
let exec = require('sync-exec');
let router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
    const out1 = exec('bash run_test.sh');
    //const out2 = exec('bash run_single.sh "sample_data/images/0_L_CC.png" "L-CC"');

    //const out1 = exec('pwd');
    //const out2 = exec('pwd);

    res.json({ "msg1": out1});//, "msg2": out2 });
});

module.exports = router;