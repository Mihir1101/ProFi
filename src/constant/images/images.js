import aave from '../../stock/tokens/aave-aave-logo.svg';
import btc from '../../stock/tokens/bitcoin-btc-logo.png';
import eth from '../../stock/tokens/ethereum-eth-logo.png';
import link from '../../stock/tokens/chainlink-link-logo.svg';
import matic from '../../stock/tokens/polygon-matic-logo.svg';
import doge from '../../stock/tokens/dogecoin-doge-logo.svg';
import ltc from '../../stock/tokens/litecoin-ltc-logo.svg';
import none from '../../stock/tokens/null.png';
import BNB from '../../stock/tokens/bnb.png';
import USDT from '../../stock/tokens/usdt.png';
import APE from '../../stock/tokens/ape.png';

export function tokenImage(id) {
  switch (id) {
    case 'AAVE':
      return aave;
    case 'BTC':
      return btc;
    case 'ETH':
      return eth;
    case 'LINK':
      return link;
    case 'MATIC':
      return matic;
    case 'DOGE':
      return doge;
    case 'LTC':
      return ltc;
    case 'BNB':
      return BNB;
    case 'USDT':
      return USDT;
    case 'APE':
      return APE;
    default:
      return none;
  }
}