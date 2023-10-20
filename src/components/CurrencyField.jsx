import React from 'react'

const CurrencyField = props => {
  const getPrice = (value) => {
    props.getSwapPrice(value)
  }

  return (
    <div className="currencyInput">
      <div className="numberContainer">
        {props.loading ? (
          <div className="btn-grad">
            <props.spinner />
          </div>
        ) : (
          <input
            className="btn-grad"
            placeholder="0.0"
            value={props.value}
            onBlur={e => (props.field === 'input' ? getPrice(e.target.value) : null)}
          />
        )}
      </div>
      <div className="tokenContainer">
        <span className="tokenName">{props.tokenName}</span>
        <div className="balanceContainer">
          <span className="balanceAmount">Balance: {props.balance?.toFixed(3)}</span>
        </div>
      </div>
    </div>
  )
}

export default CurrencyField