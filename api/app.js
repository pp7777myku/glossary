const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 9001;

// Database connection configuration
const dbConfig = {
  host     : 'my-mysql',
  port     : 3306,
  user     : 'root',
  password : 'Itmoitmo123',
  database : 'database_9030'
};

// Retry parameters
const maxRetries = 60;
const retryInterval = 10000; // 10 seconds

// Function to establish a database connection with retry logic
function connectWithRetry(attempt) {
  const db = mysql.createConnection(dbConfig);

  db.connect(err => {
    if (err) {
      console.error(`Database connection failed (Attempt ${attempt}): ${err.stack}`);
      if (attempt < maxRetries) {
        console.log(`Retrying to connect in ${retryInterval / 1000} seconds...`);
        setTimeout(() => connectWithRetry(attempt + 1), retryInterval);
      } else {
        console.error('Max retries reached. Exiting.');
        process.exit(1); // Exit the process if max retries reached
      }
    } else {
      console.log('Database connected.');
      // Rest of your code to setup routes and start server...
    }
  });

  return db;
}

// Connect to the database with retry logic
const db = connectWithRetry(1);

// Rest of your Express app code...
