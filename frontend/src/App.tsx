import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom'

import Home from './Home'
import TopBar from './TopBar'
import Resume from './Resume'
import About from './About'

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<TopBar />}>
            <Route path='home' element={<Home />} />
            <Route path='about' element={<About />} />
            <Route path='resume' element={<Resume />} />
          </Route>
        </Routes>
      </BrowserRouter>

    </div>
  );
}

export default App;