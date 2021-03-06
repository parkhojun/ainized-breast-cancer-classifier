let express = require('express');
var exec = require('child_process').exec, child;
// https://stackoverflow.com/questions/1880198/how-to-execute-shell-command-in-javascript
let router = express.Router();

/* GET home page. */
router.get('/', (req, res, next) => {
    console.log(11);
    exec("bash run_test.sh", (error, stdout, stderr) => {
        if (!error) {
            res.json({ "msg": stdout });
        } else {
            res.json({ "msg": stderr });
        }
    });
});

router.get('/:image', (req, res, next) => {
    const { image } = req.params;
    const tag = image.split(".")[0].split("_").slice(1).join("-");
    
    console.log(image, tag);

    const query = `bash run_single_ainized.sh "sample_data/images/${image}" "${tag}"`
    exec(query, (error, stdout, stderr) => {
        console.log(stdout);
        if (!error) {
            res.json({ "msg": stdout });
        } else {
            res.json({ "msg": stderr });
        }
    });
});

module.exports = router;