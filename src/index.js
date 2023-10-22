import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import About from './components/About';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';

const Routes = createBrowserRouter([
  { path: '/', element: <App /> },
  { path: '/about', element: <About />}
])

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
      <RouterProvider router={Routes}/>
  </React.StrictMode>
);
