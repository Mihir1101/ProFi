import React, { useEffect, useState } from 'react';
import axiosGraph from './constant/graph/axiosGraph';
import { graphid } from './constant/graph/graphid';
import PushMessage from './components/PushMessage';
import './styles/App.css';

function App() {
  const [data, setData] = useState([]);
  useEffect(() => {
    const fetchdata = async () => {
      const data = await axiosGraph.post(
        `${graphid}`,
        {
          query: `
          {
            assetPairs(
              where: {id_in: ["ETH/USD", "AAVE/USD", "LINK/USD", "MATIC/USD","DOGE/USD", "LTC/USD", "BTC/USD"]}
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
  }, []);
  return (
    <main>
      {data ? (
        <div>
          <div>
          {data.map((item, index) => (
            <div key={index} className='token-card'>
              <h3>{item.id}</h3>
              <h3>{item.currentPrice}</h3>
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
