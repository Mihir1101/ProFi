function customSigmoid(x) {
    const a = 10; // The upper bound for values above 4.6
    const b = 2;  // The lower bound for values below 4.6
    const k = 4.6; // The threshold value
  
    if (x >= k) {
      return a / (1 + Math.exp(-k * (x - 4.6)));
    } else {
      return b / (1 + Math.exp(k * (x - 4.6)));
    }
  }
  
  // Example usage with your input values:
  let BTC = 5.5389985942;
  let ETH = 4.7611057086;
  let DOGE = 4.5899453510;
  
  let mappedBTC = customSigmoid(BTC);
  let mappedETH = customSigmoid(ETH);
  let mappedDOGE = customSigmoid(DOGE);
  
  console.log(`Mapped BTC: ${mappedBTC}`);
  console.log(`Mapped ETH: ${mappedETH}`);
  console.log(`Mapped DOGE: ${mappedDOGE}`);
  