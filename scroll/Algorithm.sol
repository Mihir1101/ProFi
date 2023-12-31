// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Algorithm is Ownable {
    // =========================================================
    //                      Safe Math
    // =========================================================

    function SafeSub(uint256 a, uint256 b) public pure returns (uint256) {
        if (a < b) {
            return (b - a);
        } else {
            return (a - b);
        }
    }

    // ========================================================
    //        Storage Variables, events and constructors
    // ========================================================

    uint256[] private open;
    uint256[] private close;
    uint256[] private high;
    uint256[] private low;
    uint256[] private volume;
    uint256[] private marketCap;
    uint256 private markets;
    uint256 private github_commits;
    uint256[] private algo_array;

    constructor(address initialOwner) Ownable(initialOwner) {
        open = new uint256[](0);
        close = new uint256[](0);
        high = new uint256[](0);
        low = new uint256[](0);
        volume = new uint256[](0);
        marketCap = new uint256[](0);
        markets = 0;
        github_commits = 0;
        algo_array = new uint256[](0);
    }

    // ========================================================
    //         Functions to add data into the array
    // ========================================================

    function addOpen(uint256 item) public onlyOwner {
        open.push(item);
    }

    function addClose(uint256 item) public onlyOwner {
        close.push(item);
    }

    function addHigh(uint256 item) public onlyOwner {
        high.push(item);
    }

    function addLow(uint256 item) public onlyOwner {
        low.push(item);
    }

    function addVolume(uint256 item) public onlyOwner {
        volume.push(item);
    }

    function addMarketCap(uint256 item) public onlyOwner {
        marketCap.push(item);
    }

    function update_markets(uint256 item) public onlyOwner {
        markets = item;
    }

    function update_github_commits(uint256 item) public onlyOwner {
        github_commits = item;
    }

    // ========================================================
    //            Functions to get the data arrays
    // ========================================================

    function getParams()
        public
        view
        returns (
            uint256[] memory,
            uint256[] memory,
            uint256[] memory,
            uint256[] memory,
            uint256[] memory,
            uint256[] memory,
            uint256,
            uint256,
            uint256[] memory
        )
    {
        return (
            open,
            close,
            high,
            low,
            volume,
            marketCap,
            markets,
            github_commits,
            algo_array
        );
    }

    // ============================================================
    //           Functions used in the algorithm
    // ============================================================

    function normalize_between_zero_and_1e10(
        uint256 value
    ) public pure returns (uint256) {
        unchecked {
            while (value > 1e10) {
                value /= 10;
            }
            while (value < 0) {
                value *= 10;
            }
        }
        return uint256(value);
    }

    function check_size(
        uint256 value1,
        uint256 value2
    ) public pure returns (uint256) {
        unchecked {
            if (value1 > value2) {
                return uint256(1);
            } else {
                return uint256(0);
            }
        }
    }

    function abs(int256 n) internal pure returns (uint256) {
        unchecked {
            return uint256(n >= 0 ? n : -n);
        }
    }

    function generate_algo_array() public {
        for (uint256 i = 0; i < (open.length - 1); i++) {
            uint256 first;
            if (high[i] > low[i]) {
                first = high[i] - low[i];
            } else {
                first = low[i] - high[i];
            }
            uint256 second;
            if (close[i] > open[i]) {
                second = close[i] - open[i];
            } else {
                second = open[i] - close[i];
            }
            uint256 result;
            if (second == 0) {
                result = 1e10;
            } else {
                result = ((first * 1e10) / (second));
            }
            uint256 algo = (2 * normalize_between_zero_and_1e10(result)) +
                (2 *
                    (
                        SafeSub(
                            1e10,
                            (SafeSub(marketCap[i], marketCap[i + 1]) / 1e11)
                        )
                    )) +
                (2 *
                    (
                        SafeSub(
                            1e10,
                            (SafeSub(volume[i], volume[i + 1]) / 1e11)
                        )
                    )) +
                (1 * ((markets) / 1e4)) +
                (2 * ((github_commits) / 1e5)) +
                (1e10 * check_size(close[i], open[i]));

            algo_array.push(algo);
        }
    }

    function return_safeness_score() public view returns (uint256) {
        uint256 score_sum = 0;
        for (uint256 i = 0; i < algo_array.length; i++) {
            score_sum = score_sum + algo_array[i];
        }
        return ((score_sum) / algo_array.length);
    }
}
