// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";

contract USDT is Ownable {
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
            5712490082,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            9999989867,
            10000200272,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            9999619722,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000100136,
            9999970198,
            9999719858,
            10000200272,
            9368550181,
            10356700420,
            10104000568,
            10027799606,
            10040500164,
            9972659945,
            10011099577,
            10072000027,
            10125499964,
            9915580153,
            9998469949,
            9957020283,
            10002499819,
            9990879893,
            9973229766,
            9992150000,
            10017000000,
            9968180000,
            9873860000,
            9949610642,
            10152846695,
            10047963135,
            10097858524,
            10005733379,
            10061735086,
            10030356967,
            9915383435,
            10035545961,
            10039185825,
            10030355956,
            10065377838,
            10018170883,
            9995707104,
            10002517879,
            10063404402,
            10035985485,
            10031737319,
            9996007328,
            9996457091,
            9998842776,
            10030563849,
            10015056200,
            10002004200,
            10003694299,
            10006139600,
            10008379500,
            10020868100,
            9999834400,
            9998711100,
            10004775600,
            10002011500,
            10004493400,
            10006315400,
            10001150115,
            10003824114,
            10004487156,
            10000933790,
            10005052670,
            10003594435,
            10003064639,
            10001520891,
            9993808858,
            9988602903,
            10003224782,
            10000142919,
            10000616343,
            9999557604,
            10000287017,
            9996796257,
            10001378741,
            10001689777,
            10000784290,
            10005551542,
            10002140882,
            9998185240,
            9999145877,
            9998128419
        ];
        close = [
            5683140159,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            9994540215,
            9996920228,
            9996640086,
            9998220205,
            9995160103,
            9999989867,
            9999319911,
            9999629855,
            9620580077,
            9998880029,
            9999970198,
            9999970198,
            9999539852,
            9999790192,
            8498089910,
            9998310208,
            9135389924,
            9193980098,
            9511889815,
            9696649909,
            9554039836,
            9664040208,
            9811649919,
            9556180239,
            9630889893,
            9714030027,
            9251440167,
            9796329737,
            9807779789,
            9829049706,
            9717360139,
            9797819853,
            9785410000,
            9645700000,
            9252840000,
            9457230000,
            9820764184,
            10041273143,
            9867687129,
            9932537975,
            9742064160,
            9766097888,
            9704940810,
            9769747514,
            9888114104,
            9936797525,
            9693534506,
            9813919232,
            9792621268,
            9865150328,
            9893978004,
            8994899733,
            9742148364,
            9711674657,
            9856512990,
            9905762982,
            9915392872,
            9903259206,
            9997414500,
            9980208300,
            9964889300,
            9939527400,
            9974125300,
            9987004100,
            9974040600,
            9986278100,
            9989527500,
            9989024200,
            9993671500,
            9981867834,
            9989666525,
            9980164828,
            9980090838,
            9998448987,
            10002233560,
            9999575867,
            9999698742,
            9484861079,
            9975466726,
            9987047154,
            9998860651,
            9998908263,
            9998615026,
            9815247356,
            9995986556,
            9995673635,
            10000251584,
            9991164142,
            9991963571,
            9994798750,
            9957605929,
            9991210184,
            9977963440,
            9989877145
        ];
        high = [
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10003900528,
            10025500059,
            10010700226,
            10003199577,
            10008100271,
            10065000057,
            10000100136,
            10001900196,
            10010700226,
            10010099411,
            10000000000,
            10000000000,
            10005700588,
            10005899668,
            10017900467,
            10003800392,
            10012899636,
            12098100185,
            10900000334,
            10397100449,
            10361399651,
            10507700443,
            10189100504,
            11059099436,
            10880000591,
            10698900223,
            10481799841,
            10241199732,
            10205899477,
            10193400383,
            10263700485,
            10141799450,
            10262300000,
            10333100000,
            10175500000,
            10178799999,
            10486951489,
            10481809967,
            10491157806,
            10534210690,
            10382064827,
            10303301066,
            10212506994,
            10212211101,
            10206184382,
            10572028117,
            10352391992,
            10306668162,
            10441609820,
            10259115609,
            10309587599,
            10848018246,
            10246366459,
            10604850700,
            10353091339,
            10202627853,
            10563730601,
            10290820472,
            10033111900,
            10024084400,
            10021778600,
            10032234900,
            10031432600,
            10041042700,
            10280454600,
            10019998800,
            10104249400,
            10014036600,
            10019376200,
            10018374350,
            10016680715,
            10330189504,
            10019989489,
            10011171699,
            10026831348,
            10008965101,
            10006806674,
            10003744240,
            9996112065,
            10003597930,
            10005739629,
            10004202218,
            10003458516,
            10005145777,
            10005725818,
            10005025703,
            10024961408,
            10296284355,
            10015296914,
            10021184521,
            10013906729,
            10014211849,
            10011281461,
            10009376649
        ];
        low = [
            5683140159,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            10000000000,
            9994540215,
            9996920228,
            9996640086,
            9998220205,
            9995160103,
            9999989867,
            9999319911,
            9999629855,
            9620580077,
            9998880029,
            9999970198,
            9999970198,
            9999539852,
            9999790192,
            8498089910,
            9998310208,
            9135389924,
            9193980098,
            9511889815,
            9696649909,
            9554039836,
            9664040208,
            9811649919,
            9556180239,
            9630889893,
            9714030027,
            9251440167,
            9796329737,
            9807779789,
            9829049706,
            9717360139,
            9797819853,
            9785410000,
            9645700000,
            9252840000,
            9457230000,
            9820764184,
            10041273143,
            9867687129,
            9932537975,
            9742064160,
            9766097888,
            9704940810,
            9769747514,
            9888114104,
            9936797525,
            9693534506,
            9813919232,
            9792621268,
            9865150328,
            9893978004,
            8994899733,
            9742148364,
            9711674657,
            9856512990,
            9905762982,
            9915392872,
            9903259206,
            9997414500,
            9980208300,
            9964889300,
            9939527400,
            9974125300,
            9987004100,
            9974040600,
            9986278100,
            9989527500,
            9989024200,
            9993671500,
            9981867834,
            9989666525,
            9980164828,
            9980090838,
            9998448987,
            10002233560,
            9999575867,
            9999698742,
            9484861079,
            9975466726,
            9987047154,
            9998860651,
            9998908263,
            9998615026,
            9815247356,
            9995986556,
            9995673635,
            10000251584,
            9991164142,
            9991963571,
            9994798750,
            9957605929,
            9991210184,
            9977963440,
            9989877145
        ];
        volume = [
            370500000000,
            6130700000000,
            25223800000000,
            4725750000000000,
            1102800000000,
            70216899999999,
            1429820000000000,
            263673000000000,
            6597240000000000,
            69951300000000,
            103850000000000,
            775323000000000,
            1477470000000000,
            4542780000000000,
            25802700000000000,
            13225500000000000,
            8930380000000000,
            9084760000000000,
            4025480000000000,
            10222200000000000,
            5171180000000000,
            7754400000000000,
            27629400000000000,
            55573100000000000,
            341158000000000000,
            237399000000000000,
            847399040000000000,
            725504000000000000,
            751848960000000000,
            1092170000000000000,
            1174110000000000000,
            1841820000000000000,
            10439699840000000000,
            19270100480000000000,
            26639301120000000000,
            24142300160000000000,
            17637199360000000000,
            44984401920000000000,
            26133399040000000000,
            25406200320000000000,
            32531000000000000000,
            26592300000000000000,
            33073200000000000000,
            21524700000000000000,
            40656622220899999744,
            34475139036999999488,
            41106961741899997184,
            79117563361900003328,
            81087432109900005376,
            127020333473700003840,
            256772150862799994880,
            273482951581400006656,
            172876624891300020224,
            135950174298600013824,
            211005923435099979776,
            307273108476599992320,
            191451986477200015360,
            242141200561099997184,
            404968553251900030976,
            449487491205299961856,
            389706960543399936000,
            899368332095200034816,
            350091244696999952384,
            189260191203600007168,
            312165752369199972352,
            379496358274500001792,
            363265002986100031488,
            425144240886200008704,
            784220574811799945216,
            614684632550599950336,
            1013275082115099918336,
            1064899149745700077568,
            1112539622061299990528,
            991203762752100106240,
            879833575859400081408,
            625912068378700021760,
            513946688265199943680,
            862001029646499971072,
            659355365332499955712,
            915611128631799971840,
            873966933391300100096,
            572995981395100041216,
            450826938920899969024,
            723307896000399933440,
            904898480432500047872,
            572663398503499956224,
            628417942721300004864,
            455785183272399994880,
            522673480201799991296,
            484059347223300014080,
            552236555887200043008,
            671684233377599979520,
            374052241659599978496,
            134665425534400004096,
            314161342223000010752,
            298785443293400006656,
            298094238529599963136,
            214891882322400018432,
            6894385222558400118784,
            7339720343238499893248,
            6602838810578800082944,
            6790166639462399868928,
            6266274437907699728384
        ];
        marketCap = [
            2516000000000000,
            2516000000000000,
            4516000000000000,
            4516000000000000,
            4516000000000000,
            4516000000000000,
            4516000000000000,
            4516000000000000,
            4516000000000000,
            9516000000000000,
            14515985500000000,
            14516290300000000,
            14515910000000000,
            19515910000000000,
            19515910000000000,
            59515910000000000,
            69513337900000000,
            69515910000000000,
            69515909500000000,
            69515897300000008,
            69515897200000000,
            99516892400000000,
            249515159700000000,
            249502459100000000,
            549508555600000000,
            590339351000000000,
            1088028608700000000,
            2162339281600000000,
            3197951540099999744,
            3204953437400000000,
            4355266118800000000,
            4523826310600000000,
            7702058882400000000,
            13848626179200000000,
            21955769019699998720,
            22147086100500000768,
            22889019119499997184,
            24145278843000000512,
            25021340533200003072,
            27049529762299998208,
            24609265104299999232,
            27517652481999998976,
            28074320474499997696,
            17553213982499999744,
            18412410175499999232,
            18841990820600000512,
            20339705662599999488,
            20418096951700000768,
            20299867046100000768,
            28515027344699998208,
            31414193564999999488,
            35733286680999997440,
            40415600246499999744,
            40228748162600001536,
            41249224956400001024,
            41344123474500001792,
            41150418713200001024,
            41067239754099998720,
            46453749339399995392,
            46719315135400001536,
            61847594999300005888,
            63935517318599999488,
            87807662102099984384,
            91871115842600009728,
            99996352953799999488,
            133681678957800013824,
            155225313778999984128,
            166576428431000010752,
            191345973037200015360,
            209394407047100006400,
            264519889544800010240,
            350514233197499973632,
            407239814868199997440,
            509954927885800046592,
            618162542658500034560,
            624688886003799949312,
            618078563525799968768,
            655252324983200022528,
            684781589407799967744,
            702865589079600005120,
            733268684948800012288,
            783516989399699947520,
            781583308925899898880,
            796039764628500119552,
            819586432165899927552,
            831657431511400054784,
            724940461305299992576,
            663366783557199986688,
            662196900384100057088,
            675508784472100044800,
            679595369560699961344,
            694162689724600025088,
            653636904240300032000,
            662421037575999979520,
            678192531476100022272,
            709410510926100037632,
            796822434974199971840,
            817439425093400002560,
            832120709510800080896,
            833844880525899988992,
            838117610115700097024,
            828522386091000070144,
            832615172902700056576
        ];
        markets = 266790000000000;
        github_commits = 1000000000000000;
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
