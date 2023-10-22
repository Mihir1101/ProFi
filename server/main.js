const express = require("express");
const app = express();
const fs = require("fs");
const port = 6969;
const { Web3 } = require('web3');
require('dotenv').config();
const SepoliaContractAddressArray = ["ARB", "BNB", "0xEf68a0a81E65FCcC8e8E934B48CE7cc8d13B6055", "0x48424D7C9A7C44EC0ad3C73d983E20E248aBD4d3", "0xd0eF0811Cb353a8d5c09AAbE7acf1CD0776d09CE", "OP", "PEPE", "PUSH", "USDT"];
const FileCoinContractAddressArray = ["ARB", "BNB", "0xE6dD79C6D7C1B959E6DD87838ed8cA571c632172", "0x7bb3aF97694802B4665cf74079376d2167Bf03d5", "0xD043f19c25a83903788C95CE39a8Be0064896a4e", "OP", "PEPE", "PUSH", "USDT"];
const MantleContractAddressArray = ["ARB", "BNB", "0x7d1bB6B83EdCB9378d3C4647E218BCB1Dea19CCE", "0x79bd4b4c662810f049171FDEb3563826b12Df65B", "0xE6dD79C6D7C1B959E6DD87838ed8cA571c632172", "OP", "PEPE", "PUSH", "USDT"];
const TOKENS = ["ARB", "BNB", "BTC", "DOGE", "ETH", "OP", "PEPE", "PUSH", "USDT"]
let contractABIArray = ["", "", "", "", "", "", "", "", ""];
let DeployerArray = ["ARB", "BNB", "0x0c0a01d30bc2efc35954dfba5c498069f5ceedb2", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "OP", "PEPE", "PUSH", "USDT"];

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
app.use(express.static("./public")); // to view static files

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
                contractAddress = FileCoinContractAddressArray[i];
                contractABI = contractABIArray[i];
                Deployer = DeployerArray[i];
                break;
            }
        }
        console.log("ABI", contractABI);
        console.log("Address", contractAddress);
        // const contract = new web3.eth.Contract(contractABI, contractAddress);
        res.status(200).render("index", { token: req.params.token, contractABI: contractABI, contractAddress: contractAddress, Deployer: Deployer });
    }
});

app.listen(port, () => {
    console.log(`App listening at port ${port}`);
});