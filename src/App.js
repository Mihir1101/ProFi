import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import axiosGraph from './constant/graph/axiosGraph';
import { graphid } from './constant/graph/graphid';
import { tokenImage } from './constant/images/images';
import './styles/App.css';

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    const fetchdata = async () => {
      const data = await axiosGraph.post(
        `${graphid}`,
        { 
          //More lokens can be queried some of them are !!!
          //"MATIC/USD","DOGE/USD", "LTC/USD", "BTC/USD"
          query: `
            {
              assetPairs(
                where: {id_in: ["ETH/USD","DOGE/USD", "BTC/USD", "BNB/USD", "USDT/USD"]}
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
          {data.map((item, index) => {
              // Split the token ID and take the part before "/USD"
              const tokenId = item.id.split('/')[0];
              return (
                <Link to={`http://localhost:6969/tokens/${tokenId}`} key={index}>
                  <div className='card'>
                    <div className='textBox'>
                      <span className='head'>{tokenId}</span>
                      <span className='price'>$ {item.currentPrice}</span>
                    </div>
                    <img srcSet={tokenImage(tokenId)} className='img' height='100vh' alt={tokenId} />
                  </div>
                </Link>
              );
            })}
          </div>
        </div>
      ) : (
        <h1>loading</h1>
      )}
    </main>
  );
}

export default App;