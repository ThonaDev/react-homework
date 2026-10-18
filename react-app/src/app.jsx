import React, { useState, useEffect } from 'react';

function App() {
  const [hostname, setHostname] = useState('Loading...');

  useEffect(() => {
    fetch('/health')
      .then(res => res.json())
      .catch(() => ({ server: window.location.hostname }))
      .then(data => {
        setHostname(data.server || window.location.hostname);
      });
  }, []);

  return (
    <div style={{ fontFamily: 'Arial, sans-serif', textAlign: 'center', marginTop: '50px' }}>
      <h1>Highly Available React Infrastructure</h1>
      <p>Served from Backend Server:</p>
      <div style={{
        display: 'inline-block',
        padding: '20px 40px',
        fontSize: '24px',
        fontWeight: 'bold',
        color: '#fff',
        backgroundColor: '#007acc',
        borderRadius: '8px',
        boxShadow: '0 4px 6px rgba(0,0,0,0.1)'
      }}>
        {hostname.toUpperCase()}
      </div>
    </div>
  );
}

export default App;