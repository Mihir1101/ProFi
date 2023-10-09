import React, { useEffect, useState } from 'react';
import axiosGraph from './constant/graph/axiosGraph';
import { graphid } from './constant/graph/graphid';
import PushMessage from './components/PushMessage';
import { tokenImage } from './constant/images/images';
import './styles/App.css';

function App() {
  const [data, setData] = useState([]);
  const [currentState, setCurrentState] = useState("USD");

  function changeCurrentState() {
    if (currentState === "USD") {
      setCurrentState("ETH");
    } else {
      setCurrentState("USD");
    }
  }

  function returnOppositeState() {
    if (currentState === "USD") {
      return "ETH";
    } else {
      return "USD";
    }
  }

  useEffect(() => {
    const interval = setInterval(() => {
      fetchdata();
    }, 1000);
    return () => clearInterval(interval);
  });

  const fetchdata = async () => {
    const data = await axiosGraph.post(
      `${graphid}`,
      {
        query: `
          {
            assetPairs(
              where: {id_in: ["ETH/${currentState}", "AAVE/${currentState}", "LINK/${currentState}", "MATIC/${currentState}","DOGE/${currentState}", "LTC/${currentState}", "BTC/${currentState}", "MTN/${currentState}"]}
              orderBy: currentPrice
              orderDirection: desc
            ) {
              currentPrice
              id
            }
          }
          `
      }
    );
    setData(data.data.data.assetPairs);
  }
  fetchdata();

  return (
    <main>
      {data ? (
        <div>
          <h1 className='header'>Tokens</h1>
          <button className='btn' onClick={changeCurrentState} >Convert to {returnOppositeState()}</button>
          <div className='card-container'>
            {data.map((item, index) => (
              <div key={index} className='card'>
                <div className='textBox'>
                  <span className='head'>{item.id}</span>
                  <span className='price'>{item.currentPrice}</span>
                </div>
                <img srcSet={tokenImage(item.id)} className='img' height='100vh'></img>
              </div>
            ))}
          </div>
          <PushMessage />
        </div>
      ) : (
        <h1>loading</h1>
      )}
    </main>


  );
}

export default App;
