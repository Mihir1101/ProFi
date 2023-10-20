import React from 'react'
import PageButton from './PageButton'

const ConnectButton = props => {
  const { isConnected, signerAddress, getSigner, provider } = props
  const displayAddress = `${signerAddress?.substring(0,10)}...`

  return (
    <>
      {isConnected() ? (
        <div className="buttonContainer">
          <PageButton name={displayAddress} />
        </div>
      ) : (
        <div
          className="connectButton"
          onClick={() => getSigner(provider)}
        >
          Connect Wallet
        </div>
      )}
    </>
  )
}

export default ConnectButton