const express = require("express");
const app = express();
const fs = require("fs");
const port = 6969;
const { Web3 } = require('web3');
require('dotenv').config();
const contractAddressArray = ["0x7512fBd4A1186Dc1F465D3F60a9a323c72d406CA", "", "", "", "", "", "", "", ""];
const TOKENS = ["ARB", "BNB", "BTC", "DOGE", "ETH", "OP", "PEPE", "PUSH", "USDT"]
let contractABIArray = ["", "", "", "", "", "", "", "", ""];
let DeployerArray = ["0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b","","","","","","","",""];

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

app.use(express.json()); // to get the data in json format
app.use(express.urlencoded({ extended: true })); // to get the form data

app.set("view engine", "ejs");
app.use(express.static("public")); // to view static files

// ========================================================
//                     ROUTES
// ========================================================

app.get("/tokens/:token", async (req, res) => {
    if (TOKENS.includes(req.params.token)) {
        console.log(req.params.token);
        const web3 = new Web3(process.env.RPC_URL);
        let contractAddress;
        let contractABI;
        let Deployer;
        for (let i = 0; i < TOKENS.length; i++) {
            if (TOKENS[i] == req.params.token) {
                contractAddress = contractAddressArray[i];
                contractABI = contractABIArray[i];
                Deployer = DeployerArray[i];
                break;
            }
        }
        console.log("ABI", contractABI);
        console.log("Address", contractAddress);
        // const contract = new web3.eth.Contract(contractABI, contractAddress);
        res.status(200).render("index", { token: req.params.token, contractABI: contractABI, contractAddress: contractAddress,Deployer : Deployer });
    }
});

app.listen(port, () => {
    console.log(`App listening at port ${port}`);
});