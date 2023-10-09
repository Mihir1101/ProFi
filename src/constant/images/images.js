import aave from '../../stock/tokens/aave-aave-logo.svg';
import btc from '../../stock/tokens/bitcoin-btc-logo.png';
import eth from '../../stock/tokens/ethereum-eth-logo.png';
import link from '../../stock/tokens/chainlink-link-logo.svg';
import matic from '../../stock/tokens/polygon-matic-logo.svg';
import doge from '../../stock/tokens/dogecoin-doge-logo.svg';
import ltc from '../../stock/tokens/litecoin-ltc-logo.svg';
import none from '../../stock/tokens/null.png';

export function tokenImage(id) {
  switch (id) {
    case 'AAVE/USD':
      return aave;
    case 'BTC/USD':
      return btc;
    case 'ETH/USD':
      return eth;
    case 'LINK/USD':
      return link;
    case 'MATIC/USD':
      return matic;
    case 'DOGE/USD':
      return doge;
    case 'LTC/USD':
      return ltc;
    default:
      return none;
  }
}