let express = require('express');
var exec = require('child_process').exec, child;
// https://stackoverflow.com/questions/1880198/how-to-execute-shell-command-in-javascript
let router = express.Router();

/* GET home page. */
router.get('/', (req, res, next) => {
    exec('bash run_test.sh',  (error, stdout, stderr) => {
        if (!error) {
            res.json({ "eval": stdout });
        } else {
            res.json({ "eval": stderr });
        }
    });
    //const out2 = exec('bash run_single.sh "sample_data/images/0_L_CC.png" "L-CC"');

    //const out1 = exec('pwd');
    //const out2 = exec('pwd);

    //res.json({ "msg1": out1});//, "msg2": out2 });

    //const out = exec('ls -la');
    
});

module.exports = router;