import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import axiosGraph from './constant/graph/axiosGraph';
import { graphid } from './constant/graph/graphid';
import PushMessage from './components/PushMessage';
import { tokenImage } from './constant/images/images';
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
                where: {id_in: ["ETH/USD", "AAVE/USD", "LINK/USD", "MATIC/USD","DOGE/USD", "LTC/USD", "BTC/USD", "MTN/USD"]}
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
      console.log(data);
      setData(data?.data?.data?.assetPairs);
    }
    fetchdata();
  }, []);


  return (

    <main>
      {data ? (
        <div>
          <h1 className='header'>Tokens</h1>
          <div className='card-container'>
            {data.map((item, index) => (
              <Link key={index} to={`/id/${item.id}`} className='card'>
                <div className='textBox'>
                  <span className='head'>{item.id}</span>
                  <span className='price'>{item.currentPrice}</span>
                </div>
                <img srcSet={tokenImage(item.id)} className='img' height='100vh'></img>
              </Link>
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
