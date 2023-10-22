const express = require("express");
const app = express();
const fs = require("fs");
const port = 6969;
const { Web3 } = require('web3');
require('dotenv').config();
const SepoliaContractAddressArray = ["ARB", "BNB", "0xEf68a0a81E65FCcC8e8E934B48CE7cc8d13B6055", "0x48424D7C9A7C44EC0ad3C73d983E20E248aBD4d3", "0xd0eF0811Cb353a8d5c09AAbE7acf1CD0776d09CE", "OP", "PEPE", "PUSH", "USDT", "APE"];
const FileCoinContractAddressArray = ["0x257A6EF09e1d6534873b2889e1Aca43465BafF9f", "0x3f8B911e8d65e81dF19A0AaA6172f8c86033765c", "0x6F6f7A59515b362E33D73a34557A083D8290b846", "0x7bb3aF97694802B4665cf74079376d2167Bf03d5", "0xD043f19c25a83903788C95CE39a8Be0064896a4e", "0xA9A8E66Af3FF353577E79e7872c37B6d8466bC68", "0xf408e12a869f3b7B39B9680dEbA8179819724403", "0x2390D8A5b111bF8de8024acA6899C00668415EA4", "0xD759Ea32961Aaf6D3e09c1d731d8f1e3592Ad005", "APE"];
const MantleContractAddressArray = ["0x8AaFabC0711Cd5508f1B775e78BB40cd6296cFe5", "0x7FAe0edA5Ce5113F4F6dCAc3c3252EA1a4F70Eb6", "0x7d1bB6B83EdCB9378d3C4647E218BCB1Dea19CCE", "0x79bd4b4c662810f049171FDEb3563826b12Df65B", "0xE6dD79C6D7C1B959E6DD87838ed8cA571c632172", "0xFdf49CEAd5fb56a740964751E474ecD730DCE40f", "0x88764Ee0AD40004621194f27b9D6D77CE090AD0C", "0x46de9190a00A27c1a8F7Cf760cb3Ad8625E48556", "0x0E414Ab9b0A21FB5c0C15A06900FEa78B886ab36", "0xD759Ea32961Aaf6D3e09c1d731d8f1e3592Ad005"];
const TOKENS = ["ARB", "BNB", "BTC", "DOGE", "ETH", "OP", "PEPE", "PUSH", "USDT", "APE"]
let contractABIArray = ["", "", "", "", "", "", "", "", ""];
let DeployerArray = ["0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b", "0x7DB89eEadF8a526e7EDaedCF3DdBd0452B7F4c8b"];

for (let i = 0; i < TOKENS.length; i++) {
    fs.readFile(`./out/${TOKENS[i]}.sol/${TOKENS[i]}.json`, 'utf8', (err, data) => {
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
                contractAddress = MantleContractAddressArray[i];
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