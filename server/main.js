const express = require("express");
const app = express();
const fs = require("fs");
const port = 6969;
const { Web3 } = require('web3');
require('dotenv').config();
const contractAddressArray = ["0x89F901ae61DaBc7df104137DfeF621c260f65C25", "", "", "", "", "", "", "", ""]; // change to where the contract for each token is deployed
// const blockParameter = 'latest';
// const gasLimit = 200000; // Set your desired gas limit
// // If you are using an EIP-1559 transaction, also set the following parameters:
// const maxPriorityFeePerGas = '1000000000'; // Replace with your desired maxPriorityFeePerGas
// const maxFeePerGas = '2000000000'; // Replace with your desired maxFeePerGas
const TOKENS = ["ARB", "BNB", "BTC", "DOGE", "ETH", "OP", "PEPE", "PUSH", "USDT"]
let contractABIArray = ["", "", "", "", "", "", "", "", ""];

for (let i = 0; i < TOKENS.length; i++) {
    fs.readFile(`../contracts/out/${TOKENS[i]}.sol/${TOKENS[i]}.json`, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading JSON file:', err);
        } else {
            try {
                const jsonData = JSON.parse(data);
                const ABI = jsonData.abi;
                contractABIArray[i] = ABI;
                // You can now work with the JSON data in your app
            } catch (parseError) {
                console.error('Error parsing JSON:', parseError);
            }
        }
    });
}

// const { addClose, getClose } = require("./Params/CLOSE/close");
// const { setGithubCommits, getGithubCommits } = require("./Params/GITHUB/github");
// const { addHigh, getHigh } = require("./Params/HIGH/high");
// const { addLow, getLow } = require("./Params/LOW/low");
// const { addMarketCap, getMarketCap } = require("./Params/MARKET-CAP/market-cap");
// const { setMarkets, getMarkets } = require("./Params/MARKETS/markets");
// const { addOpen, getOpen } = require("./Params/OPEN/open");
// const { setTwitterFollowers, getTwitterFollowers } = require("./Params/TWITTER/twitter");


app.use(express.json()); // to get the data in json format
app.use(express.urlencoded({ extended: true })); // to get the form data

app.set("view engine", "ejs");
app.use(express.static("public")); // to view static files

// ========================================================
//                     ROUTES
// ========================================================

app.post("/tokens/:token/update/Twitter_Followers", async (req, res) => {
    if (TOKENS.includes(req.params.token)) {

    }
})

app.get("/tokens/:token", async (req, res) => {
    if (TOKENS.includes(req.params.token)) {
        console.log(req.params.token);
        const web3 = new Web3(process.env.RPC_URL);
        let contractAddress;
        let contractABI;
        for (let i = 0; i < TOKENS.length; i++) {
            if (TOKENS[i] == req.params.token) {
                contractAddress = contractAddressArray[i];
                contractABI = contractABIArray[i];
                break;
            }
        }
        console.log("ABI", contractABI);
        console.log("Address", contractAddress);
        // const contract = new web3.eth.Contract(contractABI, contractAddress);
        res.status(200).render("index", { token: req.params.token, contractABI: contractABI, contractAddress: contractAddress });
    }
});

app.listen(port, () => {
    console.log(`App listening at port ${port}`);
});
// Open.forEach((element, index) => {
//     Open[index] = element / BigInt(1e10);
// });

// Close.forEach((element, index) => {
//     Close[index] = element / BigInt(1e10);
// });

// High.forEach((element, index) => {
//     High[index] = element / BigInt(1e10);
// });

// Low.forEach((element, index) => {
//     Low[index] = element / BigInt(1e10);
// });

// MarketCap.forEach((element, index) => {
//     MarketCap[index] = element / BigInt(1e10);
// });

// token: req.params.token, twitter_followers: (Twitter_Followers) / BigInt(1e10), Github_Commits: (Github_Commits) / BigInt(1e10), Markets: (Markets) / BigInt(1e10), Open: Open[Open.length - 1], Close: Close[Close.length - 1], High: High[High.length - 1], Low: Low[Low.length - 1], MarketCap: MarketCap[MarketCap.length - 1] 