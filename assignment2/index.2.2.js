const fs = require('fs');
const util = require('util');
const path = require('path');

const getDir = util.promisify(fs.readdir);
const getFileStat = util.promisify(fs.stat);

const PATH = './test';

const searchDir = async dir => {
    const files = await getDir(dir);
    files.forEach(async file => {
        const filePath = path.join(dir, file);
        const stat = await getFileStat(filePath);
        if(stat.isDirectory()){
            await searchDir(filePath);
        }
        else if(path.extname(filePath) === '.js'){
            console.log(filePath);
        }
    });
};

(async () => {
    try{
        await searchDir(PATH);
    } catch(err){
        console.error(err);
    }
})();