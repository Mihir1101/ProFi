// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ARB is Ownable {
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
            13253957518,
            12723932134,
            12241172783,
            12825206839,
            11628545501,
            12179561882,
            12244738679,
            13785094221,
            13936656793,
            12941979567,
            12005592910,
            11559647373,
            12349101729,
            12436235302,
            12131807250,
            11973627798,
            11627821653,
            11838455426,
            12428485006,
            12177746780,
            11943016365,
            13664558393,
            16878668384,
            16494671533,
            16988281724,
            16127950691,
            16728158580,
            14901601049,
            14405579052,
            14703748931,
            14637747713,
            13391980278,
            13382974315,
            13791771610,
            13847429167,
            14230040185,
            13825403872,
            13667403684,
            13711611071,
            13189753182,
            13500126146,
            13439698485,
            13175507664,
            13571699438,
            12432937031,
            12268229716,
            10931908708,
            11032485229,
            11733194866,
            10918761584,
            11718713354,
            11709022153,
            11732504350,
            11933651204,
            11791463213,
            11994036239,
            11566683572,
            11631920056,
            11630805452,
            11275696629,
            11256808661,
            11669831976,
            11102189915,
            11069482301,
            11607862196,
            11732820910,
            12478648321,
            12271090972,
            12221503958,
            11617670681,
            11469537822,
            12404406084,
            12155174029,
            12108248586,
            11376383726,
            11866793317,
            11261826922,
            11299930772,
            11308143086,
            9928231221,
            9918606858,
            9780290689,
            9907115933,
            9412686382,
            9490105098,
            9747529324,
            9935208107,
            9941070833,
            10065388264,
            10842027446,
            11415199640,
            10906809207,
            11344693200,
            10789691498,
            11118349869,
            11412039039,
            12060356911,
            11238506127,
            11300797693,
            11604960196,
            11502216583,
            11507466546,
            11668527751,
            11495374765,
            11111951521,
            10761168065,
            11304249091,
            11256325808,
            11245938115,
            11215409179,
            11252875457,
            11214701247,
            12239712141,
            12105920191,
            12678446100,
            12714208918,
            13021700128,
            12438340088,
            12682144640,
            12606456391,
            12367377992,
            12256160985,
            12509780049,
            11869736038,
            11687458930,
            11970227434,
            11724640320,
            11745571388,
            11822195114,
            11580799808,
            11685664933,
            11602119903,
            11326089291,
            11291115051,
            11554458781,
            11370424073,
            11365645045,
            11335317405,
            11603274160,
            11756110644,
            11594412352,
            11575580066,
            11630110405,
            11444119495,
            11413097457,
            11299780264,
            10475268768,
            9854462496,
            10067396515,
            10200797784,
            10303757925,
            9965770991,
            9796338495,
            10082028801,
            9801392380,
            9479611494,
            9503788210,
            9577626608,
            9486071407,
            9711803131,
            9431759878,
            9154581997,
            8843977677,
            8881293238,
            9046526590,
            8959761516,
            9009422951,
            9011066446,
            9121425353,
            9019046271,
            8986180032,
            8441712852,
            7610826362,
            7834480965,
            7865066649,
            8043588733,
            8082457210,
            8274218263,
            7945808814,
            8244702158,
            8610361509,
            8593660874,
            8231429680,
            8406830283,
            8216170578,
            8084110426,
            8070782643,
            8250503024,
            8175716755,
            8911211932,
            9032766971,
            9084653287,
            9697709072,
            9313268752,
            9061711522
        ];
        close = [
            11860597964,
            11929703314,
            12080917900,
            11244949596,
            11204940968,
            12019210879,
            12244738679,
            13425862430,
            12691790892,
            11415402425,
            11134021975,
            11512844784,
            12129586526,
            11856142828,
            11856407513,
            11572776097,
            11525104156,
            11660001638,
            12129624111,
            11661482742,
            11842270901,
            13664558393,
            16247072261,
            15978071658,
            15981091530,
            15976284542,
            14693857578,
            14115287070,
            14183975836,
            14336728180,
            13160338086,
            12937393603,
            13004331698,
            13412123861,
            13823419583,
            13692586762,
            13546003746,
            13515481464,
            12989765791,
            13115804114,
            13029112830,
            13130678146,
            13048269596,
            12264017136,
            12264673033,
            10581183820,
            10823800414,
            11017815751,
            10643940982,
            10692242203,
            11478522411,
            11494067431,
            11548613346,
            11680886939,
            11400977701,
            11448107195,
            11465378104,
            11540949510,
            11212925432,
            11125430936,
            11216102260,
            10912425596,
            10761988364,
            11056614322,
            11553399740,
            11680979988,
            12160612540,
            12162471898,
            11455462159,
            11362631136,
            11408469761,
            12100327729,
            12057771484,
            10901849320,
            11153026871,
            11220129793,
            11119251853,
            11212385450,
            9487502312,
            9806722663,
            9608304376,
            9717534919,
            9285072330,
            9141598870,
            9296675742,
            9688763565,
            9853811040,
            9885593086,
            9875790996,
            10791442218,
            10885977298,
            10904309823,
            10659996002,
            10761609156,
            10880523070,
            11403101930,
            11203749013,
            11228979225,
            11030506747,
            11393541035,
            11281355173,
            11505151898,
            11493994698,
            10992691119,
            10765625829,
            10652392616,
            11140201857,
            11230889618,
            11030928913,
            11140380652,
            11147242700,
            11139138958,
            11749126555,
            12076095064,
            12498818869,
            12594284257,
            12360426706,
            12372157047,
            12468838896,
            12368336442,
            12216251950,
            12221233535,
            11752468828,
            11626217597,
            11557705767,
            11711899674,
            11596869456,
            11727944708,
            11496163858,
            11553071596,
            11306984447,
            11290803271,
            11222157295,
            11288214131,
            11357126019,
            11307221320,
            11153202347,
            11318393353,
            11601649737,
            11568866126,
            11523826712,
            11552895347,
            11436932809,
            11357658808,
            11262856775,
            10353203712,
            9493326227,
            9828160585,
            10059100006,
            10179002622,
            9855048842,
            9481122166,
            9784694510,
            9685379765,
            9348010443,
            9394942313,
            9469279058,
            9281921732,
            9349899424,
            9409010378,
            9081942342,
            8761928735,
            8784057568,
            8817540659,
            8863797025,
            8849868729,
            8839279542,
            8979734285,
            8950825126,
            8967811432,
            8350500686,
            7453409002,
            7550259434,
            7756946854,
            7845725702,
            7871346104,
            8077019624,
            7874456243,
            7873363566,
            8209764593,
            8381184017,
            8131866495,
            8186184154,
            8196754259,
            8078363585,
            8049802179,
            8065707607,
            8139061327,
            8169118577,
            8842257009,
            8941046813,
            9082345273,
            9213571723,
            9034525866,
            8697019896
        ];
        high = [
            15558723484,
            13072317724,
            13418532479,
            13202750077,
            12204825610,
            12718052500,
            14185846645,
            14347790024,
            14011819543,
            12971251995,
            12243072727,
            12622365921,
            12849507023,
            12442242369,
            12423397880,
            12083110445,
            11935545521,
            12479446793,
            12527386170,
            12183395487,
            13718969109,
            17194956211,
            17330447237,
            17075318470,
            16988281724,
            18011177172,
            16865176145,
            15357266558,
            14950720023,
            14964950630,
            14638926570,
            13616567533,
            13810483943,
            14946457879,
            14488561305,
            14391647643,
            13930863680,
            14198518043,
            13832081729,
            13561525684,
            13596879879,
            13603308193,
            13617838415,
            13648949462,
            12588061320,
            12280525958,
            11118819025,
            11956187577,
            11733194866,
            11724627911,
            11872002161,
            12011757499,
            12258358270,
            12062512275,
            12081147205,
            12086445592,
            11695799976,
            11677172703,
            11694555149,
            11359099216,
            11763500922,
            11670762504,
            11124749901,
            11762683356,
            11759659607,
            12518293063,
            12707668250,
            12426919335,
            12323074675,
            11658887409,
            12507071216,
            12515091771,
            12318515838,
            12108248586,
            11953810263,
            11918187705,
            11462071451,
            11498036110,
            11321179286,
            10143238549,
            9953923697,
            10271756448,
            10053602039,
            9558831996,
            9813919843,
            10079491634,
            10209404913,
            10132059366,
            10851569398,
            11466427135,
            11719822687,
            11536408773,
            11349387538,
            11324856841,
            11679328586,
            12386453149,
            12061510927,
            11634476716,
            11918205732,
            11657419344,
            11588145016,
            11810472781,
            11919832915,
            11545528651,
            11405364613,
            11302487583,
            11443170096,
            11392664964,
            11404510729,
            11319992670,
            11375078613,
            12406151841,
            13159742447,
            13193395628,
            13030384797,
            13419932460,
            13252153780,
            12906912049,
            12793423125,
            12927799191,
            12502037671,
            12655174555,
            12526795019,
            11926442230,
            12018370189,
            12053471809,
            11787234081,
            11829345833,
            11867298134,
            11888854207,
            11736472812,
            11721593364,
            11476038790,
            11631731953,
            11562857034,
            11451225822,
            11508710189,
            11709867206,
            11900844666,
            11863526321,
            11627519978,
            11658797912,
            11663320983,
            11507629060,
            11609275034,
            11328419462,
            10617011523,
            10222068588,
            10306598414,
            10388043175,
            10325560435,
            10028187784,
            10241512562,
            10128219252,
            9801507210,
            9525434965,
            9633562389,
            9587398007,
            9920910771,
            9717494004,
            9566027895,
            9271692818,
            8932439710,
            9072971897,
            9239979829,
            9096619855,
            9085814976,
            9188190282,
            9207533402,
            9024618794,
            8986521728,
            8469574945,
            7972479434,
            8138768666,
            8150212824,
            8123073829,
            8327656203,
            8276501657,
            8381782503,
            8610187888,
            8676498282,
            8625470070,
            8458843311,
            8469740381,
            8305118761,
            8177724477,
            8250264260,
            8425121490,
            8979700361,
            9117861079,
            9223336181,
            9790393569,
            9843069843,
            9424615557,
            9066614443
        ];
        low = [
            11860597964,
            11929703314,
            12080917900,
            11244949596,
            11204940968,
            12019210879,
            12244738679,
            13425862430,
            12691790892,
            11415402425,
            11134021975,
            11512844784,
            12129586526,
            11856142828,
            11856407513,
            11572776097,
            11525104156,
            11660001638,
            12129624111,
            11661482742,
            11842270901,
            13664558393,
            16247072261,
            15978071658,
            15981091530,
            15976284542,
            14693857578,
            14115287070,
            14183975836,
            14336728180,
            13160338086,
            12937393603,
            13004331698,
            13412123861,
            13823419583,
            13692586762,
            13546003746,
            13515481464,
            12989765791,
            13115804114,
            13029112830,
            13130678146,
            13048269596,
            12264017136,
            12264673033,
            10581183820,
            10823800414,
            11017815751,
            10643940982,
            10692242203,
            11478522411,
            11494067431,
            11548613346,
            11680886939,
            11400977701,
            11448107195,
            11465378104,
            11540949510,
            11212925432,
            11125430936,
            11216102260,
            10912425596,
            10761988364,
            11056614322,
            11553399740,
            11680979988,
            12160612540,
            12162471898,
            11455462159,
            11362631136,
            11408469761,
            12100327729,
            12057771484,
            10901849320,
            11153026871,
            11220129793,
            11119251853,
            11212385450,
            9487502312,
            9806722663,
            9608304376,
            9717534919,
            9285072330,
            9141598870,
            9296675742,
            9688763565,
            9853811040,
            9885593086,
            9875790996,
            10791442218,
            10885977298,
            10904309823,
            10659996002,
            10761609156,
            10880523070,
            11403101930,
            11203749013,
            11228979225,
            11030506747,
            11393541035,
            11281355173,
            11505151898,
            11493994698,
            10992691119,
            10765625829,
            10652392616,
            11140201857,
            11230889618,
            11030928913,
            11140380652,
            11147242700,
            11139138958,
            11749126555,
            12076095064,
            12498818869,
            12594284257,
            12360426706,
            12372157047,
            12468838896,
            12368336442,
            12216251950,
            12221233535,
            11752468828,
            11626217597,
            11557705767,
            11711899674,
            11596869456,
            11727944708,
            11496163858,
            11553071596,
            11306984447,
            11290803271,
            11222157295,
            11288214131,
            11357126019,
            11307221320,
            11153202347,
            11318393353,
            11601649737,
            11568866126,
            11523826712,
            11552895347,
            11436932809,
            11357658808,
            11262856775,
            10353203712,
            9493326227,
            9828160585,
            10059100006,
            10179002622,
            9855048842,
            9481122166,
            9784694510,
            9685379765,
            9348010443,
            9394942313,
            9469279058,
            9281921732,
            9349899424,
            9409010378,
            9081942342,
            8761928735,
            8784057568,
            8817540659,
            8863797025,
            8849868729,
            8839279542,
            8979734285,
            8950825126,
            8967811432,
            8350500686,
            7453409002,
            7550259434,
            7756946854,
            7845725702,
            7871346104,
            8077019624,
            7874456243,
            7873363566,
            8209764593,
            8381184017,
            8131866495,
            8186184154,
            8196754259,
            8078363585,
            8049802179,
            8065707607,
            8139061327,
            8169118577,
            8842257009,
            8941046813,
            9082345273,
            9213571723,
            9034525866,
            8697019896
        ];
        volume = [
            25377095807700000768,
            12948942429300000768,
            10595879586599999488,
            10142406033500000256,
            6966362698800000000,
            7911913583200001024,
            18603263774000001024,
            10235378249199998976,
            7081148016300000256,
            10603891038699999232,
            9101133438200000512,
            7417942939500000256,
            6815374370700000256,
            3896458693299999744,
            3312342727600000000,
            2381600373300000256,
            2509218744400000000,
            3917612829600000000,
            3295213061700000256,
            3444337806000000000,
            10539508560899999744,
            29276171808699998208,
            15526208167700000768,
            11054554260499998720,
            8818771781100000256,
            17012585353900001280,
            14541688097300000768,
            11894201445799999488,
            11156303401500000256,
            7433682528999999488,
            6247069108899999744,
            6458550491000000512,
            6363377586400000000,
            12328226458900000768,
            7472651577299999744,
            4139087695000000000,
            2155757344000000000,
            3276165039700000256,
            3563989720299999744,
            2547844540400000000,
            3366911165600000000,
            2834950422000000000,
            3503649191600000512,
            4705381057500000256,
            2378785488300000256,
            6030385196400000000,
            3000981447200000512,
            6675661871299999744,
            3976956236400000000,
            4724911680899999744,
            2568256223300000256,
            2247123109400000000,
            3199836202099999744,
            2517566310400000000,
            2776501934600000000,
            2338042739600000000,
            1565912158600000256,
            872519589900000000,
            1246939075500000000,
            1208365856300000000,
            1789548295200000000,
            2193437734100000000,
            1808279070300000000,
            2670953321000000000,
            1424646083600000256,
            2899246804600000000,
            3176212792099999744,
            2486490655000000000,
            2479364741899999744,
            1458768311800000000,
            3537862925600000000,
            1800234486300000000,
            1196448317900000000,
            4295840680600000000,
            3652345697200000512,
            2553814492800000000,
            1671680100300000000,
            1372593158500000000,
            6630285292599999488,
            2096654500000000000,
            2540072217600000000,
            2792157108200000000,
            2177090827600000000,
            1978529358100000000,
            1671715289500000000,
            1479794777100000000,
            1493620040600000000,
            1298105338700000000,
            2569337585400000000,
            3671086349600000000,
            2966196975500000256,
            2710552377300000256,
            1904059433700000000,
            2131309084300000000,
            3976270050600000000,
            4156195578500000256,
            3234655349700000256,
            2245234253100000000,
            4903603543799999488,
            1632066076100000256,
            1568423259000000000,
            1943727512900000000,
            1791355180300000000,
            1615077185600000000,
            1968277577500000000,
            1993896684300000000,
            1216193248400000000,
            1196917301500000000,
            1435392078700000000,
            1015362639300000128,
            1340639092000000000,
            3117052470899999744,
            6125580091000000512,
            4138871670099999744,
            2668975602700000256,
            4476310865899999744,
            3426045211299999744,
            2679223657000000000,
            2460234848499999744,
            1918861105900000000,
            966481238000000000,
            1281029602500000000,
            1819431259199999744,
            1116038448800000000,
            1467168478500000000,
            963924700800000000,
            828581049800000000,
            443481021400000000,
            937016376400000000,
            1292443236000000000,
            1373594430100000000,
            1319569438700000000,
            1172714819400000000,
            1257057191400000000,
            1122183848100000000,
            1124594426700000000,
            1611429225400000000,
            1681016494300000000,
            2193045909700000000,
            1581114901900000000,
            1124382492800000000,
            967338283600000000,
            1102720360600000000,
            1181773449200000000,
            1668847571300000000,
            2321904375600000000,
            3135535712099999744,
            1976870761300000000,
            1211763166700000000,
            1360901097000000000,
            1536903858899999744,
            1779892656699999744,
            1576300190900000000,
            1341634364900000000,
            1528072939700000000,
            972855943000000000,
            1008727144300000128,
            1115959346700000000,
            1737076948100000000,
            1361511172800000000,
            1651993454199999744,
            1475098086000000000,
            975666919400000000,
            923343292700000000,
            1091628859599999872,
            902988067300000000,
            1021743715300000000,
            860224585699999872,
            897310795699999872,
            472258570500000000,
            1512906243899999744,
            2778503318399999488,
            2024488496699999744,
            1705370583200000000,
            1281678277900000000,
            1059105718199999872,
            1073692725500000000,
            839422815699999872,
            1362060671100000256,
            1218637313900000000,
            1353468324100000000,
            1381667028600000256,
            862435582500000000,
            623444594400000000,
            649644867900000000,
            748379345400000128,
            703303735600000000,
            742941948000000000,
            1439910463000000000,
            1598272914600000000,
            1067371462600000000,
            1686489246000000000,
            2051317513800000000,
            1567354924600000000,
            1636167056699999744
        ];
        marketCap = [
            16224267736400001024,
            15614983199900000256,
            16362269539500001280,
            14824489564999999488,
            15526402452700000256,
            15608048058199998464,
            17582760042899998720,
            17778405580099999744,
            16210782467800000512,
            15297582683699998720,
            14738307254599999488,
            15746688578099998720,
            15857679717200001024,
            15467934748699998208,
            15268778754599999488,
            14828707064000000000,
            15094662663699998720,
            15845167563399999488,
            15524865854300000256,
            15309857363000000512,
            17411775116999999488,
            21523884407600001024,
            21023372661700001792,
            21656451683200000000,
            20558455121899999232,
            21339634854000001024,
            19002296765599997952,
            18369276822699999232,
            18746115321199996928,
            18669806607900000256,
            17075334875899998208,
            17063891645799999488,
            17589315283599998976,
            17654389892999999488,
            18142407316099999744,
            17626185097400000512,
            17415261414599999488,
            17489264662300000256,
            16816106699700000768,
            17217611310599999488,
            17136531189500000256,
            16800401370799998976,
            17302580885199998976,
            15855144836099999744,
            15640334476800000000,
            13934849782899998720,
            14067311234800001024,
            14962137550799998976,
            13923245557899999232,
            14941079452299999232,
            14928223207399999488,
            14958866816800000000,
            15214226114300000256,
            15034296396500000768,
            15294847902400000000,
            14745127926099998720,
            14830803062200000512,
            14828513446900000768,
            14376497994400000000,
            14352756743100000256,
            14879445835000000512,
            14155611375000000512,
            14113485850200000512,
            14800162601500000256,
            14959339631500001280,
            15912018516300001280,
            15648947518900000768,
            15583220807599998976,
            14813338394200000512,
            14623939847499999232,
            15810702527499999232,
            15497114956700000256,
            15438747745099999232,
            14508847449699999744,
            15129023820700000256,
            14358804045500000256,
            14407295862300000256,
            14417348776400001024,
            12657229667700000768,
            12647622167700000768,
            12468971559200000000,
            12631572630599999488,
            12000956017600000000,
            12098828955100000256,
            12427599911400001536,
            12668253273299998720,
            12674859952400001024,
            12832503396700000256,
            13823785701800001536,
            14553447266400002048,
            13907202725099999232,
            14460830190300000256,
            13757817578699999232,
            14174316389600000000,
            14549426183000000512,
            15375599719700000768,
            14333275397100001280,
            14409670429400000512,
            14789578097500000256,
            14667067403299999744,
            14671863867599998976,
            14875808122499999744,
            14654843239500001280,
            14167924241600000000,
            13726172931900000256,
            14410671668800002048,
            14352410357799999488,
            14337611410499999744,
            14298732963299999744,
            14347779858300000256,
            14300520183800000512,
            15607618147200000000,
            15436507926099998720,
            16158038391700000768,
            16210120988599998464,
            16599381067800000512,
            15855909213099999232,
            16167622843000000512,
            16073435850999998464,
            15769628963200000000,
            15624885902400000000,
            15951336727299999744,
            15133776616500000768,
            14900725984600000512,
            15259154534400000000,
            14950442852600000512,
            14977150867499999232,
            15071928380499998720,
            14765666387000000512,
            14899428177200001024,
            14788396473199998976,
            14438982797300000768,
            14397477051099998208,
            14731043477600000000,
            14497328511600001024,
            14491589614000001024,
            14452936622300000256,
            14794052813699999744,
            14990871429300000768,
            14782232871700000768,
            14758868220599998464,
            14828660430300000256,
            14591709114599999488,
            14551662393499998208,
            14407812393699999744,
            13355095621300000768,
            12561763321600000000,
            12835015336899999744,
            13004058105500000256,
            13139865609699999744,
            12711704096099999744,
            12486466694200000512,
            12853476888800002048,
            12496930082599999488,
            12087238086500001792,
            12117982209899999232,
            12211470022400000000,
            12094699389300000768,
            12381223638400000000,
            12025846616199999488,
            11671350398499999744,
            11275987908599998464,
            11323598145400000512,
            11534790984999999488,
            11424479068800002048,
            11487373443299999744,
            11488783712099999744,
            11626074824100001792,
            11499407742599999488,
            11457364964800000000,
            10762570929899999232,
            9703516291200000000,
            9987661350700001280,
            10029255920399998976,
            10256197585799999488,
            10307636925299998720,
            10549338520199999488,
            10131565572099999744,
            10512279725799999488,
            10977989556700000256,
            10955556435699998720,
            10495318262799998976,
            10718642466699999232,
            10475429945299998720,
            10307448050100000768,
            10290698857300000768,
            10519086931299999744,
            10424104002400000000,
            11361320403699998720,
            11518080318900000768,
            11584299585299998720,
            12364489278499999744,
            11874180544200001536,
            11553766638099998720,
            11278863350100000768
        ];
        markets = 2610000000000;
        github_commits = 94130000000000;
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
    //            Function to get the data arrays
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
            if (high[1] > low[1]) {
                first = high[1] - low[1];
            } else {
                first = low[1] - high[1];
            }
            uint256 second;
            if (close[1] > open[1]) {
                second = close[1] - open[1];
            } else {
                second = open[1] - close[1];
            }
            uint256 result;
            if (second == 0) {
                result = 1e10;
            } else {
                result = ((first * 1e10) / (second));
            }
            uint256 algo = (2 * normalize_between_zero_and_1e10(result)) +
                (2 *
                    (1e10 - (SafeSub(marketCap[i], marketCap[i + 1]) / 1e11))) +
                (2 * (1e10 - (SafeSub(volume[i], volume[i + 1]) / 1e11))) +
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
