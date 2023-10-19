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

// =================================================================
//                     SET EVENT LISTENER
// =================================================================



function Listen_For_Events(contract) {
    const eventSubscription = contract.events["twitter_followers_changed", "markets_changed", "github_commits_changed", "open_Added", "close_Added", "high_Added", "low_Added", "volume_Added", "marketCap_Added"]({
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

// =================================================================
//                     TWITTER
// =================================================================

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

async function getTwitterFollowers(contract) {
    const data = contract.methods.getTwitterFollowers().encodeABI();
    const result = await contract.methods.getTwitterFollowers().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: data }, blockParameter);
    console.log("The number of Twitter Followers for this token currently are ", result);
    return result;
}

// =================================================================
//                    GITHUB
// =================================================================

async function setGithubCommits(newValue, web3, contract) {
    try {
        // Ensure you have the sender's Ethereum address and private key
        const senderAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"; // Replace with the sender's address
        const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Replace with the sender's private key

        // Unlock the sender's account
        await web3.eth.accounts.wallet.add(privateKey);

        // Construct the transaction data
        const data = contract.methods.update_github_commits(newValue).encodeABI();


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

async function getGithubCommits(contract) {
    const data = contract.methods.get_github_commits().encodeABI();
    const result = await contract.methods.get_github_commits().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: data }, blockParameter);
    console.log("The number of Github Commits for this token currently are ", result);
    return result;
}

// =================================================================
//                    MARKETS
// =================================================================

async function setMarkets(newValue, web3, contract) {
    try {
        // Ensure you have the sender's Ethereum address and private key
        const senderAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"; // Replace with the sender's address
        const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Replace with the sender's private key

        // Unlock the sender's account
        await web3.eth.accounts.wallet.add(privateKey);

        // Construct the transaction data
        const data = contract.methods.update_markets(newValue).encodeABI();


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

async function getMarkets(contract) {
    const data = contract.methods.getMarkets().encodeABI();
    const result = await contract.methods.getMarkets().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: data }, blockParameter);
    console.log("The number of Github Commits for this token currently are ", result);
    return result;
}

// ========================================================
//                     OPEN
// ========================================================

async function addOpen(value, web3, contract) {
    try {
        // Ensure you have the sender's Ethereum address and private key
        const senderAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"; // Replace with the sender's address
        const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Replace with the sender's private key

        // Unlock the sender's account
        await web3.eth.accounts.wallet.add(privateKey);

        // Construct the transaction data
        const data = contract.methods.addOpen(newValue).encodeABI();


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

async function getOpen(contract) {
    const data = contract.methods.getOpen().encodeABI();
    const result = await contract.methods.getOpen().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: data }, blockParameter);
    console.log("The Open array currently is :  ", result);
    return result;
}

// ========================================================
//                     CLOSE
// ========================================================

async function addClose(value, web3, contract) {
    try {
        // Ensure you have the sender's Ethereum address and private key
        const senderAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"; // Replace with the sender's address
        const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Replace with the sender's private key

        // Unlock the sender's account
        await web3.eth.accounts.wallet.add(privateKey);

        // Construct the transaction data
        const data = contract.methods.addClose(newValue).encodeABI();


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

async function getClose(contract) {
    const data = contract.methods.getClose().encodeABI();
    const result = await contract.methods.getClose().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: data }, blockParameter);
    console.log("The Open array currently is :  ", result);
    return result;
}


// ========================================================
//                     HIGH
// ========================================================

async function addHigh(value, web3, contract) {
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


// ========================================================
//                     LOW
// ========================================================

async function addLow(value, web3, contract) {
    try {
        // Ensure you have the sender's Ethereum address and private key
        const senderAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"; // Replace with the sender's address
        const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Replace with the sender's private key

        // Unlock the sender's account
        await web3.eth.accounts.wallet.add(privateKey);

        // Construct the transaction data
        const data = contract.methods.addLow(newValue).encodeABI();


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

async function getLow(contract) {
    const data = contract.methods.getLow().encodeABI();
    const result = await contract.methods.getLow().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: data }, blockParameter);
    console.log("The Open array currently is :  ", result);
    return result;
}

// ========================================================
//                     MARKET-CAP
// ========================================================

async function addMarketCap(value, web3, contract) {
    try {
        // Ensure you have the sender's Ethereum address and private key
        const senderAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"; // Replace with the sender's address
        const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Replace with the sender's private key

        // Unlock the sender's account
        await web3.eth.accounts.wallet.add(privateKey);

        // Construct the transaction data
        const data = contract.methods.addMarketCap(newValue).encodeABI();


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

async function getMarketCap(contract) {
    const data = contract.methods.getMarketCap().encodeABI();
    const result = await contract.methods.getMarketCap().call({ to: "0x5FbDB2315678afecb367f032d93F642f64180aa3", from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", data: data }, blockParameter);
    console.log("The Open array currently is :  ", result);
    return result;
}

// ========================================================
//                     ROUTES
// ========================================================

app.get("/:token", async (req, res) => {
    if (req.params.token == "favicon.ico") { } else {
        console.log(req.params.token);
        const web3 = new Web3('http://127.0.0.1:8545');
        const contract = new web3.eth.Contract(contractABI, contractAddress);
        const Twitter_Followers = await getTwitterFollowers(contract);
        await setTwitterFollowers(4200042, web3, contract);
        const Github_Commits = await getGithubCommits(contract);
        await setGithubCommits(69, web3, contract);
        const Markets = await getMarkets(contract);
        await setMarkets(69, web3, contract);
        await addOpen(69, web3, contract);
        const Open = await getOpen(contract);
        await addClose(69, web3, contract);
        const Close = await getClose(contract);
        await addHigh(69, web3, contract);
        const High = await getHigh(contract);
        await addLow(69, web3, contract);
        const Low = await getLow(contract);
        await addMarketCap(69, web3, contract);
        const MarketCap = await getMarketCap(contract);

        Listen_For_Events(contract);
        res.status(200).render("index", { token: req.params.token, twitter_followers: Twitter_Followers, Github_Commits: Github_Commits, Markets: Markets, Open: Open, Close: Close, High: High, Low: Low, MarketCap: MarketCap });
    }
});

app.listen(port, () => {
    console.log(`App listening at port ${port}`);
});