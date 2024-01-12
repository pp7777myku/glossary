const express = require('express');
const axios = require('axios');
const app = express();
const port = 9002;

// 静态文件托管
app.use(express.static('public'));

// API代理
app.get('/api/glossary', async (req, res) => {
    try {
        const response = await axios.get('http://localhost:9001/glossary');
        res.json(response.data);
    } catch (error) {
        console.error(error);
        res.status(500).send('Error fetching data');
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
