import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import TokenDetail from './components/TokenDetail';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';

const Routes = createBrowserRouter([
  { path: '/', element: <App /> },
  { path: '/id', element: <TokenDetail />}
])

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
      <RouterProvider router={Routes}/>
  </React.StrictMode>
);
