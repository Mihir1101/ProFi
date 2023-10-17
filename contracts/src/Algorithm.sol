// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Algorithm is Ownable {
    // scale all of them by 1e10
    uint256[] private open;
    uint256[] private close;
    uint256[] private high;
    uint256[] private low;
    uint256[] private volume;
    uint256[] private marketCap;
    uint256 private markets;
    uint256 private twitter_followers;
    uint256 private github_commits;
    uint256[] private algo_array;

    event open_Added(uint256 item);
    event close_Added(uint256 item);
    event high_Added(uint256 item);
    event low_Added(uint256 item);
    event volume_Added(uint256 item);
    event marketCap_Added(uint256 item);
    event markets_changed(uint256 item);
    event twitter_followers_changed(uint256 item);
    event github_commits_changed(uint256 item);

    constructor () {
        open = [];
        close = [];
        high = [];
        low = [];
        volume = [];
        marketCap = [];
        markets = 0;
        twitter_followers = 0;
        github_commits = 0;
        algo_array = [];
    }

    function addOpen(uint256 item) public onlyOwner {
        open.push(item);
        emit open_Added(item);
    }

    function addClose(uint256 item) public onlyOwner {
        close.push(item);
        emit close_Added(item);
    }

    function addHigh(uint256 item) public onlyOwner {
        high.push(item);
        emit high_Added(item);
    }

    function addLow(uint256 item) public onlyOwner {
        low.push(item);
        emit low_Added(item);
    }

    function addVolume(uint256 item) public onlyOwner {
        volume.push(item);
        emit volume_Added(item);
    }

    function addMarketCap(uint256 item) public onlyOwner {
        marketCap.push(item);
        emit marketCap_Added(item);
    }

    function markets_changed(uint256 item) public onlyOwner {
        markets = item;
        emit markets_changed(item);
    }

    function twitter_followers_changed(uint256 item) public onlyOwner {
        twitter_followers = item;
        emit twitter_followers_changed(item);
    }

    function github_commits_changed(uint256 item) public onlyOwner {
        github_commits = item;
        emit github_commits_changed(item);
    }

    // Function to get the current array
    function getOpen() public view returns (uint256[] memory) {
        return open;
    }

    function getClose() public view returns (uint256[] memory) {
        return close;
    }

    function getHigh() public view returns (uint256[] memory) {
        return high;
    }

    function getLow() public view returns (uint256[] memory) {
        return low;
    }

    function getOpen() public view returns (uint256[] memory) {
        return open;
    }


    function normalize_between_zero_and_one (uint256 value) public pure returns (uint256) {
        unchecked {
            while (value >= 1) {
                value /= 10;
            }
            while (value < 0) {
                value *= 10;
            }
        }
        return value;
    }

    function check_size(uint256 value1 , uint256 value2) public pure returns (uint256) {
        unchecked {
            if(value1 > value2) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    function abs(int256 n) internal pure returns (uint256) {
        unchecked {
            return uint256(n >= 0 ? n : -n);
        }
    }
    
    function generate_algo_array () public onlyOwner {
        for (uint256 i = 0; i < (open.length - 1) ; i++) {
            uint256 algo = (2 * normalize_between_zero_and_one(abs((((high[i] - low[i]) * 1e10) / (close[i] - open[i]))))) + 
                           (2 * (1 - (abs(marketCap[i] - marketCap[i+1])) / 100000000000)) + 
                           (2 * (1 - (abs(volume[i] - volume[i+1])) / 100000000000)) + 
                           (1 * ((markets) / 10000)) + 
                           (2 * ((github_commits) / 100000)) + 
                           (check_size(close[i], open[i]));


            algo_array.push(algo);
        }
    }

    function return_safeness_score () private 
}
