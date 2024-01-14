const express = require('express');
const app = express();
const port = 9001;

const elements = [
  { id: '1', type: 'default', data: { label: 'Term1', note: 'term1 isasddsaasdasdasdasdasdasdasdafsdfsdfdgd....' }, position: { x: 250, y: 100 } },
  { id: '2', type: 'default', data: { label: 'Term2', note: 'term2 sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....' }, position: { x: 100, y: 200 } },
  { id: '3', type: 'default', data: { label: 'Term3', note: 'term3 isdfsdffffffffffffffffff....' }, position: { x: 400, y: 200 } },
  { id: '4', type: 'default', data: { label: 'Term4', note: 'term4 sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....is....' }, position: { x: 250, y: 300 } },
  { id: '5', type: 'default', data: { label: 'Term5', note: 'term5 issdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis........' }, position: { x: 250, y: 400 } },
  { id: '6', type: 'default', data: { label: 'Term6', note: 'term5 issdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis........' }, position: { x: 250, y: 500 } },
  { id: '7', type: 'default', data: { label: 'Term7', note: 'term5 is..sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis......' }, position: { x: 250, y: 600 } },
  { id: '8', type: 'default', data: { label: 'Term8', note: 'term5 issdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis........' }, position: { x: 250, y: 700 } },
  { id: '9', type: 'default', data: { label: 'Term9', note: 'term5 issdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis........' }, position: { x: 250, y: 800 } },
  { id: '10', type: 'default', data: { label: 'Term10', note: 'term5 issdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis........' }, position: { x: 250, y: 900 } },
  { id: '11', type: 'default', data: { label: 'Term11', note: 'term5 issdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis....sdafsdfsdfsdfsdfsdfsdfsdfsdfsdfis........' }, position: { x: 250, y: 1000 } },
  // 边关系
  { id: 'e1-2', source: '1', target: '2', animated: true, label:'next' },
  { id: 'e2-3', source: '2', target: '3', animated: true, label:'next' },
  { id: 'e3-4', source: '3', target: '4', animated: true, label:'next' },
  { id: 'e2-4', source: '2', target: '4', animated: true, label:'next' },
  // 更多边...
];
  
  app.get('/glossary', (req, res) => {
    res.json(elements);
  });
  

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/glossary`);
});