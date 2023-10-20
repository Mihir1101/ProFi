let GetParams = document.getElementById("get_params");
let GenAlgo = document.getElementById("gen_algo");
let GetSafeness = document.getElementById("get_safeness");
let params = document.getElementById("params");
let algo = document.getElementById("algo");
let Safeness = document.getElementById("Safeness");

GetParams.addEventListener("click", async () => {
    if (web3.currentProvider.isMetaMask) {
        const accounts = await web3.eth.getAccounts();
        if (accounts.length === 0) {
            console.log("No Ethereum account connected.");
            return;
        }

        const senderAddress = accounts[0];
        let contract = <% - JSON.stringify(contract) %>;
        let ContractAddress = <% - JSON.stringify(ContractAddress) %>;
        const data = contract.methods.getParams().encodeABI();
        const gas = await contract.methods.getParams().estimateGas({ to: ContractAddress, from: senderAddress, data });
        const nonce = await web3.eth.getTransactionCount(senderAddress);

        const tx = {
            from: senderAddress,
            to: ContractAddress,
            gas,
            data,
            nonce,
        };
        const result = await web3.eth.sendTransaction(tx);
        params.innerHTML = result;
        console.log('Transaction Hash:', result.transactionHash);
    }
})