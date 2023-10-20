// ========================================================
//                     HIGH
// ========================================================

async function addHigh(newValue, web3, contract) {
    try {
        // Ensure you have the sender's Ethereum address and private key
        const senderAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"; // Replace with the sender's address
        const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Replace with the sender's private key

        // Unlock the sender's account
        await web3.eth.accounts.wallet.add(privateKey);

        // Construct the transaction data
        const data = contract.methods.addHigh(newValue).encodeABI();


        // Estimate the gas required for the transaction
        const gas = await web3.eth.estimateGas({
            to: "0x5FbDB2315678afecb367f032d93F642f64180aa3",
            from: senderAddress,
            data,
        });

        // Create and sign the transaction
        const nonce = await web3.eth.getTransactionCount(senderAddress);
        const tx = {
            from: senderAddress,
            to: "0x5FbDB2315678afecb367f032d93F642f64180aa3",
            gas,
            gasLimit,
            maxFeePerGas,
            maxPriorityFeePerGas,
            data,
            nonce,
        };
        console.log("tx : ", tx);
        const signedTx = await web3.eth.accounts.signTransaction(tx, privateKey);

        // Send the transaction
        const receipt = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);

        console.log('Transaction Hash:', receipt.transactionHash);
    } catch (error) {
        console.error('Error setting Twitter followers:', error);
    }
}

async function getHigh(contract) {
    const data = contract.methods.getHigh().encodeABI();
    const result = await contract.methods.getHigh().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: data }, blockParameter);
    console.log("The Open array currently is :  ", result);
    return result;
}

module.exports = {addHigh,getHigh};