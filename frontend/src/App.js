// frontend/src/App.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Routes, Route } from 'react-router-dom';

function HealthCheck() {
  return <div>OK</div>;
}

function App() {
  const [items, setItems] = useState([]);

  useEffect(() => {
    fetchItems();
  }, []);

  const fetchItems = async () => {
    try {
      const response = await axios.get('/api/items');
      setItems(response.data);
    } catch (error) {
      console.error('Error fetching items:', error);
    }
  };

  return (
    <Routes>
      <Route path="/health" element={<HealthCheck />} />
      <Route
        path="/"
        element={
          <div>
            <h1>My 3-Tier Application</h1>
            <div>
              {items.map(item => (
                <div key={item.id}>{item.name}</div>
              ))}
            </div>
          </div>
        }
      />
    </Routes>
  );
}

export default App;
