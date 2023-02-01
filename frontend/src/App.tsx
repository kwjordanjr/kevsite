import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Home from './Home'
import Layout from './Layout'

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<Layout />}>
            <Route path='home' element={<Home />} />
            <Route path='about' />
          </Route>
        </Routes>
      </BrowserRouter>

    </div>
  );
}

export default App;