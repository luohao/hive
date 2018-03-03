set hive.explain.user=true;
create table bug_201_input_a (
       userid                                       int
) clustered by (userid) sorted by (userid) into 64 BUCKETS ;

create table bug_201_input_b (
       userid                  int 
) clustered by (userid) sorted by (userid) into 64 BUCKETS ;

insert overwrite table bug_201_input_a 
select distinct(userid) as userid from (
  select arr as userid from (
     select explode(array (
            12804352        ,251326720,50029057        ,251155969,60217858        ,251995906,78744835        ,250561795,13637380        ,207184132,58189573        ,251988997,
            62314246        ,251565574,63912199        ,250889479,57424648        ,208269832,39819529        ,251811337,39396106        ,250124554,25833739        ,251722507,
            48908812        ,252057100,39894541        ,251633677,20268046        ,251462926,46375183        ,251292175,64902160        ,251879440,40980241        ,204206353,
            50411026        ,251790610,54030355        ,251367187,29097748        ,205968148,12755989        ,250773013,45685270        ,208406038,47788567        ,208235287,
            57724696        ,207559192,13083673        ,206630425,41717530        ,250929946,50642971        ,250759195,43144732        ,250841116,51059485        ,250670365,
            39771166        ,250752286,53244703        ,250834207,43725088        ,207961888,46586401        ,207285793,77241634        ,251837986,19967011        ,251919907,
            37230628        ,251496484,47419429        ,251578405,50786086        ,250144294,48593959        ,251742247,44885800        ,251318824,52295209        ,251400745,
            66274090        ,251988010,28960555        ,208357675,51024940        ,206923564,32156461        ,251981101,47398702        ,252063022,48238639        ,251386927,
            77377840        ,251468848,64068145        ,207333169,16142386        ,251380018,15971635        ,251461939,60018484        ,250027828,43171381        ,250867765,
            47548726        ,250191670,37776439        ,208330039,59588152        ,251871544,75335737        ,251953465,57477946        ,251782714,63623995        ,250348603,
            57641788        ,250935868,42058045        ,250007101,59574334        ,251352382,42474559        ,250928959,52663360        ,252021568,60578113        ,251598145,
            60407362        ,251174722,55941187        ,208302403,65119300        ,251843908,61916485        ,251673157,65535814        ,207790150,62838343        ,208124743,
            26030152        ,251666248,45315145        ,204498505,59799370        ,251577418,72514891        ,250648651,64258636        ,208281676,53475661        ,251823181,
            30564430        ,207940174,32162383        ,250976335,62059600        ,251563600,64920913        ,251392849,50347858        ,250716754,40828243        ,251304019,
            44447572        ,204388948,14966869        ,251973205,59013718        ,250791766,12856663        ,251631703,40227160        ,250450264,20600665        ,252048217,
            48223834        ,251119450,76099675        ,207741787,49145692        ,250019932,50490973        ,207905629,58405726        ,250689118,47370079        ,250013023,
            44419936        ,250347616,36416353        ,250934881,62776162        ,251269474,48455779        ,251098723,43736932        ,251938660,12740197        ,251767909,
            54007654        ,252102502,49794151        ,251931751,63267688        ,252013672,28480873        ,252095593,63684202        ,251419498,76652395        ,252006763,
            64606060        ,251077996,53317741        ,251665261,21310318        ,250989166,41353327        ,208116847,52805488        ,208451440,43033201        ,251992945,
            48673906        ,251064178,15655795        ,207686515,44794996        ,251228020,14303605        ,251815285,48243574        ,251897206,65507191        ,207508855,
            63820408        ,250797688,45457273        ,251637625,62973562        ,251466874,42083707        ,252054139,63642748        ,251630716,40731517        ,251712637,
            29948542        ,252047230,40137343        ,250360447,43756672        ,251200384,13517953        ,251534977,77273218        ,251616898,54867331        ,250435459,
            46105732        ,250517380,48714373        ,208150405,79369606        ,250933894,57216391        ,250257799,20408200        ,250845064,61675657        ,206962057,
            15013258        ,250756234,54512011        ,250585483,70512268        ,251172748,78932365        ,251254669,12814222       , 251841934,49533583       , 251923855,
            44309392       , 208040848,73953937       , 250824337,56601490       , 251664274,35458963       , 208033939,50953876       , 251828116,74281621       , 204155029,
            64509334       , 250223254,44630167       , 252073879,52292248       , 207685528,63997081       , 251732377,46897306       , 250803610,60370843       , 251138203,
            65506204       , 251725468,48406429       , 205821085,15893662       , 250878622,38716063       , 251213215,35007904       , 251295136,66926497       , 251629729,
            56143522       , 251964322,73407139       , 250277539,71720356       , 251117476,80645797       , 205465765,43079590       , 250270630,75756199       , 208156327,
            58656424       , 251445160,57474985       , 251779753,45428650       , 251356330,62186923       , 250680235,54183340       , 250004140,55781293       , 207637165,
            15941038       , 251684014,14254255       , 251513263,42130096       , 251342512,34884529       , 208217521,70087858       , 251253682,50208691       , 250830259,
            54333364       , 250406836,17019829       , 251752117,75468982       , 251834038,17689015       , 208203703,22571704       , 250481848,52974265       , 250816441,
            52803514       , 251656378,61981627       , 251485627,13045180       , 250556860,71494333       , 250133437,81935806       , 251478718,50433727       , 252065983,
            26764480       , 250631872,64747201       , 251977153,64829122       , 206830786,47982019       , 251888323,64992964       , 207499972,52188613       , 251799493,
            39384262       , 251376070,41992903       , 250699975,41822152       , 250781896,39882697       , 250358473,56135626       , 251198410,35751115       , 251785675,
            75249868       , 251867596,55118029       , 207479245,70107598       , 251526094,50481103       , 207895759,55869136       , 251689936,45086161       , 251519185,
            46431442       , 251348434,53335507       , 251683027,39520468       , 251512276,53246677       , 250836181,42211030       , 251928790,56442583       , 251252695,
            75727576       , 251334616,15673561       , 250911193,42286042       , 250993114,63845083       , 251833051,37396444       , 251156956,77653213       , 251744221,
            16335838       , 251068126,61393375       , 250897375,53642464       , 250221280,58525153       , 206843617,56585698       , 207683554,30642403       , 250972387,
            63319012       , 250801636,76287205       , 207929317,44785126       , 251723494,50425831       , 251300071,45706984       , 251634664,13952233       , 251463913,
            77960170       , 251293162,27760363       , 251627755,69280492       , 206734060,13521901       , 208332013,35333614       , 250862830,56892655       , 251702767,
            49394416       , 251532016,79291633       , 250097905,50316274       , 206467570,45344755       , 251525107,17127412       , 250596340,53846773       , 206966005,
            53170678       , 251012854,46430455       , 252105463,59651320       , 251682040,54427129       , 251763961,54509050       , 252098554,65203195       , 251422459,
            40270588       , 250241020,13316605       , 208379389,45235198       , 251668222,60477439       , 251497471,
            101510977       ,114200836       ,156174985       ,60512971        ,181554703       ,
            148365841       ,52703827        ,182530846       ,149341984       ,116153122       ,
            162031843       ,141532840       ,154222699       ,109320121       ,155198842       
                       )) as arr )a )b;



