// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";

contract OP is Ownable {
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
        open = [
            11649688073,
            6484381436,
            5078333824,
            5379707592,
            5207063533,
            5337632101,
            5794995384,
            9214857557,
            15854996370,
            19109411083,
            14416499637,
            11760689417,
            10512954007,
            11730017183,
            14008228320,
            9276278518,
            9051799264,
            8424562386,
            8437949105,
            6982818479,
            8318550559,
            10430287779,
            12888631064,
            9013921432,
            8476868768,
            8839502167,
            10700684073,
            10154776322,
            9266460606,
            9329488082,
            9231003536,
            12607283494,
            18237747370,
            21823202604,
            23775676909,
            29373524650,
            23352754747,
            25772924626,
            30121056817,
            24298612150,
            23491867594,
            27062763271,
            22659465240,
            22011286912,
            22872052742,
            26919082942,
            22021617061,
            21747332736,
            18909857911,
            16357485428,
            16360275214,
            16454650896,
            14803327680,
            10935292754,
            10986148207,
            13340381317,
            13336808582,
            12138555898,
            14880363063,
            15812732777,
            16189703629,
            17016114352,
            15392850428,
            14725296253,
            14518432264,
            13376559440,
            12689451869,
            13733881266,
            12638082687
        ];
        close = [
            6335132507,
            4005076852,
            4593829155,
            5081378353,
            5147598884,
            4147198553,
            5658829284,
            7500029592,
            13699413325,
            13935853538,
            10958736133,
            9942643608,
            10325460141,
            10737805797,
            9190896925,
            8666899928,
            8391705429,
            8269517218,
            6577986746,
            6394923332,
            7955926572,
            9522229766,
            7735323413,
            8399152404,
            8051268727,
            8440133673,
            9927727383,
            9033153542,
            8739448783,
            8835306559,
            9110496369,
            12092790819,
            16188290515,
            19449290048,
            20670166565,
            23049161011,
            20878675735,
            23512807986,
            22635425356,
            17937620160,
            22699725445,
            21454766451,
            20254229487,
            21080515809,
            21911516709,
            21564470491,
            21152010162,
            18165537851,
            14903231265,
            16065017345,
            15604825726,
            13512226607,
            10556886386,
            10592367037,
            10897280408,
            11856502218,
            11793809812,
            11644608983,
            14212043616,
            14299507660,
            15571744958,
            15267692557,
            12857196000,
            14366268673,
            12893175204,
            12401248773,
            12310060928,
            12621794568,
            12369734261
        ];
        high = [
            13602157263,
            6657616487,
            6469158315,
            6106746478,
            6209041100,
            6128412907,
            9699201855,
            19146395887,
            22171345301,
            20546254157,
            15980659813,
            13493098745,
            12940630403,
            14653604230,
            14233892745,
            9821746069,
            9881319684,
            8836060837,
            8505455499,
            8532791018,
            12267096771,
            13979910064,
            13833442383,
            9785824541,
            9619060318,
            11314442264,
            11138412863,
            11888067435,
            9785453984,
            9612931734,
            12625122580,
            18780347504,
            24774339727,
            25227057414,
            32093314824,
            31674664209,
            29812321946,
            32621825291,
            30906157392,
            25723775626,
            29450406415,
            27411184100,
            23360401343,
            23784043380,
            28132417071,
            27383224539,
            23409137802,
            21859702034,
            19108651215,
            18662272011,
            17155003396,
            16663842750,
            15406410935,
            11804786764,
            14877813196,
            13766641337,
            13688441954,
            15960087775,
            16377616714,
            16190368839,
            17458837611,
            18108835889,
            15725020509,
            16132032568,
            15195318290,
            13649924855,
            14351776715,
            14218538752,
            14189401556
        ];
        low = [
            6335132507,
            4005076852,
            4593829155,
            5081378353,
            5147598884,
            4147198553,
            5658829284,
            7500029592,
            13699413325,
            13935853538,
            10958736133,
            9942643608,
            10325460141,
            10737805797,
            9190896925,
            8666899928,
            8391705429,
            8269517218,
            6577986746,
            6394923332,
            7955926572,
            9522229766,
            7735323413,
            8399152404,
            8051268727,
            8440133673,
            9927727383,
            9033153542,
            8739448783,
            8835306559,
            9110496369,
            12092790819,
            16188290515,
            19449290048,
            20670166565,
            23049161011,
            20878675735,
            23512807986,
            22635425356,
            17937620160,
            22699725445,
            21454766451,
            20254229487,
            21080515809,
            21911516709,
            21564470491,
            21152010162,
            18165537851,
            14903231265,
            16065017345,
            15604825726,
            13512226607,
            10556886386,
            10592367037,
            10897280408,
            11856502218,
            11793809812,
            11644608983,
            14212043616,
            14299507660,
            15571744958,
            15267692557,
            12857196000,
            14366268673,
            12893175204,
            12401248773,
            12310060928,
            12621794568,
            12369734261
        ];
        volume = [
            1872009824800000000,
            581298796500000000,
            883635104300000128,
            220681139200000032,
            306226067600000000,
            1396939660000000000,
            1768040286399999744,
            2816019427500000256,
            1958648580100000000,
            1934450250100000000,
            1676175890700000000,
            1446335192800000000,
            1209423580600000000,
            2266393400300000000,
            1333870143100000000,
            720736456200000000,
            577138029900000000,
            297680211600000000,
            331588487300000000,
            1155603779000000000,
            1436057057700000000,
            1721859936399999744,
            831700054200000000,
            470768290400000000,
            288464628100000000,
            495911714600000000,
            326197699300000000,
            348144635900000064,
            295682190600000000,
            218444593600000000,
            1547483346300000000,
            2413867170900000256,
            3096635301899999744,
            2299964580200000000,
            3366724534600000000,
            2179889242000000000,
            2949782245600000000,
            4353619451100000256,
            2122170669100000000,
            4289785091000000000,
            2197923870600000000,
            963772739000000000,
            986887751900000000,
            612419164700000000,
            1255728892000000000,
            878096879900000000,
            594216597300000000,
            731822162300000000,
            551971532800000000,
            499023002200000000,
            504160466700000000,
            858933435300000000,
            879651858700000000,
            709291104400000000,
            13031469597500000256,
            8659007956400000000,
            5018332551600000000,
            10934873473199998976,
            10504277812600000512,
            7813500335200000000,
            11925820628199999488,
            9199959679600000000,
            8870782950700000256,
            8404892800900000768,
            6860329426000000000,
            3894862878399999488,
            5745209648099999744,
            4947999190899999744,
            5118216309399999488
        ];
        marketCap = [
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            3723609543700000256,
            4488013365299999744,
            3385457372099999744,
            2761421004900000256,
            2466982225600000000,
            2753592956600000512,
            3287617687900000256,
            2176839391600000000,
            2125473672600000000,
            1977445444300000000,
            1980672923000000000,
            1639333688000000000,
            1952999980900000000,
            2449189465500000256,
            3024589362400000000,
            2114134714500000000,
            1989882564500000000,
            2075424064800000000,
            2512368155600000000,
            2384103738400000000,
            2175065061800000000,
            2189267063700000000,
            2167006343500000000,
            2959841213100000256,
            4281424577699999744,
            5123713119100000256,
            5579912947600000000,
            6891783483300000768,
            5483944677699999744,
            6046577128400000000,
            7072433780700000256,
            7651235043099999232,
            7394272435299999744,
            8521008631399999488,
            7134869970000000000,
            6929757330000000000,
            7202691416799998976,
            8475335896300000256,
            6934322085800000512,
            6849686209099999232,
            5955049463900000256,
            5485867962800000000,
            5486069120000000000,
            5518980556599999488,
            9542554068999999488,
            7049130993400000512,
            7081586255100000256,
            8599506367500000256,
            8596352621299999744,
            7824350109099999232,
            9592457843299999744,
            10741017424999999488,
            10993815098900000768,
            12196178873900001280,
            11032336602699999232,
            10555112038400000000,
            10405353352899999744,
            10682466761300000768,
            10132978035299999744,
            10970317728699998208,
            10092521592999999488,
            11270201190100000768
        ];
        markets = 1990000000000;
        github_commits = 141060000000000;
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
