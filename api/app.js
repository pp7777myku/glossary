const express = require('express');
const app = express();
const port = 9001;

const elements = [
    { id: '1', type: 'default', data: { label: 'Term1: Definition of Term1' }, position: { x: 250, y: 5 } },
    { id: '2', type: 'default', data: { label: 'Term2: Definition of Term2' }, position: { x: 100, y: 100 } },
    { id: '3', type: 'default', data: { label: 'Term3: Definition of Term3' }, position: { x: 400, y: 100 } },
    { id: '4', type: 'default', data: { label: 'Term4: Definition of Term4' }, position: { x: 250, y: 200 } },
    { id: '5', type: 'default', data: { label: 'Term5: Definition of Term5' }, position: { x: 250, y: 300 } },
    // 边关系
    { id: 'e1-2', source: '1', target: '2', animated: true },
    { id: 'e2-3', source: '2', target: '3', animated: true },
    { id: 'e3-4', source: '3', target: '4', animated: true },
    { id: 'e4-5', source: '4', target: '5', animated: true },
    // 更多边...
  ];
  
  app.get('/glossary', (req, res) => {
    res.json(elements);
  });
  

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