insert overwrite table bug_201_input_b
select distinct(userid) as userid from (
  select arr as userid from (
     select explode(array (
            55632256        ,243051712    ,39037825        ,163984129    ,22443394        ,147389698    ,68322115        ,193268419,
            51727684        ,176673988    ,35133253        ,160079557    ,81011974        ,205958278    ,64417543        ,251836999,
            47823112        ,172769416    ,31228681        ,156174985    ,14634250        ,202053706    ,60512971        ,247932427,
            43918540        ,168864844    ,89797261        ,152270413    ,73202830        ,73202830    ,56608399        ,244027855,
            40013968        ,164960272    ,85892689        ,148365841    ,69298258        ,69298258    ,52703827        ,177650131,
            36109396        ,161055700    ,19514965        ,206934421    ,65393686        ,190339990    ,48799255        ,111272407,
            94677976        ,157151128    ,15610393        ,203029849    ,61489114        ,248908570    ,44894683        ,169840987,
            90773404        ,153246556    ,11705821        ,74178973    ,57584542        ,245003998    ,40990111        ,165936415,
            24395680        ,149341984    ,70274401        ,70274401    ,53679970        ,178626274    ,37085539        ,162031843,
            145437412       ,207910564    ,66369829        ,191316133    ,49775398        ,112248550    ,33180967        ,158127271,
            79059688        ,204005992    ,62465257        ,187411561    ,45870826        ,170817130    ,29276395        ,154222699,
            12681964        ,75155116     ,58560685        ,245980141    ,41966254        ,166912558    ,150318127       ,150318127,
            8777392         ,71250544     ,54656113        ,179602417    ,38061682        ,163007986    ,146413555       ,146413555,
            67345972        ,192292276    ,50751541        ,175697845    ,34157110        ,159103414    ,17562679        ,204982135,
            63441400        ,250860856    ,46846969        ,171793273    ,30252538        ,155198842    ,76131259        ,201077563,
            59536828        ,246956284    ,42942397        ,167888701    ,26347966        ,151294270    ,9753535         ,72226687,
            101510977       ,114200836       ,156174985       ,60512971        ,181554703       ,
            148365841       ,52703827        ,182530846       ,149341984       ,116153122       ,
            162031843       ,141532840       ,154222699       ,109320121       ,155198842       
        )) as arr )a ) b;

explain
select
t1.userid,
  fa.userid   as  fa_userid 
  from bug_201_input_b as t1
  join bug_201_input_a as fa on (t1.userid = fa.userid) ;

select
t1.userid,
  fa.userid   as  fa_userid 
  from bug_201_input_b as t1
  join bug_201_input_a as fa on (t1.userid = fa.userid) ;


set hive.auto.convert.join=true;
set hive.auto.convert.join.noconditionaltask.size=100 ;
set hive.auto.convert.sortmerge.join=true
set hive.convert.join.bucket.mapjoin.tez = true;
set hive.auto.convert.sortmerge.join.bigtable.selection.policy = org.apache.hadoop.hive.ql.optimizer.TableSizeBasedBigTableSelectorForAutoSMJ;

explain
select
t1.userid,
  fa.userid   as  fa_userid 
  from bug_201_input_b as t1
  join bug_201_input_a as fa on (t1.userid = fa.userid) ;

select
t1.userid,
  fa.userid   as  fa_userid 
  from bug_201_input_b as t1
  join bug_201_input_a as fa on (t1.userid = fa.userid) ;

