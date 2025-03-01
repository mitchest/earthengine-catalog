local id = 'OpenLandMap/SOL/SOL_GRTGROUP_USDA-SOILTAX_C/v01';
local subdir = 'OpenLandMap';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.cc_by_sa_4_0;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
  ],
  id: id,
  title: 'OpenLandMap USDA Soil Taxonomy Great Groups',
  'gee:type': ee_const.gee_type.image,
  description: |||
    Predicted USDA soil great group probabilities at 250m.

    Distribution of the USDA soil great groups based on machine learning predictions
    from global compilation of soil profiles. To learn more about soil great groups
    please refer to the [Illustrated Guide to Soil Taxonomy - NRCS - USDA](https://www.nrcs.usda.gov/wps/PA_NRCSConsumption/download/?cid=stelprdb1247203.pdf).

    * Processing steps are described in detail [here](https://gitlab.com/openlandmap/global-layers/tree/master/soil)
    * Antarctica is not included.

    To access and visualize maps outside of Earth Engine, use [this page](https://opengeohub.org/about-openlandmap).

    If you discover a bug, artifact or inconsistency in the LandGIS maps
    or if you have a question please use the following channels:

     *  [Technical issues and questions about the code](https://gitlab.com/openlandmap/global-layers/issues)
     *  [General questions and comments](https://disqus.com/home/forums/landgis/)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.license(license.reference),
    {
      rel: ee_const.rel.cite_as,
      href: 'https://doi.org/10.5281/zenodo.1476844',
    },
  ],
  keywords: [
    'envirometrix',
    'opengeohub',
    'openlandmap',
    'soil',
    'taxonomy',
    'usda',
  ],
  providers: [
    ee.producer_provider('EnvirometriX Ltd', 'https://doi.org/10.5281/zenodo.1476844'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('1950-01-01T00:00:00Z', '2018-01-01T00:00:00Z'),
  summaries: {
    gsd: [
      250.0,
    ],
    'eo:bands': [
      {
        name: 'grtgroup',
        description: 'USDA soil taxonomy great groups',
        'gee:classes': [
          {
            color: 'FFFFFF',
            description: 'NODATA',
            value: 0,
          },
          {
            value: 1,
            color: 'ADFF2D',
            description: 'Albaqualfs',
          },
          {
            value: 2,
            color: 'ADFF22',
            description: 'Cryaqualfs',
          },
          {
            value: 4,
            color: 'A5FF2F',
            description: 'Durixeralfs',
          },
          {
            value: 6,
            color: '87FF37',
            description: 'Endoaqualfs',
          },
          {
            value: 7,
            color: 'BAF019',
            description: 'Epiaqualfs',
          },
          {
            value: 9,
            color: '87FF19',
            description: 'Fragiaqualfs',
          },
          {
            value: 10,
            color: '96F03D',
            description: 'Fragiudalfs',
          },
          {
            value: 11,
            color: 'A3F52F',
            description: 'Fragixeralfs',
          },
          {
            value: 12,
            color: 'AFF319',
            description: 'Fraglossudalfs',
          },
          {
            value: 13,
            color: '91FF37',
            description: 'Glossaqualfs',
          },
          {
            value: 14,
            color: '9CF319',
            description: 'Glossocryalfs',
          },
          {
            value: 15,
            color: '9BFF37',
            description: 'Glossudalfs',
          },
          {
            value: 16,
            color: '91FF19',
            description: 'Haplocryalfs',
          },
          {
            value: 17,
            color: '71FF37',
            description: 'Haploxeralfs',
          },
          {
            value: 18,
            color: '86FF19',
            description: 'Hapludalfs',
          },
          {
            value: 19,
            color: 'A9D42D',
            description: 'Haplustalfs',
          },
          {
            value: 25,
            color: 'AFF519',
            description: 'Natraqualfs',
          },
          {
            value: 26,
            color: '9BFF19',
            description: 'Natrixeralfs',
          },
          {
            value: 27,
            color: '9AF024',
            description: 'Natrudalfs',
          },
          {
            value: 28,
            color: 'A5FD2F',
            description: 'Natrustalfs',
          },
          {
            value: 29,
            color: '88FF37',
            description: 'Palecryalfs',
          },
          {
            value: 30,
            color: 'AFED19',
            description: 'Paleudalfs',
          },
          {
            value: 31,
            color: '71FF19',
            description: 'Paleustalfs',
          },
          {
            value: 32,
            color: 'AFF026',
            description: 'Palexeralfs',
          },
          {
            value: 38,
            color: '8CF537',
            description: 'Rhodustalfs',
          },
          {
            value: 39,
            color: 'B7FF19',
            description: 'Vermaqualfs',
          },
          {
            value: 41,
            color: '7177C0',
            description: 'Eutroboralfs',
          },
          {
            value: 42,
            color: '9A85EC',
            description: 'Ochraqualfs',
          },
          {
            value: 43,
            color: 'F5F5E1',
            description: 'Glossoboralfs',
          },
          {
            value: 44,
            color: '52CF5A',
            description: 'Cryoboralfs',
          },
          {
            value: 45,
            color: 'E42777',
            description: 'Natriboralfs',
          },
          {
            value: 46,
            color: '4EF76D',
            description: 'Paleboralfs',
          },
          {
            value: 50,
            color: 'FF00FB',
            description: 'Cryaquands',
          },
          {
            value: 58,
            color: 'EB05EB',
            description: 'Fulvicryands',
          },
          {
            value: 59,
            color: 'FA04FA',
            description: 'Fulvudands',
          },
          {
            value: 61,
            color: 'FC04F5',
            description: 'Haplocryands',
          },
          {
            value: 63,
            color: 'F50DF0',
            description: 'Haploxerands',
          },
          {
            value: 64,
            color: 'F118F1',
            description: 'Hapludands',
          },
          {
            value: 74,
            color: 'FA0CFA',
            description: 'Udivitrands',
          },
          {
            value: 75,
            color: 'FC05E1',
            description: 'Ustivitrands',
          },
          {
            value: 76,
            color: 'F100D5',
            description: 'Vitraquands',
          },
          {
            value: 77,
            color: 'EB09E6',
            description: 'Vitricryands',
          },
          {
            value: 80,
            color: 'FA22FA',
            description: 'Vitrixerands',
          },
          {
            value: 82,
            color: 'FFDAB9',
            description: 'Aquicambids',
          },
          {
            value: 83,
            color: 'F5D2BB',
            description: 'Aquisalids',
          },
          {
            value: 85,
            color: 'E8C9B8',
            description: 'Argidurids',
          },
          {
            value: 86,
            color: 'FFDDC4',
            description: 'Argigypsids',
          },
          {
            value: 87,
            color: 'E7CBC0',
            description: 'Calciargids',
          },
          {
            value: 89,
            color: 'FFD2C3',
            description: 'Calcigypsids',
          },
          {
            value: 90,
            color: 'F5D6BB',
            description: 'Gypsiargids',
          },
          {
            value: 92,
            color: 'D5D3B9',
            description: 'Haplargids',
          },
          {
            value: 93,
            color: 'E8D4B8',
            description: 'Haplocalcids',
          },
          {
            value: 94,
            color: 'E7CDC0',
            description: 'Haplocambids',
          },
          {
            value: 96,
            color: 'F3EAC8',
            description: 'Haplodurids',
          },
          {
            value: 97,
            color: 'A0C4BA',
            description: 'Haplogypsids',
          },
          {
            value: 98,
            color: 'FFD2B9',
            description: 'Haplosalids',
          },
          {
            value: 99,
            color: 'F5DABB',
            description: 'Natrargids',
          },
          {
            value: 100,
            color: 'F5D5B9',
            description: 'Natridurids',
          },
          {
            value: 101,
            color: 'E8EBB8',
            description: 'Natrigypsids',
          },
          {
            value: 102,
            color: 'FFDDC2',
            description: 'Paleargids',
          },
          {
            value: 103,
            color: 'E7FFC0',
            description: 'Petroargids',
          },
          {
            value: 104,
            color: 'F3E6C8',
            description: 'Petrocalcids',
          },
          {
            value: 105,
            color: 'FFDAB9',
            description: 'Petrocambids',
          },
          {
            value: 107,
            color: 'F5CDB9',
            description: 'Petrogypsids',
          },
          {
            value: 110,
            color: 'A91D30',
            description: 'Calciorthids',
          },
          {
            value: 111,
            color: '796578',
            description: 'Camborthids',
          },
          {
            value: 112,
            color: 'D8FF6E',
            description: 'Paleorthids',
          },
          {
            value: 113,
            color: '177548',
            description: 'Durorthids',
          },
          {
            value: 114,
            color: '43EFD6',
            description: 'Durargids',
          },
          {
            value: 115,
            color: '8496A9',
            description: 'Gypsiorthids',
          },
          {
            value: 116,
            color: '296819',
            description: 'Nadurargids',
          },
          {
            value: 118,
            color: '73FFD4',
            description: 'Cryaquents',
          },
          {
            value: 119,
            color: '6FFFC8',
            description: 'Cryofluvents',
          },
          {
            value: 120,
            color: '75FBC9',
            description: 'Cryopsamments',
          },
          {
            value: 121,
            color: '86F5D1',
            description: 'Cryorthents',
          },
          {
            value: 122,
            color: '82FFD2',
            description: 'Endoaquents',
          },
          {
            value: 123,
            color: '88EEC8',
            description: 'Epiaquents',
          },
          {
            value: 124,
            color: '80FFD4',
            description: 'Fluvaquents',
          },
          {
            value: 126,
            color: '6BFFC9',
            description: 'Frasiwassents',
          },
          {
            value: 131,
            color: '88EEC8',
            description: 'Hydraquents',
          },
          {
            value: 133,
            color: '7FFFC8',
            description: 'Psammaquents',
          },
          {
            value: 134,
            color: '81FFD2',
            description: 'Psammowassents',
          },
          {
            value: 135,
            color: '86F0D4',
            description: 'Quartzipsamments',
          },
          {
            value: 136,
            color: '67FFC8',
            description: 'Sulfaquents',
          },
          {
            value: 137,
            color: '88EEC8',
            description: 'Sulfiwassents',
          },
          {
            value: 138,
            color: '7FFBCB',
            description: 'Torrifluvents',
          },
          {
            value: 139,
            color: '87FFD2',
            description: 'Torriorthents',
          },
          {
            value: 140,
            color: '8AF5CE',
            description: 'Torripsamments',
          },
          {
            value: 141,
            color: '6BFAD2',
            description: 'Udifluvents',
          },
          {
            value: 142,
            color: '78F0D4',
            description: 'Udipsamments',
          },
          {
            value: 143,
            color: '88EEC8',
            description: 'Udorthents',
          },
          {
            value: 144,
            color: '7FFBD4',
            description: 'Ustifluvents',
          },
          {
            value: 145,
            color: '73F5CD',
            description: 'Ustipsamments',
          },
          {
            value: 146,
            color: '88C8D2',
            description: 'Ustorthents',
          },
          {
            value: 147,
            color: '91F0CD',
            description: 'Xerofluvents',
          },
          {
            value: 148,
            color: '73CDD2',
            description: 'Xeropsamments',
          },
          {
            value: 149,
            color: '88EEC8',
            description: 'Xerorthents',
          },
          {
            value: 153,
            color: 'FB849B',
            description: 'Udarents',
          },
          {
            value: 154,
            color: 'DD4479',
            description: 'Torriarents',
          },
          {
            value: 155,
            color: '61388B',
            description: 'Xerarents',
          },
          {
            value: 179,
            color: 'A52A30',
            description: 'Cryofibrists',
          },
          {
            value: 180,
            color: '722328',
            description: 'Cryofolists',
          },
          {
            value: 181,
            color: 'D81419',
            description: 'Cryohemists',
          },
          {
            value: 182,
            color: 'A42828',
            description: 'Cryosaprists',
          },
          {
            value: 183,
            color: '82F5CD',
            description: 'Frasiwassists',
          },
          {
            value: 184,
            color: 'A54C2E',
            description: 'Haplofibrists',
          },
          {
            value: 185,
            color: 'C11919',
            description: 'Haplohemists',
          },
          {
            value: 186,
            color: 'B91419',
            description: 'Haplosaprists',
          },
          {
            value: 189,
            color: '21B199',
            description: 'Sphagnofibrists',
          },
          {
            value: 190,
            color: '702028',
            description: 'Sulfihemists',
          },
          {
            value: 191,
            color: 'B41919',
            description: 'Sulfisaprists',
          },
          {
            value: 196,
            color: 'B22328',
            description: 'Udifolists',
          },
          {
            value: 201,
            color: 'A2C7EB',
            description: 'Borosaprists',
          },
          {
            value: 202,
            color: '36BA79',
            description: 'Medisaprists',
          },
          {
            value: 203,
            color: '806797',
            description: 'Borohemists',
          },
          {
            value: 206,
            color: 'CB5B5F',
            description: 'Calcicryepts',
          },
          {
            value: 207,
            color: 'CD5C5C',
            description: 'Calciustepts',
          },
          {
            value: 208,
            color: 'D94335',
            description: 'Calcixerepts',
          },
          {
            value: 209,
            color: 'D35740',
            description: 'Cryaquepts',
          },
          {
            value: 210,
            color: 'E05A5D',
            description: 'Durixerepts',
          },
          {
            value: 212,
            color: 'CF5B5C',
            description: 'Durustepts',
          },
          {
            value: 213,
            color: 'CA5964',
            description: 'Dystrocryepts',
          },
          {
            value: 215,
            color: 'CA5D5F',
            description: 'Dystroxerepts',
          },
          {
            value: 216,
            color: 'CD5E5A',
            description: 'Dystrudepts',
          },
          {
            value: 217,
            color: 'CA5969',
            description: 'Dystrustepts',
          },
          {
            value: 218,
            color: 'D95A35',
            description: 'Endoaquepts',
          },
          {
            value: 219,
            color: 'D36240',
            description: 'Epiaquepts',
          },
          {
            value: 220,
            color: 'E05C43',
            description: 'Eutrudepts',
          },
          {
            value: 221,
            color: 'D64755',
            description: 'Fragiaquepts',
          },
          {
            value: 222,
            color: 'CF595C',
            description: 'Fragiudepts',
          },
          {
            value: 225,
            color: 'FF5F5F',
            description: 'Halaquepts',
          },
          {
            value: 226,
            color: 'CD6058',
            description: 'Haplocryepts',
          },
          {
            value: 228,
            color: 'D95F35',
            description: 'Haploxerepts',
          },
          {
            value: 229,
            color: 'D35140',
            description: 'Haplustepts',
          },
          {
            value: 230,
            color: 'D65A55',
            description: 'Humaquepts',
          },
          {
            value: 231,
            color: 'E05C59',
            description: 'Humicryepts',
          },
          {
            value: 233,
            color: 'CF525E',
            description: 'Humixerepts',
          },
          {
            value: 234,
            color: 'C65978',
            description: 'Humudepts',
          },
          {
            value: 235,
            color: 'F5615F',
            description: 'Humustepts',
          },
          {
            value: 245,
            color: '826F9A',
            description: 'Ustochrepts',
          },
          {
            value: 246,
            color: 'CFF41A',
            description: 'Eutrochrepts',
          },
          {
            value: 247,
            color: '4A6F31',
            description: 'Dystrochrepts',
          },
          {
            value: 248,
            color: 'A96989',
            description: 'Eutrocryepts',
          },
          {
            value: 249,
            color: 'E16438',
            description: 'Haplaquepts',
          },
          {
            value: 250,
            color: '24F640',
            description: 'Xerochrepts',
          },
          {
            value: 251,
            color: '88C1F9',
            description: 'Cryochrepts',
          },
          {
            value: 252,
            color: 'F5D25C',
            description: 'Fragiochrepts',
          },
          {
            value: 253,
            color: 'D74322',
            description: 'Haplumbrepts',
          },
          {
            value: 254,
            color: '7F939E',
            description: 'Cryumbrepts',
          },
          {
            value: 255,
            color: '41A545',
            description: 'Dystropepts',
          },
          {
            value: 256,
            color: '8F8340',
            description: 'Vitrandepts',
          },
          {
            value: 268,
            color: '09FE03',
            description: 'Argialbolls',
          },
          {
            value: 269,
            color: '0AFF00',
            description: 'Argiaquolls',
          },
          {
            value: 270,
            color: '0FF30F',
            description: 'Argicryolls',
          },
          {
            value: 271,
            color: '02F00A',
            description: 'Argiudolls',
          },
          {
            value: 272,
            color: '0FC903',
            description: 'Argiustolls',
          },
          {
            value: 273,
            color: '17F000',
            description: 'Argixerolls',
          },
          {
            value: 274,
            color: '0CFF00',
            description: 'Calciaquolls',
          },
          {
            value: 275,
            color: '0AC814',
            description: 'Calcicryolls',
          },
          {
            value: 276,
            color: '0CFE00',
            description: 'Calciudolls',
          },
          {
            value: 277,
            color: '0AFF0A',
            description: 'Calciustolls',
          },
          {
            value: 278,
            color: '03FF05',
            description: 'Calcixerolls',
          },
          {
            value: 279,
            color: '1CF31C',
            description: 'Cryaquolls',
          },
          {
            value: 280,
            color: '24F000',
            description: 'Cryrendolls',
          },
          {
            value: 283,
            color: '00FF0C',
            description: 'Durixerolls',
          },
          {
            value: 284,
            color: '14C814',
            description: 'Durustolls',
          },
          {
            value: 285,
            color: '00FE4C',
            description: 'Endoaquolls',
          },
          {
            value: 286,
            color: '14FF96',
            description: 'Epiaquolls',
          },
          {
            value: 287,
            color: '44D205',
            description: 'Haplocryolls',
          },
          {
            value: 289,
            color: '05F305',
            description: 'Haploxerolls',
          },
          {
            value: 290,
            color: '62F00A',
            description: 'Hapludolls',
          },
          {
            value: 291,
            color: '0FCD03',
            description: 'Haplustolls',
          },
          {
            value: 292,
            color: '00D20F',
            description: 'Haprendolls',
          },
          {
            value: 294,
            color: '1ADD11',
            description: 'Natraquolls',
          },
          {
            value: 296,
            color: '09FF0C',
            description: 'Natrixerolls',
          },
          {
            value: 297,
            color: '03FF05',
            description: 'Natrudolls',
          },
          {
            value: 298,
            color: '05E700',
            description: 'Natrustolls',
          },
          {
            value: 299,
            color: '02F00A',
            description: 'Palecryolls',
          },
          {
            value: 300,
            color: '0FEA03',
            description: 'Paleudolls',
          },
          {
            value: 301,
            color: '00F000',
            description: 'Paleustolls',
          },
          {
            value: 302,
            color: '0CCB0C',
            description: 'Palexerolls',
          },
          {
            value: 303,
            color: '14DD14',
            description: 'Vermudolls',
          },
          {
            value: 306,
            color: '6A685D',
            description: 'Haploborolls',
          },
          {
            value: 307,
            color: 'FAE6B9',
            description: 'Argiborolls',
          },
          {
            value: 308,
            color: '769A34',
            description: 'Haplaquolls',
          },
          {
            value: 309,
            color: '6FF2DF',
            description: 'Cryoborolls',
          },
          {
            value: 310,
            color: 'CA7FC6',
            description: 'Natriborolls',
          },
          {
            value: 311,
            color: 'D8228F',
            description: 'Calciborolls',
          },
          {
            value: 312,
            color: 'C01BF0',
            description: 'Paleborolls',
          },
          {
            value: 342,
            color: 'D2BAD3',
            description: 'Alaquods',
          },
          {
            value: 343,
            color: 'D8C3CB',
            description: 'Alorthods',
          },
          {
            value: 345,
            color: 'D4C6D4',
            description: 'Duraquods',
          },
          {
            value: 348,
            color: 'D5BED5',
            description: 'Durorthods',
          },
          {
            value: 349,
            color: 'DDB9DD',
            description: 'Endoaquods',
          },
          {
            value: 350,
            color: 'D8D2D8',
            description: 'Epiaquods',
          },
          {
            value: 351,
            color: 'D4C9D4',
            description: 'Fragiaquods',
          },
          {
            value: 353,
            color: 'D2BAD5',
            description: 'Fragiorthods',
          },
          {
            value: 354,
            color: 'D5BAD5',
            description: 'Haplocryods',
          },
          {
            value: 356,
            color: 'D5B2D5',
            description: 'Haplohumods',
          },
          {
            value: 357,
            color: 'D8C8D2',
            description: 'Haplorthods',
          },
          {
            value: 358,
            color: 'D4CBD4',
            description: 'Humicryods',
          },
          {
            value: 367,
            color: '552638',
            description: 'Haplaquods',
          },
          {
            value: 368,
            color: '2571EB',
            description: 'Cryorthods',
          },
          {
            value: 370,
            color: 'FFA514',
            description: 'Albaquults',
          },
          {
            value: 371,
            color: 'F3A502',
            description: 'Endoaquults',
          },
          {
            value: 372,
            color: 'FB7B00',
            description: 'Epiaquults',
          },
          {
            value: 373,
            color: 'F0B405',
            description: 'Fragiaquults',
          },
          {
            value: 374,
            color: 'F7A80F',
            description: 'Fragiudults',
          },
          {
            value: 375,
            color: 'FB9113',
            description: 'Haplohumults',
          },
          {
            value: 376,
            color: 'FFA519',
            description: 'Haploxerults',
          },
          {
            value: 377,
            color: 'F3A702',
            description: 'Hapludults',
          },
          {
            value: 378,
            color: 'FBBA07',
            description: 'Haplustults',
          },
          {
            value: 381,
            color: 'F7970F',
            description: 'Kandiudults',
          },
          {
            value: 385,
            color: 'F3A702',
            description: 'Kanhapludults',
          },
          {
            value: 387,
            color: 'FB5A00',
            description: 'Paleaquults',
          },
          {
            value: 388,
            color: 'F0C005',
            description: 'Palehumults',
          },
          {
            value: 389,
            color: 'F7810F',
            description: 'Paleudults',
          },
          {
            value: 390,
            color: 'FF9C00',
            description: 'Paleustults',
          },
          {
            value: 391,
            color: 'F3B002',
            description: 'Palexerults',
          },
          {
            value: 396,
            color: 'F0B005',
            description: 'Rhodudults',
          },
          {
            value: 399,
            color: 'F7980F',
            description: 'Umbraquults',
          },
          {
            value: 401,
            color: '4D7CFC',
            description: 'Ochraquults',
          },
          {
            value: 403,
            color: 'FFFF00',
            description: 'Calciaquerts',
          },
          {
            value: 405,
            color: 'FAFA05',
            description: 'Calciusterts',
          },
          {
            value: 406,
            color: 'EBEB22',
            description: 'Calcixererts',
          },
          {
            value: 409,
            color: 'FFFF14',
            description: 'Dystraquerts',
          },
          {
            value: 410,
            color: 'F1F10A',
            description: 'Dystruderts',
          },
          {
            value: 412,
            color: 'FAFA05',
            description: 'Endoaquerts',
          },
          {
            value: 413,
            color: 'EBEB1E',
            description: 'Epiaquerts',
          },
          {
            value: 414,
            color: 'F5EB0C',
            description: 'Gypsitorrerts',
          },
          {
            value: 415,
            color: 'EEF506',
            description: 'Gypsiusterts',
          },
          {
            value: 417,
            color: 'F1F129',
            description: 'Haplotorrerts',
          },
          {
            value: 418,
            color: 'FAFA05',
            description: 'Haploxererts',
          },
          {
            value: 419,
            color: 'EBEB0C',
            description: 'Hapluderts',
          },
          {
            value: 420,
            color: 'F5D202',
            description: 'Haplusterts',
          },
          {
            value: 422,
            color: 'FFD700',
            description: 'Natraquerts',
          },
          {
            value: 424,
            color: 'F1F12B',
            description: 'Salitorrerts',
          },
          {
            value: 429,
            color: 'A91FAC',
            description: 'Chromusterts',
          },
          {
            value: 430,
            color: '2DA468',
            description: 'Pellusterts',
          },
          {
            value: 431,
            color: '9A8B71',
            description: 'Chromoxererts',
          },
          {
            value: 432,
            color: '76B989',
            description: 'Pelluderts',
          },
          {
            value: 433,
            color: '713959',
            description: 'Torrerts',
          },
        ],
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'USDA soil taxonomy great groups',
        lookat: {
          lon: -5.6,
          lat: 30.7,
          zoom: 1,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              433.0,
            ],
            palette: [
              'FFFFFF',
              'ADFF2D',
              'ADFF22',
              'A5FF2F',
              '87FF37',
              'BAF019',
              '87FF19',
              '96F03D',
              'A3F52F',
              'AFF319',
              '91FF37',
              '9CF319',
              '9BFF37',
              '91FF19',
              '71FF37',
              '86FF19',
              'A9D42D',
              'AFF519',
              '9BFF19',
              '9AF024',
              'A5FD2F',
              '88FF37',
              'AFED19',
              '71FF19',
              'AFF026',
              '8CF537',
              'B7FF19',
              '7177C0',
              '9A85EC',
              'F5F5E1',
              '52CF5A',
              'E42777',
              '4EF76D',
              'FF00FB',
              'EB05EB',
              'FA04FA',
              'FC04F5',
              'F50DF0',
              'F118F1',
              'FA0CFA',
              'FC05E1',
              'F100D5',
              'EB09E6',
              'FA22FA',
              'FFDAB9',
              'F5D2BB',
              'E8C9B8',
              'FFDDC4',
              'E7CBC0',
              'FFD2C3',
              'F5D6BB',
              'D5D3B9',
              'E8D4B8',
              'E7CDC0',
              'F3EAC8',
              'A0C4BA',
              'FFD2B9',
              'F5DABB',
              'F5D5B9',
              'E8EBB8',
              'FFDDC2',
              'E7FFC0',
              'F3E6C8',
              'FFDAB9',
              'F5CDB9',
              'A91D30',
              '796578',
              'D8FF6E',
              '177548',
              '43EFD6',
              '8496A9',
              '296819',
              '73FFD4',
              '6FFFC8',
              '75FBC9',
              '86F5D1',
              '82FFD2',
              '88EEC8',
              '80FFD4',
              '6BFFC9',
              '88EEC8',
              '7FFFC8',
              '81FFD2',
              '86F0D4',
              '67FFC8',
              '88EEC8',
              '7FFBCB',
              '87FFD2',
              '8AF5CE',
              '6BFAD2',
              '78F0D4',
              '88EEC8',
              '7FFBD4',
              '73F5CD',
              '88C8D2',
              '91F0CD',
              '73CDD2',
              '88EEC8',
              'FB849B',
              'DD4479',
              '61388B',
              'A52A30',
              '722328',
              'D81419',
              'A42828',
              '82F5CD',
              'A54C2E',
              'C11919',
              'B91419',
              '21B199',
              '702028',
              'B41919',
              'B22328',
              'A2C7EB',
              '36BA79',
              '806797',
              'CB5B5F',
              'CD5C5C',
              'D94335',
              'D35740',
              'E05A5D',
              'CF5B5C',
              'CA5964',
              'CA5D5F',
              'CD5E5A',
              'CA5969',
              'D95A35',
              'D36240',
              'E05C43',
              'D64755',
              'CF595C',
              'FF5F5F',
              'CD6058',
              'D95F35',
              'D35140',
              'D65A55',
              'E05C59',
              'CF525E',
              'C65978',
              'F5615F',
              '826F9A',
              'CFF41A',
              '4A6F31',
              'A96989',
              'E16438',
              '24F640',
              '88C1F9',
              'F5D25C',
              'D74322',
              '7F939E',
              '41A545',
              '8F8340',
              '09FE03',
              '0AFF00',
              '0FF30F',
              '02F00A',
              '0FC903',
              '17F000',
              '0CFF00',
              '0AC814',
              '0CFE00',
              '0AFF0A',
              '03FF05',
              '1CF31C',
              '24F000',
              '00FF0C',
              '14C814',
              '00FE4C',
              '14FF96',
              '44D205',
              '05F305',
              '62F00A',
              '0FCD03',
              '00D20F',
              '1ADD11',
              '09FF0C',
              '03FF05',
              '05E700',
              '02F00A',
              '0FEA03',
              '00F000',
              '0CCB0C',
              '14DD14',
              '6A685D',
              'FAE6B9',
              '769A34',
              '6FF2DF',
              'CA7FC6',
              'D8228F',
              'C01BF0',
              'D2BAD3',
              'D8C3CB',
              'D4C6D4',
              'D5BED5',
              'DDB9DD',
              'D8D2D8',
              'D4C9D4',
              'D2BAD5',
              'D5BAD5',
              'D5B2D5',
              'D8C8D2',
              'D4CBD4',
              '552638',
              '2571EB',
              'FFA514',
              'F3A502',
              'FB7B00',
              'F0B405',
              'F7A80F',
              'FB9113',
              'FFA519',
              'F3A702',
              'FBBA07',
              'F7970F',
              'F3A702',
              'FB5A00',
              'F0C005',
              'F7810F',
              'FF9C00',
              'F3B002',
              'F0B005',
              'F7980F',
              '4D7CFC',
              'FFFF00',
              'FAFA05',
              'EBEB22',
              'FFFF14',
              'F1F10A',
              'FAFA05',
              'EBEB1E',
              'F5EB0C',
              'EEF506',
              'F1F129',
              'FAFA05',
              'EBEB0C',
              'F5D202',
              'FFD700',
              'F1F12B',
              'A91FAC',
              '2DA468',
              '9A8B71',
              '76B989',
              '713959',
            ],
            bands: [
              'grtgroup',
            ],
          },
        },
      },
    ],
  },
  'sci:doi': '10.5281/zenodo.1476844',
  'sci:citation': |||
    Tomislav Hengl, & Travis Nauman. (2018). Predicted USDA soil great groups at
    250 m (probabilities) (Version v01) [Data set]. Zenodo.
    [10.5281/zenodo.1476844](https://doi.org/10.5281/zenodo.1476844)
  |||,
  'gee:terms_of_use': ee.gee_terms_of_use(license),
  'gee:unusual_terms_of_use': true,
  'gee:user_uploaded': true,
}
