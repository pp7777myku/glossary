const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 9001;

//connect to database
const db = mysql.createConnection({
  host     : 'my-mysql',
  port     : 3306,
  user     : 'root',
  password : 'Itmoitmo123',
  database : 'database_9030'
});


db.connect(err => {
  if (err) {
    console.error('Database connection failed: ' + err.stack);
    return;
  }
  console.log('Database connected.');
});

// get data from tables
const getElements = async (callback) => {
  try {
    const nodes = await query('SELECT * FROM nodes');
    const edges = await query('SELECT * FROM edges');
    const transformedNodes = nodes.map(node => ({
      id: node.id,
      type: node.type,
      data: {
        label: node.label,
        note: node.note
      },
      position: {
        x: node.position_x,
        y: node.position_y
      }
    }));
    const transformedEdges = edges.map(edge => ({
      id: edge.id,
      source: edge.source,
      target: edge.target,
      animated: edge.animated === 1,  // Assuming animated is stored as a boolean in the database
      label: edge.label
    }));
    callback([...transformedNodes, ...transformedEdges]);
  } catch (err) {
    console.error(err);
    throw err;
  }
};

// search function
function query(sql) {
  return new Promise((resolve, reject) => {
    db.query(sql, (err, result) => {
      if (err) {
        return reject(err);
      }
      resolve(result);
    });
  });
}

// Express router
app.get('/glossary', (req, res) => {
  getElements(elements => {
    res.json(elements);
  });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/glossary`);
});