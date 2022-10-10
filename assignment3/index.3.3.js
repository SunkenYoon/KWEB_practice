const express = require('express');
const app = express();
const port = 3000;

app.get('/factorial/:number', (req, res) => {
    const { number } = req.params;
    const parsedNum = parseInt(number);
    let result = 1;
    for (let i = 0; i < parsedNum; i++){
        result *= (i + 1);
    }
    return res.send(`${number}! = ${result}.`);
});

app.get('/factorial', (req, res) => {
    const { number } = req.query;
    return res.redirect(`/factorial/${number}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));