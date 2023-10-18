const express = require("express");
const app = express();
const fs = require("fs");
const port = 6969;
const { Web3 } = require('web3');
const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
const blockParameter = 'latest';
const gasLimit = 200000; // Set your desired gas limit

// If you are using an EIP-1559 transaction, also set the following parameters:
const maxPriorityFeePerGas = '1000000000'; // Replace with your desired maxPriorityFeePerGas
const maxFeePerGas = '2000000000'; // Replace with your desired maxFeePerGas


let contractABI = "";

fs.readFile('../contracts/out/Algorithm.sol/Algorithm.json', 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading JSON file:', err);
    } else {
        try {
            const jsonData = JSON.parse(data);
            contractABI = jsonData.abi;
            // You can now work with the JSON data in your app
        } catch (parseError) {
            console.error('Error parsing JSON:', parseError);
        }
    }
});

app.use(express.json()); // to get the data in json format
app.use(express.urlencoded({ extended: true })); // to get the form data

app.set("view engine", "ejs");
app.use(express.static("public")); // to view static files

async function setTwitterFollowers(newValue, web3, contract) {
    try {
        // Ensure you have the sender's Ethereum address and private key
        const senderAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"; // Replace with the sender's address
        const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Replace with the sender's private key

        // Unlock the sender's account
        await web3.eth.accounts.wallet.add(privateKey);

        // Construct the transaction data
        const data = contract.methods.update_twitter_followers(newValue).encodeABI();


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

function Listen_For_Events(contract) {
    const eventSubscription = contract.events["twitter_followers_changed"]({
        fromBlock: 'latest', // Start listening from the latest block
        toBlock: 'latest',   // End listening at the latest block
    })
    eventSubscription.on('data', (event) => {
        console.log('Event data:', event.returnValues); // Access event data
    })
    eventSubscription.on('changed', (event) => {
        // Handle event removal (e.g., due to chain reorganization)
    })
    eventSubscription.on('error', (error) => {
        console.error('Error:', error);
    });

}


app.get("/:token", async (req, res) => {
    if (req.params.token == "favicon.ico") { } else {
        console.log(req.params.token);
        const web3 = new Web3('http://127.0.0.1:8545');
        const contract = new web3.eth.Contract(contractABI, contractAddress);
        const result = await contract.methods.getTwitterFollowers().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: "0xb37f2e2b" }, blockParameter);
        console.log("The number of Twotter Followers for this token currently are ", result);
        await setTwitterFollowers(4200042, web3, contract);
        Listen_For_Events(contract);
        res.status(200).render("index", { token: req.params.token });
    }
});

app.listen(port, () => {
    console.log(`App listening at port ${port}`);
});