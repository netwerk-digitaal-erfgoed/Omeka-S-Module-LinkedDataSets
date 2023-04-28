-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Gegenereerd op: 28 apr 2023 om 11:54
-- Serverversie: 10.3.38-MariaDB
-- PHP-versie: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lamp`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `custom_vocab`
--

CREATE TABLE `custom_vocab` (
  `id` int(11) NOT NULL,
  `item_set_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `terms` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `uris` longtext DEFAULT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `custom_vocab`
--

INSERT INTO `custom_vocab` (`id`, `item_set_id`, `owner_id`, `label`, `lang`, `terms`, `uris`) VALUES
(4, NULL, 1, 'test', NULL, '[\"1\",\"2\",\"3\"]', NULL),
(5, NULL, 1, 'LDS IETF Language Tags', NULL, '[\"af\",\"af-NA\",\"af-ZA\",\"agq\",\"agq-CM\",\"ak\",\"ak-GH\",\"am\",\"am-ET\",\"ar\",\"ar-001\",\"ar-AE\",\"ar-BH\",\"ar-DJ\",\"ar-DZ\",\"ar-EG\",\"ar-ER\",\"ar-EH\",\"ar-IL\",\"ar-IQ\",\"ar-JO\",\"ar-KM\",\"ar-KW\",\"ar-LB\",\"ar-LY\",\"ar-MA\",\"ar-MR\",\"ar-OM\",\"ar-PS\",\"ar-QA\",\"ar-SA\",\"ar-SD\",\"ar-SO\",\"ar-SS\",\"ar-SY\",\"ar-TD\",\"ar-TN\",\"ar-YE\",\"as\",\"as-IN\",\"asa\",\"asa-TZ\",\"ast\",\"ast-ES\",\"az\",\"az-Cyrl\",\"az-Cyrl-AZ\",\"az-Latn\",\"az-Latn-AZ\",\"bas\",\"bas-CM\",\"be\",\"be-BY\",\"bem\",\"bem-ZM\",\"bez\",\"bez-TZ\",\"bg\",\"bg-BG\",\"bm\",\"bm-ML\",\"bn\",\"bn-BD\",\"bn-IN\",\"bo\",\"bo-CN\",\"bo-IN\",\"br\",\"br-FR\",\"brx\",\"brx-IN\",\"bs\",\"bs-Cyrl\",\"bs-Cyrl-BA\",\"bs-Latn\",\"bs-Latn-BA\",\"ca\",\"ca-AD\",\"ca-ES\",\"ca-ES-VALENCIA\",\"ca-FR\",\"ca-IT\",\"ccp\",\"ccp-BD\",\"ccp-IN\",\"ce\",\"ce-RU\",\"ceb\",\"ceb-PH\",\"cgg\",\"cgg-UG\",\"chr\",\"chr-US\",\"ckb\",\"ckb-IQ\",\"ckb-IR\",\"cs\",\"cs-CZ\",\"cu\",\"cu-RU\",\"cy\",\"cy-GB\",\"da\",\"da-DK\",\"da-GL\",\"dav\",\"dav-KE\",\"de\",\"de-AT\",\"de-BE\",\"de-CH\",\"de-DE\",\"de-IT\",\"de-LI\",\"de-LU\",\"dje\",\"dje-NE\",\"dsb\",\"dsb-DE\",\"dua\",\"dua-CM\",\"dyo\",\"dyo-SN\",\"dz\",\"dz-BT\",\"ebu\",\"ebu-KE\",\"ee\",\"ee-GH\",\"ee-TG\",\"el\",\"el-CY\",\"el-GR\",\"en\",\"en-001\",\"en-150\",\"en-AE\",\"en-AG\",\"en-AI\",\"en-AS\",\"en-AT\",\"en-AU\",\"en-BB\",\"en-BE\",\"en-BI\",\"en-BM\",\"en-BS\",\"en-BW\",\"en-BZ\",\"en-CA\",\"en-CC\",\"en-CH\",\"en-CK\",\"en-CM\",\"en-CX\",\"en-CY\",\"en-DE\",\"en-DG\",\"en-DK\",\"en-DM\",\"en-ER\",\"en-FI\",\"en-FJ\",\"en-FK\",\"en-FM\",\"en-GB\",\"en-GD\",\"en-GG\",\"en-GH\",\"en-GI\",\"en-GM\",\"en-GU\",\"en-GY\",\"en-HK\",\"en-IE\",\"en-IL\",\"en-IM\",\"en-IN\",\"en-IO\",\"en-JE\",\"en-JM\",\"en-KE\",\"en-KI\",\"en-KN\",\"en-KY\",\"en-LC\",\"en-LR\",\"en-LS\",\"en-MG\",\"en-MH\",\"en-MO\",\"en-MP\",\"en-MS\",\"en-MT\",\"en-MU\",\"en-MW\",\"en-MY\",\"en-NA\",\"en-NF\",\"en-NG\",\"en-NL\",\"en-NR\",\"en-NU\",\"en-NZ\",\"en-PG\",\"en-PH\",\"en-PK\",\"en-PN\",\"en-PR\",\"en-PW\",\"en-RW\",\"en-SB\",\"en-SC\",\"en-SD\",\"en-SE\",\"en-SG\",\"en-SH\",\"en-SI\",\"en-SL\",\"en-SS\",\"en-SX\",\"en-SZ\",\"en-TC\",\"en-TK\",\"en-TO\",\"en-TT\",\"en-TV\",\"en-TZ\",\"en-UG\",\"en-UM\",\"en-US\",\"en-US-POSIX\",\"en-VC\",\"en-VG\",\"en-VI\",\"en-VU\",\"en-WS\",\"en-ZA\",\"en-ZM\",\"en-ZW\",\"eo\",\"eo-001\",\"es\",\"es-419\",\"es-AR\",\"es-BO\",\"es-BR\",\"es-BZ\",\"es-CL\",\"es-CO\",\"es-CR\",\"es-CU\",\"es-DO\",\"es-EA\",\"es-EC\",\"es-ES\",\"es-GQ\",\"es-GT\",\"es-HN\",\"es-IC\",\"es-MX\",\"es-NI\",\"es-PA\",\"es-PE\",\"es-PH\",\"es-PR\",\"es-PY\",\"es-SV\",\"es-US\",\"es-UY\",\"es-VE\",\"et\",\"et-EE\",\"eu\",\"eu-ES\",\"ewo\",\"ewo-CM\",\"fa\",\"fa-AF\",\"fa-IR\",\"ff\",\"ff-Adlm\",\"ff-Adlm-BF\",\"ff-Adlm-CM\",\"ff-Adlm-GH\",\"ff-Adlm-GM\",\"ff-Adlm-GN\",\"ff-Adlm-GW\",\"ff-Adlm-LR\",\"ff-Adlm-MR\",\"ff-Adlm-NE\",\"ff-Adlm-NG\",\"ff-Adlm-SL\",\"ff-Adlm-SN\",\"ff-Latn\",\"ff-Latn-BF\",\"ff-Latn-CM\",\"ff-Latn-GH\",\"ff-Latn-GM\",\"ff-Latn-GN\",\"ff-Latn-GW\",\"ff-Latn-LR\",\"ff-Latn-MR\",\"ff-Latn-NE\",\"ff-Latn-NG\",\"ff-Latn-SL\",\"ff-Latn-SN\",\"fi\",\"fi-FI\",\"fil\",\"fil-PH\",\"fo\",\"fo-DK\",\"fo-FO\",\"fr\",\"fr-BE\",\"fr-BF\",\"fr-BI\",\"fr-BJ\",\"fr-BL\",\"fr-CA\",\"fr-CD\",\"fr-CF\",\"fr-CG\",\"fr-CH\",\"fr-CI\",\"fr-CM\",\"fr-DJ\",\"fr-DZ\",\"fr-FR\",\"fr-GA\",\"fr-GF\",\"fr-GN\",\"fr-GP\",\"fr-GQ\",\"fr-HT\",\"fr-KM\",\"fr-LU\",\"fr-MA\",\"fr-MC\",\"fr-MF\",\"fr-MG\",\"fr-ML\",\"fr-MQ\",\"fr-MR\",\"fr-MU\",\"fr-NC\",\"fr-NE\",\"fr-PF\",\"fr-PM\",\"fr-RE\",\"fr-RW\",\"fr-SC\",\"fr-SN\",\"fr-SY\",\"fr-TD\",\"fr-TG\",\"fr-TN\",\"fr-VU\",\"fr-WF\",\"fr-YT\",\"fur\",\"fur-IT\",\"fy\",\"fy-NL\",\"ga\",\"ga-GB\",\"ga-IE\",\"gd\",\"gd-GB\",\"gl\",\"gl-ES\",\"gsw\",\"gsw-CH\",\"gsw-FR\",\"gsw-LI\",\"gu\",\"gu-IN\",\"guz\",\"guz-KE\",\"gv\",\"gv-IM\",\"ha\",\"ha-GH\",\"ha-NE\",\"ha-NG\",\"haw\",\"haw-US\",\"he\",\"he-IL\",\"hi\",\"hi-IN\",\"hr\",\"hr-BA\",\"hr-HR\",\"hsb\",\"hsb-DE\",\"hu\",\"hu-HU\",\"hy\",\"hy-AM\",\"ia\",\"ia-001\",\"id\",\"id-ID\",\"ig\",\"ig-NG\",\"ii\",\"ii-CN\",\"is\",\"is-IS\",\"it\",\"it-CH\",\"it-IT\",\"it-SM\",\"it-VA\",\"ja\",\"ja-JP\",\"jgo\",\"jgo-CM\",\"jmc\",\"jmc-TZ\",\"jv\",\"jv-ID\",\"ka\",\"ka-GE\",\"kab\",\"kab-DZ\",\"kam\",\"kam-KE\",\"kde\",\"kde-TZ\",\"kea\",\"kea-CV\",\"khq\",\"khq-ML\",\"ki\",\"ki-KE\",\"kk\",\"kk-KZ\",\"kkj\",\"kkj-CM\",\"kl\",\"kl-GL\",\"kln\",\"kln-KE\",\"km\",\"km-KH\",\"kn\",\"kn-IN\",\"ko\",\"ko-KP\",\"ko-KR\",\"kok\",\"kok-IN\",\"ks\",\"ks-Arab\",\"ks-Arab-IN\",\"ksb\",\"ksb-TZ\",\"ksf\",\"ksf-CM\",\"ksh\",\"ksh-DE\",\"ku\",\"ku-TR\",\"kw\",\"kw-GB\",\"ky\",\"ky-KG\",\"lag\",\"lag-TZ\",\"lb\",\"lb-LU\",\"lg\",\"lg-UG\",\"lkt\",\"lkt-US\",\"ln\",\"ln-AO\",\"ln-CD\",\"ln-CF\",\"ln-CG\",\"lo\",\"lo-LA\",\"lrc\",\"lrc-IQ\",\"lrc-IR\",\"lt\",\"lt-LT\",\"lu\",\"lu-CD\",\"luo\",\"luo-KE\",\"luy\",\"luy-KE\",\"lv\",\"lv-LV\",\"mai\",\"mai-IN\",\"mas\",\"mas-KE\",\"mas-TZ\",\"mer\",\"mer-KE\",\"mfe\",\"mfe-MU\",\"mg\",\"mg-MG\",\"mgh\",\"mgh-MZ\",\"mgo\",\"mgo-CM\",\"mi\",\"mi-NZ\",\"mk\",\"mk-MK\",\"ml\",\"ml-IN\",\"mn\",\"mn-MN\",\"mni\",\"mni-Beng\",\"mni-Beng-IN\",\"mr\",\"mr-IN\",\"ms\",\"ms-BN\",\"ms-ID\",\"ms-MY\",\"ms-SG\",\"mt\",\"mt-MT\",\"mua\",\"mua-CM\",\"my\",\"my-MM\",\"mzn\",\"mzn-IR\",\"naq\",\"naq-NA\",\"nb\",\"nb-NO\",\"nb-SJ\",\"nd\",\"nd-ZW\",\"nds\",\"nds-DE\",\"nds-NL\",\"ne\",\"ne-IN\",\"ne-NP\",\"nl\",\"nl-AW\",\"nl-BE\",\"nl-BQ\",\"nl-CW\",\"nl-NL\",\"nl-SR\",\"nl-SX\",\"nmg\",\"nmg-CM\",\"nn\",\"nn-NO\",\"nnh\",\"nnh-CM\",\"nus\",\"nus-SS\",\"nyn\",\"nyn-UG\",\"om\",\"om-ET\",\"om-KE\",\"or\",\"or-IN\",\"os\",\"os-GE\",\"os-RU\",\"pa\",\"pa-Arab\",\"pa-Arab-PK\",\"pa-Guru\",\"pa-Guru-IN\",\"pcm\",\"pcm-NG\",\"pl\",\"pl-PL\",\"prg\",\"prg-001\",\"ps\",\"ps-AF\",\"ps-PK\",\"pt\",\"pt-AO\",\"pt-BR\",\"pt-CH\",\"pt-CV\",\"pt-GQ\",\"pt-GW\",\"pt-LU\",\"pt-MO\",\"pt-MZ\",\"pt-PT\",\"pt-ST\",\"pt-TL\",\"qu\",\"qu-BO\",\"qu-EC\",\"qu-PE\",\"rm\",\"rm-CH\",\"rn\",\"rn-BI\",\"ro\",\"ro-MD\",\"ro-RO\",\"rof\",\"rof-TZ\",\"root\",\"ru\",\"ru-BY\",\"ru-KG\",\"ru-KZ\",\"ru-MD\",\"ru-RU\",\"ru-UA\",\"rw\",\"rw-RW\",\"rwk\",\"rwk-TZ\",\"sah\",\"sah-RU\",\"saq\",\"saq-KE\",\"sat\",\"sat-Olck\",\"sat-Olck-IN\",\"sbp\",\"sbp-TZ\",\"sd\",\"sd-Arab\",\"sd-Arab-PK\",\"sd-Deva\",\"sd-Deva-IN\",\"se\",\"se-FI\",\"se-NO\",\"se-SE\",\"seh\",\"seh-MZ\",\"ses\",\"ses-ML\",\"sg\",\"sg-CF\",\"shi\",\"shi-Latn\",\"shi-Latn-MA\",\"shi-Tfng\",\"shi-Tfng-MA\",\"si\",\"si-LK\",\"sk\",\"sk-SK\",\"sl\",\"sl-SI\",\"smn\",\"smn-FI\",\"sn\",\"sn-ZW\",\"so\",\"so-DJ\",\"so-ET\",\"so-KE\",\"so-SO\",\"sq\",\"sq-AL\",\"sq-MK\",\"sq-XK\",\"sr\",\"sr-Cyrl\",\"sr-Cyrl-BA\",\"sr-Cyrl-ME\",\"sr-Cyrl-RS\",\"sr-Cyrl-XK\",\"sr-Latn\",\"sr-Latn-BA\",\"sr-Latn-ME\",\"sr-Latn-RS\",\"sr-Latn-XK\",\"su\",\"su-Latn\",\"su-Latn-ID\",\"sv\",\"sv-AX\",\"sv-FI\",\"sv-SE\",\"sw\",\"sw-CD\",\"sw-KE\",\"sw-TZ\",\"sw-UG\",\"ta\",\"ta-IN\",\"ta-LK\",\"ta-MY\",\"ta-SG\",\"te\",\"te-IN\",\"teo\",\"teo-KE\",\"teo-UG\",\"tg\",\"tg-TJ\",\"th\",\"th-TH\",\"ti\",\"ti-ER\",\"ti-ET\",\"tk\",\"tk-TM\",\"to\",\"to-TO\",\"tr\",\"tr-CY\",\"tr-TR\",\"tt\",\"tt-RU\",\"twq\",\"twq-NE\",\"tzm\",\"tzm-MA\",\"ug\",\"ug-CN\",\"uk\",\"uk-UA\",\"ur\",\"ur-IN\",\"ur-PK\",\"uz\",\"uz-Arab\",\"uz-Arab-AF\",\"uz-Cyrl\",\"uz-Cyrl-UZ\",\"uz-Latn\",\"uz-Latn-UZ\",\"vai\",\"vai-Latn\",\"vai-Latn-LR\",\"vai-Vaii\",\"vai-Vaii-LR\",\"vi\",\"vi-VN\",\"vo\",\"vo-001\",\"vun\",\"vun-TZ\",\"wae\",\"wae-CH\",\"wo\",\"wo-SN\",\"xh\",\"xh-ZA\",\"xog\",\"xog-UG\",\"yav\",\"yav-CM\",\"yi\",\"yi-001\",\"yo\",\"yo-BJ\",\"yo-NG\",\"yue\",\"yue-Hans\",\"yue-Hans-CN\",\"yue-Hant\",\"yue-Hant-HK\",\"zgh\",\"zgh-MA\",\"zh\",\"zh-Hans\",\"zh-Hans-CN\",\"zh-Hans-HK\",\"zh-Hans-MO\",\"zh-Hans-SG\",\"zh-Hant\",\"zh-Hant-HK\",\"zh-Hant-MO\",\"zh-Hant-TW\",\"zu\",\"zu-ZA\"]', NULL),
(6, NULL, 1, 'LDS licenses', NULL, NULL, '{\"http:\\/\\/opendatacommons.org\\/licenses\\/pddl\\/1-0\\/\":\"Open Data Commons Public Domain Dedication and License (PDDL) v1.0\",\"http:\\/\\/opendatacommons.org\\/licenses\\/by\\/1-0\\/\":\"Open Data Commons Attribution License (ODC-By) v1.0\",\"http:\\/\\/opendatacommons.org\\/licenses\\/odbl\\/1-0\\/\":\"Open Data Commons Open Database License (ODbL) v1.0\",\"https:\\/\\/opendatacommons.org\\/licenses\\/by\\/1-0\\/\":\"Open Data Commons Attribution License (ODC-By) v1.0\",\"http:\\/\\/creativecommons.org\\/licenses\\/by-sa\\/4.0\\/\":\"Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)\",\"http:\\/\\/creativecommons.org\\/licenses\\/by\\/4.0\\/\":\"Attribution 4.0 International (CC BY 4.0)\",\"https:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/4.0\\/\":\"Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)\",\"https:\\/\\/creativecommons.org\\/licenses\\/by-nc\\/4.0\\/\":\"Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)\",\"https:\\/\\/creativecommons.org\\/licenses\\/by-nc-sa\\/4.0\\/\":\"Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)\",\"https:\\/\\/creativecommons.org\\/licenses\\/by-nc-nd\\/4.0\\/\":\"Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)\",\"http:\\/\\/creativecommons.org\\/publicdomain\\/mark\\/1.0\\/\":\"Public Domain Mark 1.0\",\"http:\\/\\/creativecommons.org\\/publicdomain\\/zero\\/1.0\\/\":\"CC0 1.0 Universal (CC0 1.0) Public Domain Dedication\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC\\/1.0\\/\":\"In copyright\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC-OW-EU\\/1.0\\/\":\"In copyright (EU orphan work)\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC-EDU\\/1.0\\/\":\"In copyright (educational use permitted)\",\"http:\\/\\/rightsstatements.org\\/vocab\\/UND\\/1.0\\/\":\"Copyright undetermined\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NKC\\/1.0\\/\":\"No known copyright\",\"http:\\/\\/rightsstatements.org\\/vocab\\/CNE\\/1.0\\/\":\"Copyright  not evaluated\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NoC-US\\/1.0\\/\":\"No copyright - United States\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NoC-CR\\/1.0\\/\":\"No copyright - contractual restrictions\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NoC-NC\\/1.0\\/\":\"No copyright - non-commercial use only\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NoC-OKLR\\/1.0\\/\":\"No copyright - other known legal restrictions\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC-NC\\/1.0\\/\":\"In copyright (non-commercial use permitted)\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC-RUU\\/1.0\\/\":\"In copyright (rights-holder(s) unlocatable or unidentifiable)\"}');
INSERT INTO `custom_vocab` (`id`, `item_set_id`, `owner_id`, `label`, `lang`, `terms`, `uris`) VALUES
(7, NULL, 1, 'LDS Media Types', NULL, '[\"application\\/1d-interleaved-parityfec\",\"application\\/3gpdash-qoe-report+xml\",\"application\\/3gpp-ims+xml\",\"application\\/A2L\",\"application\\/activemessage\",\"application\\/activity+json\",\"application\\/alto-costmap+json\",\"application\\/alto-costmapfilter+json\",\"application\\/alto-directory+json\",\"application\\/alto-endpointcost+json\",\"application\\/alto-endpointcostparams+json\",\"application\\/alto-endpointprop+json\",\"application\\/alto-endpointpropparams+json\",\"application\\/alto-error+json\",\"application\\/alto-networkmap+json\",\"application\\/alto-networkmapfilter+json\",\"application\\/AML\",\"application\\/andrew-inset\",\"application\\/applefile\",\"application\\/ATF\",\"application\\/ATFX\",\"application\\/atom+xml\",\"application\\/atomcat+xml\",\"application\\/atomdeleted+xml\",\"application\\/atomicmail\",\"application\\/atomsvc+xml\",\"application\\/ATXML\",\"application\\/auth-policy+xml\",\"application\\/bacnet-xdd+zip\",\"application\\/batch-SMTP\",\"application\\/beep+xml\",\"application\\/calendar+json\",\"application\\/calendar+xml\",\"application\\/call-completion\",\"application\\/CALS-1840\",\"application\\/cbor\",\"application\\/cccex\",\"application\\/ccmp+xml\",\"application\\/ccxml+xml\",\"application\\/CDFX+XML\",\"application\\/cdmi-capability\",\"application\\/cdmi-container\",\"application\\/cdmi-domain\",\"application\\/cdmi-object\",\"application\\/cdmi-queue\",\"application\\/cdni\",\"application\\/CEA\",\"application\\/cea-2018+xml\",\"application\\/cellml+xml\",\"application\\/cfw\",\"application\\/clue_info+xml\",\"application\\/cms\",\"application\\/cnrp+xml\",\"application\\/coap-group+json\",\"application\\/coap-payload\",\"application\\/commonground\",\"application\\/conference-info+xml\",\"application\\/cose\",\"application\\/cose-key\",\"application\\/cose-key-set\",\"application\\/cpl+xml\",\"application\\/csrattrs\",\"application\\/csta+xml\",\"application\\/CSTAdata+xml\",\"application\\/csvm+json\",\"application\\/cwt\",\"application\\/cybercash\",\"application\\/dash+xml\",\"application\\/dashdelta\",\"application\\/davmount+xml\",\"application\\/dca-rft\",\"application\\/DCD\",\"application\\/dec-dx\",\"application\\/dialog-info+xml\",\"application\\/dicom\",\"application\\/dicom+json\",\"application\\/dicom+xml\",\"application\\/DII\",\"application\\/DIT\",\"application\\/dns\",\"application\\/dskpp+xml\",\"application\\/dssc+der\",\"application\\/dssc+xml\",\"application\\/dvcs\",\"application\\/ecmascript\",\"application\\/EDI-consent\",\"application\\/EDI-X12\",\"application\\/EDIFACT\",\"application\\/efi\",\"application\\/EmergencyCallData.Comment+xml\",\"application\\/EmergencyCallData.Control+xml\",\"application\\/EmergencyCallData.DeviceInfo+xml\",\"application\\/EmergencyCallData.eCall.MSD\",\"application\\/EmergencyCallData.ProviderInfo+xml\",\"application\\/EmergencyCallData.ServiceInfo+xml\",\"application\\/EmergencyCallData.SubscriberInfo+xml\",\"application\\/EmergencyCallData.VEDS+xml\",\"application\\/emotionml+xml\",\"application\\/encaprtp\",\"application\\/epp+xml\",\"application\\/epub+zip\",\"application\\/eshop\",\"application\\/example\",\"application\\/fastinfoset\",\"application\\/fastsoap\",\"application\\/fdt+xml\",\"application\\/fhir+json\",\"application\\/fhir+xml\",\"application\\/fits\",\"application\\/font-sfnt\",\"application\\/font-tdpfr\",\"application\\/font-woff\",\"application\\/framework-attributes+xml\",\"application\\/geo+json\",\"application\\/geo+json-seq\",\"application\\/geoxacml+xml\",\"application\\/gml+xml\",\"application\\/gzip\",\"application\\/H224\",\"application\\/held+xml\",\"application\\/http\",\"application\\/hyperstudio\",\"application\\/ibe-key-request+xml\",\"application\\/ibe-pkg-reply+xml\",\"application\\/ibe-pp-data\",\"application\\/iges\",\"application\\/im-iscomposing+xml\",\"application\\/index\",\"application\\/index-obj\",\"application\\/index.cmd\",\"application\\/index.response\",\"application\\/index.vnd\",\"application\\/inkml+xml\",\"application\\/IOTP\",\"application\\/ipfix\",\"application\\/ipp\",\"application\\/ISUP\",\"application\\/its+xml\",\"application\\/javascript\",\"application\\/jf2feed+json\",\"application\\/jose\",\"application\\/jose+json\",\"application\\/jrd+json\",\"application\\/json\",\"application\\/json-patch+json\",\"application\\/json-seq\",\"application\\/jwk+json\",\"application\\/jwk-set+json\",\"application\\/jwt\",\"application\\/kpml-request+xml\",\"application\\/kpml-response+xml\",\"application\\/ld+json\",\"application\\/ld+json+gzip\",\"application\\/lgr+xml\",\"application\\/link-format\",\"application\\/load-control+xml\",\"application\\/lost+xml\",\"application\\/lostsync+xml\",\"application\\/LXF\",\"application\\/mac-binhex40\",\"application\\/macwriteii\",\"application\\/mads+xml\",\"application\\/marc\",\"application\\/marcxml+xml\",\"application\\/mathematica\",\"application\\/mbms-associated-procedure-description+xml\",\"application\\/mbms-deregister+xml\",\"application\\/mbms-envelope+xml\",\"application\\/mbms-msk+xml\",\"application\\/mbms-msk-response+xml\",\"application\\/mbms-protection-description+xml\",\"application\\/mbms-reception-report+xml\",\"application\\/mbms-register+xml\",\"application\\/mbms-register-response+xml\",\"application\\/mbms-schedule+xml\",\"application\\/mbms-user-service-description+xml\",\"application\\/mbox\",\"application\\/media-policy-dataset+xml\",\"application\\/media_control+xml\",\"application\\/mediaservercontrol+xml\",\"application\\/merge-patch+json\",\"application\\/metalink4+xml\",\"application\\/mets+xml\",\"application\\/MF4\",\"application\\/mikey\",\"application\\/mmt-usd+xml\",\"application\\/mods+xml\",\"application\\/moss-keys\",\"application\\/moss-signature\",\"application\\/mosskey-data\",\"application\\/mosskey-request\",\"application\\/mp21\",\"application\\/mp4\",\"application\\/mpeg4-generic\",\"application\\/mpeg4-iod\",\"application\\/mpeg4-iod-xmt\",\"application\\/mrb-consumer+xml\",\"application\\/mrb-publish+xml\",\"application\\/msc-ivr+xml\",\"application\\/msc-mixer+xml\",\"application\\/msword\",\"application\\/mud+json\",\"application\\/mxf\",\"application\\/n-quads\",\"application\\/n-quads+gzip\",\"application\\/n-triples\",\"application\\/n-triples+gzip\",\"application\\/nasdata\",\"application\\/news-checkgroups\",\"application\\/news-groupinfo\",\"application\\/news-transmission\",\"application\\/nlsml+xml\",\"application\\/node\",\"application\\/nss\",\"application\\/ocsp-request\",\"application\\/ocsp-response\",\"application\\/octet-stream\",\"application\\/ODA\",\"application\\/ODX\",\"application\\/oebps-package+xml\",\"application\\/ogg\",\"application\\/oxps\",\"application\\/p2p-overlay+xml\",\"application\\/passport\",\"application\\/patch-ops-error+xml\",\"application\\/pdf\",\"application\\/PDX\",\"application\\/pgp-encrypted\",\"application\\/pgp-signature\",\"application\\/pidf+xml\",\"application\\/pidf-diff+xml\",\"application\\/pkcs10\",\"application\\/pkcs12\",\"application\\/pkcs7-mime\",\"application\\/pkcs7-signature\",\"application\\/pkcs8\",\"application\\/pkcs8-encrypted\",\"application\\/pkix-attr-cert\",\"application\\/pkix-cert\",\"application\\/pkix-crl\",\"application\\/pkix-pkipath\",\"application\\/pkixcmp\",\"application\\/pls+xml\",\"application\\/poc-settings+xml\",\"application\\/postscript\",\"application\\/ppsp-tracker+json\",\"application\\/problem+json\",\"application\\/problem+xml\",\"application\\/provenance+xml\",\"application\\/prs.alvestrand.titrax-sheet\",\"application\\/prs.cww\",\"application\\/prs.hpub+zip\",\"application\\/prs.nprend\",\"application\\/prs.plucker\",\"application\\/prs.rdf-xml-crypt\",\"application\\/prs.xsf+xml\",\"application\\/pskc+xml\",\"application\\/QSIG\",\"application\\/raptorfec\",\"application\\/rdap+json\",\"application\\/rdf+xml\",\"application\\/rdf+xml+gzip\",\"application\\/reginfo+xml\",\"application\\/relax-ng-compact-syntax\",\"application\\/remote-printing\",\"application\\/reputon+json\",\"application\\/resource-lists+xml\",\"application\\/resource-lists-diff+xml\",\"application\\/rfc+xml\",\"application\\/riscos\",\"application\\/rlmi+xml\",\"application\\/rls-services+xml\",\"application\\/route-apd+xml\",\"application\\/route-s-tsid+xml\",\"application\\/route-usd+xml\",\"application\\/rpki-ghostbusters\",\"application\\/rpki-manifest\",\"application\\/rpki-publication\",\"application\\/rpki-roa\",\"application\\/rpki-updown\",\"application\\/rtf\",\"application\\/rtploopback\",\"application\\/rtx\",\"application\\/samlassertion+xml\",\"application\\/samlmetadata+xml\",\"application\\/sbml+xml\",\"application\\/scaip+xml\",\"application\\/scim+json\",\"application\\/scvp-cv-request\",\"application\\/scvp-cv-response\",\"application\\/scvp-vp-request\",\"application\\/scvp-vp-response\",\"application\\/sdp\",\"application\\/sep+xml\",\"application\\/sep-exi\",\"application\\/session-info\",\"application\\/set-payment\",\"application\\/set-payment-initiation\",\"application\\/set-registration\",\"application\\/set-registration-initiation\",\"application\\/SGML\",\"application\\/sgml-open-catalog\",\"application\\/shf+xml\",\"application\\/sieve\",\"application\\/simple-filter+xml\",\"application\\/simple-message-summary\",\"application\\/simpleSymbolContainer\",\"application\\/slate\",\"application\\/smil\",\"application\\/smil+xml\",\"application\\/smpte336m\",\"application\\/soap+fastinfoset\",\"application\\/soap+xml\",\"application\\/sparql-query\",\"application\\/spirits-event+xml\",\"application\\/sql\",\"application\\/srgs\",\"application\\/srgs+xml\",\"application\\/sru+xml\",\"application\\/ssml+xml\",\"application\\/tamp-apex-update\",\"application\\/tamp-apex-update-confirm\",\"application\\/tamp-community-update\",\"application\\/tamp-community-update-confirm\",\"application\\/tamp-error\",\"application\\/tamp-sequence-adjust\",\"application\\/tamp-sequence-adjust-confirm\",\"application\\/tamp-status-query\",\"application\\/tamp-status-response\",\"application\\/tamp-update\",\"application\\/tamp-update-confirm\",\"application\\/tei+xml\",\"application\\/thraud+xml\",\"application\\/timestamp-query\",\"application\\/timestamp-reply\",\"application\\/timestamped-data\",\"application\\/tnauthlist\",\"application\\/trig\",\"application\\/ttml+xml\",\"application\\/tve-trigger\",\"application\\/ulpfec\",\"application\\/urc-grpsheet+xml\",\"application\\/urc-ressheet+xml\",\"application\\/urc-targetdesc+xml\",\"application\\/urc-uisocketdesc+xml\",\"application\\/vcard+json\",\"application\\/vcard+xml\",\"application\\/vemmi\",\"application\\/vnd-acucobol\",\"application\\/vnd-curl\",\"application\\/vnd-dart\",\"application\\/vnd-dxr\",\"application\\/vnd-fdf\",\"application\\/vnd-mif\",\"application\\/vnd-sema\",\"application\\/vnd-wap-wmlc\",\"application\\/vnd.1000minds.decision-model+xml\",\"application\\/vnd.3gpp-prose+xml\",\"application\\/vnd.3gpp-prose-pc3ch+xml\",\"application\\/vnd.3gpp-v2x-local-service-information\",\"application\\/vnd.3gpp.access-transfer-events+xml\",\"application\\/vnd.3gpp.bsf+xml\",\"application\\/vnd.3gpp.GMOP+xml\",\"application\\/vnd.3gpp.mcptt-affiliation-command+xml\",\"application\\/vnd.3gpp.mcptt-floor-request+xml\",\"application\\/vnd.3gpp.mcptt-info+xml\",\"application\\/vnd.3gpp.mcptt-location-info+xml\",\"application\\/vnd.3gpp.mcptt-mbms-usage-info+xml\",\"application\\/vnd.3gpp.mcptt-signed+xml\",\"application\\/vnd.3gpp.mid-call+xml\",\"application\\/vnd.3gpp.pic-bw-large\",\"application\\/vnd.3gpp.pic-bw-small\",\"application\\/vnd.3gpp.pic-bw-var\",\"application\\/vnd.3gpp.sms\",\"application\\/vnd.3gpp.sms+xml\",\"application\\/vnd.3gpp.srvcc-ext+xml\",\"application\\/vnd.3gpp.SRVCC-info+xml\",\"application\\/vnd.3gpp.state-and-event-info+xml\",\"application\\/vnd.3gpp.ussd+xml\",\"application\\/vnd.3gpp2.bcmcsinfo+xml\",\"application\\/vnd.3gpp2.sms\",\"application\\/vnd.3gpp2.tcap\",\"application\\/vnd.3lightssoftware.imagescal\",\"application\\/vnd.3M.Post-it-Notes\",\"application\\/vnd.accpac.simply.aso\",\"application\\/vnd.accpac.simply.imp\",\"application\\/vnd.acucorp\",\"application\\/vnd.adobe.flash-movie\",\"application\\/vnd.adobe.formscentral.fcdt\",\"application\\/vnd.adobe.fxp\",\"application\\/vnd.adobe.partial-upload\",\"application\\/vnd.adobe.xdp+xml\",\"application\\/vnd.adobe.xfdf\",\"application\\/vnd.aether.imp\",\"application\\/vnd.afpc.afplinedata\",\"application\\/vnd.ah-barcode\",\"application\\/vnd.ahead.space\",\"application\\/vnd.airzip.filesecure.azf\",\"application\\/vnd.airzip.filesecure.azs\",\"application\\/vnd.amadeus+json\",\"application\\/vnd.amazon.mobi8-ebook\",\"application\\/vnd.americandynamics.acc\",\"application\\/vnd.amiga.ami\",\"application\\/vnd.amundsen.maze+xml\",\"application\\/vnd.anki\",\"application\\/vnd.anser-web-certificate-issue-initiation\",\"application\\/vnd.antix.game-component\",\"application\\/vnd.apache.thrift.binary\",\"application\\/vnd.apache.thrift.compact\",\"application\\/vnd.apache.thrift.json\",\"application\\/vnd.api+json\",\"application\\/vnd.apothekende.reservation+json\",\"application\\/vnd.apple.installer+xml\",\"application\\/vnd.apple.mpegurl\",\"application\\/vnd.arastra.swi\",\"application\\/vnd.aristanetworks.swi\",\"application\\/vnd.artsquare\",\"application\\/vnd.astraea-software.iota\",\"application\\/vnd.audiograph\",\"application\\/vnd.autopackage\",\"application\\/vnd.avalon+json\",\"application\\/vnd.avistar+xml\",\"application\\/vnd.balsamiq.bmml+xml\",\"application\\/vnd.balsamiq.bmpr\",\"application\\/vnd.bbf.usp.msg\",\"application\\/vnd.bbf.usp.msg+json\",\"application\\/vnd.bekitzur-stech+json\",\"application\\/vnd.bint.med-content\",\"application\\/vnd.biopax.rdf+xml\",\"application\\/vnd.blink-idb-value-wrapper\",\"application\\/vnd.blueice.multipass\",\"application\\/vnd.bluetooth.ep.oob\",\"application\\/vnd.bluetooth.le.oob\",\"application\\/vnd.bmi\",\"application\\/vnd.businessobjects\",\"application\\/vnd.cab-jscript\",\"application\\/vnd.canon-cpdl\",\"application\\/vnd.canon-lips\",\"application\\/vnd.capasystems-pg+json\",\"application\\/vnd.cendio.thinlinc.clientconf\",\"application\\/vnd.century-systems.tcp_stream\",\"application\\/vnd.chemdraw+xml\",\"application\\/vnd.chess-pgn\",\"application\\/vnd.chipnuts.karaoke-mmd\",\"application\\/vnd.cinderella\",\"application\\/vnd.cirpack.isdn-ext\",\"application\\/vnd.citationstyles.style+xml\",\"application\\/vnd.claymore\",\"application\\/vnd.cloanto.rp9\",\"application\\/vnd.clonk.c4group\",\"application\\/vnd.cluetrust.cartomobile-config\",\"application\\/vnd.cluetrust.cartomobile-config-pkg\",\"application\\/vnd.coffeescript\",\"application\\/vnd.collabio.xodocuments.document\",\"application\\/vnd.collabio.xodocuments.document-template\",\"application\\/vnd.collabio.xodocuments.presentation\",\"application\\/vnd.collabio.xodocuments.presentation-template\",\"application\\/vnd.collabio.xodocuments.spreadsheet\",\"application\\/vnd.collabio.xodocuments.spreadsheet-template\",\"application\\/vnd.collection+json\",\"application\\/vnd.collection.doc+json\",\"application\\/vnd.collection.next+json\",\"application\\/vnd.comicbook+zip\",\"application\\/vnd.comicbook-rar\",\"application\\/vnd.commerce-battelle\",\"application\\/vnd.commonspace\",\"application\\/vnd.contact.cmsg\",\"application\\/vnd.coreos.ignition+json\",\"application\\/vnd.cosmocaller\",\"application\\/vnd.crick.clicker\",\"application\\/vnd.crick.clicker.keyboard\",\"application\\/vnd.crick.clicker.palette\",\"application\\/vnd.crick.clicker.template\",\"application\\/vnd.crick.clicker.wordbank\",\"application\\/vnd.criticaltools.wbs+xml\",\"application\\/vnd.ctc-posml\",\"application\\/vnd.ctct.ws+xml\",\"application\\/vnd.cups-pdf\",\"application\\/vnd.cups-postscript\",\"application\\/vnd.cups-ppd\",\"application\\/vnd.cups-raster\",\"application\\/vnd.cups-raw\",\"application\\/vnd.cyan.dean.root+xml\",\"application\\/vnd.cybank\",\"application\\/vnd.d2l.coursepackage1p0+zip\",\"application\\/vnd.data-vision.rdz\",\"application\\/vnd.datapackage+json\",\"application\\/vnd.dataresource+json\",\"application\\/vnd.debian.binary-package\",\"application\\/vnd.dece-zip\",\"application\\/vnd.dece.data\",\"application\\/vnd.dece.ttml+xml\",\"application\\/vnd.dece.unspecified\",\"application\\/vnd.denovo.fcselayout-link\",\"application\\/vnd.desmume-movie\",\"application\\/vnd.dir-bi.plate-dl-nosuffix\",\"application\\/vnd.dm.delegation+xml\",\"application\\/vnd.dna\",\"application\\/vnd.document+json\",\"application\\/vnd.dolby.mobile.1\",\"application\\/vnd.dolby.mobile.2\",\"application\\/vnd.doremir.scorecloud-binary-document\",\"application\\/vnd.dpgraph\",\"application\\/vnd.dreamfactory\",\"application\\/vnd.drive+json\",\"application\\/vnd.dtg.local\",\"application\\/vnd.dtg.local-html\",\"application\\/vnd.dtg.local.flash\",\"application\\/vnd.dvb.ait\",\"application\\/vnd.dvb.dvbj\",\"application\\/vnd.dvb.esgcontainer\",\"application\\/vnd.dvb.ipdcdftnotifaccess\",\"application\\/vnd.dvb.ipdcesgaccess\",\"application\\/vnd.dvb.ipdcesgaccess2\",\"application\\/vnd.dvb.ipdcesgpdd\",\"application\\/vnd.dvb.ipdcroaming\",\"application\\/vnd.dvb.iptv.alfec-base\",\"application\\/vnd.dvb.iptv.alfec-enhancement\",\"application\\/vnd.dvb.notif-aggregate-root+xml\",\"application\\/vnd.dvb.notif-container+xml\",\"application\\/vnd.dvb.notif-generic+xml\",\"application\\/vnd.dvb.notif-ia-msglist+xml\",\"application\\/vnd.dvb.notif-ia-registration-request+xml\",\"application\\/vnd.dvb.notif-ia-registration-response+xml\",\"application\\/vnd.dvb.notif-init+xml\",\"application\\/vnd.dvb.pfr\",\"application\\/vnd.dvb_service\",\"application\\/vnd.dynageo\",\"application\\/vnd.dzr\",\"application\\/vnd.easykaraoke.cdgdownload\",\"application\\/vnd.ecdis-update\",\"application\\/vnd.ecip.rlp\",\"application\\/vnd.ecowin.chart\",\"application\\/vnd.ecowin.filerequest\",\"application\\/vnd.ecowin.fileupdate\",\"application\\/vnd.ecowin.series\",\"application\\/vnd.ecowin.seriesrequest\",\"application\\/vnd.ecowin.seriesupdate\",\"application\\/vnd.efi-img\",\"application\\/vnd.efi-iso\",\"application\\/vnd.emclient.accessrequest+xml\",\"application\\/vnd.enliven\",\"application\\/vnd.enphase.envoy\",\"application\\/vnd.eprints.data+xml\",\"application\\/vnd.epson.esf\",\"application\\/vnd.epson.msf\",\"application\\/vnd.epson.quickanime\",\"application\\/vnd.epson.salt\",\"application\\/vnd.epson.ssf\",\"application\\/vnd.ericsson.quickcall\",\"application\\/vnd.espass-espass+zip\",\"application\\/vnd.eszigno3+xml\",\"application\\/vnd.etsi.aoc+xml\",\"application\\/vnd.etsi.asic-e+zip\",\"application\\/vnd.etsi.asic-s+zip\",\"application\\/vnd.etsi.cug+xml\",\"application\\/vnd.etsi.iptvcommand+xml\",\"application\\/vnd.etsi.iptvdiscovery+xml\",\"application\\/vnd.etsi.iptvprofile+xml\",\"application\\/vnd.etsi.iptvsad-bc+xml\",\"application\\/vnd.etsi.iptvsad-cod+xml\",\"application\\/vnd.etsi.iptvsad-npvr+xml\",\"application\\/vnd.etsi.iptvservice+xml\",\"application\\/vnd.etsi.iptvsync+xml\",\"application\\/vnd.etsi.iptvueprofile+xml\",\"application\\/vnd.etsi.mcid+xml\",\"application\\/vnd.etsi.mheg5\",\"application\\/vnd.etsi.overload-control-policy-dataset+xml\",\"application\\/vnd.etsi.pstn+xml\",\"application\\/vnd.etsi.sci+xml\",\"application\\/vnd.etsi.simservs+xml\",\"application\\/vnd.etsi.timestamp-token\",\"application\\/vnd.etsi.tsl+xml\",\"application\\/vnd.etsi.tsl.der\",\"application\\/vnd.eudora.data\",\"application\\/vnd.evolv.ecig.profile\",\"application\\/vnd.evolv.ecig.settings\",\"application\\/vnd.evolv.ecig.theme\",\"application\\/vnd.ezpix-album\",\"application\\/vnd.ezpix-package\",\"application\\/vnd.f-secure.mobile\",\"application\\/vnd.fastcopy-disk-image\",\"application\\/vnd.fdsn.mseed\",\"application\\/vnd.fdsn.seed\",\"application\\/vnd.ffsns\",\"application\\/vnd.filmit.zfc\",\"application\\/vnd.fints\",\"application\\/vnd.firemonkeys.cloudcell\",\"application\\/vnd.FloGraphIt\",\"application\\/vnd.fluxtime.clip\",\"application\\/vnd.font-fontforge-sfd\",\"application\\/vnd.framemaker\",\"application\\/vnd.frogans.fnc\",\"application\\/vnd.frogans.ltf\",\"application\\/vnd.fsc.weblaunch\",\"application\\/vnd.fujitsu.oasys\",\"application\\/vnd.fujitsu.oasys2\",\"application\\/vnd.fujitsu.oasys3\",\"application\\/vnd.fujitsu.oasysgp\",\"application\\/vnd.fujitsu.oasysprs\",\"application\\/vnd.fujixerox.ART-EX\",\"application\\/vnd.fujixerox.ART4\",\"application\\/vnd.fujixerox.ddd\",\"application\\/vnd.fujixerox.docuworks\",\"application\\/vnd.fujixerox.docuworks.binder\",\"application\\/vnd.fujixerox.docuworks.container\",\"application\\/vnd.fujixerox.HBPL\",\"application\\/vnd.fut-misnet\",\"application\\/vnd.fuzzysheet\",\"application\\/vnd.genomatix.tuxedo\",\"application\\/vnd.geo+json\",\"application\\/vnd.geocube+xml\",\"application\\/vnd.geogebra.file\",\"application\\/vnd.geogebra.tool\",\"application\\/vnd.geometry-explorer\",\"application\\/vnd.geonext\",\"application\\/vnd.geoplan\",\"application\\/vnd.geospace\",\"application\\/vnd.gerber\",\"application\\/vnd.globalplatform.card-content-mgt\",\"application\\/vnd.globalplatform.card-content-mgt-response\",\"application\\/vnd.gmx\",\"application\\/vnd.google-earth.kml+xml\",\"application\\/vnd.google-earth.kmz\",\"application\\/vnd.gov.sk.e-form+xml\",\"application\\/vnd.gov.sk.e-form+zip\",\"application\\/vnd.gov.sk.xmldatacontainer+xml\",\"application\\/vnd.grafeq\",\"application\\/vnd.gridmp\",\"application\\/vnd.groove-account\",\"application\\/vnd.groove-help\",\"application\\/vnd.groove-identity-message\",\"application\\/vnd.groove-injector\",\"application\\/vnd.groove-tool-message\",\"application\\/vnd.groove-tool-template\",\"application\\/vnd.groove-vcard\",\"application\\/vnd.hal+json\",\"application\\/vnd.hal+xml\",\"application\\/vnd.HandHeld-Entertainment+xml\",\"application\\/vnd.hbci\",\"application\\/vnd.hc+json\",\"application\\/vnd.hcl-bireports\",\"application\\/vnd.hdt\",\"application\\/vnd.heroku+json\",\"application\\/vnd.hhe.lesson-player\",\"application\\/vnd.hp-HPGL\",\"application\\/vnd.hp-hpid\",\"application\\/vnd.hp-hps\",\"application\\/vnd.hp-jlyt\",\"application\\/vnd.hp-PCL\",\"application\\/vnd.hp-PCLXL\",\"application\\/vnd.httphone\",\"application\\/vnd.hydrostatix.sof-data\",\"application\\/vnd.hyper+json\",\"application\\/vnd.hyper-item+json\",\"application\\/vnd.hyperdrive+json\",\"application\\/vnd.hzn-3d-crossword\",\"application\\/vnd.ibm.afplinedata\",\"application\\/vnd.ibm.electronic-media\",\"application\\/vnd.ibm.MiniPay\",\"application\\/vnd.ibm.modcap\",\"application\\/vnd.ibm.rights-management\",\"application\\/vnd.ibm.secure-container\",\"application\\/vnd.iccprofile\",\"application\\/vnd.ieee.1905\",\"application\\/vnd.igloader\",\"application\\/vnd.imagemeter.folder+zip\",\"application\\/vnd.imagemeter.image+zip\",\"application\\/vnd.immervision-ivp\",\"application\\/vnd.immervision-ivu\",\"application\\/vnd.ims.imsccv1p1\",\"application\\/vnd.ims.imsccv1p2\",\"application\\/vnd.ims.imsccv1p3\",\"application\\/vnd.ims.lis.v2.result+json\",\"application\\/vnd.ims.lti.v2.toolconsumerprofile+json\",\"application\\/vnd.ims.lti.v2.toolproxy+json\",\"application\\/vnd.ims.lti.v2.toolproxy.id+json\",\"application\\/vnd.ims.lti.v2.toolsettings+json\",\"application\\/vnd.ims.lti.v2.toolsettings.simple+json\",\"application\\/vnd.informedcontrol.rms+xml\",\"application\\/vnd.informix-visionary\",\"application\\/vnd.infotech.project\",\"application\\/vnd.infotech.project+xml\",\"application\\/vnd.innopath.wamp.notification\",\"application\\/vnd.insors.igm\",\"application\\/vnd.intercon.formnet\",\"application\\/vnd.intergeo\",\"application\\/vnd.intertrust.digibox\",\"application\\/vnd.intertrust.nncp\",\"application\\/vnd.intu.qbo\",\"application\\/vnd.intu.qfx\",\"application\\/vnd.iptc.g2.catalogitem+xml\",\"application\\/vnd.iptc.g2.conceptitem+xml\",\"application\\/vnd.iptc.g2.knowledgeitem+xml\",\"application\\/vnd.iptc.g2.newsitem+xml\",\"application\\/vnd.iptc.g2.newsmessage+xml\",\"application\\/vnd.iptc.g2.packageitem+xml\",\"application\\/vnd.iptc.g2.planningitem+xml\",\"application\\/vnd.ipunplugged.rcprofile\",\"application\\/vnd.irepository.package+xml\",\"application\\/vnd.is-xpr\",\"application\\/vnd.isac.fcs\",\"application\\/vnd.jam\",\"application\\/vnd.japannet-directory-service\",\"application\\/vnd.japannet-jpnstore-wakeup\",\"application\\/vnd.japannet-payment-wakeup\",\"application\\/vnd.japannet-registration\",\"application\\/vnd.japannet-registration-wakeup\",\"application\\/vnd.japannet-setstore-wakeup\",\"application\\/vnd.japannet-verification\",\"application\\/vnd.japannet-verification-wakeup\",\"application\\/vnd.jcp.javame.midlet-rms\",\"application\\/vnd.jisp\",\"application\\/vnd.joost.joda-archive\",\"application\\/vnd.jsk.isdn-ngn\",\"application\\/vnd.kahootz\",\"application\\/vnd.kde.karbon\",\"application\\/vnd.kde.kchart\",\"application\\/vnd.kde.kformula\",\"application\\/vnd.kde.kivio\",\"application\\/vnd.kde.kontour\",\"application\\/vnd.kde.kpresenter\",\"application\\/vnd.kde.kspread\",\"application\\/vnd.kde.kword\",\"application\\/vnd.kenameaapp\",\"application\\/vnd.kidspiration\",\"application\\/vnd.Kinar\",\"application\\/vnd.koan\",\"application\\/vnd.kodak-descriptor\",\"application\\/vnd.las.las+json\",\"application\\/vnd.las.las+xml\",\"application\\/vnd.liberty-request+xml\",\"application\\/vnd.llamagraphics.life-balance.desktop\",\"application\\/vnd.llamagraphics.life-balance.exchange+xml\",\"application\\/vnd.lotus-1-2-3\",\"application\\/vnd.lotus-approach\",\"application\\/vnd.lotus-freelance\",\"application\\/vnd.lotus-notes\",\"application\\/vnd.lotus-organizer\",\"application\\/vnd.lotus-screencam\",\"application\\/vnd.lotus-wordpro\",\"application\\/vnd.macports.portpkg\",\"application\\/vnd.mapbox-vector-tile\",\"application\\/vnd.marlin.drm.actiontoken+xml\",\"application\\/vnd.marlin.drm.conftoken+xml\",\"application\\/vnd.marlin.drm.license+xml\",\"application\\/vnd.marlin.drm.mdcf\",\"application\\/vnd.mason+json\",\"application\\/vnd.maxmind.maxmind-db\",\"application\\/vnd.mcd\",\"application\\/vnd.medcalcdata\",\"application\\/vnd.mediastation.cdkey\",\"application\\/vnd.meridian-slingshot\",\"application\\/vnd.MFER\",\"application\\/vnd.mfmp\",\"application\\/vnd.micro+json\",\"application\\/vnd.micrografx-igx\",\"application\\/vnd.micrografx.flo\",\"application\\/vnd.microsoft.portable-executable\",\"application\\/vnd.microsoft.windows.thumbnail-cache\",\"application\\/vnd.miele+json\",\"application\\/vnd.minisoft-hp3000-save\",\"application\\/vnd.mitsubishi.misty-guard.trustweb\",\"application\\/vnd.Mobius.DAF\",\"application\\/vnd.Mobius.DIS\",\"application\\/vnd.Mobius.MBK\",\"application\\/vnd.Mobius.MQY\",\"application\\/vnd.Mobius.MSL\",\"application\\/vnd.Mobius.PLC\",\"application\\/vnd.Mobius.TXF\",\"application\\/vnd.mophun.application\",\"application\\/vnd.mophun.certificate\",\"application\\/vnd.motorola.flexsuite\",\"application\\/vnd.motorola.flexsuite.adsi\",\"application\\/vnd.motorola.flexsuite.fis\",\"application\\/vnd.motorola.flexsuite.gotap\",\"application\\/vnd.motorola.flexsuite.kmr\",\"application\\/vnd.motorola.flexsuite.ttc\",\"application\\/vnd.motorola.flexsuite.wem\",\"application\\/vnd.motorola.iprm\",\"application\\/vnd.mozilla.xul+xml\",\"application\\/vnd.ms-3mfdocument\",\"application\\/vnd.ms-artgalry\",\"application\\/vnd.ms-asf\",\"application\\/vnd.ms-cab-compressed\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-excel.addin.macroEnabled.12\",\"application\\/vnd.ms-excel.sheet.binary.macroEnabled.12\",\"application\\/vnd.ms-excel.sheet.macroEnabled.12\",\"application\\/vnd.ms-excel.template.macroEnabled.12\",\"application\\/vnd.ms-fontobject\",\"application\\/vnd.ms-htmlhelp\",\"application\\/vnd.ms-ims\",\"application\\/vnd.ms-lrm\",\"application\\/vnd.ms-office.activeX+xml\",\"application\\/vnd.ms-officetheme\",\"application\\/vnd.ms-playready.initiator+xml\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-powerpoint.addin.macroEnabled.12\",\"application\\/vnd.ms-powerpoint.presentation.macroEnabled.12\",\"application\\/vnd.ms-powerpoint.slide.macroEnabled.12\",\"application\\/vnd.ms-powerpoint.slideshow.macroEnabled.12\",\"application\\/vnd.ms-powerpoint.template.macroEnabled.12\",\"application\\/vnd.ms-PrintDeviceCapabilities+xml\",\"application\\/vnd.ms-PrintSchemaTicket+xml\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-tnef\",\"application\\/vnd.ms-windows.devicepairing\",\"application\\/vnd.ms-windows.nwprinting.oob\",\"application\\/vnd.ms-windows.printerpairing\",\"application\\/vnd.ms-windows.wsd.oob\",\"application\\/vnd.ms-wmdrm.lic-chlg-req\",\"application\\/vnd.ms-wmdrm.lic-resp\",\"application\\/vnd.ms-wmdrm.meter-chlg-req\",\"application\\/vnd.ms-wmdrm.meter-resp\",\"application\\/vnd.ms-word.document.macroEnabled.12\",\"application\\/vnd.ms-word.template.macroEnabled.12\",\"application\\/vnd.ms-works\",\"application\\/vnd.ms-wpl\",\"application\\/vnd.ms-xpsdocument\",\"application\\/vnd.msa-disk-image\",\"application\\/vnd.mseq\",\"application\\/vnd.msign\",\"application\\/vnd.multiad.creator\",\"application\\/vnd.multiad.creator.cif\",\"application\\/vnd.music-niff\",\"application\\/vnd.musician\",\"application\\/vnd.muvee.style\",\"application\\/vnd.mynfc\",\"application\\/vnd.ncd.control\",\"application\\/vnd.ncd.reference\",\"application\\/vnd.nearst.inv+json\",\"application\\/vnd.nervana\",\"application\\/vnd.netfpx\",\"application\\/vnd.neurolanguage.nlu\",\"application\\/vnd.nintendo.nitro.rom\",\"application\\/vnd.nintendo.snes.rom\",\"application\\/vnd.nitf\",\"application\\/vnd.noblenet-directory\",\"application\\/vnd.noblenet-sealer\",\"application\\/vnd.noblenet-web\",\"application\\/vnd.nokia.catalogs\",\"application\\/vnd.nokia.conml+wbxml\",\"application\\/vnd.nokia.conml+xml\",\"application\\/vnd.nokia.iptv.config+xml\",\"application\\/vnd.nokia.iSDS-radio-presets\",\"application\\/vnd.nokia.landmark+wbxml\",\"application\\/vnd.nokia.landmark+xml\",\"application\\/vnd.nokia.landmarkcollection+xml\",\"application\\/vnd.nokia.n-gage.ac+xml\",\"application\\/vnd.nokia.n-gage.data\",\"application\\/vnd.nokia.n-gage.symbian.install\",\"application\\/vnd.nokia.ncd\",\"application\\/vnd.nokia.pcd+wbxml\",\"application\\/vnd.nokia.pcd+xml\",\"application\\/vnd.nokia.radio-preset\",\"application\\/vnd.nokia.radio-presets\",\"application\\/vnd.novadigm.EDM\",\"application\\/vnd.novadigm.EDX\",\"application\\/vnd.novadigm.EXT\",\"application\\/vnd.ntt-local.content-share\",\"application\\/vnd.ntt-local.file-transfer\",\"application\\/vnd.ntt-local.ogw_remote-access\",\"application\\/vnd.ntt-local.sip-ta_remote\",\"application\\/vnd.ntt-local.sip-ta_tcp_stream\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.chart-template\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.formula-template\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.graphics-template\",\"application\\/vnd.oasis.opendocument.image\",\"application\\/vnd.oasis.opendocument.image-template\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.presentation-template\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.spreadsheet-template\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.oasis.opendocument.text-master\",\"application\\/vnd.oasis.opendocument.text-template\",\"application\\/vnd.oasis.opendocument.text-web\",\"application\\/vnd.obn\",\"application\\/vnd.ocf+cbor\",\"application\\/vnd.oftn.l10n+json\",\"application\\/vnd.oipf.contentaccessdownload+xml\",\"application\\/vnd.oipf.contentaccessstreaming+xml\",\"application\\/vnd.oipf.cspg-hexbinary\",\"application\\/vnd.oipf.dae.svg+xml\",\"application\\/vnd.oipf.dae.xhtml+xml\",\"application\\/vnd.oipf.mippvcontrolmessage+xml\",\"application\\/vnd.oipf.pae.gem\",\"application\\/vnd.oipf.spdiscovery+xml\",\"application\\/vnd.oipf.spdlist+xml\",\"application\\/vnd.oipf.ueprofile+xml\",\"application\\/vnd.oipf.userprofile+xml\",\"application\\/vnd.olpc-sugar\",\"application\\/vnd.oma-scws-config\",\"application\\/vnd.oma-scws-http-request\",\"application\\/vnd.oma-scws-http-response\",\"application\\/vnd.oma.bcast.associated-procedure-parameter+xml\",\"application\\/vnd.oma.bcast.drm-trigger+xml\",\"application\\/vnd.oma.bcast.imd+xml\",\"application\\/vnd.oma.bcast.ltkm\",\"application\\/vnd.oma.bcast.notification+xml\",\"application\\/vnd.oma.bcast.provisioningtrigger\",\"application\\/vnd.oma.bcast.sgboot\",\"application\\/vnd.oma.bcast.sgdd+xml\",\"application\\/vnd.oma.bcast.sgdu\",\"application\\/vnd.oma.bcast.simple-symbol-container\",\"application\\/vnd.oma.bcast.smartcard-trigger+xml\",\"application\\/vnd.oma.bcast.sprov+xml\",\"application\\/vnd.oma.bcast.stkm\",\"application\\/vnd.oma.cab-address-book+xml\",\"application\\/vnd.oma.cab-feature-handler+xml\",\"application\\/vnd.oma.cab-pcc+xml\",\"application\\/vnd.oma.cab-subs-invite+xml\",\"application\\/vnd.oma.cab-user-prefs+xml\",\"application\\/vnd.oma.dcd\",\"application\\/vnd.oma.dcdc\",\"application\\/vnd.oma.dd2+xml\",\"application\\/vnd.oma.drm.risd+xml\",\"application\\/vnd.oma.group-usage-list+xml\",\"application\\/vnd.oma.lwm2m+json\",\"application\\/vnd.oma.lwm2m+tlv\",\"application\\/vnd.oma.pal+xml\",\"application\\/vnd.oma.poc.detailed-progress-report+xml\",\"application\\/vnd.oma.poc.final-report+xml\",\"application\\/vnd.oma.poc.groups+xml\",\"application\\/vnd.oma.poc.invocation-descriptor+xml\",\"application\\/vnd.oma.poc.optimized-progress-report+xml\",\"application\\/vnd.oma.push\",\"application\\/vnd.oma.scidm.messages+xml\",\"application\\/vnd.oma.xcap-directory+xml\",\"application\\/vnd.omads-email+xml\",\"application\\/vnd.omads-file+xml\",\"application\\/vnd.omads-folder+xml\",\"application\\/vnd.omaloc-supl-init\",\"application\\/vnd.onepager\",\"application\\/vnd.onepagertamp\",\"application\\/vnd.onepagertamx\",\"application\\/vnd.onepagertat\",\"application\\/vnd.onepagertatp\",\"application\\/vnd.onepagertatx\",\"application\\/vnd.openblox.game+xml\",\"application\\/vnd.openblox.game-binary\",\"application\\/vnd.openeye.oeb\",\"application\\/vnd.openstreetmap.data+xml\",\"application\\/vnd.openxmlformats-officedocument.custom-properties+xml\",\"application\\/vnd.openxmlformats-officedocument.customXmlProperties+xml\",\"application\\/vnd.openxmlformats-officedocument.drawing+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.chart+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.chartshapes+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.diagramColors+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.diagramData+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.diagramLayout+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.diagramStyle+xml\",\"application\\/vnd.openxmlformats-officedocument.extended-properties+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml-template\",\"application\\/vnd.openxmlformats-officedocument.presentationml.commentAuthors+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.comments+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.handoutMaster+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.notesMaster+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.notesSlide+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presProps+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slide\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slide+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideshow\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideshow.main+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideUpdateInfo+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.tableStyles+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.tags+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.template.main+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.viewProps+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml-template\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.calcChain+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.chartsheet+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.comments+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.connections+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.dialogsheet+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.externalLink+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.pivotCacheDefinition+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.pivotCacheRecords+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.pivotTable+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.queryTable+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.revisionHeaders+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.revisionLog+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sharedStrings+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheetMetadata+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.table+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.tableSingleCells+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.template.main+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.userNames+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.volatileDependencies+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml\",\"application\\/vnd.openxmlformats-officedocument.theme+xml\",\"application\\/vnd.openxmlformats-officedocument.themeOverride+xml\",\"application\\/vnd.openxmlformats-officedocument.vmlDrawing\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml-template\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.comments+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document.glossary+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.endnotes+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.footnotes+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.template.main+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.webSettings+xml\",\"application\\/vnd.openxmlformats-package.core-properties+xml\",\"application\\/vnd.openxmlformats-package.digital-signature-xmlsignature+xml\",\"application\\/vnd.openxmlformats-package.relationships+xml\",\"application\\/vnd.oracle.resource+json\",\"application\\/vnd.orange.indata\",\"application\\/vnd.osa.netdeploy\",\"application\\/vnd.osgeo.mapguide.package\",\"application\\/vnd.osgi.bundle\",\"application\\/vnd.osgi.dp\",\"application\\/vnd.osgi.subsystem\",\"application\\/vnd.otps.ct-kip+xml\",\"application\\/vnd.oxli.countgraph\",\"application\\/vnd.pagerduty+json\",\"application\\/vnd.palm\",\"application\\/vnd.panoply\",\"application\\/vnd.paos+xml\",\"application\\/vnd.patentdive\",\"application\\/vnd.pawaafile\",\"application\\/vnd.pcos\",\"application\\/vnd.pg.format\",\"application\\/vnd.pg.osasli\",\"application\\/vnd.piaccess.application-licence\",\"application\\/vnd.picsel\",\"application\\/vnd.pmi.widget\",\"application\\/vnd.poc.group-advertisement+xml\",\"application\\/vnd.pocketlearn\",\"application\\/vnd.powerbuilder6\",\"application\\/vnd.powerbuilder6-s\",\"application\\/vnd.powerbuilder7\",\"application\\/vnd.powerbuilder7-s\",\"application\\/vnd.powerbuilder75\",\"application\\/vnd.powerbuilder75-s\",\"application\\/vnd.preminet\",\"application\\/vnd.previewsystems.box\",\"application\\/vnd.proteus.magazine\",\"application\\/vnd.publishare-delta-tree\",\"application\\/vnd.pvi.ptid1\",\"application\\/vnd.pwg-multiplexed\",\"application\\/vnd.pwg-xhtml-print+xml\",\"application\\/vnd.qualcomm.brew-app-res\",\"application\\/vnd.quarantainenet\",\"application\\/vnd.Quark.QuarkXPress\",\"application\\/vnd.quobject-quoxdocument\",\"application\\/vnd.radisys.moml+xml\",\"application\\/vnd.radisys.msml+xml\",\"application\\/vnd.radisys.msml-audit+xml\",\"application\\/vnd.radisys.msml-audit-conf+xml\",\"application\\/vnd.radisys.msml-audit-conn+xml\",\"application\\/vnd.radisys.msml-audit-dialog+xml\",\"application\\/vnd.radisys.msml-audit-stream+xml\",\"application\\/vnd.radisys.msml-conf+xml\",\"application\\/vnd.radisys.msml-dialog+xml\",\"application\\/vnd.radisys.msml-dialog-base+xml\",\"application\\/vnd.radisys.msml-dialog-fax-detect+xml\",\"application\\/vnd.radisys.msml-dialog-fax-sendrecv+xml\",\"application\\/vnd.radisys.msml-dialog-group+xml\",\"application\\/vnd.radisys.msml-dialog-speech+xml\",\"application\\/vnd.radisys.msml-dialog-transform+xml\",\"application\\/vnd.rainstor.data\",\"application\\/vnd.rapid\",\"application\\/vnd.rar\",\"application\\/vnd.realvnc.bed\",\"application\\/vnd.recordare.musicxml\",\"application\\/vnd.recordare.musicxml+xml\",\"application\\/vnd.renlearn.rlprint\",\"application\\/vnd.restful+json\",\"application\\/vnd.rig.cryptonote\",\"application\\/vnd.route66.link66+xml\",\"application\\/vnd.rs-274x\",\"application\\/vnd.ruckus.download\",\"application\\/vnd.s3sms\",\"application\\/vnd.sailingtracker.track\",\"application\\/vnd.sbm.cid\",\"application\\/vnd.sbm.mid2\",\"application\\/vnd.scribus\",\"application\\/vnd.sealed-doc\",\"application\\/vnd.sealed-eml\",\"application\\/vnd.sealed-mht\",\"application\\/vnd.sealed-ppt\",\"application\\/vnd.sealed-tiff\",\"application\\/vnd.sealed-xls\",\"application\\/vnd.sealed.3df\",\"application\\/vnd.sealed.csf\",\"application\\/vnd.sealed.net\",\"application\\/vnd.sealedmedia.softseal-html\",\"application\\/vnd.sealedmedia.softseal-pdf\",\"application\\/vnd.seemail\",\"application\\/vnd.semd\",\"application\\/vnd.semf\",\"application\\/vnd.shana.informed.formdata\",\"application\\/vnd.shana.informed.formtemplate\",\"application\\/vnd.shana.informed.interchange\",\"application\\/vnd.shana.informed.package\",\"application\\/vnd.shootproof+json\",\"application\\/vnd.sigrok.session\",\"application\\/vnd.SimTech-MindMapper\",\"application\\/vnd.siren+json\",\"application\\/vnd.smaf\",\"application\\/vnd.smart.notebook\",\"application\\/vnd.smart.teacher\",\"application\\/vnd.software602.filler.form+xml\",\"application\\/vnd.software602.filler.form-xml-zip\",\"application\\/vnd.solent.sdkm+xml\",\"application\\/vnd.spotfire.dxp\",\"application\\/vnd.spotfire.sfs\",\"application\\/vnd.sqlite3\",\"application\\/vnd.sss-cod\",\"application\\/vnd.sss-dtf\",\"application\\/vnd.sss-ntf\",\"application\\/vnd.stepmania.package\",\"application\\/vnd.stepmania.stepchart\",\"application\\/vnd.street-stream\",\"application\\/vnd.sun.wadl+xml\",\"application\\/vnd.sus-calendar\",\"application\\/vnd.svd\",\"application\\/vnd.swiftview-ics\",\"application\\/vnd.syncml+xml\",\"application\\/vnd.syncml.dm+wbxml\",\"application\\/vnd.syncml.dm+xml\",\"application\\/vnd.syncml.dm.notification\",\"application\\/vnd.syncml.dmddf+wbxml\",\"application\\/vnd.syncml.dmddf+xml\",\"application\\/vnd.syncml.dmtnds+wbxml\",\"application\\/vnd.syncml.dmtnds+xml\",\"application\\/vnd.syncml.ds.notification\",\"application\\/vnd.tableschema+json\",\"application\\/vnd.tao.intent-module-archive\",\"application\\/vnd.tcpdump.pcap\",\"application\\/vnd.tmd.mediaflex.api+xml\",\"application\\/vnd.tml\",\"application\\/vnd.tmobile-livetv\",\"application\\/vnd.tri.onesource\",\"application\\/vnd.trid.tpt\",\"application\\/vnd.triscape.mxs\",\"application\\/vnd.trueapp\",\"application\\/vnd.truedoc\",\"application\\/vnd.ubisoft.webplayer\",\"application\\/vnd.ufdl\",\"application\\/vnd.uiq.theme\",\"application\\/vnd.umajin\",\"application\\/vnd.unity\",\"application\\/vnd.uoml+xml\",\"application\\/vnd.uplanet.alert\",\"application\\/vnd.uplanet.alert-wbxml\",\"application\\/vnd.uplanet.bearer-choice\",\"application\\/vnd.uplanet.bearer-choice-wbxml\",\"application\\/vnd.uplanet.cacheop\",\"application\\/vnd.uplanet.cacheop-wbxml\",\"application\\/vnd.uplanet.channel\",\"application\\/vnd.uplanet.channel-wbxml\",\"application\\/vnd.uplanet.list\",\"application\\/vnd.uplanet.list-wbxml\",\"application\\/vnd.uplanet.listcmd\",\"application\\/vnd.uplanet.listcmd-wbxml\",\"application\\/vnd.uplanet.signal\",\"application\\/vnd.uri-map\",\"application\\/vnd.valve.source.material\",\"application\\/vnd.vcx\",\"application\\/vnd.vd-study\",\"application\\/vnd.vectorworks\",\"application\\/vnd.vel+json\",\"application\\/vnd.verimatrix.vcas\",\"application\\/vnd.vidsoft.vidconference\",\"application\\/vnd.visio\",\"application\\/vnd.visionary\",\"application\\/vnd.vividence.scriptfile\",\"application\\/vnd.vsf\",\"application\\/vnd.wap-slc\",\"application\\/vnd.wap-wbxml\",\"application\\/vnd.wap.sic\",\"application\\/vnd.wap.wmlscriptc\",\"application\\/vnd.webturbo\",\"application\\/vnd.wfa.p2p\",\"application\\/vnd.wfa.wsc\",\"application\\/vnd.windows.devicepairing\",\"application\\/vnd.wmc\",\"application\\/vnd.wmf.bootstrap\",\"application\\/vnd.wolfram.mathematica\",\"application\\/vnd.wolfram.mathematica.package\",\"application\\/vnd.wolfram.player\",\"application\\/vnd.wordperfect\",\"application\\/vnd.wqd\",\"application\\/vnd.wrq-hp3000-labelled\",\"application\\/vnd.wt.stf\",\"application\\/vnd.wv.csp+wbxml\",\"application\\/vnd.wv.csp+xml\",\"application\\/vnd.wv.ssp+xml\",\"application\\/vnd.xacml+json\",\"application\\/vnd.xara\",\"application\\/vnd.xfdl\",\"application\\/vnd.xfdl.webform\",\"application\\/vnd.xmi+xml\",\"application\\/vnd.xmpie.cpkg\",\"application\\/vnd.xmpie.dpkg\",\"application\\/vnd.xmpie.plan\",\"application\\/vnd.xmpie.ppkg\",\"application\\/vnd.xmpie.xlim\",\"application\\/vnd.yamaha.hv-dic\",\"application\\/vnd.yamaha.hv-script\",\"application\\/vnd.yamaha.hv-voice\",\"application\\/vnd.yamaha.openscoreformat\",\"application\\/vnd.yamaha.openscoreformat.osfpvg+xml\",\"application\\/vnd.yamaha.remote-setup\",\"application\\/vnd.yamaha.smaf-audio\",\"application\\/vnd.yamaha.smaf-phrase\",\"application\\/vnd.yamaha.through-ngn\",\"application\\/vnd.yamaha.tunnel-udpencap\",\"application\\/vnd.yaoweme\",\"application\\/vnd.yellowriver-custom-menu\",\"application\\/vnd.youtube.yt\",\"application\\/vnd.zul\",\"application\\/vnd.zzazz.deck+xml\",\"application\\/voicexml+xml\",\"application\\/voucher-cms+json\",\"application\\/vq-rtcpxr\",\"application\\/watcherinfo+xml\",\"application\\/webpush-options+json\",\"application\\/whoispp-query\",\"application\\/whoispp-response\",\"application\\/widget\",\"application\\/wita\",\"application\\/wordperfect5.1\",\"application\\/wsdl+xml\",\"application\\/wspolicy+xml\",\"application\\/x-www-form-urlencoded\",\"application\\/x400-bp\",\"application\\/xacml+xml\",\"application\\/xcap-att+xml\",\"application\\/xcap-caps+xml\",\"application\\/xcap-diff+xml\",\"application\\/xcap-el+xml\",\"application\\/xcap-error+xml\",\"application\\/xcap-ns+xml\",\"application\\/xcon-conference-info+xml\",\"application\\/xcon-conference-info-diff+xml\",\"application\\/xenc+xml\",\"application\\/xhtml+xml\",\"application\\/xliff+xml\",\"application\\/xml\",\"application\\/xml-dtd\",\"application\\/xml-external-parsed-entity\",\"application\\/xml-patch+xml\",\"application\\/xmpp+xml\",\"application\\/xop+xml\",\"application\\/xv+xml\",\"application\\/yang\",\"application\\/yang-data+json\",\"application\\/yang-data+xml\",\"application\\/yang-patch+json\",\"application\\/yang-patch+xml\",\"application\\/yin+xml\",\"application\\/zip\",\"application\\/zlib\",\"image\\/aces\",\"image\\/bmp\",\"image\\/cgm\",\"image\\/dicom-rle\",\"image\\/emf\",\"image\\/example\",\"image\\/fits\",\"image\\/g3fax\",\"image\\/jls\",\"image\\/jp2\",\"image\\/jpm\",\"image\\/jpx\",\"image\\/naplps\",\"image\\/png\",\"image\\/prs.btif\",\"image\\/prs.pti\",\"image\\/pwg-raster\",\"image\\/t38\",\"image\\/tiff\",\"image\\/tiff-fx\",\"image\\/vnd-djvu\",\"image\\/vnd-svf\",\"image\\/vnd-wap-wbmp\",\"image\\/vnd.adobe.photoshop\",\"image\\/vnd.airzip.accelerator.azv\",\"image\\/vnd.cns.inf2\",\"image\\/vnd.dece.graphic\",\"image\\/vnd.dvb.subtitle\",\"image\\/vnd.dwg\",\"image\\/vnd.dxf\",\"image\\/vnd.fastbidsheet\",\"image\\/vnd.fpx\",\"image\\/vnd.fst\",\"image\\/vnd.fujixerox.edmics-mmr\",\"image\\/vnd.fujixerox.edmics-rlc\",\"image\\/vnd.globalgraphics.pgb\",\"image\\/vnd.microsoft.icon\",\"image\\/vnd.mix\",\"image\\/vnd.mozilla.apng\",\"image\\/vnd.ms-modi\",\"image\\/vnd.net-fpx\",\"image\\/vnd.radiance\",\"image\\/vnd.sealed-png\",\"image\\/vnd.sealedmedia.softseal-gif\",\"image\\/vnd.sealedmedia.softseal-jpg\",\"image\\/vnd.tencent.tap\",\"image\\/vnd.valve.source.texture\",\"image\\/vnd.xiff\",\"image\\/vnd.zbrush.pcx\",\"image\\/wmf\",\"message\\/CPIM\",\"message\\/delivery-status\",\"message\\/disposition-notification\",\"message\\/example\",\"message\\/feedback-report\",\"message\\/global\",\"message\\/global-delivery-status\",\"message\\/global-disposition-notification\",\"message\\/global-headers\",\"message\\/http\",\"message\\/imdn+xml\",\"message\\/news\",\"message\\/s-http\",\"message\\/sip\",\"message\\/sipfrag\",\"message\\/tracking-status\",\"message\\/vnd.si.simp\",\"message\\/vnd.wfa.wsc\",\"model\\/3mf\",\"model\\/example\",\"model\\/gltf+json\",\"model\\/gltf-binary\",\"model\\/iges\",\"model\\/stl\",\"model\\/vnd-dwf\",\"model\\/vnd.collada+xml\",\"model\\/vnd.flatland.3dml\",\"model\\/vnd.gdl\",\"model\\/vnd.gs-gdl\",\"model\\/vnd.gtw\",\"model\\/vnd.moml+xml\",\"model\\/vnd.mts\",\"model\\/vnd.opengex\",\"model\\/vnd.parasolid.transmit-binary\",\"model\\/vnd.parasolid.transmit-text\",\"model\\/vnd.rosette.annotated-data-model\",\"model\\/vnd.valve.source.compiled-map\",\"model\\/vnd.vtu\",\"model\\/x3d+fastinfoset\",\"model\\/x3d+xml\",\"model\\/x3d-vrml\",\"text\\/1d-interleaved-parityfec\",\"text\\/cache-manifest\",\"text\\/calendar\",\"text\\/css\",\"text\\/csv\",\"text\\/csv+gzip\",\"text\\/csv-schema\",\"text\\/directory\",\"text\\/dns\",\"text\\/ecmascript\",\"text\\/encaprtp\",\"text\\/example\",\"text\\/fwdred\",\"text\\/grammar-ref-list\",\"text\\/html\",\"text\\/javascript\",\"text\\/jcr-cnd\",\"text\\/markdown\",\"text\\/mizar\",\"text\\/n3\",\"text\\/parameters\",\"text\\/provenance-notation\",\"text\\/prs.fallenstein.rst\",\"text\\/prs.lines.tag\",\"text\\/prs.prop.logic\",\"text\\/raptorfec\",\"text\\/RED\",\"text\\/rfc822-headers\",\"text\\/rtf\",\"text\\/rtp-enc-aescm128\",\"text\\/rtploopback\",\"text\\/rtx\",\"text\\/SGML\",\"text\\/strings\",\"text\\/t140\",\"text\\/tab-separated-values\",\"text\\/troff\",\"text\\/turtle\",\"text\\/turtle+gzip\",\"text\\/ulpfec\",\"text\\/uri-list\",\"text\\/vcard\",\"text\\/vnd-a\",\"text\\/vnd-curl\",\"text\\/vnd.abc\",\"text\\/vnd.ascii-art\",\"text\\/vnd.debian.copyright\",\"text\\/vnd.DMClientScript\",\"text\\/vnd.dvb.subtitle\",\"text\\/vnd.esmertec.theme-descriptor\",\"text\\/vnd.fly\",\"text\\/vnd.fmi.flexstor\",\"text\\/vnd.graphviz\",\"text\\/vnd.in3d.3dml\",\"text\\/vnd.in3d.spot\",\"text\\/vnd.IPTC.NewsML\",\"text\\/vnd.IPTC.NITF\",\"text\\/vnd.latex-z\",\"text\\/vnd.motorola.reflex\",\"text\\/vnd.ms-mediapackage\",\"text\\/vnd.net2phone.commcenter.command\",\"text\\/vnd.radisys.msml-basic-layout\",\"text\\/vnd.si.uricatalogue\",\"text\\/vnd.sun.j2me.app-descriptor\",\"text\\/vnd.trolltech.linguist\",\"text\\/vnd.wap-wml\",\"text\\/vnd.wap.si\",\"text\\/vnd.wap.sl\",\"text\\/vnd.wap.wmlscript\",\"text\\/xml\",\"text\\/xml-external-parsed-entity\"]', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(1, 'item_sets', 1, 1, 'Organisaties A-Z', 'Organisaties A-Z'),
(2, 'item_sets', 1, 1, 'Personen 0-9', 'Personen 0-9'),
(3, 'items', 1, 1, 'AAA', 'AAA'),
(4, 'items', 1, 1, 'BBB', 'BBB'),
(5, 'items', 1, 1, 'CCC', 'CCC'),
(6, 'items', 1, 1, 'DDD', 'DDD'),
(7, 'items', 1, 1, '111', '111'),
(8, 'items', 1, 1, '222', '222'),
(9, 'items', 1, 1, '333', '333'),
(10, 'items', 1, 1, '444', '444'),
(21, 'items', 1, 1, 'personen.ttl', 'personen.ttl\ntest\ntext/turtle\nTODO '),
(23, 'items', 1, 1, 'Test', 'Test\nPersonen\nBBB');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(21, NULL),
(22, NULL),
(23, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `item_item_set`
--

INSERT INTO `item_item_set` (`item_id`, `item_set_id`) VALUES
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CustomVocab', 1, '2.0.0'),
('LinkedDataSets', 1, '0.0.1-dev'),
('NumericDataTypes', 1, '1.11.0');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `numeric_data_types_duration`
--

CREATE TABLE `numeric_data_types_duration` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `numeric_data_types_integer`
--

CREATE TABLE `numeric_data_types_integer` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `numeric_data_types_interval`
--

CREATE TABLE `numeric_data_types_interval` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` bigint(20) NOT NULL,
  `value2` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `numeric_data_types_timestamp`
--

CREATE TABLE `numeric_data_types_timestamp` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(1637, 1, 6, 'maximumAttendeeCapacity', 'maximumAttendeeCapacity', 'The total number of individuals that may attend an event or venue.'),
(1638, 1, 6, 'printEdition', 'printEdition', 'The edition of the print product in which the NewsArticle appears.'),
(1639, 1, 6, 'actors', 'actors', 'An actor, e.g. in TV, radio, movie, video games etc. Actors can be associated with individual items or with a series, episode, clip.'),
(1640, 1, 6, 'actor', 'actor', 'An actor, e.g. in TV, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.'),
(1641, 1, 6, 'latitude', 'latitude', 'The latitude of a location. For example ```37.42242``` ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)).'),
(1642, 1, 6, 'geoCoveredBy', 'geoCoveredBy', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that covers it. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(1643, 1, 6, 'requiredQuantity', 'requiredQuantity', 'The required quantity of the item(s).'),
(1644, 1, 6, 'price', 'price', 'The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes.\\n\\nUsage guidelines:\\n\\n* Use the [[priceCurrency]] property (with standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\") instead of including [ambiguous symbols](http://en.wikipedia.org/wiki/Dollar_sign#Currencies_that_use_the_dollar_or_peso_sign) such as \'$\' in the value.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.\\n* Note that both [RDFa](http://www.w3.org/TR/xhtml-rdfa-primer/#using-the-content-attribute) and Microdata syntax allow the use of a \"content=\" attribute for publishing simple machine-readable values alongside more human-friendly formatting.\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\n      '),
(1645, 1, 6, 'homeLocation', 'homeLocation', 'A contact location for a person\'s residence.'),
(1646, 1, 6, 'location', 'location', 'The location of, for example, where an event is happening, where an organization is located, or where an action takes place.'),
(1647, 1, 6, 'dayOfWeek', 'dayOfWeek', 'The day of the week for which these opening hours are valid.'),
(1648, 1, 6, 'cvdNumC19OFMechVentPats', 'cvdNumC19OFMechVentPats', 'numc19ofmechventpats - ED/OVERFLOW and VENTILATED: Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed and on a mechanical ventilator.'),
(1649, 1, 6, 'diversityStaffingReport', 'diversityStaffingReport', 'For an [[Organization]] (often but not necessarily a [[NewsMediaOrganization]]), a report on staffing diversity issues. In a news context this might be for example ASNE or RTDNA (US) reports, or self-reported.'),
(1650, 1, 6, 'publishingPrinciples', 'publishingPrinciples', 'The publishingPrinciples property indicates (typically via [[URL]]) a document describing the editorial principles of an [[Organization]] (or individual, e.g. a [[Person]] writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a [[CreativeWork]] (e.g. [[NewsArticle]]) the principles are those of the party primarily responsible for the creation of the [[CreativeWork]].\n\nWhile such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a [[funder]]) can be expressed using schema.org terminology.\n'),
(1651, 1, 6, 'billingDuration', 'billingDuration', 'Specifies for how long this price (or price component) will be billed. Can be used, for example, to model the contractual duration of a subscription or payment plan. Type can be either a Duration or a Number (in which case the unit of measurement, for example month, is specified by the unitCode property).'),
(1652, 1, 6, 'prescriptionStatus', 'prescriptionStatus', 'Indicates the status of drug prescription, e.g. local catalogs classifications or whether the drug is available by prescription or over-the-counter, etc.'),
(1653, 1, 6, 'monthlyMinimumRepaymentAmount', 'monthlyMinimumRepaymentAmount', 'The minimum payment is the lowest amount of money that one is required to pay on a credit card statement each month.'),
(1654, 1, 6, 'associatedMediaReview', 'associatedMediaReview', 'An associated [[MediaReview]], related by specific common content, topic or claim. The expectation is that this property would be most typically used in cases where a single activity is conducting both claim reviews and media reviews, in which case [[relatedMediaReview]] would commonly be used on a [[ClaimReview]], while [[relatedClaimReview]] would be used on [[MediaReview]].'),
(1655, 1, 6, 'associatedReview', 'associatedReview', 'An associated [[Review]].'),
(1656, 1, 6, 'infectiousAgent', 'infectiousAgent', 'The actual infectious agent, such as a specific bacterium.'),
(1657, 1, 6, 'occupancy', 'occupancy', 'The allowed total occupancy for the accommodation in persons (including infants etc). For individual accommodations, this is not necessarily the legal maximum but defines the permitted usage as per the contractual agreement (e.g. a double room used by a single person).\nTypical unit code(s): C62 for person'),
(1658, 1, 6, 'merchantReturnLink', 'merchantReturnLink', 'Specifies a Web page or service by URL, for product returns.'),
(1659, 1, 6, 'valueReference', 'valueReference', 'A secondary value that provides additional information on the original value, e.g. a reference temperature or a type of measurement.'),
(1660, 1, 6, 'jobLocation', 'jobLocation', 'A (typically single) geographic location associated with the job position.'),
(1661, 1, 6, 'geoRadius', 'geoRadius', 'Indicates the approximate radius of a GeoCircle (metres unless indicated otherwise via Distance notation).'),
(1662, 1, 6, 'steps', 'steps', 'A single step item (as HowToStep, text, document, video, etc.) or a HowToSection (originally misnamed \'steps\'; \'step\' is preferred).'),
(1663, 1, 6, 'step', 'step', 'A single step item (as HowToStep, text, document, video, etc.) or a HowToSection.'),
(1664, 1, 6, 'followup', 'followup', 'Typical or recommended followup care after the procedure is performed.'),
(1665, 1, 6, 'hasPOS', 'hasPOS', 'Points-of-Sales operated by the organization or person.'),
(1666, 1, 6, 'floorLevel', 'floorLevel', 'The floor level for an [[Accommodation]] in a multi-storey building. Since counting\n  systems [vary internationally](https://en.wikipedia.org/wiki/Storey#Consecutive_number_floor_designations), the local system should be used where possible.'),
(1667, 1, 6, 'variesBy', 'variesBy', 'Indicates the property or properties by which the variants in a [[ProductGroup]] vary, e.g. their size, color etc. Schema.org properties can be referenced by their short name e.g. \"color\"; terms defined elsewhere can be referenced with their URIs.'),
(1668, 1, 6, 'estimatesRiskOf', 'estimatesRiskOf', 'The condition, complication, or symptom whose risk is being estimated.'),
(1669, 1, 6, 'countryOfLastProcessing', 'countryOfLastProcessing', 'The place where the item (typically [[Product]]) was last processed and tested before importation.'),
(1670, 1, 6, 'releaseDate', 'releaseDate', 'The release date of a product or product model. This can be used to distinguish the exact variant of a product.'),
(1671, 1, 6, 'isSimilarTo', 'isSimilarTo', 'A pointer to another, functionally similar product (or multiple products).'),
(1672, 1, 6, 'trailer', 'trailer', 'The trailer of a movie or TV/radio series, season, episode, etc.'),
(1673, 1, 6, 'relatedCondition', 'relatedCondition', 'A medical condition associated with this anatomy.'),
(1674, 1, 6, 'postalCodePrefix', 'postalCodePrefix', 'A defined range of postal codes indicated by a common textual prefix. Used for non-numeric systems such as UK.'),
(1675, 1, 6, 'departureBusStop', 'departureBusStop', 'The stop or station from which the bus departs.'),
(1676, 1, 6, 'datasetTimeInterval', 'datasetTimeInterval', 'The range of temporal applicability of a dataset, e.g. for a 2011 census dataset, the year 2011 (in ISO 8601 time interval format).'),
(1677, 1, 6, 'temporalCoverage', 'temporalCoverage', 'The temporalCoverage of a CreativeWork indicates the period that the content applies to, i.e. that it describes, either as a DateTime or as a textual string indicating a time period in [ISO 8601 time interval format](https://en.wikipedia.org/wiki/ISO_8601#Time_intervals). In\n      the case of a Dataset it will typically indicate the relevant time period in a precise notation (e.g. for a 2011 census dataset, the year 2011 would be written \"2011/2012\"). Other forms of content, e.g. ScholarlyArticle, Book, TVSeries or TVEpisode, may indicate their temporalCoverage in broader terms - textually or via well-known URL.\n      Written works such as books may sometimes have precise temporal coverage too, e.g. a work set in 1939 - 1945 can be indicated in ISO 8601 interval format format via \"1939/1945\".\n\nOpen-ended date ranges can be written with \"..\" in place of the end date. For example, \"2015-11/..\" indicates a range beginning in November 2015 and with no specified final date. This is tentative and might be updated in future when ISO 8601 is officially updated.'),
(1678, 1, 6, 'cvdNumBedsOcc', 'cvdNumBedsOcc', 'numbedsocc - HOSPITAL INPATIENT BED OCCUPANCY: Total number of staffed inpatient beds that are occupied.'),
(1679, 1, 6, 'diseasePreventionInfo', 'diseasePreventionInfo', 'Information about disease prevention.'),
(1680, 1, 6, 'flightDistance', 'flightDistance', 'The distance of the flight.'),
(1681, 1, 6, 'exceptDate', 'exceptDate', 'Defines a [[Date]] or [[DateTime]] during which a scheduled [[Event]] will not take place. The property allows exceptions to\n      a [[Schedule]] to be specified. If an exception is specified as a [[DateTime]] then only the event that would have started at that specific date and time\n      should be excluded from the schedule. If an exception is specified as a [[Date]] then any event that is scheduled for that 24 hour period should be\n      excluded from the schedule. This allows a whole day to be excluded from the schedule without having to itemise every scheduled event.'),
(1682, 1, 6, 'catalogNumber', 'catalogNumber', 'The catalog number for the release.'),
(1683, 1, 6, 'costPerUnit', 'costPerUnit', 'The cost per unit of the drug.'),
(1684, 1, 6, 'comprisedOf', 'comprisedOf', 'Specifying something physically contained by something else. Typically used here for the underlying anatomical structures, such as organs, that comprise the anatomical system.'),
(1685, 1, 6, 'spokenByCharacter', 'spokenByCharacter', 'The (e.g. fictional) character, Person or Organization to whom the quotation is attributed within the containing CreativeWork.'),
(1686, 1, 6, 'salaryCurrency', 'salaryCurrency', 'The currency (coded using [ISO 4217](http://en.wikipedia.org/wiki/ISO_4217)) used for the main salary information in this job posting or for this employee.'),
(1687, 1, 6, 'acrissCode', 'acrissCode', 'The ACRISS Car Classification Code is a code used by many car rental companies, for classifying vehicles. ACRISS stands for Association of Car Rental Industry Systems and Standards.'),
(1688, 1, 6, 'exercisePlan', 'exercisePlan', 'A sub property of instrument. The exercise plan used on this action.'),
(1689, 1, 6, 'instrument', 'instrument', 'The object that helped the agent perform the action. E.g. John wrote a book with *a pen*.'),
(1690, 1, 6, 'endorsers', 'endorsers', 'People or organizations that endorse the plan.'),
(1691, 1, 6, 'transFatContent', 'transFatContent', 'The number of grams of trans fat.'),
(1692, 1, 6, 'guidelineDate', 'guidelineDate', 'Date on which this guideline\'s recommendation was made.'),
(1693, 1, 6, 'issueNumber', 'issueNumber', 'Identifies the issue of publication; for example, \"iii\" or \"2\".'),
(1694, 1, 6, 'position', 'position', 'The position of an item in a series or sequence of items.'),
(1695, 1, 6, 'workLocation', 'workLocation', 'A contact location for a person\'s place of work.'),
(1696, 1, 6, 'hiringOrganization', 'hiringOrganization', 'Organization or Person offering the job position.'),
(1697, 1, 6, 'broadcastChannelId', 'broadcastChannelId', 'The unique address by which the BroadcastService can be identified in a provider lineup. In US, this is typically a number.'),
(1698, 1, 6, 'query', 'query', 'A sub property of instrument. The query used on this action.'),
(1699, 1, 6, 'jobImmediateStart', 'jobImmediateStart', 'An indicator as to whether a position is available for an immediate start.'),
(1700, 1, 6, 'applicationSuite', 'applicationSuite', 'The name of the application suite to which the application belongs (e.g. Excel belongs to Office).'),
(1701, 1, 6, 'aircraft', 'aircraft', 'The kind of aircraft (e.g., \"Boeing 747\").'),
(1702, 1, 6, 'grantee', 'grantee', 'The person, organization, contact point, or audience that has been granted this permission.'),
(1703, 1, 6, 'medicineSystem', 'medicineSystem', 'The system of medicine that includes this MedicalEntity, for example \'evidence-based\', \'homeopathic\', \'chiropractic\', etc.'),
(1704, 1, 6, 'correctionsPolicy', 'correctionsPolicy', 'For an [[Organization]] (e.g. [[NewsMediaOrganization]]), a statement describing (in news media, the newsroom’s) disclosure and correction policy for errors.'),
(1705, 1, 6, 'sizeSystem', 'sizeSystem', 'The size system used to identify a product\'s size. Typically either a standard (for example, \"GS1\" or \"ISO-EN13402\"), country code (for example \"US\" or \"JP\"), or a measuring system (for example \"Metric\" or \"Imperial\").'),
(1706, 1, 6, 'playersOnline', 'playersOnline', 'Number of players on the server.'),
(1707, 1, 6, 'industry', 'industry', 'The industry associated with the job position.'),
(1708, 1, 6, 'menuAddOn', 'menuAddOn', 'Additional menu item(s) such as a side dish of salad or side order of fries that can be added to this menu item. Additionally it can be a menu section containing allowed add-on menu items for this menu item.'),
(1709, 1, 6, 'directApply', 'directApply', 'Indicates whether an [[url]] that is associated with a [[JobPosting]] enables direct application for the job, via the posting website. A job posting is considered to have directApply of [[True]] if an application process for the specified job can be directly initiated via the url(s) given (noting that e.g. multiple internet domains might nevertheless be involved at an implementation level). A value of [[False]] is appropriate if there is no clear path to applying directly online for the specified job, navigating directly from the JobPosting url(s) supplied.'),
(1710, 1, 6, 'evidenceOrigin', 'evidenceOrigin', 'Source of the data used to formulate the guidance, e.g. RCT, consensus opinion, etc.'),
(1711, 1, 6, 'actionableFeedbackPolicy', 'actionableFeedbackPolicy', 'For a [[NewsMediaOrganization]] or other news-related [[Organization]], a statement about public engagement activities (for news media, the newsroom’s), including involving the public - digitally or otherwise -- in coverage decisions, reporting and activities after publication.'),
(1712, 1, 6, 'utterances', 'utterances', 'Text of an utterances (spoken words, lyrics etc.) that occurs at a certain section of a media object, represented as a [[HyperTocEntry]].'),
(1713, 1, 6, 'studyLocation', 'studyLocation', 'The location in which the study is taking/took place.'),
(1714, 1, 6, 'accessibilityControl', 'accessibilityControl', 'Identifies input methods that are sufficient to fully control the described resource. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessibilityControl-vocabulary).'),
(1715, 1, 6, 'maximumEnrollment', 'maximumEnrollment', 'The maximum number of students who may be enrolled in the program.'),
(1716, 1, 6, 'checkoutPageURLTemplate', 'checkoutPageURLTemplate', 'A URL template (RFC 6570) for a checkout page for an offer. This approach allows merchants to specify a URL for online checkout of the offered product, by interpolating parameters such as the logged in user ID, product ID, quantity, discount code etc. Parameter naming and standardization are not specified here.'),
(1717, 1, 6, 'musicBy', 'musicBy', 'The composer of the soundtrack.'),
(1718, 1, 6, 'lastReviewed', 'lastReviewed', 'Date on which the content on this web page was last reviewed for accuracy and/or completeness.'),
(1719, 1, 6, 'courseMode', 'courseMode', 'The medium or means of delivery of the course instance or the mode of study, either as a text label (e.g. \"online\", \"onsite\" or \"blended\"; \"synchronous\" or \"asynchronous\"; \"full-time\" or \"part-time\") or as a URL reference to a term from a controlled vocabulary (e.g. https://ceds.ed.gov/element/001311#Asynchronous).'),
(1720, 1, 6, 'competencyRequired', 'competencyRequired', 'Knowledge, skill, ability or personal attribute that must be demonstrated by a person or other entity in order to do something such as earn an Educational Occupational Credential or understand a LearningResource.'),
(1721, 1, 6, 'paymentMethod', 'paymentMethod', 'The name of the credit card or other method of payment for the order.'),
(1722, 1, 6, 'honorificPrefix', 'honorificPrefix', 'An honorific prefix preceding a Person\'s name such as Dr/Mrs/Mr.'),
(1723, 1, 6, 'bed', 'bed', 'The type of bed or beds included in the accommodation. For the single case of just one bed of a certain type, you use bed directly with a text.\n      If you want to indicate the quantity of a certain kind of bed, use an instance of BedDetails. For more detailed information, use the amenityFeature property.'),
(1724, 1, 6, 'tracks', 'tracks', 'A music recording (track)&#x2014;usually a single song.'),
(1725, 1, 6, 'track', 'track', 'A music recording (track)&#x2014;usually a single song. If an ItemList is given, the list should contain items of type MusicRecording.'),
(1726, 1, 6, 'mathExpression', 'mathExpression', 'A mathematical expression (e.g. \'x^2-3x=0\') that may be solved for a specific variable, simplified, or transformed. This can take many formats, e.g. LaTeX, Ascii-Math, or math as you would write with a keyboard.'),
(1727, 1, 6, 'isbn', 'isbn', 'The ISBN of the book.'),
(1728, 1, 6, 'identifier', 'identifier', 'The identifier property represents any kind of identifier for any kind of [[Thing]], such as ISBNs, GTIN codes, UUIDs etc. Schema.org provides dedicated properties for representing many of these, either as textual strings or as URL (URI) links. See [background notes](/docs/datamodel.html#identifierBg) for more details.\n        '),
(1729, 1, 6, 'countriesSupported', 'countriesSupported', 'Countries for which the application is supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.'),
(1730, 1, 6, 'checkinTime', 'checkinTime', 'The earliest someone may check into a lodging establishment.'),
(1731, 1, 6, 'deliveryMethod', 'deliveryMethod', 'A sub property of instrument. The method of delivery.'),
(1732, 1, 6, 'hasBioPolymerSequence', 'hasBioPolymerSequence', 'A symbolic representation of a BioChemEntity. For example, a nucleotide sequence of a Gene or an amino acid sequence of a Protein.'),
(1733, 1, 6, 'hasRepresentation', 'hasRepresentation', 'A common representation such as a protein sequence or chemical structure for this entity. For images use schema.org/image.'),
(1734, 1, 6, 'distribution', 'distribution', 'A downloadable form of this dataset, at a specific location, in a specific format. This property can be repeated if different variations are available. There is no expectation that different downloadable distributions must contain exactly equivalent information (see also [DCAT](https://www.w3.org/TR/vocab-dcat-3/#Class:Distribution) on this point). Different distributions might include or exclude different subsets of the entire dataset, for example.'),
(1735, 1, 6, 'bankAccountType', 'bankAccountType', 'The type of a bank account.'),
(1736, 1, 6, 'mediaItemAppearance', 'mediaItemAppearance', 'In the context of a [[MediaReview]], indicates specific media item(s) that are grouped using a [[MediaReviewItem]].'),
(1737, 1, 6, 'audio', 'audio', 'An embedded audio object.'),
(1738, 1, 6, 'playMode', 'playMode', 'Indicates whether this game is multi-player, co-op or single-player.  The game can be marked as multi-player, co-op and single-player at the same time.'),
(1739, 1, 6, 'foodWarning', 'foodWarning', 'Any precaution, guidance, contraindication, etc. related to consumption of specific foods while taking this drug.'),
(1740, 1, 6, 'vehicleInteriorType', 'vehicleInteriorType', 'The type or material of the interior of the vehicle (e.g. synthetic fabric, leather, wood, etc.). While most interior types are characterized by the material used, an interior type can also be based on vehicle usage or target audience.'),
(1741, 1, 6, 'assesses', 'assesses', 'The item being described is intended to assess the competency or learning outcome defined by the referenced term.'),
(1742, 1, 6, 'currentExchangeRate', 'currentExchangeRate', 'The current price of a currency.'),
(1743, 1, 6, 'numberOfBathroomsTotal', 'numberOfBathroomsTotal', 'The total integer number of bathrooms in some [[Accommodation]], following real estate conventions as [documented in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsTotalInteger+Field): \"The simple sum of the number of bathrooms. For example for a property with two Full Bathrooms and one Half Bathroom, the Bathrooms Total Integer will be 3.\". See also [[numberOfRooms]].'),
(1744, 1, 6, 'experienceInPlaceOfEducation', 'experienceInPlaceOfEducation', 'Indicates whether a [[JobPosting]] will accept experience (as indicated by [[OccupationalExperienceRequirements]]) in place of its formal educational qualifications (as indicated by [[educationRequirements]]). If true, indicates that satisfying one of these requirements is sufficient.'),
(1745, 1, 6, 'legislationTransposes', 'legislationTransposes', 'Indicates that this legislation (or part of legislation) fulfills the objectives set by another legislation, by passing appropriate implementation measures. Typically, some legislations of European Union\'s member states or regions transpose European Directives. This indicates a legally binding link between the 2 legislations.'),
(1746, 1, 6, 'legislationApplies', 'legislationApplies', 'Indicates that this legislation (or part of a legislation) somehow transfers another legislation in a different legislative context. This is an informative link, and it has no legal value. For legally-binding links of transposition, use the <a href=\"/legislationTransposes\">legislationTransposes</a> property. For example an informative consolidated law of a European Union\'s member state \"applies\" the consolidated version of the European Directive implemented in it.'),
(1747, 1, 6, 'distinguishingSign', 'distinguishingSign', 'One of a set of signs and symptoms that can be used to distinguish this diagnosis from others in the differential diagnosis.'),
(1748, 1, 6, 'legislationJurisdiction', 'legislationJurisdiction', 'The jurisdiction from which the legislation originates.'),
(1749, 1, 6, 'jurisdiction', 'jurisdiction', 'Indicates a legal jurisdiction, e.g. of some legislation, or where some government service is based.'),
(1750, 1, 6, 'spatialCoverage', 'spatialCoverage', 'The spatialCoverage of a CreativeWork indicates the place(s) which are the focus of the content. It is a subproperty of\n      contentLocation intended primarily for more technical and detailed materials. For example with a Dataset, it indicates\n      areas that the dataset describes: a dataset of New York weather would have spatialCoverage which was the place: the state of New York.'),
(1751, 1, 6, 'arrivalAirport', 'arrivalAirport', 'The airport where the flight terminates.'),
(1752, 1, 6, 'interactingDrug', 'interactingDrug', 'Another drug that is known to interact with this drug in a way that impacts the effect of this drug or causes a risk to the patient. Note: disease interactions are typically captured as contraindications.'),
(1753, 1, 6, 'availabilityStarts', 'availabilityStarts', 'The beginning of the availability of the product or service included in the offer.'),
(1754, 1, 6, 'vehicleSeatingCapacity', 'vehicleSeatingCapacity', 'The number of passengers that can be seated in the vehicle, both in terms of the physical space available, and in terms of limitations set by law.\\n\\nTypical unit code(s): C62 for persons.'),
(1755, 1, 6, 'relevantOccupation', 'relevantOccupation', 'The Occupation for the JobPosting.'),
(1756, 1, 6, 'phoneticText', 'phoneticText', 'Representation of a text [[textValue]] using the specified [[speechToTextMarkup]]. For example the city name of Houston in IPA: /ˈhjuːstən/.'),
(1757, 1, 6, 'vehicleInteriorColor', 'vehicleInteriorColor', 'The color or color combination of the interior of the vehicle.'),
(1758, 1, 6, 'broadcastSubChannel', 'broadcastSubChannel', 'The subchannel used for the broadcast.'),
(1759, 1, 6, 'targetPlatform', 'targetPlatform', 'Type of app development: phone, Metro style, desktop, XBox, etc.'),
(1760, 1, 6, 'naics', 'naics', 'The North American Industry Classification System (NAICS) code for a particular organization or business person.'),
(1761, 1, 6, 'color', 'color', 'The color of the product.'),
(1762, 1, 6, 'risks', 'risks', 'Specific physiologic risks associated to the diet plan.'),
(1763, 1, 6, 'dateIssued', 'dateIssued', 'The date the ticket was issued.'),
(1764, 1, 6, 'propertyID', 'propertyID', 'A commonly used identifier for the characteristic represented by the property, e.g. a manufacturer or a standard code for a property. propertyID can be\n(1) a prefixed string, mainly meant to be used with standards for product properties; (2) a site-specific, non-prefixed string (e.g. the primary key of the property or the vendor-specific ID of the property), or (3)\na URL indicating the type of the property, either pointing to an external vocabulary, or a Web resource that describes the property (e.g. a glossary entry).\nStandards bodies should promote a standard prefix for the identifiers of properties from their standards.'),
(1765, 1, 6, 'directors', 'directors', 'A director of e.g. TV, radio, movie, video games etc. content. Directors can be associated with individual items or with a series, episode, clip.'),
(1766, 1, 6, 'director', 'director', 'A director of e.g. TV, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.'),
(1767, 1, 6, 'map', 'map', 'A URL to a map of the place.'),
(1768, 1, 6, 'hasMap', 'hasMap', 'A URL to a map of the place.'),
(1769, 1, 6, 'stageAsNumber', 'stageAsNumber', 'The stage represented as a number, e.g. 3.'),
(1770, 1, 6, 'awards', 'awards', 'Awards won by or for this item.'),
(1771, 1, 6, 'award', 'award', 'An award won by or for this item.'),
(1772, 1, 6, 'associatedDisease', 'associatedDisease', 'Disease associated to this BioChemEntity. Such disease can be a MedicalCondition or a URL. If you want to add an evidence supporting the association, please use PropertyValue.'),
(1773, 1, 6, 'amenityFeature', 'amenityFeature', 'An amenity feature (e.g. a characteristic or service) of the Accommodation. This generic property does not make a statement about whether the feature is included in an offer for the main accommodation or available at extra costs.'),
(1774, 1, 6, 'birthDate', 'birthDate', 'Date of birth.'),
(1775, 1, 6, 'valueMaxLength', 'valueMaxLength', 'Specifies the allowed range for number of characters in a literal value.'),
(1776, 1, 6, 'programName', 'programName', 'The program providing the membership.'),
(1777, 1, 6, 'isRelatedTo', 'isRelatedTo', 'A pointer to another, somehow related product (or multiple products).'),
(1778, 1, 6, 'vehicleModelDate', 'vehicleModelDate', 'The release date of a vehicle model (often used to differentiate versions of the same make and model).'),
(1779, 1, 6, 'typicalCreditsPerTerm', 'typicalCreditsPerTerm', 'The number of credits or units a full-time student would be expected to take in 1 term however \'term\' is defined by the institution.'),
(1780, 1, 6, 'titleEIDR', 'titleEIDR', 'An [EIDR](https://eidr.org/) (Entertainment Identifier Registry) [[identifier]] representing at the most general/abstract level, a work of film or television.\n\nFor example, the motion picture known as \"Ghostbusters\" has a titleEIDR of  \"10.5240/7EC7-228A-510A-053E-CBB8-J\". This title (or work) may have several variants, which EIDR calls \"edits\". See [[editEIDR]].\n\nSince schema.org types like [[Movie]] and [[TVEpisode]] can be used for both works and their multiple expressions, it is possible to use [[titleEIDR]] alone (for a general description), or alongside [[editEIDR]] for a more edit-specific description.\n'),
(1781, 1, 6, 'editEIDR', 'editEIDR', 'An [EIDR](https://eidr.org/) (Entertainment Identifier Registry) [[identifier]] representing a specific edit / edition for a work of film or television.\n\nFor example, the motion picture known as \"Ghostbusters\" whose [[titleEIDR]] is \"10.5240/7EC7-228A-510A-053E-CBB8-J\" has several edits, e.g. \"10.5240/1F2A-E1C5-680A-14C6-E76B-I\" and \"10.5240/8A35-3BEE-6497-5D12-9E4F-3\".\n\nSince schema.org types like [[Movie]] and [[TVEpisode]] can be used for both works and their multiple expressions, it is possible to use [[titleEIDR]] alone (for a general description), or alongside [[editEIDR]] for a more edit-specific description.\n'),
(1782, 1, 6, 'embeddedTextCaption', 'embeddedTextCaption', 'Represents textual captioning from a [[MediaObject]], e.g. text of a \'meme\'.'),
(1783, 1, 6, 'caption', 'caption', 'The caption for this object. For downloadable machine formats (closed caption, subtitles etc.) use MediaObject and indicate the [[encodingFormat]].'),
(1784, 1, 6, 'recommendedIntake', 'recommendedIntake', 'Recommended intake of this supplement for a given population as defined by a specific recommending authority.'),
(1785, 1, 6, 'instructor', 'instructor', 'A person assigned to instruct or provide instructional assistance for the [[CourseInstance]].'),
(1786, 1, 6, 'administrationRoute', 'administrationRoute', 'A route by which this drug may be administered, e.g. \'oral\'.'),
(1787, 1, 6, 'postOp', 'postOp', 'A description of the postoperative procedures, care, and/or followups for this device.'),
(1788, 1, 6, 'subStructure', 'subStructure', 'Component (sub-)structure(s) that comprise this anatomical structure.'),
(1789, 1, 6, 'isResizable', 'isResizable', 'Whether the 3DModel allows resizing. For example, room layout applications often do not allow 3DModel elements to be resized to reflect reality.'),
(1790, 1, 6, 'affectedBy', 'affectedBy', 'Drugs that affect the test\'s results.'),
(1791, 1, 6, 'healthPlanPharmacyCategory', 'healthPlanPharmacyCategory', 'The category or type of pharmacy associated with this cost sharing.'),
(1792, 1, 6, 'authenticator', 'authenticator', 'The Organization responsible for authenticating the user\'s subscription. For example, many media apps require a cable/satellite provider to authenticate your subscription before playing media.'),
(1793, 1, 6, 'vehicleIdentificationNumber', 'vehicleIdentificationNumber', 'The Vehicle Identification Number (VIN) is a unique serial number used by the automotive industry to identify individual motor vehicles.'),
(1794, 1, 6, 'serialNumber', 'serialNumber', 'The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.'),
(1795, 1, 6, 'coverageStartTime', 'coverageStartTime', 'The time when the live blog will begin covering the Event. Note that coverage may begin before the Event\'s start time. The LiveBlogPosting may also be created before coverage begins.'),
(1796, 1, 6, 'contentReferenceTime', 'contentReferenceTime', 'The specific time described by a creative work, for works (e.g. articles, video objects etc.) that emphasise a particular moment within an Event.'),
(1797, 1, 6, 'epidemiology', 'epidemiology', 'The characteristics of associated patients, such as age, gender, race etc.'),
(1798, 1, 6, 'schoolClosuresInfo', 'schoolClosuresInfo', 'Information about school closures.'),
(1799, 1, 6, 'callSign', 'callSign', 'A [callsign](https://en.wikipedia.org/wiki/Call_sign), as used in broadcasting and radio communications to identify people, radio and TV stations, or vehicles.'),
(1800, 1, 6, 'acquiredFrom', 'acquiredFrom', 'The organization or person from which the product was acquired.'),
(1801, 1, 6, 'branchCode', 'branchCode', 'A short textual code (also called \"store code\") that uniquely identifies a place of business. The code is typically assigned by the parentOrganization and used in structured URLs.\\n\\nFor example, in the URL http://www.starbucks.co.uk/store-locator/etc/detail/3047 the code \"3047\" is a branchCode for a particular branch.\n      '),
(1802, 1, 6, 'drug', 'drug', 'Specifying a drug or medicine used in a medication procedure.'),
(1803, 1, 6, 'code', 'code', 'A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.'),
(1804, 1, 6, 'codingSystem', 'codingSystem', 'The coding system, e.g. \'ICD-10\'.'),
(1805, 1, 6, 'gtin12', 'gtin12', 'The GTIN-12 code of the product, or the product to which the offer refers. The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.'),
(1806, 1, 6, 'gtin', 'gtin', 'A Global Trade Item Number ([GTIN](https://www.gs1.org/standards/id-keys/gtin)). GTINs identify trade items, including products and services, using numeric identification codes.\n\nThe GS1 [digital link specifications](https://www.gs1.org/standards/Digital-Link/) express GTINs as URLs (URIs, IRIs, etc.). Details including regular expression examples can be found in, Section 6 of the GS1 URI Syntax specification; see also [schema.org tracking issue](https://github.com/schemaorg/schemaorg/issues/3156#issuecomment-1209522809) for schema.org-specific discussion. A correct [[gtin]] value should be a valid GTIN, which means that it should be an all-numeric string of either 8, 12, 13 or 14 digits, or a \"GS1 Digital Link\" URL based on such a string. The numeric component should also have a [valid GS1 check digit](https://www.gs1.org/services/check-digit-calculator) and meet the other rules for valid GTINs. See also [GS1\'s GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) and [Wikipedia](https://en.wikipedia.org/wiki/Global_Trade_Item_Number) for more details. Left-padding of the gtin values is not required or encouraged. The [[gtin]] property generalizes the earlier [[gtin8]], [[gtin12]], [[gtin13]], and [[gtin14]] properties.\n\nNote also that this is a definition for how to include GTINs in Schema.org data, and not a definition of GTINs in general - see the GS1 documentation for authoritative details.'),
(1807, 1, 6, 'applicationStartDate', 'applicationStartDate', 'The date at which the program begins collecting applications for the next enrollment cycle.'),
(1808, 1, 6, 'includesObject', 'includesObject', 'This links to a node or nodes indicating the exact quantity of the products included in  an [[Offer]] or [[ProductCollection]].'),
(1809, 1, 6, 'volumeNumber', 'volumeNumber', 'Identifies the volume of publication or multi-part work; for example, \"iii\" or \"2\".'),
(1810, 1, 6, 'acceptedOffer', 'acceptedOffer', 'The offer(s) -- e.g., product, quantity and price combinations -- included in the order.'),
(1811, 1, 6, 'cvdNumC19HospPats', 'cvdNumC19HospPats', 'numc19hosppats - HOSPITALIZED: Patients currently hospitalized in an inpatient care location who have suspected or confirmed COVID-19.'),
(1812, 1, 6, 'entertainmentBusiness', 'entertainmentBusiness', 'A sub property of location. The entertainment business where the action occurred.'),
(1813, 1, 6, 'educationalLevel', 'educationalLevel', 'The level in terms of progression through an educational or training context. Examples of educational levels include \'beginner\', \'intermediate\' or \'advanced\', and formal sets of level indicators.'),
(1814, 1, 6, 'uploadDate', 'uploadDate', 'Date when this media object was uploaded to this site.'),
(1815, 1, 6, 'programType', 'programType', 'The type of educational or occupational program. For example, classroom, internship, alternance, etc.'),
(1816, 1, 6, 'highPrice', 'highPrice', 'The highest price of all offers available.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(1817, 1, 6, 'byDay', 'byDay', 'Defines the day(s) of the week on which a recurring [[Event]] takes place. May be specified using either [[DayOfWeek]], or alternatively [[Text]] conforming to iCal\'s syntax for byDay recurrence rules.'),
(1818, 1, 6, 'additionalProperty', 'additionalProperty', 'A property-value pair representing an additional characteristic of the entity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.\\n\\nNote: Publishers should be aware that applications designed to use specific schema.org properties (e.g. https://schema.org/width, https://schema.org/color, https://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.\n'),
(1819, 1, 6, 'catalog', 'catalog', 'A data catalog which contains this dataset.'),
(1820, 1, 6, 'includedInDataCatalog', 'includedInDataCatalog', 'A data catalog which contains this dataset.'),
(1821, 1, 6, 'seriousAdverseOutcome', 'seriousAdverseOutcome', 'A possible serious complication and/or serious side effect of this therapy. Serious adverse outcomes include those that are life-threatening; result in death, disability, or permanent damage; require hospitalization or prolong existing hospitalization; cause congenital anomalies or birth defects; or jeopardize the patient and may require medical or surgical intervention to prevent one of the outcomes in this definition.'),
(1822, 1, 6, 'brand', 'brand', 'The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.'),
(1823, 1, 6, 'isLiveBroadcast', 'isLiveBroadcast', 'True if the broadcast is of a live event.'),
(1824, 1, 6, 'sensoryRequirement', 'sensoryRequirement', 'A description of any sensory requirements and levels necessary to function on the job, including hearing and vision. Defined terms such as those in O*net may be used, but note that there is no way to specify the level of ability as well as its nature when using a defined term.'),
(1825, 1, 6, 'linkRelationship', 'linkRelationship', 'Indicates the relationship type of a Web link. '),
(1826, 1, 6, 'productSupported', 'productSupported', 'The product or service this support contact point is related to (such as product support for a particular product line). This can be a specific product or product line (e.g. \"iPhone\") or a general category of products or services (e.g. \"smartphones\").'),
(1827, 1, 6, 'ccRecipient', 'ccRecipient', 'A sub property of recipient. The recipient copied on a message.'),
(1828, 1, 6, 'recipient', 'recipient', 'A sub property of participant. The participant who is at the receiving end of the action.'),
(1829, 1, 6, 'occupationalCategory', 'occupationalCategory', 'A category describing the job, preferably using a term from a taxonomy such as [BLS O*NET-SOC](http://www.onetcenter.org/taxonomy.html), [ISCO-08](https://www.ilo.org/public/english/bureau/stat/isco/isco08/) or similar, with the property repeated for each applicable value. Ideally the taxonomy should be identified, and both the textual label and formal code for the category should be provided.\\n\nNote: for historical reasons, any textual label and formal code provided as a literal may be assumed to be from O*NET-SOC.'),
(1830, 1, 6, 'responsibilities', 'responsibilities', 'Responsibilities associated with this role or Occupation.'),
(1831, 1, 6, 'nonEqual', 'nonEqual', 'This ordering relation for qualitative values indicates that the subject is not equal to the object.'),
(1832, 1, 6, 'qualifications', 'qualifications', 'Specific qualifications required for this role or Occupation.'),
(1833, 1, 6, 'contactlessPayment', 'contactlessPayment', 'A secure method for consumers to purchase products or services via debit, credit or smartcards by using RFID or NFC technology.'),
(1834, 1, 6, 'causeOf', 'causeOf', 'The condition, complication, symptom, sign, etc. caused.'),
(1835, 1, 6, 'passengerPriorityStatus', 'passengerPriorityStatus', 'The priority status assigned to a passenger for security or boarding (e.g. FastTrack or Priority).'),
(1836, 1, 6, 'freeShippingThreshold', 'freeShippingThreshold', 'A monetary value above (or at) which the shipping rate becomes free. Intended to be used via an [[OfferShippingDetails]] with [[shippingSettingsLink]] matching this [[ShippingRateSettings]].'),
(1837, 1, 6, 'marginOfError', 'marginOfError', 'A marginOfError for an [[Observation]].'),
(1838, 1, 6, 'pageStart', 'pageStart', 'The page on which the work starts; for example \"135\" or \"xiii\".'),
(1839, 1, 6, 'dateRead', 'dateRead', 'The date/time at which the message has been read by the recipient if a single recipient exists.'),
(1840, 1, 6, 'tool', 'tool', 'A sub property of instrument. An object used (but not consumed) when performing instructions or a direction.'),
(1841, 1, 6, 'priceCurrency', 'priceCurrency', 'The currency of the price, or a price component when attached to [[PriceSpecification]] and its subtypes.\\n\\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\".'),
(1842, 1, 6, 'merchantReturnDays', 'merchantReturnDays', 'Specifies either a fixed return date or the number of days (from the delivery date) that a product can be returned. Used when the [[returnPolicyCategory]] property is specified as [[MerchantReturnFiniteReturnWindow]].'),
(1843, 1, 6, 'sugarContent', 'sugarContent', 'The number of grams of sugar.'),
(1844, 1, 6, 'thumbnail', 'thumbnail', 'Thumbnail image for an image or video.'),
(1845, 1, 6, 'hasMenuSection', 'hasMenuSection', 'A subgrouping of the menu (by dishes, course, serving time period, etc.).'),
(1846, 1, 6, 'loanRepaymentForm', 'loanRepaymentForm', 'A form of paying back money previously borrowed from a lender. Repayment usually takes the form of periodic payments that normally include part principal plus interest in each payment.'),
(1847, 1, 6, 'publisherImprint', 'publisherImprint', 'The publishing division which published the comic.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1848, 1, 6, 'productionCompany', 'productionCompany', 'The production company or studio responsible for the item, e.g. series, video game, episode etc.'),
(1849, 1, 6, 'startTime', 'startTime', 'The startTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start. For actions that span a period of time, when the action was performed. E.g. John wrote a book from *January* to December. For media, including audio and video, it\'s the time offset of the start of a clip within a larger file.\\n\\nNote that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.'),
(1850, 1, 6, 'contactPoints', 'contactPoints', 'A contact point for a person or organization.'),
(1851, 1, 6, 'contactPoint', 'contactPoint', 'A contact point for a person or organization.'),
(1852, 1, 6, 'candidate', 'candidate', 'A sub property of object. The candidate subject of this action.'),
(1853, 1, 6, 'object', 'object', 'The object upon which the action is carried out, whose state is kept intact or changed. Also known as the semantic roles patient, affected or undergoer (which change their state) or theme (which doesn\'t). E.g. John read *a book*.'),
(1854, 1, 6, 'netWorth', 'netWorth', 'The total financial value of the person as calculated by subtracting assets from liabilities.'),
(1855, 1, 6, 'recordLabel', 'recordLabel', 'The label that issued the release.'),
(1856, 1, 6, 'offerCount', 'offerCount', 'The number of offers for the product.'),
(1857, 1, 6, 'seasons', 'seasons', 'A season in a media series.'),
(1858, 1, 6, 'season', 'season', 'A season in a media series.'),
(1859, 1, 6, 'status', 'status', 'The status of the study (enumerated).'),
(1860, 1, 6, 'includedComposition', 'includedComposition', 'Smaller compositions included in this work (e.g. a movement in a symphony).'),
(1861, 1, 6, 'inventoryLevel', 'inventoryLevel', 'The current approximate inventory level for the item or items.'),
(1862, 1, 6, 'isPlanForApartment', 'isPlanForApartment', 'Indicates some accommodation that this floor plan describes.'),
(1863, 1, 6, 'teaches', 'teaches', 'The item being described is intended to help a person learn the competency or learning outcome defined by the referenced term.'),
(1864, 1, 6, 'numberedPosition', 'numberedPosition', 'A number associated with a role in an organization, for example, the number on an athlete\'s jersey.'),
(1865, 1, 6, 'governmentBenefitsInfo', 'governmentBenefitsInfo', 'governmentBenefitsInfo provides information about government benefits associated with a SpecialAnnouncement.'),
(1866, 1, 6, 'cvdNumC19OverflowPats', 'cvdNumC19OverflowPats', 'numc19overflowpats - ED/OVERFLOW: Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed.'),
(1867, 1, 6, 'procedure', 'procedure', 'A description of the procedure involved in setting up, using, and/or installing the device.'),
(1868, 1, 6, 'paymentUrl', 'paymentUrl', 'The URL for sending a payment.'),
(1869, 1, 6, 'endTime', 'endTime', 'The endTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end. For actions that span a period of time, when the action was performed. E.g. John wrote a book from January to *December*. For media, including audio and video, it\'s the time offset of the end of a clip within a larger file.\\n\\nNote that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.'),
(1870, 1, 6, 'itemListElement', 'itemListElement', 'For itemListElement values, you can use simple strings (e.g. \"Peter\", \"Paul\", \"Mary\"), existing entities, or use ListItem.\\n\\nText values are best if the elements in the list are plain strings. Existing entities are best for a simple, unordered list of existing things in your data. ListItem is used with ordered lists when you want to provide additional context about the element in that list or when the same item might be in different places in different lists.\\n\\nNote: The order of elements in your mark-up is not sufficient for indicating the order or elements.  Use ListItem with a \'position\' property in such cases.'),
(1871, 1, 6, 'successorOf', 'successorOf', 'A pointer from a newer variant of a product  to its previous, often discontinued predecessor.'),
(1872, 1, 6, 'cvdNumVent', 'cvdNumVent', 'numvent - MECHANICAL VENTILATORS: Total number of ventilators available.'),
(1873, 1, 6, 'numberOfRooms', 'numberOfRooms', 'The number of rooms (excluding bathrooms and closets) of the accommodation or lodging business.\nTypical unit code(s): ROM for room or C62 for no unit. The type of room can be put in the unitText property of the QuantitativeValue.'),
(1874, 1, 6, 'potentialUse', 'potentialUse', 'Intended use of the BioChemEntity by humans.'),
(1875, 1, 6, 'characterAttribute', 'characterAttribute', 'A piece of data that represents a particular aspect of a fictional character (skill, power, character points, advantage, disadvantage).'),
(1876, 1, 6, 'chemicalComposition', 'chemicalComposition', 'The chemical composition describes the identity and relative ratio of the chemical elements that make up the substance.'),
(1877, 1, 6, 'numberOfSeasons', 'numberOfSeasons', 'The number of seasons in this series.'),
(1878, 1, 6, 'offersPrescriptionByMail', 'offersPrescriptionByMail', 'Whether prescriptions can be delivered by mail.'),
(1879, 1, 6, 'lyricist', 'lyricist', 'The person who wrote the words.'),
(1880, 1, 6, 'sdPublisher', 'sdPublisher', 'Indicates the party responsible for generating and publishing the current structured data markup, typically in cases where the structured data is derived automatically from existing published content but published on a different site. For example, student projects and open data initiatives often re-publish existing content with more explicitly structured metadata. The\n[[sdPublisher]] property helps make such practices more explicit.'),
(1881, 1, 6, 'isAvailableGenerically', 'isAvailableGenerically', 'True if the drug is available in a generic form (regardless of name).'),
(1882, 1, 6, 'algorithm', 'algorithm', 'The algorithm or rules to follow to compute the score.'),
(1883, 1, 6, 'includedRiskFactor', 'includedRiskFactor', 'A modifiable or non-modifiable risk factor included in the calculation, e.g. age, coexisting condition.'),
(1884, 1, 6, 'colorist', 'colorist', 'The individual who adds color to inked drawings.'),
(1885, 1, 6, 'recipeInstructions', 'recipeInstructions', 'A step in making the recipe, in the form of a single item (document, video, etc.) or an ordered list with HowToStep and/or HowToSection items.'),
(1886, 1, 6, 'repeatFrequency', 'repeatFrequency', 'Defines the frequency at which [[Event]]s will occur according to a schedule [[Schedule]]. The intervals between\n      events should be defined as a [[Duration]] of time.'),
(1887, 1, 6, 'frequency', 'frequency', 'How often the dose is taken, e.g. \'daily\'.'),
(1888, 1, 6, 'beneficiaryBank', 'beneficiaryBank', 'A bank or bank’s branch, financial institution or international financial institution operating the beneficiary’s bank account or releasing funds for the beneficiary.'),
(1889, 1, 6, 'arrivalGate', 'arrivalGate', 'Identifier of the flight\'s arrival gate.'),
(1890, 1, 6, 'contentType', 'contentType', 'The supported content type(s) for an EntryPoint response.'),
(1891, 1, 6, 'arrivalBoatTerminal', 'arrivalBoatTerminal', 'The terminal or port from which the boat arrives.'),
(1892, 1, 6, 'address', 'address', 'Physical address of the item.'),
(1893, 1, 6, 'checkoutTime', 'checkoutTime', 'The latest someone may check out of a lodging establishment.'),
(1894, 1, 6, 'billingAddress', 'billingAddress', 'The billing address for the order.'),
(1895, 1, 6, 'eventSchedule', 'eventSchedule', 'Associates an [[Event]] with a [[Schedule]]. There are circumstances where it is preferable to share a schedule for a series of\n      repeating events rather than data on the individual events themselves. For example, a website or application might prefer to publish a schedule for a weekly\n      gym class rather than provide data on every event. A schedule could be processed by applications to add forthcoming events to a calendar. An [[Event]] that\n      is associated with a [[Schedule]] using this property should not have [[startDate]] or [[endDate]] properties. These are instead defined within the associated\n      [[Schedule]], this avoids any ambiguity for clients using the data. The property might have repeated values to specify different schedules, e.g. for different months\n      or seasons.'),
(1896, 1, 6, 'validThrough', 'validThrough', 'The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.'),
(1897, 1, 6, 'warrantyPromise', 'warrantyPromise', 'The warranty promise(s) included in the offer.'),
(1898, 1, 6, 'warranty', 'warranty', 'The warranty promise(s) included in the offer.'),
(1899, 1, 6, 'relatedTherapy', 'relatedTherapy', 'A medical therapy related to this anatomy.'),
(1900, 1, 6, 'slogan', 'slogan', 'A slogan or motto associated with the item.'),
(1901, 1, 6, 'employmentUnit', 'employmentUnit', 'Indicates the department, unit and/or facility where the employee reports and/or in which the job is to be performed.'),
(1902, 1, 6, 'geographicArea', 'geographicArea', 'The geographic area associated with the audience.'),
(1903, 1, 6, 'inverseOf', 'inverseOf', 'Relates a property to a property that is its inverse. Inverse properties relate the same pairs of items to each other, but in reversed direction. For example, the \'alumni\' and \'alumniOf\' properties are inverseOf each other. Some properties don\'t have explicit inverses; in these situations RDFa and JSON-LD syntax for reverse properties can be used.'),
(1904, 1, 6, 'broadcastTimezone', 'broadcastTimezone', 'The timezone in [ISO 8601 format](http://en.wikipedia.org/wiki/ISO_8601) for which the service bases its broadcasts.'),
(1905, 1, 6, 'timeOfDay', 'timeOfDay', 'The time of day the program normally runs. For example, \"evenings\".'),
(1906, 1, 6, 'bestRating', 'bestRating', 'The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.'),
(1907, 1, 6, 'processingTime', 'processingTime', 'Estimated processing time for the service using this channel.'),
(1908, 1, 6, 'membershipPointsEarned', 'membershipPointsEarned', 'The number of membership points earned by the member. If necessary, the unitText can be used to express the units the points are issued in. (E.g. stars, miles, etc.)'),
(1909, 1, 6, 'elevation', 'elevation', 'The elevation of a location ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)). Values may be of the form \'NUMBER UNIT\\_OF\\_MEASUREMENT\' (e.g., \'1,000 m\', \'3,200 ft\') while numbers alone should be assumed to be a value in meters.'),
(1910, 1, 6, 'creditedTo', 'creditedTo', 'The group the release is credited to if different than the byArtist. For example, Red and Blue is credited to \"Stefani Germanotta Band\", but by Lady Gaga.'),
(1911, 1, 6, 'sport', 'sport', 'A type of sport (e.g. Baseball).'),
(1912, 1, 6, 'seeks', 'seeks', 'A pointer to products or services sought by the organization or person (demand).'),
(1913, 1, 6, 'additionalName', 'additionalName', 'An additional name for a Person, can be used for a middle name.'),
(1914, 1, 6, 'alternateName', 'alternateName', 'An alias for the item.'),
(1915, 1, 6, 'downPayment', 'downPayment', 'a type of payment made in cash during the onset of the purchase of an expensive good/service. The payment typically represents only a percentage of the full purchase price.'),
(1916, 1, 6, 'postOfficeBoxNumber', 'postOfficeBoxNumber', 'The post office box number for PO box addresses.'),
(1917, 1, 6, 'energyEfficiencyScaleMax', 'energyEfficiencyScaleMax', 'Specifies the most energy efficient class on the regulated EU energy consumption scale for the product category a product belongs to. For example, energy consumption for televisions placed on the market after January 1, 2020 is scaled from D to A+++.'),
(1918, 1, 6, 'userInteractionCount', 'userInteractionCount', 'The number of interactions for the CreativeWork using the WebSite or SoftwareApplication.'),
(1919, 1, 6, 'sizeGroup', 'sizeGroup', 'The size group (also known as \"size type\") for a product\'s size. Size groups are common in the fashion industry to define size segments and suggested audiences for wearable products. Multiple values can be combined, for example \"men\'s big and tall\", \"petite maternity\" or \"regular\"'),
(1920, 1, 6, 'productionDate', 'productionDate', 'The date of production of the item, e.g. vehicle.'),
(1921, 1, 6, 'hostingOrganization', 'hostingOrganization', 'The organization (airline, travelers\' club, etc.) the membership is made with.'),
(1922, 1, 6, 'addOn', 'addOn', 'An additional offer that can only be obtained in combination with the first base offer (e.g. supplements and extensions that are available for a surcharge).'),
(1923, 1, 6, 'hasOfferCatalog', 'hasOfferCatalog', 'Indicates an OfferCatalog listing for this Organization, Person, or Service.'),
(1924, 1, 6, 'shippingDetails', 'shippingDetails', 'Indicates information about the shipping policies and options associated with an [[Offer]].'),
(1925, 1, 6, 'seasonNumber', 'seasonNumber', 'Position of the season within an ordered group of seasons.'),
(1926, 1, 6, 'loanType', 'loanType', 'The type of a loan or credit.'),
(1927, 1, 6, 'documentation', 'documentation', 'Further documentation describing the Web API in more detail.'),
(1928, 1, 6, 'domiciledMortgage', 'domiciledMortgage', 'Whether borrower is a resident of the jurisdiction where the property is located.'),
(1929, 1, 6, 'drugUnit', 'drugUnit', 'The unit in which the drug is measured, e.g. \'5 mg tablet\'.'),
(1930, 1, 6, 'physicalRequirement', 'physicalRequirement', 'A description of the types of physical activity associated with the job. Defined terms such as those in O*net may be used, but note that there is no way to specify the level of ability as well as its nature when using a defined term.'),
(1931, 1, 6, 'numberOfCredits', 'numberOfCredits', 'The number of credits or units awarded by a Course or required to complete an EducationalOccupationalProgram.'),
(1932, 1, 6, 'funder', 'funder', 'A person or organization that supports (sponsors) something through some kind of financial contribution.'),
(1933, 1, 6, 'sponsor', 'sponsor', 'A person or organization that supports a thing through a pledge, promise, or financial contribution. E.g. a sponsor of a Medical Study or a corporate sponsor of an event.'),
(1934, 1, 6, 'nonProprietaryName', 'nonProprietaryName', 'The generic name of this drug or supplement.'),
(1935, 1, 6, 'returnPolicyCountry', 'returnPolicyCountry', 'The country where the product has to be sent to for returns, for example \"Ireland\" using the [[name]] property of [[Country]]. You can also provide the two-letter [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1). Note that this can be different from the country where the product was originally shipped from or sent to.'),
(1936, 1, 6, 'screenCount', 'screenCount', 'The number of screens in the movie theater.'),
(1937, 1, 6, 'cashBack', 'cashBack', 'A cardholder benefit that pays the cardholder a small percentage of their net expenditures.'),
(1938, 1, 6, 'underName', 'underName', 'The person or organization the reservation or ticket is for.'),
(1939, 1, 6, 'logo', 'logo', 'An associated logo.'),
(1940, 1, 6, 'image', 'image', 'An image of the item. This can be a [[URL]] or a fully described [[ImageObject]].'),
(1941, 1, 6, 'domainIncludes', 'domainIncludes', 'Relates a property to a class that is (one of) the type(s) the property is expected to be used on.'),
(1942, 1, 6, 'inChI', 'inChI', 'Non-proprietary identifier for molecular entity that can be used in printed and electronic data sources thus enabling easier linking of diverse data compilations.'),
(1943, 1, 6, 'quarantineGuidelines', 'quarantineGuidelines', 'Guidelines about quarantine rules, e.g. in the context of a pandemic.'),
(1944, 1, 6, 'discountCode', 'discountCode', 'Code used to redeem a discount.'),
(1945, 1, 6, 'musicalKey', 'musicalKey', 'The key, mode, or scale this composition uses.'),
(1946, 1, 6, 'productID', 'productID', 'The product identifier, such as ISBN. For example: ``` meta itemprop=\"productID\" content=\"isbn:123-456-789\" ```.'),
(1947, 1, 6, 'breastfeedingWarning', 'breastfeedingWarning', 'Any precaution, guidance, contraindication, etc. related to this drug\'s use by breastfeeding mothers.'),
(1948, 1, 6, 'relatedStructure', 'relatedStructure', 'Related anatomical structure(s) that are not part of the system but relate or connect to it, such as vascular bundles associated with an organ system.'),
(1949, 1, 6, 'currency', 'currency', 'The currency in which the monetary amount is expressed.\\n\\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\".'),
(1950, 1, 6, 'cvdNumC19MechVentPats', 'cvdNumC19MechVentPats', 'numc19mechventpats - HOSPITALIZED and VENTILATED: Patients hospitalized in an NHSN inpatient care location who have suspected or confirmed COVID-19 and are on a mechanical ventilator.'),
(1951, 1, 6, 'ethicsPolicy', 'ethicsPolicy', 'Statement about ethics policy, e.g. of a [[NewsMediaOrganization]] regarding journalistic and publishing practices, or of a [[Restaurant]], a page describing food source policies. In the case of a [[NewsMediaOrganization]], an ethicsPolicy is typically a statement describing the personal, organizational, and corporate standards of behavior expected by the organization.'),
(1952, 1, 6, 'refundType', 'refundType', 'A refund type, from an enumerated list.'),
(1953, 1, 6, 'postalCodeRange', 'postalCodeRange', 'A defined range of postal codes.'),
(1954, 1, 6, 'recognizedBy', 'recognizedBy', 'An organization that acknowledges the validity, value or utility of a credential. Note: recognition may include a process of quality assurance or accreditation.'),
(1955, 1, 6, 'workPerformed', 'workPerformed', 'A work performed in some event, for example a play performed in a TheaterEvent.'),
(1956, 1, 6, 'workFeatured', 'workFeatured', 'A work featured in some event, e.g. exhibited in an ExhibitionEvent.\n       Specific subproperties are available for workPerformed (e.g. a play), or a workPresented (a Movie at a ScreeningEvent).'),
(1957, 1, 6, 'mentions', 'mentions', 'Indicates that the CreativeWork contains a reference to, but is not necessarily about a concept.'),
(1958, 1, 6, 'customerRemorseReturnLabelSource', 'customerRemorseReturnLabelSource', 'The method (from an enumeration) by which the customer obtains a return shipping label for a product returned due to customer remorse.'),
(1959, 1, 6, 'legislationConsolidates', 'legislationConsolidates', 'Indicates another legislation taken into account in this consolidated legislation (which is usually the product of an editorial process that revises the legislation). This property should be used multiple times to refer to both the original version or the previous consolidated version, and to the legislations making the change.'),
(1960, 1, 6, 'aggregateRating', 'aggregateRating', 'The overall rating, based on a collection of reviews or ratings, of the item.'),
(1961, 1, 6, 'itinerary', 'itinerary', 'Destination(s) ( [[Place]] ) that make up a trip. For a trip where destination order is important use [[ItemList]] to specify that order (see examples).'),
(1962, 1, 6, 'globalLocationNumber', 'globalLocationNumber', 'The [Global Location Number](http://www.gs1.org/gln) (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.'),
(1963, 1, 6, 'applicantLocationRequirements', 'applicantLocationRequirements', 'The location(s) applicants can apply from. This is usually used for telecommuting jobs where the applicant does not need to be in a physical office. Note: This should not be used for citizenship or work visa requirements.'),
(1964, 1, 6, 'unitCode', 'unitCode', 'The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.'),
(1965, 1, 6, 'parents', 'parents', 'A parents of the person.'),
(1966, 1, 6, 'parent', 'parent', 'A parent of this person.'),
(1967, 1, 6, 'renegotiableLoan', 'renegotiableLoan', 'Whether the terms for payment of interest can be renegotiated during the life of the loan.'),
(1968, 1, 6, 'priceComponent', 'priceComponent', 'This property links to all [[UnitPriceSpecification]] nodes that apply in parallel for the [[CompoundPriceSpecification]] node.'),
(1969, 1, 6, 'eligibleDuration', 'eligibleDuration', 'The duration for which the given offer is valid.'),
(1970, 1, 6, 'copyrightYear', 'copyrightYear', 'The year during which the claimed copyright for the CreativeWork was first asserted.'),
(1971, 1, 6, 'trialDesign', 'trialDesign', 'Specifics about the trial design (enumerated).'),
(1972, 1, 6, 'serviceAudience', 'serviceAudience', 'The audience eligible for this service.'),
(1973, 1, 6, 'audience', 'audience', 'An intended audience, i.e. a group for whom something was created.'),
(1974, 1, 6, 'vehicleSpecialUsage', 'vehicleSpecialUsage', 'Indicates whether the vehicle has been used for special purposes, like commercial rental, driving school, or as a taxi. The legislation in many countries requires this information to be revealed when offering a car for sale.'),
(1975, 1, 6, 'comment', 'comment', 'Comments, typically from users.'),
(1976, 1, 6, 'publicationType', 'publicationType', 'The type of the medical article, taken from the US NLM MeSH publication type catalog. See also [MeSH documentation](http://www.nlm.nih.gov/mesh/pubtypes.html).'),
(1977, 1, 6, 'availableIn', 'availableIn', 'The location in which the strength is available.'),
(1978, 1, 6, 'legislationIdentifier', 'legislationIdentifier', 'An identifier for the legislation. This can be either a string-based identifier, like the CELEX at EU level or the NOR in France, or a web-based, URL/URI identifier, like an ELI (European Legislation Identifier) or an URN-Lex.'),
(1979, 1, 6, 'discount', 'discount', 'Any discount applied (to an Order).'),
(1980, 1, 6, 'model', 'model', 'The model of the product. Use with the URL of a ProductModel or a textual representation of the model identifier. The URL of the ProductModel can be from an external source. It is recommended to additionally provide strong product identifiers via the gtin8/gtin13/gtin14 and mpn properties.'),
(1981, 1, 6, 'numberOfEpisodes', 'numberOfEpisodes', 'The number of episodes in this season or series.'),
(1982, 1, 6, 'deathDate', 'deathDate', 'Date of death.'),
(1983, 1, 6, 'servingSize', 'servingSize', 'The serving size, in terms of the number of volume or mass.'),
(1984, 1, 6, 'ownershipFundingInfo', 'ownershipFundingInfo', 'For an [[Organization]] (often but not necessarily a [[NewsMediaOrganization]]), a description of organizational ownership structure; funding and grants. In a news/media setting, this is with particular reference to editorial independence.   Note that the [[funder]] is also available and can be used to make basic funder information machine-readable.'),
(1985, 1, 6, 'playerType', 'playerType', 'Player type required&#x2014;for example, Flash or Silverlight.'),
(1986, 1, 6, 'priceComponentType', 'priceComponentType', 'Identifies a price component (for example, a line item on an invoice), part of the total price for an offer.'),
(1987, 1, 6, 'abridged', 'abridged', 'Indicates whether the book is an abridged edition.'),
(1988, 1, 6, 'reviewAspect', 'reviewAspect', 'This Review or Rating is relevant to this part or facet of the itemReviewed.'),
(1989, 1, 6, 'advanceBookingRequirement', 'advanceBookingRequirement', 'The amount of time that is required between accepting the offer and the actual usage of the resource or service.'),
(1990, 1, 6, 'sender', 'sender', 'A sub property of participant. The participant who is at the sending end of the action.'),
(1991, 1, 6, 'participant', 'participant', 'Other co-agents that participated in the action indirectly. E.g. John wrote a book with *Steve*.'),
(1992, 1, 6, 'ingredients', 'ingredients', 'A single ingredient used in the recipe, e.g. sugar, flour or garlic.'),
(1993, 1, 6, 'recipeIngredient', 'recipeIngredient', 'A single ingredient used in the recipe, e.g. sugar, flour or garlic.'),
(1994, 1, 6, 'supply', 'supply', 'A sub-property of instrument. A supply consumed when performing instructions or a direction.'),
(1995, 1, 6, 'area', 'area', 'The area within which users can expect to reach the broadcast service.'),
(1996, 1, 6, 'serviceArea', 'serviceArea', 'The geographic area where the service is provided.'),
(1997, 1, 6, 'downvoteCount', 'downvoteCount', 'The number of downvotes this question, answer or comment has received from the community.'),
(1998, 1, 6, 'children', 'children', 'A child of the person.'),
(1999, 1, 6, 'arrivalPlatform', 'arrivalPlatform', 'The platform where the train arrives.'),
(2000, 1, 6, 'firstPerformance', 'firstPerformance', 'The date and place the work was first performed.'),
(2001, 1, 6, 'ratingValue', 'ratingValue', 'The rating for the content.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(2002, 1, 6, 'collectionSize', 'collectionSize', 'The number of items in the [[Collection]].'),
(2003, 1, 6, 'resultReview', 'resultReview', 'A sub property of result. The review that resulted in the performing of the action.'),
(2004, 1, 6, 'result', 'result', 'The result produced in the action. E.g. John wrote *a book*.'),
(2005, 1, 6, 'albums', 'albums', 'A collection of music albums.'),
(2006, 1, 6, 'album', 'album', 'A music album.'),
(2007, 1, 6, 'datePublished', 'datePublished', 'Date of first broadcast/publication.'),
(2008, 1, 6, 'includesAttraction', 'includesAttraction', 'Attraction located at destination.'),
(2009, 1, 6, 'publishedOn', 'publishedOn', 'A broadcast service associated with the publication event.'),
(2010, 1, 6, 'actionStatus', 'actionStatus', 'Indicates the current disposition of the Action.'),
(2011, 1, 6, 'orderDate', 'orderDate', 'Date order was placed.'),
(2012, 1, 6, 'prescribingInfo', 'prescribingInfo', 'Link to prescribing information for the drug.'),
(2013, 1, 6, 'contributor', 'contributor', 'A secondary contributor to the CreativeWork or Event.'),
(2014, 1, 6, 'yearBuilt', 'yearBuilt', 'The year an [[Accommodation]] was constructed. This corresponds to the [YearBuilt field in RESO](https://ddwiki.reso.org/display/DDW17/YearBuilt+Field). '),
(2015, 1, 6, 'trainingSalary', 'trainingSalary', 'The estimated salary earned while in the program.'),
(2016, 1, 6, 'orderQuantity', 'orderQuantity', 'The number of the item ordered. If the property is not set, assume the quantity is one.'),
(2017, 1, 6, 'bioChemInteraction', 'bioChemInteraction', 'A BioChemEntity that is known to interact with this item.'),
(2018, 1, 6, 'healthPlanId', 'healthPlanId', 'The 14-character, HIOS-generated Plan ID number. (Plan IDs must be unique, even across different markets.)'),
(2019, 1, 6, 'valuePattern', 'valuePattern', 'Specifies a regular expression for testing literal values according to the HTML spec.'),
(2020, 1, 6, 'orderItemNumber', 'orderItemNumber', 'The identifier of the order item.'),
(2021, 1, 6, 'accommodationCategory', 'accommodationCategory', 'Category of an [[Accommodation]], following real estate conventions, e.g. RESO (see [PropertySubType](https://ddwiki.reso.org/display/DDW17/PropertySubType+Field), and [PropertyType](https://ddwiki.reso.org/display/DDW17/PropertyType+Field) fields  for suggested values).'),
(2022, 1, 6, 'category', 'category', 'A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.'),
(2023, 1, 6, 'sdLicense', 'sdLicense', 'A license document that applies to this structured data, typically indicated by URL.'),
(2024, 1, 6, 'broadcastFrequency', 'broadcastFrequency', 'The frequency used for over-the-air broadcasts. Numeric values or simple ranges, e.g. 87-99. In addition a shortcut idiom is supported for frequences of AM and FM radio channels, e.g. \"87 FM\".'),
(2025, 1, 6, 'abstract', 'abstract', 'An abstract is a short description that summarizes a [[CreativeWork]].'),
(2026, 1, 6, 'floorSize', 'floorSize', 'The size of the accommodation, e.g. in square meter or squarefoot.\nTypical unit code(s): MTK for square meter, FTK for square foot, or YDK for square yard '),
(2027, 1, 6, 'measurementTechnique', 'measurementTechnique', 'A technique or technology used in a [[Dataset]] (or [[DataDownload]], [[DataCatalog]]),\ncorresponding to the method used for measuring the corresponding variable(s) (described using [[variableMeasured]]). This is oriented towards scientific and scholarly dataset publication but may have broader applicability; it is not intended as a full representation of measurement, but rather as a high level summary for dataset discovery.\n\nFor example, if [[variableMeasured]] is: molecule concentration, [[measurementTechnique]] could be: \"mass spectrometry\" or \"nmr spectroscopy\" or \"colorimetry\" or \"immunofluorescence\".\n\nIf the [[variableMeasured]] is \"depression rating\", the [[measurementTechnique]] could be \"Zung Scale\" or \"HAM-D\" or \"Beck Depression Inventory\".\n\nIf there are several [[variableMeasured]] properties recorded for some given data object, use a [[PropertyValue]] for each [[variableMeasured]] and attach the corresponding [[measurementTechnique]].\n      '),
(2028, 1, 6, 'seatRow', 'seatRow', 'The row location of the reserved seat (e.g., B).'),
(2029, 1, 6, 'programPrerequisites', 'programPrerequisites', 'Prerequisites for enrolling in the program.'),
(2030, 1, 6, 'endOffset', 'endOffset', 'The end time of the clip expressed as the number of seconds from the beginning of the work.'),
(2031, 1, 6, 'associatedClaimReview', 'associatedClaimReview', 'An associated [[ClaimReview]], related by specific common content, topic or claim. The expectation is that this property would be most typically used in cases where a single activity is conducting both claim reviews and media reviews, in which case [[relatedMediaReview]] would commonly be used on a [[ClaimReview]], while [[relatedClaimReview]] would be used on [[MediaReview]].'),
(2032, 1, 6, 'application', 'application', 'An application that can complete the request.'),
(2033, 1, 6, 'actionApplication', 'actionApplication', 'An application that can complete the request.'),
(2034, 1, 6, 'cookTime', 'cookTime', 'The time it takes to actually cook the dish, in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).'),
(2035, 1, 6, 'performTime', 'performTime', 'The length of time it takes to perform instructions or a direction (not including time to prepare the supplies), in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).'),
(2036, 1, 6, 'availableChannel', 'availableChannel', 'A means of accessing the service (e.g. a phone bank, a web site, a location, etc.).'),
(2037, 1, 6, 'seatNumber', 'seatNumber', 'The location of the reserved seat (e.g., 27).'),
(2038, 1, 6, 'costCategory', 'costCategory', 'The category of cost, such as wholesale, retail, reimbursement cap, etc.'),
(2039, 1, 6, 'associatedAnatomy', 'associatedAnatomy', 'The anatomy of the underlying organ system or structures associated with this entity.'),
(2040, 1, 6, 'homeTeam', 'homeTeam', 'The home team in a sports event.'),
(2041, 1, 6, 'competitor', 'competitor', 'A competitor in a sports event.'),
(2042, 1, 6, 'iswcCode', 'iswcCode', 'The International Standard Musical Work Code for the composition.'),
(2043, 1, 6, 'inChIKey', 'inChIKey', 'InChIKey is a hashed version of the full InChI (using the SHA-256 algorithm).'),
(2044, 1, 6, 'gameAvailabilityType', 'gameAvailabilityType', 'Indicates the availability type of the game content associated with this action, such as whether it is a full version or a demo.'),
(2045, 1, 6, 'publishedBy', 'publishedBy', 'An agent associated with the publication event.'),
(2046, 1, 6, 'shippingOrigin', 'shippingOrigin', 'Indicates the origin of a shipment, i.e. where it should be coming from.'),
(2047, 1, 6, 'requirements', 'requirements', 'Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (examples: DirectX, Java or .NET runtime).'),
(2048, 1, 6, 'softwareRequirements', 'softwareRequirements', 'Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (examples: DirectX, Java or .NET runtime).'),
(2049, 1, 6, 'thumbnailUrl', 'thumbnailUrl', 'A thumbnail image relevant to the Thing.'),
(2050, 1, 6, 'newsUpdatesAndGuidelines', 'newsUpdatesAndGuidelines', 'Indicates a page with news updates and guidelines. This could often be (but is not required to be) the main page containing [[SpecialAnnouncement]] markup on a site.'),
(2051, 1, 6, 'priceSpecification', 'priceSpecification', 'One or more detailed price specifications, indicating the unit price and delivery or payment charges.'),
(2052, 1, 6, 'availableStrength', 'availableStrength', 'An available dosage strength for the drug.'),
(2053, 1, 6, 'musicArrangement', 'musicArrangement', 'An arrangement derived from the composition.'),
(2054, 1, 6, 'healthPlanCoinsuranceOption', 'healthPlanCoinsuranceOption', 'Whether the coinsurance applies before or after deductible, etc. TODO: Is this a closed set?'),
(2055, 1, 6, 'datePosted', 'datePosted', 'Publication date of an online listing.'),
(2056, 1, 6, 'reviews', 'reviews', 'Review of the item.'),
(2057, 1, 6, 'review', 'review', 'A review of the item.'),
(2058, 1, 6, 'validUntil', 'validUntil', 'The date when the item is no longer valid.'),
(2059, 1, 6, 'requiresSubscription', 'requiresSubscription', 'Indicates if use of the media require a subscription  (either paid or free). Allowed values are ```true``` or ```false``` (note that an earlier version had \'yes\', \'no\').'),
(2060, 1, 6, 'ratingCount', 'ratingCount', 'The count of total number of ratings.'),
(2061, 1, 6, 'expectedArrivalFrom', 'expectedArrivalFrom', 'The earliest date the package may arrive.'),
(2062, 1, 6, 'version', 'version', 'The version of the CreativeWork embodied by a specified resource.'),
(2063, 1, 6, 'dropoffTime', 'dropoffTime', 'When a rental car can be dropped off.'),
(2064, 1, 6, 'infectiousAgentClass', 'infectiousAgentClass', 'The class of infectious agent (bacteria, prion, etc.) that causes the disease.'),
(2065, 1, 6, 'doseValue', 'doseValue', 'The value of the dose, e.g. 500.'),
(2066, 1, 6, 'cvdNumC19Died', 'cvdNumC19Died', 'numc19died - DEATHS: Patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any overflow location.'),
(2067, 1, 6, 'alternativeHeadline', 'alternativeHeadline', 'A secondary title of the CreativeWork.'),
(2068, 1, 6, 'longitude', 'longitude', 'The longitude of a location. For example ```-122.08585``` ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)).'),
(2069, 1, 6, 'energyEfficiencyScaleMin', 'energyEfficiencyScaleMin', 'Specifies the least energy efficient class on the regulated EU energy consumption scale for the product category a product belongs to. For example, energy consumption for televisions placed on the market after January 1, 2020 is scaled from D to A+++.'),
(2070, 1, 6, 'appliesToPaymentMethod', 'appliesToPaymentMethod', 'The payment method(s) to which the payment charge specification applies.'),
(2071, 1, 6, 'credentialCategory', 'credentialCategory', 'The category or type of credential being described, for example \"degree”, “certificate”, “badge”, or more specific term.'),
(2072, 1, 6, 'appliesToDeliveryMethod', 'appliesToDeliveryMethod', 'The delivery method(s) to which the delivery charge or payment charge specification applies.'),
(2073, 1, 6, 'targetName', 'targetName', 'The name of a node in an established educational framework.'),
(2074, 1, 6, 'repetitions', 'repetitions', 'Number of times one should repeat the activity.'),
(2075, 1, 6, 'originatesFrom', 'originatesFrom', 'The vasculature the lymphatic structure originates, or afferents, from.'),
(2076, 1, 6, 'positiveNotes', 'positiveNotes', 'Provides positive considerations regarding something, for example product highlights or (alongside [[negativeNotes]]) pro/con lists for reviews.\n\nIn the case of a [[Review]], the property describes the [[itemReviewed]] from the perspective of the review; in the case of a [[Product]], the product itself is being described.\n\nThe property values can be expressed either as unstructured text (repeated as necessary), or if ordered, as a list (in which case the most positive is at the beginning of the list).'),
(2077, 1, 6, 'passengerSequenceNumber', 'passengerSequenceNumber', 'The passenger\'s sequence number as assigned by the airline.'),
(2078, 1, 6, 'clipNumber', 'clipNumber', 'Position of the clip within an ordered group of clips.'),
(2079, 1, 6, 'gtin13', 'gtin13', 'The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceding zero. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.'),
(2080, 1, 6, 'hasAdultConsideration', 'hasAdultConsideration', 'Used to tag an item to be intended or suitable for consumption or use by adults only.'),
(2081, 1, 6, 'asin', 'asin', 'An Amazon Standard Identification Number (ASIN) is a 10-character alphanumeric unique identifier assigned by Amazon.com and its partners for product identification within the Amazon organization (summary from [Wikipedia](https://en.wikipedia.org/wiki/Amazon_Standard_Identification_Number)\'s article).\n\nNote also that this is a definition for how to include ASINs in Schema.org data, and not a definition of ASINs in general - see documentation from Amazon for authoritative details.\nASINs are most commonly encoded as text strings, but the [asin] property supports URL/URI as potential values too.'),
(2082, 1, 6, 'reservedTicket', 'reservedTicket', 'A ticket associated with the reservation.'),
(2083, 1, 6, 'commentCount', 'commentCount', 'The number of comments this CreativeWork (e.g. Article, Question or Answer) has received. This is most applicable to works published in Web sites with commenting system; additional comments may exist elsewhere.'),
(2084, 1, 6, 'programMembershipUsed', 'programMembershipUsed', 'Any membership in a frequent flyer, hotel loyalty program, etc. being applied to the reservation.'),
(2085, 1, 6, 'alcoholWarning', 'alcoholWarning', 'Any precaution, guidance, contraindication, etc. related to consumption of alcohol while taking this drug.'),
(2086, 1, 6, 'typicalTest', 'typicalTest', 'A medical test typically performed given this condition.'),
(2087, 1, 6, 'duringMedia', 'duringMedia', 'A media object representing the circumstances while performing this direction.'),
(2088, 1, 6, 'valueMinLength', 'valueMinLength', 'Specifies the minimum allowed range for number of characters in a literal value.'),
(2089, 1, 6, 'cvdNumC19HOPats', 'cvdNumC19HOPats', 'numc19hopats - HOSPITAL ONSET: Patients hospitalized in an NHSN inpatient care location with onset of suspected or confirmed COVID-19 14 or more days after hospitalization.'),
(2090, 1, 6, 'citation', 'citation', 'A citation or reference to another creative work, such as another publication, web page, scholarly article, etc.'),
(2091, 1, 6, 'musicGroupMember', 'musicGroupMember', 'A member of a music group&#x2014;for example, John, Paul, George, or Ringo.'),
(2092, 1, 6, 'member', 'member', 'A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.'),
(2093, 1, 6, 'cvdNumICUBedsOcc', 'cvdNumICUBedsOcc', 'numicubedsocc - ICU BED OCCUPANCY: Total number of staffed inpatient ICU beds that are occupied.'),
(2094, 1, 6, 'numberOfEmployees', 'numberOfEmployees', 'The number of employees in an organization, e.g. business.'),
(2095, 1, 6, 'subStageSuffix', 'subStageSuffix', 'The substage, e.g. \'a\' for Stage IIIa.'),
(2096, 1, 6, 'coursePrerequisites', 'coursePrerequisites', 'Requirements for taking the Course. May be completion of another [[Course]] or a textual description like \"permission of instructor\". Requirements may be a pre-requisite competency, referenced using [[AlignmentObject]].'),
(2097, 1, 6, 'sharedContent', 'sharedContent', 'A CreativeWork such as an image, video, or audio clip shared as part of this posting.'),
(2098, 1, 6, 'urlTemplate', 'urlTemplate', 'An url template (RFC6570) that will be used to construct the target of the execution of the action.'),
(2099, 1, 6, 'gtin8', 'gtin8', 'The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.'),
(2100, 1, 6, 'vehicleEngine', 'vehicleEngine', 'Information about the engine or engines of the vehicle.'),
(2101, 1, 6, 'priceRange', 'priceRange', 'The price range of the business, for example ```$$$```.'),
(2102, 1, 6, 'numberOfAvailableAccommodationUnits', 'numberOfAvailableAccommodationUnits', 'Indicates the number of available accommodation units in an [[ApartmentComplex]], or the number of accommodation units for a specific [[FloorPlan]] (within its specific [[ApartmentComplex]]). See also [[numberOfAccommodationUnits]].'),
(2103, 1, 6, 'priceType', 'priceType', 'Defines the type of a price specified for an offered product, for example a list price, a (temporary) sale price or a manufacturer suggested retail price. If multiple prices are specified for an offer the [[priceType]] property can be used to identify the type of each such specified price. The value of priceType can be specified as a value from enumeration PriceTypeEnumeration or as a free form text string for price types that are not already predefined in PriceTypeEnumeration.'),
(2104, 1, 6, 'verificationFactCheckingPolicy', 'verificationFactCheckingPolicy', 'Disclosure about verification and fact-checking processes for a [[NewsMediaOrganization]] or other fact-checking [[Organization]].'),
(2105, 1, 6, 'negativeNotes', 'negativeNotes', 'Provides negative considerations regarding something, most typically in pro/con lists for reviews (alongside [[positiveNotes]]). For symmetry \n\nIn the case of a [[Review]], the property describes the [[itemReviewed]] from the perspective of the review; in the case of a [[Product]], the product itself is being described. Since product descriptions \ntend to emphasise positive claims, it may be relatively unusual to find [[negativeNotes]] used in this way. Nevertheless for the sake of symmetry, [[negativeNotes]] can be used on [[Product]].\n\nThe property values can be expressed either as unstructured text (repeated as necessary), or if ordered, as a list (in which case the most negative is at the beginning of the list).'),
(2106, 1, 6, 'startOffset', 'startOffset', 'The start time of the clip expressed as the number of seconds from the beginning of the work.'),
(2107, 1, 6, 'codeRepository', 'codeRepository', 'Link to the repository where the un-compiled, human readable code and related code is located (SVN, GitHub, CodePlex).'),
(2108, 1, 6, 'differentialDiagnosis', 'differentialDiagnosis', 'One of a set of differential diagnoses for the condition. Specifically, a closely-related or competing diagnosis typically considered later in the cognitive process whereby this medical condition is distinguished from others most likely responsible for a similar collection of signs and symptoms to reach the most parsimonious diagnosis or diagnoses in a patient.'),
(2109, 1, 6, 'free', 'free', 'A flag to signal that the item, event, or place is accessible for free.'),
(2110, 1, 6, 'isAccessibleForFree', 'isAccessibleForFree', 'A flag to signal that the item, event, or place is accessible for free.'),
(2111, 1, 6, 'subEvents', 'subEvents', 'Events that are a part of this event. For example, a conference event includes many presentations, each subEvents of the conference.'),
(2112, 1, 6, 'subEvent', 'subEvent', 'An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference.'),
(2113, 1, 6, 'amountOfThisGood', 'amountOfThisGood', 'The quantity of the goods included in the offer.'),
(2114, 1, 6, 'geoEquals', 'geoEquals', 'Represents spatial relations in which two geometries (or the places they represent) are topologically equal, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM). \"Two geometries are topologically equal if their interiors intersect and no part of the interior or boundary of one geometry intersects the exterior of the other\" (a symmetric relationship).'),
(2115, 1, 6, 'geoMidpoint', 'geoMidpoint', 'Indicates the GeoCoordinates at the centre of a GeoShape, e.g. GeoCircle.'),
(2116, 1, 6, 'backstory', 'backstory', 'For an [[Article]], typically a [[NewsArticle]], the backstory property provides a textual summary giving a brief explanation of why and how an article was created. In a journalistic setting this could include information about reporting process, methods, interviews, data sources, etc.'),
(2117, 1, 6, 'acceptedAnswer', 'acceptedAnswer', 'The answer(s) that has been accepted as best, typically on a Question/Answer site. Sites vary in their selection mechanisms, e.g. drawing on community opinion and/or the view of the Question author.'),
(2118, 1, 6, 'suggestedAnswer', 'suggestedAnswer', 'An answer (possibly one of several, possibly incorrect) to a Question, e.g. on a Question/Answer site.'),
(2119, 1, 6, 'cvdNumTotBeds', 'cvdNumTotBeds', 'numtotbeds - ALL HOSPITAL BEDS: Total number of all inpatient and outpatient beds, including all staffed, ICU, licensed, and overflow (surge) beds used for inpatients or outpatients.'),
(2120, 1, 6, 'educationRequirements', 'educationRequirements', 'Educational background needed for the position or Occupation.'),
(2121, 1, 6, 'programmingModel', 'programmingModel', 'Indicates whether API is managed or unmanaged.'),
(2122, 1, 6, 'blogPosts', 'blogPosts', 'Indicates a post that is part of a [[Blog]]. Note that historically, what we term a \"Blog\" was once known as a \"weblog\", and that what we term a \"BlogPosting\" is now often colloquially referred to as a \"blog\".'),
(2123, 1, 6, 'blogPost', 'blogPost', 'A posting that is part of this blog.'),
(2124, 1, 6, 'validFor', 'validFor', 'The duration of validity of a permit or similar thing.'),
(2125, 1, 6, 'biomechnicalClass', 'biomechnicalClass', 'The biomechanical properties of the bone.'),
(2126, 1, 6, 'codeValue', 'codeValue', 'A short textual code that uniquely identifies the value.'),
(2127, 1, 6, 'termCode', 'termCode', 'A code that identifies this [[DefinedTerm]] within a [[DefinedTermSet]]'),
(2128, 1, 6, 'biologicalRole', 'biologicalRole', 'A role played by the BioChemEntity within a biological context.'),
(2129, 1, 6, 'occupationalCredentialAwarded', 'occupationalCredentialAwarded', 'A description of the qualification, award, certificate, diploma or other occupational credential awarded as a consequence of successful completion of this course or program.'),
(2130, 1, 6, 'greater', 'greater', 'This ordering relation for qualitative values indicates that the subject is greater than the object.'),
(2131, 1, 6, 'unnamedSourcesPolicy', 'unnamedSourcesPolicy', 'For an [[Organization]] (typically a [[NewsMediaOrganization]]), a statement about policy on use of unnamed sources and the decision process required.'),
(2132, 1, 6, 'naturalProgression', 'naturalProgression', 'The expected progression of the condition if it is not treated and allowed to progress naturally.'),
(2133, 1, 6, 'geoContains', 'geoContains', 'Represents a relationship between two geometries (or the places they represent), relating a containing geometry to a contained geometry. \"a contains b iff no points of b lie in the exterior of a, and at least one point of the interior of b lies in the interior of a\". As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(2134, 1, 6, 'announcementLocation', 'announcementLocation', 'Indicates a specific [[CivicStructure]] or [[LocalBusiness]] associated with the SpecialAnnouncement. For example, a specific testing facility or business with special opening hours. For a larger geographic region like a quarantine of an entire region, use [[spatialCoverage]].'),
(2135, 1, 6, 'runtime', 'runtime', 'Runtime platform or script interpreter dependencies (example: Java v1, Python 2.3, .NET Framework 3.0).'),
(2136, 1, 6, 'runtimePlatform', 'runtimePlatform', 'Runtime platform or script interpreter dependencies (example: Java v1, Python 2.3, .NET Framework 3.0).');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(2137, 1, 6, 'currenciesAccepted', 'currenciesAccepted', 'The currency accepted.\\n\\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\".'),
(2138, 1, 6, 'touristType', 'touristType', 'Attraction suitable for type(s) of tourist. E.g. children, visitors from a particular country, etc. '),
(2139, 1, 6, 'printPage', 'printPage', 'If this NewsArticle appears in print, this field indicates the name of the page on which the article is found. Please note that this field is intended for the exact page name (e.g. A5, B18).'),
(2140, 1, 6, 'typicalAgeRange', 'typicalAgeRange', 'The typical expected age range, e.g. \'7-9\', \'11-\'.'),
(2141, 1, 6, 'suitableForDiet', 'suitableForDiet', 'Indicates a dietary restriction or guideline for which this recipe or menu item is suitable, e.g. diabetic, halal etc.'),
(2142, 1, 6, 'shippingRate', 'shippingRate', 'The shipping rate is the cost of shipping to the specified destination. Typically, the maxValue and currency values (of the [[MonetaryAmount]]) are most appropriate.'),
(2143, 1, 6, 'assemblyVersion', 'assemblyVersion', 'Associated product/technology version. E.g., .NET Framework 4.5.'),
(2144, 1, 6, 'publicAccess', 'publicAccess', 'A flag to signal that the [[Place]] is open to public visitors.  If this property is omitted there is no assumed default boolean value'),
(2145, 1, 6, 'occupationLocation', 'occupationLocation', ' The region/country for which this occupational description is appropriate. Note that educational requirements and qualifications can vary between jurisdictions.'),
(2146, 1, 6, 'benefitsSummaryUrl', 'benefitsSummaryUrl', 'The URL that goes directly to the summary of benefits and coverage for the specific standard plan or plan variation.'),
(2147, 1, 6, 'targetProduct', 'targetProduct', 'Target Operating System / Product to which the code applies.  If applies to several versions, just the product name can be used.'),
(2148, 1, 6, 'workPresented', 'workPresented', 'The movie presented during this event.'),
(2149, 1, 6, 'carrierRequirements', 'carrierRequirements', 'Specifies specific carrier(s) requirements for the application (e.g. an application may only work on a specific carrier network).'),
(2150, 1, 6, 'dateReceived', 'dateReceived', 'The date/time the message was received if a single recipient exists.'),
(2151, 1, 6, 'handlingTime', 'handlingTime', 'The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup. Typical properties: minValue, maxValue, unitCode (d for DAY).  This is by common convention assumed to mean business days (if a unitCode is used, coded as \"d\"), i.e. only counting days when the business normally operates.'),
(2152, 1, 6, 'educationalAlignment', 'educationalAlignment', 'An alignment to an established educational framework.\n\nThis property should not be used where the nature of the alignment can be described using a simple property, for example to express that a resource [[teaches]] or [[assesses]] a competency.'),
(2153, 1, 6, 'deliveryTime', 'deliveryTime', 'The total delay between the receipt of the order and the goods reaching the final customer.'),
(2154, 1, 6, 'iupacName', 'iupacName', 'Systematic method of naming chemical compounds as recommended by the International Union of Pure and Applied Chemistry (IUPAC).'),
(2155, 1, 6, 'trailerWeight', 'trailerWeight', 'The permitted weight of a trailer attached to the vehicle.\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n* Note 1: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 2: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]].\\n* Note 3: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2156, 1, 6, 'shippingLabel', 'shippingLabel', 'Label to match an [[OfferShippingDetails]] with a [[ShippingRateSettings]] (within the context of a [[shippingSettingsLink]] cross-reference).'),
(2157, 1, 6, 'partySize', 'partySize', 'Number of people the reservation should accommodate.'),
(2158, 1, 6, 'publication', 'publication', 'A publication event associated with the item.'),
(2159, 1, 6, 'payload', 'payload', 'The permitted weight of passengers and cargo, EXCLUDING the weight of the empty vehicle.\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n\\n* Note 1: Many databases specify the permitted TOTAL weight instead, which is the sum of [[weight]] and [[payload]]\\n* Note 2: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 3: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]].\\n* Note 4: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2160, 1, 6, 'termDuration', 'termDuration', 'The amount of time in a term as defined by the institution. A term is a length of time where students take one or more classes. Semesters and quarters are common units for term.'),
(2161, 1, 6, 'itemReviewed', 'itemReviewed', 'The item that is being reviewed/rated.'),
(2162, 1, 6, 'recipe', 'recipe', 'A sub property of instrument. The recipe/instructions used to perform the action.'),
(2163, 1, 6, 'telephone', 'telephone', 'The telephone number.'),
(2164, 1, 6, 'exchangeRateSpread', 'exchangeRateSpread', 'The difference between the price at which a broker or other intermediary buys and sells foreign currency.'),
(2165, 1, 6, 'itemDefectReturnShippingFeesAmount', 'itemDefectReturnShippingFeesAmount', 'Amount of shipping costs for defect product returns. Applicable when property [[itemDefectReturnFees]] equals [[ReturnShippingFees]].'),
(2166, 1, 6, 'addressRegion', 'addressRegion', 'The region in which the locality is, and which is in the country. For example, California or another appropriate first-level [Administrative division](https://en.wikipedia.org/wiki/List_of_administrative_divisions_by_country).'),
(2167, 1, 6, 'spatial', 'spatial', 'The \"spatial\" property can be used in cases when more specific properties\n(e.g. [[locationCreated]], [[spatialCoverage]], [[contentLocation]]) are not known to be appropriate.'),
(2168, 1, 6, 'estimatedCost', 'estimatedCost', 'The estimated cost of the supply or supplies consumed when performing instructions.'),
(2169, 1, 6, 'financialAidEligible', 'financialAidEligible', 'A financial aid type or program which students may use to pay for tuition or fees associated with the program.'),
(2170, 1, 6, 'sensoryUnit', 'sensoryUnit', 'The neurological pathway extension that inputs and sends information to the brain or spinal cord.'),
(2171, 1, 6, 'awayTeam', 'awayTeam', 'The away team in a sports event.'),
(2172, 1, 6, 'antagonist', 'antagonist', 'The muscle whose action counteracts the specified muscle.'),
(2173, 1, 6, 'orderDelivery', 'orderDelivery', 'The delivery of the parcel related to this order or order item.'),
(2174, 1, 6, 'supplyTo', 'supplyTo', 'The area to which the artery supplies blood.'),
(2175, 1, 6, 'bookingTime', 'bookingTime', 'The date and time the reservation was booked.'),
(2176, 1, 6, 'circle', 'circle', 'A circle is the circular region of a specified radius centered at a specified latitude and longitude. A circle is expressed as a pair followed by a radius in meters.'),
(2177, 1, 6, 'beforeMedia', 'beforeMedia', 'A media object representing the circumstances before performing this direction.'),
(2178, 1, 6, 'episodeNumber', 'episodeNumber', 'Position of the episode within an ordered group of episodes.'),
(2179, 1, 6, 'gracePeriod', 'gracePeriod', 'The period of time after any due date that the borrower has to fulfil its obligations before a default (failure to pay) is deemed to have occurred.'),
(2180, 1, 6, 'addressLocality', 'addressLocality', 'The locality in which the street address is, and which is in the region. For example, Mountain View.'),
(2181, 1, 6, 'learningResourceType', 'learningResourceType', 'The predominant type or kind characterizing the learning resource. For example, \'presentation\', \'handout\'.'),
(2182, 1, 6, 'fuelType', 'fuelType', 'The type of fuel suitable for the engine or engines of the vehicle. If the vehicle has only one engine, this property can be attached directly to the vehicle.'),
(2183, 1, 6, 'accessibilityAPI', 'accessibilityAPI', 'Indicates that the resource is compatible with the referenced accessibility API. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessibilityAPI-vocabulary).'),
(2184, 1, 6, 'masthead', 'masthead', 'For a [[NewsMediaOrganization]], a link to the masthead page or a page listing top editorial management.'),
(2185, 1, 6, 'ticketToken', 'ticketToken', 'Reference to an asset (e.g., Barcode, QR code image or PDF) usable for entrance.'),
(2186, 1, 6, 'eligibleRegion', 'eligibleRegion', 'The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.\\n\\nSee also [[ineligibleRegion]].\n    '),
(2187, 1, 6, 'areaServed', 'areaServed', 'The geographic area where a service or offered item is provided.'),
(2188, 1, 6, 'disambiguatingDescription', 'disambiguatingDescription', 'A sub property of description. A short description of the item used to disambiguate from other, similar items. Information from other properties (in particular, name) may be necessary for the description to be useful for disambiguation.'),
(2189, 1, 6, 'description', 'description', 'A description of the item.'),
(2190, 1, 6, 'suggestedMaxAge', 'suggestedMaxAge', 'Maximum recommended age in years for the audience or user.'),
(2191, 1, 6, 'quest', 'quest', 'The task that a player-controlled character, or group of characters may complete in order to gain a reward.'),
(2192, 1, 6, 'containedIn', 'containedIn', 'The basic containment relation between a place and one that contains it.'),
(2193, 1, 6, 'containedInPlace', 'containedInPlace', 'The basic containment relation between a place and one that contains it.'),
(2194, 1, 6, 'contraindication', 'contraindication', 'A contraindication for this therapy.'),
(2195, 1, 6, 'recipeYield', 'recipeYield', 'The quantity produced by the recipe (for example, number of people served, number of servings, etc).'),
(2196, 1, 6, 'yield', 'yield', 'The quantity that results by performing instructions. For example, a paper airplane, 10 personalized candles.'),
(2197, 1, 6, 'cvdCollectionDate', 'cvdCollectionDate', 'collectiondate - Date for which patient counts are reported.'),
(2198, 1, 6, 'requiredMinAge', 'requiredMinAge', 'Audiences defined by a person\'s minimum age.'),
(2199, 1, 6, 'referencesOrder', 'referencesOrder', 'The Order(s) related to this Invoice. One or more Orders may be combined into a single Invoice.'),
(2200, 1, 6, 'identifyingTest', 'identifyingTest', 'A diagnostic test that can identify this sign.'),
(2201, 1, 6, 'inker', 'inker', 'The individual who traces over the pencil drawings in ink after pencils are complete.'),
(2202, 1, 6, 'operatingSystem', 'operatingSystem', 'Operating systems supported (Windows 7, OS X 10.6, Android 1.6).'),
(2203, 1, 6, 'byMonth', 'byMonth', 'Defines the month(s) of the year on which a recurring [[Event]] takes place. Specified as an [[Integer]] between 1-12. January is 1.'),
(2204, 1, 6, 'steeringPosition', 'steeringPosition', 'The position of the steering wheel or similar device (mostly for cars).'),
(2205, 1, 6, 'branch', 'branch', 'The branches that delineate from the nerve bundle. Not to be confused with [[branchOf]].'),
(2206, 1, 6, 'arterialBranch', 'arterialBranch', 'The branches that comprise the arterial structure.'),
(2207, 1, 6, 'taxID', 'taxID', 'The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.'),
(2208, 1, 6, 'stage', 'stage', 'The stage of the condition, if applicable.'),
(2209, 1, 6, 'engineType', 'engineType', 'The type of engine or engines powering the vehicle.'),
(2210, 1, 6, 'acceptedPaymentMethod', 'acceptedPaymentMethod', 'The payment method(s) accepted by seller for this offer.'),
(2211, 1, 6, 'representativeOfPage', 'representativeOfPage', 'Indicates whether this image is representative of the content of the page.'),
(2212, 1, 6, 'partOfOrder', 'partOfOrder', 'The overall order the items in this delivery were included in.'),
(2213, 1, 6, 'purchaseDate', 'purchaseDate', 'The date the item, e.g. vehicle, was purchased by the current owner.'),
(2214, 1, 6, 'loser', 'loser', 'A sub property of participant. The loser of the action.'),
(2215, 1, 6, 'issn', 'issn', 'The International Standard Serial Number (ISSN) that identifies this serial publication. You can repeat this property to identify different formats of, or the linking ISSN (ISSN-L) for, this serial publication.'),
(2216, 1, 6, 'landlord', 'landlord', 'A sub property of participant. The owner of the real estate property.'),
(2217, 1, 6, 'language', 'language', 'A sub property of instrument. The language used on this action.'),
(2218, 1, 6, 'inLanguage', 'inLanguage', 'The language of the content or performance or used in an action. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[availableLanguage]].'),
(2219, 1, 6, 'legislationDateVersion', 'legislationDateVersion', 'The point-in-time at which the provided description of the legislation is valid (e.g.: when looking at the law on the 2016-04-07 (= dateVersion), I get the consolidation of 2015-04-12 of the \"National Insurance Contributions Act 2015\")'),
(2220, 1, 6, 'originAddress', 'originAddress', 'Shipper\'s address.'),
(2221, 1, 6, 'healthPlanDrugTier', 'healthPlanDrugTier', 'The tier(s) of drugs offered by this formulary or insurance plan.'),
(2222, 1, 6, 'eduQuestionType', 'eduQuestionType', 'For questions that are part of learning resources (e.g. Quiz), eduQuestionType indicates the format of question being given. Example: \"Multiple choice\", \"Open ended\", \"Flashcard\".'),
(2223, 1, 6, 'keywords', 'keywords', 'Keywords or tags used to describe some item. Multiple textual entries in a keywords list are typically delimited by commas, or by repeating the property.'),
(2224, 1, 6, 'recognizingAuthority', 'recognizingAuthority', 'If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.'),
(2225, 1, 6, 'transitTime', 'transitTime', 'The typical delay the order has been sent for delivery and the goods reach the final customer. Typical properties: minValue, maxValue, unitCode (d for DAY).'),
(2226, 1, 6, 'availableTest', 'availableTest', 'A diagnostic test or procedure offered by this lab.'),
(2227, 1, 6, 'isFamilyFriendly', 'isFamilyFriendly', 'Indicates whether this content is family friendly.'),
(2228, 1, 6, 'knowsLanguage', 'knowsLanguage', 'Of a [[Person]], and less typically of an [[Organization]], to indicate a known language. We do not distinguish skill levels or reading/writing/speaking/signing here. Use language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47).'),
(2229, 1, 6, 'constrainingProperty', 'constrainingProperty', 'Indicates a property used as a constraint to define a [[StatisticalPopulation]] with respect to the set of entities\n  corresponding to an indicated type (via [[populationType]]).'),
(2230, 1, 6, 'geoCovers', 'geoCovers', 'Represents a relationship between two geometries (or the places they represent), relating a covering geometry to a covered geometry. \"Every point of b is a point of (the interior or boundary of) a\". As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(2231, 1, 6, 'penciler', 'penciler', 'The individual who draws the primary narrative artwork.'),
(2232, 1, 6, 'availableAtOrFrom', 'availableAtOrFrom', 'The place(s) from which the offer can be obtained (e.g. store locations).'),
(2233, 1, 6, 'requiredGender', 'requiredGender', 'Audiences defined by a person\'s gender.'),
(2234, 1, 6, 'educationalCredentialAwarded', 'educationalCredentialAwarded', 'A description of the qualification, award, certificate, diploma or other educational credential awarded as a consequence of successful completion of this course or program.'),
(2235, 1, 6, 'medicalSpecialty', 'medicalSpecialty', 'A medical specialty of the provider.'),
(2236, 1, 6, 'startDate', 'startDate', 'The start date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).'),
(2237, 1, 6, 'pregnancyCategory', 'pregnancyCategory', 'Pregnancy category of this drug.'),
(2238, 1, 6, 'line', 'line', 'A line is a point-to-point path consisting of two or more points. A line is expressed as a series of two or more point objects separated by space.'),
(2239, 1, 6, 'numTracks', 'numTracks', 'The number of tracks in this album or playlist.'),
(2240, 1, 6, 'numberOfForwardGears', 'numberOfForwardGears', 'The total number of forward gears available for the transmission system of the vehicle.\\n\\nTypical unit code(s): C62'),
(2241, 1, 6, 'recourseLoan', 'recourseLoan', 'The only way you get the money back in the event of default is the security. Recourse is where you still have the opportunity to go back to the borrower for the rest of the money.'),
(2242, 1, 6, 'manufacturer', 'manufacturer', 'The manufacturer of the product.'),
(2243, 1, 6, 'minValue', 'minValue', 'The lower value of some characteristic or property.'),
(2244, 1, 6, 'dropoffLocation', 'dropoffLocation', 'Where a rental car can be dropped off.'),
(2245, 1, 6, 'isAcceptingNewPatients', 'isAcceptingNewPatients', 'Whether the provider is accepting new patients.'),
(2246, 1, 6, 'permissionType', 'permissionType', 'The type of permission granted the person, organization, or audience.'),
(2247, 1, 6, 'realEstateAgent', 'realEstateAgent', 'A sub property of participant. The real estate agent involved in the action.'),
(2248, 1, 6, 'bookFormat', 'bookFormat', 'The format of the book.'),
(2249, 1, 6, 'numAdults', 'numAdults', 'The number of adults staying in the unit.'),
(2250, 1, 6, 'partOfSeason', 'partOfSeason', 'The season to which this episode belongs.'),
(2251, 1, 6, 'isPartOf', 'isPartOf', 'Indicates an item or CreativeWork that this item, or CreativeWork (in some sense), is part of.'),
(2252, 1, 6, 'produces', 'produces', 'The tangible thing generated by the service, e.g. a passport, permit, etc.'),
(2253, 1, 6, 'serviceOutput', 'serviceOutput', 'The tangible thing generated by the service, e.g. a passport, permit, etc.'),
(2254, 1, 6, 'functionalClass', 'functionalClass', 'The degree of mobility the joint allows.'),
(2255, 1, 6, 'populationType', 'populationType', 'Indicates the populationType common to all members of a [[StatisticalPopulation]].'),
(2256, 1, 6, 'inCodeSet', 'inCodeSet', 'A [[CategoryCodeSet]] that contains this category code.'),
(2257, 1, 6, 'inDefinedTermSet', 'inDefinedTermSet', 'A [[DefinedTermSet]] that contains this term.'),
(2258, 1, 6, 'additionalVariable', 'additionalVariable', 'Any additional component of the exercise prescription that may need to be articulated to the patient. This may include the order of exercises, the number of repetitions of movement, quantitative distance, progressions over time, etc.'),
(2259, 1, 6, 'servicePhone', 'servicePhone', 'The phone number to use to access the service.'),
(2260, 1, 6, 'readonlyValue', 'readonlyValue', 'Whether or not a property is mutable.  Default is false. Specifying this for a property that also has a value makes it act similar to a \"hidden\" input in an HTML form.'),
(2261, 1, 6, 'addressCountry', 'addressCountry', 'The country. For example, USA. You can also provide the two-letter [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1).'),
(2262, 1, 6, 'calories', 'calories', 'The number of calories.'),
(2263, 1, 6, 'lesser', 'lesser', 'This ordering relation for qualitative values indicates that the subject is lesser than the object.'),
(2264, 1, 6, 'remainingAttendeeCapacity', 'remainingAttendeeCapacity', 'The number of attendee places for an event that remain unallocated.'),
(2265, 1, 6, 'recipeCuisine', 'recipeCuisine', 'The cuisine of the recipe (for example, French or Ethiopian).'),
(2266, 1, 6, 'accelerationTime', 'accelerationTime', 'The time needed to accelerate the vehicle from a given start velocity to a given target velocity.\\n\\nTypical unit code(s): SEC for seconds\\n\\n* Note: There are unfortunately no standard unit codes for seconds/0..100 km/h or seconds/0..60 mph. Simply use \"SEC\" for seconds and indicate the velocities in the [[name]] of the [[QuantitativeValue]], or use [[valueReference]] with a [[QuantitativeValue]] of 0..60 mph or 0..100 km/h to specify the reference speeds.'),
(2267, 1, 6, 'lesserOrEqual', 'lesserOrEqual', 'This ordering relation for qualitative values indicates that the subject is lesser than or equal to the object.'),
(2268, 1, 6, 'course', 'course', 'A sub property of location. The course where this action was taken.'),
(2269, 1, 6, 'exerciseCourse', 'exerciseCourse', 'A sub property of location. The course where this action was taken.'),
(2270, 1, 6, 'study', 'study', 'A medical study or trial related to this entity.'),
(2271, 1, 6, 'numConstraints', 'numConstraints', 'Indicates the number of constraints (not counting [[populationType]]) defined for a particular [[StatisticalPopulation]]. This helps applications understand if they have access to a sufficiently complete description of a [[StatisticalPopulation]].'),
(2272, 1, 6, 'icaoCode', 'icaoCode', 'ICAO identifier for an airport.'),
(2273, 1, 6, 'videoFormat', 'videoFormat', 'The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).'),
(2274, 1, 6, 'inStoreReturnsOffered', 'inStoreReturnsOffered', 'Are in-store returns offered? (For more advanced return methods use the [[returnMethod]] property.)'),
(2275, 1, 6, 'diagnosis', 'diagnosis', 'One or more alternative conditions considered in the differential diagnosis process as output of a diagnosis process.'),
(2276, 1, 6, 'drainsTo', 'drainsTo', 'The vasculature that the vein drains into.'),
(2277, 1, 6, 'accountablePerson', 'accountablePerson', 'Specifies the Person that is legally accountable for the CreativeWork.'),
(2278, 1, 6, 'associatedPathophysiology', 'associatedPathophysiology', 'If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.'),
(2279, 1, 6, 'doesNotShip', 'doesNotShip', 'Indicates when shipping to a particular [[shippingDestination]] is not available.'),
(2280, 1, 6, 'exerciseRelatedDiet', 'exerciseRelatedDiet', 'A sub property of instrument. The diet used in this action.'),
(2281, 1, 6, 'recipeCategory', 'recipeCategory', 'The category of the recipe—for example, appetizer, entree, etc.'),
(2282, 1, 6, 'cvdNumBeds', 'cvdNumBeds', 'numbeds - HOSPITAL INPATIENT BEDS: Inpatient beds, including all staffed, licensed, and overflow (surge) beds used for inpatients.'),
(2283, 1, 6, 'isGift', 'isGift', 'Indicates whether the offer was accepted as a gift for someone other than the buyer.'),
(2284, 1, 6, 'emissionsCO2', 'emissionsCO2', 'The CO2 emissions in g/km. When used in combination with a QuantitativeValue, put \"g/km\" into the unitText property of that value, since there is no UN/CEFACT Common Code for \"g/km\".'),
(2285, 1, 6, 'musicCompositionForm', 'musicCompositionForm', 'The type of composition (e.g. overture, sonata, symphony, etc.).'),
(2286, 1, 6, 'members', 'members', 'A member of this organization.'),
(2287, 1, 6, 'pagination', 'pagination', 'Any description of pages that is not separated into pageStart and pageEnd; for example, \"1-6, 9, 55\" or \"10-12, 46-49\".'),
(2288, 1, 6, 'contentUrl', 'contentUrl', 'Actual bytes of the media object, for example the image file or video file.'),
(2289, 1, 6, 'additionalNumberOfGuests', 'additionalNumberOfGuests', 'If responding yes, the number of guests who will attend in addition to the invitee.'),
(2290, 1, 6, 'nonprofitStatus', 'nonprofitStatus', 'nonprofitStatus indicates the legal status of a non-profit organization in its primary place of business.'),
(2291, 1, 6, 'strengthValue', 'strengthValue', 'The value of an active ingredient\'s strength, e.g. 325.'),
(2292, 1, 6, 'affiliation', 'affiliation', 'An organization that this person is affiliated with. For example, a school/university, a club, or a team.'),
(2293, 1, 6, 'memberOf', 'memberOf', 'An Organization (or ProgramMembership) to which this Person or Organization belongs.'),
(2294, 1, 6, 'audienceType', 'audienceType', 'The target group associated with a given audience (e.g. veterans, car owners, musicians, etc.).'),
(2295, 1, 6, 'significantLinks', 'significantLinks', 'The most significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most.'),
(2296, 1, 6, 'significantLink', 'significantLink', 'One of the more significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most.'),
(2297, 1, 6, 'knows', 'knows', 'The most generic bi-directional social/work relation.'),
(2298, 1, 6, 'experienceRequirements', 'experienceRequirements', 'Description of skills and experience needed for the position or Occupation.'),
(2299, 1, 6, 'worksFor', 'worksFor', 'Organizations that the person works for.'),
(2300, 1, 6, 'coach', 'coach', 'A person that acts in a coaching role for a sports team.'),
(2301, 1, 6, 'givenName', 'givenName', 'Given name. In the U.S., the first name of a Person.'),
(2302, 1, 6, 'cvdFacilityCounty', 'cvdFacilityCounty', 'Name of the County of the NHSN facility that this data record applies to. Use [[cvdFacilityId]] to identify the facility. To provide other details, [[healthcareReportingData]] can be used on a [[Hospital]] entry.'),
(2303, 1, 6, 'returnPolicySeasonalOverride', 'returnPolicySeasonalOverride', 'Seasonal override of a return policy.'),
(2304, 1, 6, 'typeOfGood', 'typeOfGood', 'The product that this structured value is referring to.'),
(2305, 1, 6, 'isicV4', 'isicV4', 'The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.'),
(2306, 1, 6, 'possibleTreatment', 'possibleTreatment', 'A possible treatment to address this condition, sign or symptom.'),
(2307, 1, 6, 'measuredProperty', 'measuredProperty', 'The measuredProperty of an [[Observation]], either a schema.org property, a property from other RDF-compatible systems, e.g. W3C RDF Data Cube, or schema.org extensions such as [GS1\'s](https://www.gs1.org/voc/?show=properties).'),
(2308, 1, 6, 'partOfTVSeries', 'partOfTVSeries', 'The TV series to which this episode or season belongs.'),
(2309, 1, 6, 'partOfSeries', 'partOfSeries', 'The series to which this episode or season belongs.'),
(2310, 1, 6, 'diversityPolicy', 'diversityPolicy', 'Statement on diversity policy by an [[Organization]] e.g. a [[NewsMediaOrganization]]. For a [[NewsMediaOrganization]], a statement describing the newsroom’s diversity policy on both staffing and sources, typically providing staffing data.'),
(2311, 1, 6, 'numberOfPreviousOwners', 'numberOfPreviousOwners', 'The number of owners of the vehicle, including the current one.\\n\\nTypical unit code(s): C62'),
(2312, 1, 6, 'mapType', 'mapType', 'Indicates the kind of Map, from the MapCategoryType Enumeration.'),
(2313, 1, 6, 'departureTerminal', 'departureTerminal', 'Identifier of the flight\'s departure terminal.'),
(2314, 1, 6, 'pickupTime', 'pickupTime', 'When a taxi will pick up a passenger or a rental car can be picked up.'),
(2315, 1, 6, 'mealService', 'mealService', 'Description of the meals that will be provided or available for purchase.'),
(2316, 1, 6, 'restPeriods', 'restPeriods', 'How often one should break from the activity.'),
(2317, 1, 6, 'messageAttachment', 'messageAttachment', 'A CreativeWork attached to the message.'),
(2318, 1, 6, 'rsvpResponse', 'rsvpResponse', 'The response (yes, no, maybe) to the RSVP.'),
(2319, 1, 6, 'departureBoatTerminal', 'departureBoatTerminal', 'The terminal or port from which the boat departs.'),
(2320, 1, 6, 'numberOfLoanPayments', 'numberOfLoanPayments', 'The number of payments contractually required at origination to repay the loan. For monthly paying loans this is the number of months from the contractual first payment date to the maturity date.'),
(2321, 1, 6, 'pregnancyWarning', 'pregnancyWarning', 'Any precaution, guidance, contraindication, etc. related to this drug\'s use during pregnancy.'),
(2322, 1, 6, 'guideline', 'guideline', 'A medical guideline related to this entity.'),
(2323, 1, 6, 'eligibleCustomerType', 'eligibleCustomerType', 'The type(s) of customers for which the given offer is valid.'),
(2324, 1, 6, 'lyrics', 'lyrics', 'The words in the song.'),
(2325, 1, 6, 'returnPolicyCategory', 'returnPolicyCategory', 'Specifies an applicable return policy (from an enumeration).'),
(2326, 1, 6, 'usesDevice', 'usesDevice', 'Device used to perform the test.'),
(2327, 1, 6, 'increasesRiskOf', 'increasesRiskOf', 'The condition, complication, etc. influenced by this factor.'),
(2328, 1, 6, 'healthCondition', 'healthCondition', 'Specifying the health condition(s) of a patient, medical study, or other target audience.'),
(2329, 1, 6, 'median', 'median', 'The median value.'),
(2330, 1, 6, 'scheduleTimezone', 'scheduleTimezone', 'Indicates the timezone for which the time(s) indicated in the [[Schedule]] are given. The value provided should be among those listed in the IANA Time Zone Database.'),
(2331, 1, 6, 'gamePlatform', 'gamePlatform', 'The electronic systems used to play <a href=\"http://en.wikipedia.org/wiki/Category:Video_game_platforms\">video games</a>.'),
(2332, 1, 6, 'healthPlanMarketingUrl', 'healthPlanMarketingUrl', 'The URL that goes directly to the plan brochure for the specific standard plan or plan variation.'),
(2333, 1, 6, 'hasDigitalDocumentPermission', 'hasDigitalDocumentPermission', 'A permission related to the access to this document (e.g. permission to read or write an electronic document). For a public document, specify a grantee with an Audience with audienceType equal to \"public\".'),
(2334, 1, 6, 'sodiumContent', 'sodiumContent', 'The number of milligrams of sodium.'),
(2335, 1, 6, 'letterer', 'letterer', 'The individual who adds lettering, including speech balloons and sound effects, to artwork.'),
(2336, 1, 6, 'knowsAbout', 'knowsAbout', 'Of a [[Person]], and less typically of an [[Organization]], to indicate a topic that is known about - suggesting possible expertise but not implying it. We do not distinguish skill levels here, or relate this to educational content, events, objectives or [[JobPosting]] descriptions.'),
(2337, 1, 6, 'opponent', 'opponent', 'A sub property of participant. The opponent on this action.'),
(2338, 1, 6, 'guidelineSubject', 'guidelineSubject', 'The medical conditions, treatments, etc. that are the subject of the guideline.'),
(2339, 1, 6, 'equal', 'equal', 'This ordering relation for qualitative values indicates that the subject is equal to the object.'),
(2340, 1, 6, 'geoCrosses', 'geoCrosses', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that crosses it: \"a crosses b: they have some but not all interior points in common, and the dimension of the intersection is less than that of at least one of them\". As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(2341, 1, 6, 'postalCodeEnd', 'postalCodeEnd', 'Last postal code in the range (included). Needs to be after [[postalCodeBegin]].'),
(2342, 1, 6, 'department', 'department', 'A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.'),
(2343, 1, 6, 'lodgingUnitType', 'lodgingUnitType', 'Textual description of the unit type (including suite vs. room, size of bed, etc.).'),
(2344, 1, 6, 'applicationSubCategory', 'applicationSubCategory', 'Subcategory of the application, e.g. \'Arcade Game\'.'),
(2345, 1, 6, 'applicationDeadline', 'applicationDeadline', 'The date at which the program stops collecting applications for the next enrollment cycle.'),
(2346, 1, 6, 'activeIngredient', 'activeIngredient', 'An active ingredient, typically chemical compounds and/or biologic substances.'),
(2347, 1, 6, 'feesAndCommissionsSpecification', 'feesAndCommissionsSpecification', 'Description of fees, commissions, and other terms applied either to a class of financial product, or by a financial service organization.'),
(2348, 1, 6, 'molecularWeight', 'molecularWeight', 'This is the molecular weight of the entity being described, not of the parent. Units should be included in the form \'&lt;Number&gt; &lt;unit&gt;\', for example \'12 amu\' or as \'&lt;QuantitativeValue&gt;.'),
(2349, 1, 6, 'carbohydrateContent', 'carbohydrateContent', 'The number of grams of carbohydrates.'),
(2350, 1, 6, 'performers', 'performers', 'The main performer or performers of the event&#x2014;for example, a presenter, musician, or actor.'),
(2351, 1, 6, 'performer', 'performer', 'A performer at the event&#x2014;for example, a presenter, musician, musical group or actor.'),
(2352, 1, 6, 'healthcareReportingData', 'healthcareReportingData', 'Indicates data describing a hospital, e.g. a CDC [[CDCPMDRecord]] or as some kind of [[Dataset]].'),
(2353, 1, 6, 'openingHoursSpecification', 'openingHoursSpecification', 'The opening hours of a certain place.'),
(2354, 1, 6, 'author', 'author', 'The author of this content or rating. Please note that author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.'),
(2355, 1, 6, 'unitText', 'unitText', 'A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for\n<a href=\'unitCode\'>unitCode</a>.'),
(2356, 1, 6, 'speed', 'speed', 'The speed range of the vehicle. If the vehicle is powered by an engine, the upper limit of the speed range (indicated by [[maxValue]]) should be the maximum speed achievable under regular conditions.\\n\\nTypical unit code(s): KMH for km/h, HM for mile per hour (0.447 04 m/s), KNT for knot\\n\\n*Note 1: Use [[minValue]] and [[maxValue]] to indicate the range. Typically, the minimal value is zero.\\n* Note 2: There are many different ways of measuring the speed range. You can link to information about how the given value has been determined using the [[valueReference]] property.'),
(2357, 1, 6, 'servicePostalAddress', 'servicePostalAddress', 'The address for accessing the service by mail.'),
(2358, 1, 6, 'pathophysiology', 'pathophysiology', 'Changes in the normal mechanical, physical, and biochemical functions that are associated with this activity or condition.'),
(2359, 1, 6, 'healthPlanDrugOption', 'healthPlanDrugOption', 'TODO.'),
(2360, 1, 6, 'pickupLocation', 'pickupLocation', 'Where a taxi will pick up a passenger or a rental car can be picked up.'),
(2361, 1, 6, 'weightTotal', 'weightTotal', 'The permitted total weight of the loaded vehicle, including passengers and cargo and the weight of the empty vehicle.\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n\\n* Note 1: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 2: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]].\\n* Note 3: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2362, 1, 6, 'athlete', 'athlete', 'A person that acts as performing member of a sports team; a player as opposed to a coach.'),
(2363, 1, 6, 'hasDriveThroughService', 'hasDriveThroughService', 'Indicates whether some facility (e.g. [[FoodEstablishment]], [[CovidTestingFacility]]) offers a service that can be used by driving through in a car. In the case of [[CovidTestingFacility]] such facilities could potentially help with social distancing from other potentially-infected users.'),
(2364, 1, 6, 'storageRequirements', 'storageRequirements', 'Storage requirements (free space required).'),
(2365, 1, 6, 'dateline', 'dateline', 'A [dateline](https://en.wikipedia.org/wiki/Dateline) is a brief piece of text included in news articles that describes where and when the story was written or filed though the date is often omitted. Sometimes only a placename is provided.\n\nStructured representations of dateline-related information can also be expressed more explicitly using [[locationCreated]] (which represents where a work was created, e.g. where a news report was written).  For location depicted or described in the content, use [[contentLocation]].\n\nDateline summaries are oriented more towards human readers than towards automated processing, and can vary substantially. Some examples: \"BEIRUT, Lebanon, June 2.\", \"Paris, France\", \"December 19, 2017 11:43AM Reporting from Washington\", \"Beijing/Moscow\", \"QUEZON CITY, Philippines\".\n      '),
(2366, 1, 6, 'encodings', 'encodings', 'A media object that encodes this CreativeWork.'),
(2367, 1, 6, 'encoding', 'encoding', 'A media object that encodes this CreativeWork. This property is a synonym for associatedMedia.'),
(2368, 1, 6, 'returnLabelSource', 'returnLabelSource', 'The method (from an enumeration) by which the customer obtains a return shipping label for a product returned for any reason.'),
(2369, 1, 6, 'geoOverlaps', 'geoOverlaps', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that geospatially overlaps it, i.e. they have some but not all points in common. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(2370, 1, 6, 'billingStart', 'billingStart', 'Specifies after how much time this price (or price component) becomes valid and billing starts. Can be used, for example, to model a price increase after the first year of a subscription. The unit of measurement is specified by the unitCode property.'),
(2371, 1, 6, 'applicationCategory', 'applicationCategory', 'Type of software application, e.g. \'Game, Multimedia\'.'),
(2372, 1, 6, 'legislationDate', 'legislationDate', 'The date of adoption or signature of the legislation. This is the date at which the text is officially aknowledged to be a legislation, even though it might not even be published or in force.'),
(2373, 1, 6, 'dateCreated', 'dateCreated', 'The date on which the CreativeWork was created or the item was added to a DataFeed.'),
(2374, 1, 6, 'itemListOrder', 'itemListOrder', 'Type of ordering (e.g. Ascending, Descending, Unordered).'),
(2375, 1, 6, 'typeOfBed', 'typeOfBed', 'The type of bed to which the BedDetail refers, i.e. the type of bed available in the quantity indicated by quantity.'),
(2376, 1, 6, 'proficiencyLevel', 'proficiencyLevel', 'Proficiency needed for this content; expected values: \'Beginner\', \'Expert\'.'),
(2377, 1, 6, 'installUrl', 'installUrl', 'URL at which the app may be installed, if different from the URL of the item.'),
(2378, 1, 6, 'character', 'character', 'Fictional person connected with a creative work.'),
(2379, 1, 6, 'gameLocation', 'gameLocation', 'Real or fictional location of the game (or part of game).'),
(2380, 1, 6, 'costCurrency', 'costCurrency', 'The currency (in 3-letter) of the drug cost. See: http://en.wikipedia.org/wiki/ISO_4217. '),
(2381, 1, 6, 'departureTime', 'departureTime', 'The expected departure time.'),
(2382, 1, 6, 'annualPercentageRate', 'annualPercentageRate', 'The annual rate that is charged for borrowing (or made by investing), expressed as a single percentage number that represents the actual yearly cost of funds over the term of a loan. This includes any fees or additional costs associated with the transaction.'),
(2383, 1, 6, 'doorTime', 'doorTime', 'The time admission will commence.'),
(2384, 1, 6, 'claimReviewed', 'claimReviewed', 'A short summary of the specific claims reviewed in a ClaimReview.'),
(2385, 1, 6, 'bookEdition', 'bookEdition', 'The edition of the book.'),
(2386, 1, 6, 'specialCommitments', 'specialCommitments', 'Any special commitments associated with this job posting. Valid entries include VeteranCommit, MilitarySpouseCommit, etc.'),
(2387, 1, 6, 'molecularFormula', 'molecularFormula', 'The empirical formula is the simplest whole number ratio of all the atoms in a molecule.'),
(2388, 1, 6, 'iataCode', 'iataCode', 'IATA identifier for an airline or airport.'),
(2389, 1, 6, 'broadcastServiceTier', 'broadcastServiceTier', 'The type of service required to have access to the channel (e.g. Standard or Premium).'),
(2390, 1, 6, 'firstAppearance', 'firstAppearance', 'Indicates the first known occurrence of a [[Claim]] in some [[CreativeWork]].'),
(2391, 1, 6, 'workExample', 'workExample', 'Example/instance/realization/derivation of the concept of this creative work. E.g. the paperback edition, first edition, or e-book.'),
(2392, 1, 6, 'numberOfBeds', 'numberOfBeds', 'The quantity of the given bed type available in the HotelRoom, Suite, House, or Apartment.'),
(2393, 1, 6, 'postalCode', 'postalCode', 'The postal code. For example, 94043.'),
(2394, 1, 6, 'eventAttendanceMode', 'eventAttendanceMode', 'The eventAttendanceMode of an event indicates whether it occurs online, offline, or a mix.'),
(2395, 1, 6, 'taxonomicRange', 'taxonomicRange', 'The taxonomic grouping of the organism that expresses, encodes, or in some way related to the BioChemEntity.'),
(2396, 1, 6, 'supersededBy', 'supersededBy', 'Relates a term (i.e. a property, class or enumeration) to one that supersedes it.'),
(2397, 1, 6, 'resultComment', 'resultComment', 'A sub property of result. The Comment created or sent as a result of this action.'),
(2398, 1, 6, 'characterName', 'characterName', 'The name of a character played in some acting or performing role, i.e. in a PerformanceRole.'),
(2399, 1, 6, 'employmentType', 'employmentType', 'Type of employment (e.g. full-time, part-time, contract, temporary, seasonal, internship).'),
(2400, 1, 6, 'albumReleaseType', 'albumReleaseType', 'The kind of release which this album is: single, EP or album.'),
(2401, 1, 6, 'featureList', 'featureList', 'Features or modules provided by this application (and possibly required by other applications).'),
(2402, 1, 6, 'title', 'title', 'The title of the job.'),
(2403, 1, 6, 'dateModified', 'dateModified', 'The date on which the CreativeWork was most recently modified or when the item\'s entry was modified within a DataFeed.'),
(2404, 1, 6, 'identifyingExam', 'identifyingExam', 'A physical examination that can identify this sign.'),
(2405, 1, 6, 'expectedArrivalUntil', 'expectedArrivalUntil', 'The latest date the package may arrive.'),
(2406, 1, 6, 'roofLoad', 'roofLoad', 'The permitted total weight of cargo and installations (e.g. a roof rack) on top of the vehicle.\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n\\n* Note 1: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 2: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]]\\n* Note 3: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2407, 1, 6, 'missionCoveragePrioritiesPolicy', 'missionCoveragePrioritiesPolicy', 'For a [[NewsMediaOrganization]], a statement on coverage priorities, including any public agenda or stance on issues.'),
(2408, 1, 6, 'floorLimit', 'floorLimit', 'A floor limit is the amount of money above which credit card transactions must be authorized.'),
(2409, 1, 6, 'foodEstablishment', 'foodEstablishment', 'A sub property of location. The specific food establishment where the action occurred.'),
(2410, 1, 6, 'nationality', 'nationality', 'Nationality of the person.'),
(2411, 1, 6, 'alternativeOf', 'alternativeOf', 'Another gene which is a variation of this one.'),
(2412, 1, 6, 'temporal', 'temporal', 'The \"temporal\" property can be used in cases where more specific properties\n(e.g. [[temporalCoverage]], [[dateCreated]], [[dateModified]], [[datePublished]]) are not known to be appropriate.'),
(2413, 1, 6, 'variantCover', 'variantCover', 'A description of the variant cover\n    	for the issue, if the issue is a variant printing. For example, \"Bryan Hitch\n    	Variant Cover\" or \"2nd Printing Variant\".'),
(2414, 1, 6, 'broadcastSignalModulation', 'broadcastSignalModulation', 'The modulation (e.g. FM, AM, etc) used by a particular broadcast service.'),
(2415, 1, 6, 'secondaryPrevention', 'secondaryPrevention', 'A preventative therapy used to prevent reoccurrence of the medical condition after an initial episode of the condition.'),
(2416, 1, 6, 'hasCredential', 'hasCredential', 'A credential awarded to the Person or Organization.'),
(2417, 1, 6, 'contactOption', 'contactOption', 'An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers).'),
(2418, 1, 6, 'discountCurrency', 'discountCurrency', 'The currency of the discount.\\n\\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\".'),
(2419, 1, 6, 'reservationId', 'reservationId', 'A unique identifier for the reservation.'),
(2420, 1, 6, 'dateDeleted', 'dateDeleted', 'The datetime the item was removed from the DataFeed.'),
(2421, 1, 6, 'videoQuality', 'videoQuality', 'The quality of the video.'),
(2422, 1, 6, 'dateVehicleFirstRegistered', 'dateVehicleFirstRegistered', 'The date of the first registration of the vehicle with the respective public authorities.'),
(2423, 1, 6, 'partOfEpisode', 'partOfEpisode', 'The episode to which this clip belongs.'),
(2424, 1, 6, 'specialOpeningHoursSpecification', 'specialOpeningHoursSpecification', 'The special opening hours of a certain place.\\n\\nUse this to explicitly override general opening hours brought in scope by [[openingHoursSpecification]] or [[openingHours]].\n      '),
(2425, 1, 6, 'duns', 'duns', 'The Dun & Bradstreet DUNS number for identifying an organization or business person.'),
(2426, 1, 6, 'customerRemorseReturnShippingFeesAmount', 'customerRemorseReturnShippingFeesAmount', 'The amount of shipping costs if a product is returned due to customer remorse. Applicable when property [[customerRemorseReturnFees]] equals [[ReturnShippingFees]].'),
(2427, 1, 6, 'copyrightNotice', 'copyrightNotice', 'Text of a notice appropriate for describing the copyright aspects of this Creative Work, ideally indicating the owner of the copyright for the Work.'),
(2428, 1, 6, 'numberOfFullBathrooms', 'numberOfFullBathrooms', 'Number of full bathrooms - The total number of full and ¾ bathrooms in an [[Accommodation]]. This corresponds to the [BathroomsFull field in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsFull+Field).'),
(2429, 1, 6, 'tourBookingPage', 'tourBookingPage', 'A page providing information on how to book a tour of some [[Place]], such as an [[Accommodation]] or [[ApartmentComplex]] in a real estate setting, as well as other kinds of tours as appropriate.'),
(2430, 1, 6, 'arrivalStation', 'arrivalStation', 'The station where the train trip ends.'),
(2431, 1, 6, 'mediaAuthenticityCategory', 'mediaAuthenticityCategory', 'Indicates a MediaManipulationRatingEnumeration classification of a media object (in the context of how it was published or shared).'),
(2432, 1, 6, 'healthPlanCoinsuranceRate', 'healthPlanCoinsuranceRate', 'The rate of coinsurance expressed as a number between 0.0 and 1.0.'),
(2433, 1, 6, 'branchOf', 'branchOf', 'The larger organization that this local business is a branch of, if any. Not to be confused with (anatomical) [[branch]].'),
(2434, 1, 6, 'parentOrganization', 'parentOrganization', 'The larger organization that this organization is a [[subOrganization]] of, if any.'),
(2435, 1, 6, 'attendees', 'attendees', 'A person attending the event.'),
(2436, 1, 6, 'attendee', 'attendee', 'A person or organization attending the event.'),
(2437, 1, 6, 'maximumPhysicalAttendeeCapacity', 'maximumPhysicalAttendeeCapacity', 'The maximum physical attendee capacity of an [[Event]] whose [[eventAttendanceMode]] is [[OfflineEventAttendanceMode]] (or the offline aspects, in the case of a [[MixedEventAttendanceMode]]). '),
(2438, 1, 6, 'applicableLocation', 'applicableLocation', 'The location in which the status applies.'),
(2439, 1, 6, 'membershipNumber', 'membershipNumber', 'A unique identifier for the membership.'),
(2440, 1, 6, 'courseCode', 'courseCode', 'The identifier for the [[Course]] used by the course [[provider]] (e.g. CS101 or 6.001).'),
(2441, 1, 6, 'termsOfService', 'termsOfService', 'Human-readable terms of service documentation.'),
(2442, 1, 6, 'originalMediaContextDescription', 'originalMediaContextDescription', 'Describes, in a [[MediaReview]] when dealing with [[DecontextualizedContent]], background information that can contribute to better interpretation of the [[MediaObject]].');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(2443, 1, 6, 'countryOfOrigin', 'countryOfOrigin', 'The country of origin of something, including products as well as creative  works such as movie and TV content.\n\nIn the case of TV and movie, this would be the country of the principle offices of the production company or individual responsible for the movie. For other kinds of [[CreativeWork]] it is difficult to provide fully general guidance, and properties such as [[contentLocation]] and [[locationCreated]] may be more applicable.\n\nIn the case of products, the country of origin of the product. The exact interpretation of this may vary by context and product type, and cannot be fully enumerated here.'),
(2444, 1, 6, 'countryOfAssembly', 'countryOfAssembly', 'The place where the product was assembled.'),
(2445, 1, 6, 'gettingTestedInfo', 'gettingTestedInfo', 'Information about getting tested (for a [[MedicalCondition]]), e.g. in the context of a pandemic.'),
(2446, 1, 6, 'question', 'question', 'A sub property of object. A question.'),
(2447, 1, 6, 'totalTime', 'totalTime', 'The total time required to perform instructions or a direction (including time to prepare the supplies), in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).'),
(2448, 1, 6, 'serverStatus', 'serverStatus', 'Status of a game server.'),
(2449, 1, 6, 'acceptsReservations', 'acceptsReservations', 'Indicates whether a FoodEstablishment accepts reservations. Values can be Boolean, an URL at which reservations can be made or (for backwards compatibility) the strings ```Yes``` or ```No```.'),
(2450, 1, 6, 'starRating', 'starRating', 'An official rating for a lodging business or food establishment, e.g. from national associations or standards bodies. Use the author property to indicate the rating organization, e.g. as an Organization with name such as (e.g. HOTREC, DEHOGA, WHR, or Hotelstars).'),
(2451, 1, 6, 'agent', 'agent', 'The direct performer or driver of the action (animate or inanimate). E.g. *John* wrote a book.'),
(2452, 1, 6, 'email', 'email', 'Email address.'),
(2453, 1, 6, 'numberOfItems', 'numberOfItems', 'The number of items in an ItemList. Note that some descriptions might not fully describe all items in a list (e.g., multi-page pagination); in such cases, the numberOfItems would be for the entire list.'),
(2454, 1, 6, 'chemicalRole', 'chemicalRole', 'A role played by the BioChemEntity within a chemical context.'),
(2455, 1, 6, 'item', 'item', 'An entity represented by an entry in a list or data feed (e.g. an \'artist\' in a list of \'artists\').'),
(2456, 1, 6, 'validFrom', 'validFrom', 'The date when the item becomes valid.'),
(2457, 1, 6, 'taxonRank', 'taxonRank', 'The taxonomic rank of this taxon given preferably as a URI from a controlled vocabulary – typically the ranks from TDWG TaxonRank ontology or equivalent Wikidata URIs.'),
(2458, 1, 6, 'hasCategoryCode', 'hasCategoryCode', 'A Category code contained in this code set.'),
(2459, 1, 6, 'hasDefinedTerm', 'hasDefinedTerm', 'A Defined Term contained in this term set.'),
(2460, 1, 6, 'healthPlanCostSharing', 'healthPlanCostSharing', 'The costs to the patient for services under this network or formulary.'),
(2461, 1, 6, 'actionPlatform', 'actionPlatform', 'The high level platform(s) where the Action can be performed for the given URL. To specify a specific application or operating system instance, use actionApplication.'),
(2462, 1, 6, 'observationDate', 'observationDate', 'The observationDate of an [[Observation]].'),
(2463, 1, 6, 'cssSelector', 'cssSelector', 'A CSS selector, e.g. of a [[SpeakableSpecification]] or [[WebPageElement]]. In the latter case, multiple matches within a page can constitute a single conceptual \"Web page element\".'),
(2464, 1, 6, 'bccRecipient', 'bccRecipient', 'A sub property of recipient. The recipient blind copied on a message.'),
(2465, 1, 6, 'gameEdition', 'gameEdition', 'The edition of a video game.'),
(2466, 1, 6, 'evidenceLevel', 'evidenceLevel', 'Strength of evidence of the data used to formulate the guideline (enumerated).'),
(2467, 1, 6, 'headline', 'headline', 'Headline of the article.'),
(2468, 1, 6, 'interactionType', 'interactionType', 'The Action representing the type of interaction. For up votes, +1s, etc. use [[LikeAction]]. For down votes use [[DislikeAction]]. Otherwise, use the most specific Action.'),
(2469, 1, 6, 'structuralClass', 'structuralClass', 'The name given to how bone physically connects to each other.'),
(2470, 1, 6, 'workload', 'workload', 'Quantitative measure of the physiologic output of the exercise; also referred to as energy expenditure.'),
(2471, 1, 6, 'repeatCount', 'repeatCount', 'Defines the number of times a recurring [[Event]] will take place.'),
(2472, 1, 6, 'adverseOutcome', 'adverseOutcome', 'A possible complication and/or side effect of this therapy. If it is known that an adverse outcome is serious (resulting in death, disability, or permanent damage; requiring hospitalization; or otherwise life-threatening or requiring immediate medical attention), tag it as a seriousAdverseOutcome instead.'),
(2473, 1, 6, 'departureStation', 'departureStation', 'The station from which the train departs.'),
(2474, 1, 6, 'proteinContent', 'proteinContent', 'The number of grams of protein.'),
(2475, 1, 6, 'accessibilityHazard', 'accessibilityHazard', 'A characteristic of the described resource that is physiologically dangerous to some users. Related to WCAG 2.0 guideline 2.3. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessibilityHazard-vocabulary).'),
(2476, 1, 6, 'regionDrained', 'regionDrained', 'The anatomical or organ system drained by this vessel; generally refers to a specific part of an organ.'),
(2477, 1, 6, 'commentTime', 'commentTime', 'The time at which the UserComment was made.'),
(2478, 1, 6, 'boardingPolicy', 'boardingPolicy', 'The type of boarding policy used by the airline (e.g. zone-based or group-based).'),
(2479, 1, 6, 'vehicleConfiguration', 'vehicleConfiguration', 'A short text indicating the configuration of the vehicle, e.g. \'5dr hatchback ST 2.5 MT 225 hp\' or \'limited edition\'.'),
(2480, 1, 6, 'billingIncrement', 'billingIncrement', 'This property specifies the minimal quantity and rounding increment that will be the basis for the billing. The unit of measurement is specified by the unitCode property.'),
(2481, 1, 6, 'securityClearanceRequirement', 'securityClearanceRequirement', 'A description of any security clearance requirements of the job.'),
(2482, 1, 6, 'drugClass', 'drugClass', 'The class of drug this belongs to (e.g., statins).'),
(2483, 1, 6, 'regionsAllowed', 'regionsAllowed', 'The regions where the media is allowed. If not specified, then it\'s assumed to be allowed everywhere. Specify the countries in [ISO 3166 format](http://en.wikipedia.org/wiki/ISO_3166).'),
(2484, 1, 6, 'screenshot', 'screenshot', 'A link to a screenshot image of the app.'),
(2485, 1, 6, 'appearance', 'appearance', 'Indicates an occurrence of a [[Claim]] in some [[CreativeWork]].'),
(2486, 1, 6, 'toRecipient', 'toRecipient', 'A sub property of recipient. The recipient who was directly sent the message.'),
(2487, 1, 6, 'numberOfPartialBathrooms', 'numberOfPartialBathrooms', 'Number of partial bathrooms - The total number of half and ¼ bathrooms in an [[Accommodation]]. This corresponds to the [BathroomsPartial field in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsPartial+Field). '),
(2488, 1, 6, 'arrivalTerminal', 'arrivalTerminal', 'Identifier of the flight\'s arrival terminal.'),
(2489, 1, 6, 'hasCourse', 'hasCourse', 'A course or class that is one of the learning opportunities that constitute an educational / occupational program. No information is implied about whether the course is mandatory or optional; no guarantee is implied about whether the course will be available to everyone on the program.'),
(2490, 1, 6, 'includedInHealthInsurancePlan', 'includedInHealthInsurancePlan', 'The insurance plans that cover this drug.'),
(2491, 1, 6, 'valueRequired', 'valueRequired', 'Whether the property must be filled in to complete the action.  Default is false.'),
(2492, 1, 6, 'processorRequirements', 'processorRequirements', 'Processor architecture required to run the application (e.g. IA64).'),
(2493, 1, 6, 'minPrice', 'minPrice', 'The lowest price if the price is a range.'),
(2494, 1, 6, 'diseaseSpreadStatistics', 'diseaseSpreadStatistics', 'Statistical information about the spread of a disease, either as [[WebContent]], or\n  described directly as a [[Dataset]], or the specific [[Observation]]s in the dataset. When a [[WebContent]] URL is\n  provided, the page indicated might also contain more such markup.'),
(2495, 1, 6, 'cutoffTime', 'cutoffTime', 'Order cutoff time allows merchants to describe the time after which they will no longer process orders received on that day. For orders processed after cutoff time, one day gets added to the delivery time estimate. This property is expected to be most typically used via the [[ShippingRateSettings]] publication pattern. The time is indicated using the ISO-8601 Time format, e.g. \"23:30:00-05:00\" would represent 6:30 pm Eastern Standard Time (EST) which is 5 hours behind Coordinated Universal Time (UTC).'),
(2496, 1, 6, 'legislationChanges', 'legislationChanges', 'Another legislation that this legislation changes. This encompasses the notions of amendment, replacement, correction, repeal, or other types of change. This may be a direct change (textual or non-textual amendment) or a consequential or indirect change. The property is to be used to express the existence of a change relationship between two acts rather than the existence of a consolidated version of the text that shows the result of the change. For consolidation relationships, use the <a href=\"/legislationConsolidates\">legislationConsolidates</a> property.'),
(2497, 1, 6, 'episodes', 'episodes', 'An episode of a TV/radio series or season.'),
(2498, 1, 6, 'episode', 'episode', 'An episode of a TV, radio or game media within a series or season.'),
(2499, 1, 6, 'permissions', 'permissions', 'Permission(s) required to run the app (for example, a mobile app may require full internet access or may run only on wifi).'),
(2500, 1, 6, 'strengthUnit', 'strengthUnit', 'The units of an active ingredient\'s strength, e.g. mg.'),
(2501, 1, 6, 'endDate', 'endDate', 'The end date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).'),
(2502, 1, 6, 'shippingDestination', 'shippingDestination', 'indicates (possibly multiple) shipping destinations. These can be defined in several ways, e.g. postalCode ranges.'),
(2503, 1, 6, 'accessCode', 'accessCode', 'Password, PIN, or access code needed for delivery (e.g. from a locker).'),
(2504, 1, 6, 'smiles', 'smiles', 'A specification in form of a line notation for describing the structure of chemical species using short ASCII strings.  Double bond stereochemistry \\ indicators may need to be escaped in the string in formats where the backslash is an escape character.'),
(2505, 1, 6, 'afterMedia', 'afterMedia', 'A media object representing the circumstances after performing this direction.'),
(2506, 1, 6, 'gameTip', 'gameTip', 'Links to tips, tactics, etc.'),
(2507, 1, 6, 'yearsInOperation', 'yearsInOperation', 'The age of the business.'),
(2508, 1, 6, 'speakable', 'speakable', 'Indicates sections of a Web page that are particularly \'speakable\' in the sense of being highlighted as being especially appropriate for text-to-speech conversion. Other sections of a page may also be usefully spoken in particular circumstances; the \'speakable\' property serves to indicate the parts most likely to be generally useful for speech.\n\nThe *speakable* property can be repeated an arbitrary number of times, with three kinds of possible \'content-locator\' values:\n\n1.) *id-value* URL references - uses *id-value* of an element in the page being annotated. The simplest use of *speakable* has (potentially relative) URL values, referencing identified sections of the document concerned.\n\n2.) CSS Selectors - addresses content in the annotated page, e.g. via class attribute. Use the [[cssSelector]] property.\n\n3.)  XPaths - addresses content via XPaths (assuming an XML view of the content). Use the [[xpath]] property.\n\n\nFor more sophisticated markup of speakable sections beyond simple ID references, either CSS selectors or XPath expressions to pick out document section(s) as speakable. For this\nwe define a supporting type, [[SpeakableSpecification]]  which is defined to be a possible value of the *speakable* property.\n         '),
(2509, 1, 6, 'accessMode', 'accessMode', 'The human sensory perceptual system or cognitive faculty through which a person may process or perceive information. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessMode-vocabulary).'),
(2510, 1, 6, 'orderNumber', 'orderNumber', 'The identifier of the transaction.'),
(2511, 1, 6, 'foundingDate', 'foundingDate', 'The date that this organization was founded.'),
(2512, 1, 6, 'fuelEfficiency', 'fuelEfficiency', 'The distance traveled per unit of fuel used; most commonly miles per gallon (mpg) or kilometers per liter (km/L).\\n\\n* Note 1: There are unfortunately no standard unit codes for miles per gallon or kilometers per liter. Use [[unitText]] to indicate the unit of measurement, e.g. mpg or km/L.\\n* Note 2: There are two ways of indicating the fuel consumption, [[fuelConsumption]] (e.g. 8 liters per 100 km) and [[fuelEfficiency]] (e.g. 30 miles per gallon). They are reciprocal.\\n* Note 3: Often, the absolute value is useful only when related to driving speed (\"at 80 km/h\") or usage pattern (\"city traffic\"). You can use [[valueReference]] to link the value for the fuel economy to another value.'),
(2513, 1, 6, 'hasOccupation', 'hasOccupation', 'The Person\'s occupation. For past professions, use Role for expressing dates.'),
(2514, 1, 6, 'inAlbum', 'inAlbum', 'The album to which this recording belongs.'),
(2515, 1, 6, 'knownVehicleDamages', 'knownVehicleDamages', 'A textual description of known damages, both repaired and unrepaired.'),
(2516, 1, 6, 'dataFeedElement', 'dataFeedElement', 'An item within a data feed. Data feeds may have many elements.'),
(2517, 1, 6, 'expressedIn', 'expressedIn', 'Tissue, organ, biological sample, etc in which activity of this gene has been observed experimentally. For example brain, digestive system.'),
(2518, 1, 6, 'size', 'size', 'A standardized size of a product or creative work, specified either through a simple textual string (for example \'XL\', \'32Wx34L\'), a  QuantitativeValue with a unitCode, or a comprehensive and structured [[SizeSpecification]]; in other cases, the [[width]], [[height]], [[depth]] and [[weight]] properties may be more applicable. '),
(2519, 1, 6, 'customer', 'customer', 'Party placing the order or paying the invoice.'),
(2520, 1, 6, 'employees', 'employees', 'People working for this organization.'),
(2521, 1, 6, 'employee', 'employee', 'Someone working for this organization.'),
(2522, 1, 6, 'providesService', 'providesService', 'The service provided by this channel.'),
(2523, 1, 6, 'printSection', 'printSection', 'If this NewsArticle appears in print, this field indicates the print section in which the article appeared.'),
(2524, 1, 6, 'text', 'text', 'The textual content of this CreativeWork.'),
(2525, 1, 6, 'legislationLegalValue', 'legislationLegalValue', 'The legal value of this legislation file. The same legislation can be written in multiple files with different legal values. Typically a digitally signed PDF have a \"stronger\" legal value than the HTML file of the same act.'),
(2526, 1, 6, 'earlyPrepaymentPenalty', 'earlyPrepaymentPenalty', 'The amount to be paid as a penalty in the event of early payment of the loan.'),
(2527, 1, 6, 'returnMethod', 'returnMethod', 'The type of return method offered, specified from an enumeration.'),
(2528, 1, 6, 'commentText', 'commentText', 'The text of the UserComment.'),
(2529, 1, 6, 'geoTouches', 'geoTouches', 'Represents spatial relations in which two geometries (or the places they represent) touch: \"they have at least one boundary point in common, but no interior points.\" (A symmetric relationship, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).)'),
(2530, 1, 6, 'labelDetails', 'labelDetails', 'Link to the drug\'s label details.'),
(2531, 1, 6, 'answerCount', 'answerCount', 'The number of answers this question has received.'),
(2532, 1, 6, 'archivedAt', 'archivedAt', 'Indicates a page or other link involved in archival of a [[CreativeWork]]. In the case of [[MediaReview]], the items in a [[MediaReviewItem]] may often become inaccessible, but be archived by archival, journalistic, activist, or law enforcement organizations. In such cases, the referenced page may not directly publish the content.'),
(2533, 1, 6, 'relatedAnatomy', 'relatedAnatomy', 'Anatomical systems or structures that relate to the superficial anatomy.'),
(2534, 1, 6, 'accountMinimumInflow', 'accountMinimumInflow', 'A minimum amount that has to be paid in every month.'),
(2535, 1, 6, 'photos', 'photos', 'Photographs of this place.'),
(2536, 1, 6, 'photo', 'photo', 'A photograph of this place.'),
(2537, 1, 6, 'interactionService', 'interactionService', 'The WebSite or SoftwareApplication where the interactions took place.'),
(2538, 1, 6, 'physiologicalBenefits', 'physiologicalBenefits', 'Specific physiologic benefits associated to the plan.'),
(2539, 1, 6, 'previousItem', 'previousItem', 'A link to the ListItem that precedes the current one.'),
(2540, 1, 6, 'duplicateTherapy', 'duplicateTherapy', 'A therapy that duplicates or overlaps this one.'),
(2541, 1, 6, 'busNumber', 'busNumber', 'The unique identifier for the bus.'),
(2542, 1, 6, 'artEdition', 'artEdition', 'The number of copies when multiple copies of a piece of artwork are produced - e.g. for a limited edition of 20 prints, \'artEdition\' refers to the total number of copies (in this example \"20\").'),
(2543, 1, 6, 'foodEvent', 'foodEvent', 'A sub property of location. The specific food event where the action occurred.'),
(2544, 1, 6, 'gender', 'gender', 'Gender of something, typically a [[Person]], but possibly also fictional characters, animals, etc. While https://schema.org/Male and https://schema.org/Female may be used, text strings are also acceptable for people who do not identify as a binary gender. The [[gender]] property can also be used in an extended sense to cover e.g. the gender of sports teams. As with the gender of individuals, we do not try to enumerate all possibilities. A mixed-gender [[SportsTeam]] can be indicated with a text value of \"Mixed\".'),
(2545, 1, 6, 'deliveryAddress', 'deliveryAddress', 'Destination address.'),
(2546, 1, 6, 'valueName', 'valueName', 'Indicates the name of the PropertyValueSpecification to be used in URL templates and form encoding in a manner analogous to HTML\'s input@name.'),
(2547, 1, 6, 'saturatedFatContent', 'saturatedFatContent', 'The number of grams of saturated fat.'),
(2548, 1, 6, 'articleSection', 'articleSection', 'Articles may belong to one or more \'sections\' in a magazine or newspaper, such as Sports, Lifestyle, etc.'),
(2549, 1, 6, 'byMonthWeek', 'byMonthWeek', 'Defines the week(s) of the month on which a recurring Event takes place. Specified as an Integer between 1-5. For clarity, byMonthWeek is best used in conjunction with byDay to indicate concepts like the first and third Mondays of a month.'),
(2550, 1, 6, 'assembly', 'assembly', 'Library file name, e.g., mscorlib.dll, system.web.dll.'),
(2551, 1, 6, 'executableLibraryName', 'executableLibraryName', 'Library file name, e.g., mscorlib.dll, system.web.dll.'),
(2552, 1, 6, 'closes', 'closes', 'The closing hour of the place or service on the given day(s) of the week.'),
(2553, 1, 6, 'activityDuration', 'activityDuration', 'Length of time to engage in the activity.'),
(2554, 1, 6, 'bitrate', 'bitrate', 'The bitrate of the media object.'),
(2555, 1, 6, 'amount', 'amount', 'The amount of money.'),
(2556, 1, 6, 'rxcui', 'rxcui', 'The RxCUI drug identifier from RXNORM.'),
(2557, 1, 6, 'percentile90', 'percentile90', 'The 90th percentile value.'),
(2558, 1, 6, 'diagram', 'diagram', 'An image containing a diagram that illustrates the structure and/or its component substructures and/or connections with other structures.'),
(2559, 1, 6, 'loanPaymentAmount', 'loanPaymentAmount', 'The amount of money to pay in a single payment.'),
(2560, 1, 6, 'paymentDue', 'paymentDue', 'The date that payment is due.'),
(2561, 1, 6, 'paymentDueDate', 'paymentDueDate', 'The date that payment is due.'),
(2562, 1, 6, 'maxValue', 'maxValue', 'The upper value of some characteristic or property.'),
(2563, 1, 6, 'numberOfAccommodationUnits', 'numberOfAccommodationUnits', 'Indicates the total (available plus unavailable) number of accommodation units in an [[ApartmentComplex]], or the number of accommodation units for a specific [[FloorPlan]] (within its specific [[ApartmentComplex]]). See also [[numberOfAvailableAccommodationUnits]].'),
(2564, 1, 6, 'restockingFee', 'restockingFee', 'Use [[MonetaryAmount]] to specify a fixed restocking fee for product returns, or use [[Number]] to specify a percentage of the product price paid by the customer.'),
(2565, 1, 6, 'colleagues', 'colleagues', 'A colleague of the person.'),
(2566, 1, 6, 'colleague', 'colleague', 'A colleague of the person.'),
(2567, 1, 6, 'mobileUrl', 'mobileUrl', 'The [[mobileUrl]] property is provided for specific situations in which data consumers need to determine whether one of several provided URLs is a dedicated \'mobile site\'.\n\nTo discourage over-use, and reflecting intial usecases, the property is expected only on [[Product]] and [[Offer]], rather than [[Thing]]. The general trend in web technology is towards [responsive design](https://en.wikipedia.org/wiki/Responsive_web_design) in which content can be flexibly adapted to a wide range of browsing environments. Pages and sites referenced with the long-established [[url]] property should ideally also be usable on a wide variety of devices, including mobile phones. In most cases, it would be pointless and counter productive to attempt to update all [[url]] markup to use [[mobileUrl]] for more mobile-oriented pages. The property is intended for the case when items (primarily [[Product]] and [[Offer]]) have extra URLs hosted on an additional \"mobile site\" alongside the main one. It should not be taken as an endorsement of this publication style.\n    '),
(2568, 1, 6, 'suggestedGender', 'suggestedGender', 'The suggested gender of the intended person or audience, for example \"male\", \"female\", or \"unisex\".'),
(2569, 1, 6, 'eventStatus', 'eventStatus', 'An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.'),
(2570, 1, 6, 'discusses', 'discusses', 'Specifies the CreativeWork associated with the UserComment.'),
(2571, 1, 6, 'borrower', 'borrower', 'A sub property of participant. The person that borrows the object being lent.'),
(2572, 1, 6, 'inBroadcastLineup', 'inBroadcastLineup', 'The CableOrSatelliteService offering the channel.'),
(2573, 1, 6, 'intensity', 'intensity', 'Quantitative measure gauging the degree of force involved in the exercise, for example, heartbeats per minute. May include the velocity of the movement.'),
(2574, 1, 6, 'textValue', 'textValue', 'Text value being annotated.'),
(2575, 1, 6, 'isAccessoryOrSparePartFor', 'isAccessoryOrSparePartFor', 'A pointer to another product (or multiple products) for which this product is an accessory or spare part.'),
(2576, 1, 6, 'previousStartDate', 'previousStartDate', 'Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events, the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.'),
(2577, 1, 6, 'maintainer', 'maintainer', 'A maintainer of a [[Dataset]], software package ([[SoftwareApplication]]), or other [[Project]]. A maintainer is a [[Person]] or [[Organization]] that manages contributions to, and/or publication of, some (typically complex) artifact. It is common for distributions of software and data to be based on \"upstream\" sources. When [[maintainer]] is applied to a specific version of something e.g. a particular version or packaging of a [[Dataset]], it is always  possible that the upstream source has a different maintainer. The [[isBasedOn]] property can be used to indicate such relationships between datasets to make the different maintenance roles clear. Similarly in the case of software, a package may have dedicated maintainers working on integration into software distributions such as Ubuntu, as well as upstream maintainers of the underlying work.\n      '),
(2578, 1, 6, 'primaryPrevention', 'primaryPrevention', 'A preventative therapy used to prevent an initial occurrence of the medical condition, such as vaccination.'),
(2579, 1, 6, 'buyer', 'buyer', 'A sub property of participant. The participant/person/organization that bought the object.'),
(2580, 1, 6, 'suggestedAge', 'suggestedAge', 'The age or age range for the intended audience or person, for example 3-12 months for infants, 1-5 years for toddlers.'),
(2581, 1, 6, 'httpMethod', 'httpMethod', 'An HTTP method that specifies the appropriate HTTP method for a request to an HTTP EntryPoint. Values are capitalized strings as used in HTTP.'),
(2582, 1, 6, 'originalMediaLink', 'originalMediaLink', 'Link to the page containing an original version of the content, or directly to an online copy of the original [[MediaObject]] content, e.g. video file.'),
(2583, 1, 6, 'sameAs', 'sameAs', 'URL of a reference Web page that unambiguously indicates the item\'s identity. E.g. the URL of the item\'s Wikipedia page, Wikidata entry, or official website.'),
(2584, 1, 6, 'broadcaster', 'broadcaster', 'The organization owning or operating the broadcast service.'),
(2585, 1, 6, 'jobLocationType', 'jobLocationType', 'A description of the job location (e.g. TELECOMMUTE for telecommute jobs).'),
(2586, 1, 6, 'arrivalBusStop', 'arrivalBusStop', 'The stop or station from which the bus arrives.'),
(2587, 1, 6, 'relevantSpecialty', 'relevantSpecialty', 'If applicable, a medical specialty in which this entity is relevant.'),
(2588, 1, 6, 'permitAudience', 'permitAudience', 'The target audience for this permit.'),
(2589, 1, 6, 'seatingCapacity', 'seatingCapacity', 'The number of persons that can be seated (e.g. in a vehicle), both in terms of the physical space available, and in terms of limitations set by law.\\n\\nTypical unit code(s): C62 for persons '),
(2590, 1, 6, 'reviewBody', 'reviewBody', 'The actual body of the review.'),
(2591, 1, 6, 'serviceType', 'serviceType', 'The type of service being offered, e.g. veterans\' benefits, emergency relief, etc.'),
(2592, 1, 6, 'jobTitle', 'jobTitle', 'The job title of the person (for example, Financial Manager).'),
(2593, 1, 6, 'riskFactor', 'riskFactor', 'A modifiable or non-modifiable factor that increases the risk of a patient contracting this condition, e.g. age,  coexisting condition.'),
(2594, 1, 6, 'reservationFor', 'reservationFor', 'The thing -- flight, event, restaurant, etc. being reserved.'),
(2595, 1, 6, 'itemShipped', 'itemShipped', 'Item(s) being shipped.'),
(2596, 1, 6, 'trackingNumber', 'trackingNumber', 'Shipper tracking number.'),
(2597, 1, 6, 'totalPrice', 'totalPrice', 'The total price for the reservation or ticket, including applicable taxes, shipping, etc.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(2598, 1, 6, 'inSupportOf', 'inSupportOf', 'Qualification, candidature, degree, application that Thesis supports.'),
(2599, 1, 6, 'educationalProgramMode', 'educationalProgramMode', 'Similar to courseMode, the medium or means of delivery of the program as a whole. The value may either be a text label (e.g. \"online\", \"onsite\" or \"blended\"; \"synchronous\" or \"asynchronous\"; \"full-time\" or \"part-time\") or a URL reference to a term from a controlled vocabulary (e.g. https://ceds.ed.gov/element/001311#Asynchronous ).'),
(2600, 1, 6, 'nsn', 'nsn', 'Indicates the [NATO stock number](https://en.wikipedia.org/wiki/NATO_Stock_Number) (nsn) of a [[Product]]. '),
(2601, 1, 6, 'maxPrice', 'maxPrice', 'The highest price if the price is a range.'),
(2602, 1, 6, 'accessibilityFeature', 'accessibilityFeature', 'Content features of the resource, such as accessible media, alternatives and supported enhancements for accessibility. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessibilityFeature-vocabulary).'),
(2603, 1, 6, 'measuredValue', 'measuredValue', 'The measuredValue of an [[Observation]].'),
(2604, 1, 6, 'broadcastOfEvent', 'broadcastOfEvent', 'The event being broadcast such as a sporting event or awards ceremony.'),
(2605, 1, 6, 'leiCode', 'leiCode', 'An organization identifier that uniquely identifies a legal entity as defined in ISO 17442.'),
(2606, 1, 6, 'includesHealthPlanNetwork', 'includesHealthPlanNetwork', 'Networks covered by this plan.'),
(2607, 1, 6, 'sha256', 'sha256', 'The [SHA-2](https://en.wikipedia.org/wiki/SHA-2) SHA256 hash of the content of the item. For example, a zero-length input has value \'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855\''),
(2608, 1, 6, 'creativeWorkStatus', 'creativeWorkStatus', 'The status of a creative work in terms of its stage in a lifecycle. Example terms include Incomplete, Draft, Published, Obsolete. Some organizations define a set of terms for the stages of their publication lifecycle.'),
(2609, 1, 6, 'availability', 'availability', 'The availability of this item&#x2014;for example In stock, Out of stock, Pre-order, etc.'),
(2610, 1, 6, 'suggestedMinAge', 'suggestedMinAge', 'Minimum recommended age in years for the audience or user.'),
(2611, 1, 6, 'reviewRating', 'reviewRating', 'The rating given in this review. Note that reviews can themselves be rated. The ```reviewRating``` applies to rating given by the review. The [[aggregateRating]] property applies to the review itself, as a creative work.'),
(2612, 1, 6, 'arrivalTime', 'arrivalTime', 'The expected arrival time.'),
(2613, 1, 6, 'doseUnit', 'doseUnit', 'The unit of the dose, e.g. \'mg\'.'),
(2614, 1, 6, 'legalName', 'legalName', 'The official name of the organization, e.g. the registered company name.'),
(2615, 1, 6, 'priceValidUntil', 'priceValidUntil', 'The date after which the price is no longer available.'),
(2616, 1, 6, 'founders', 'founders', 'A person who founded this organization.'),
(2617, 1, 6, 'founder', 'founder', 'A person who founded this organization.'),
(2618, 1, 6, 'partOfSystem', 'partOfSystem', 'The anatomical or organ system that this structure is part of.'),
(2619, 1, 6, 'businessDays', 'businessDays', 'Days of the week when the merchant typically operates, indicated via opening hours markup.'),
(2620, 1, 6, 'numberOfBedrooms', 'numberOfBedrooms', 'The total integer number of bedrooms in a some [[Accommodation]], [[ApartmentComplex]] or [[FloorPlan]].'),
(2621, 1, 6, 'fiberContent', 'fiberContent', 'The number of grams of fiber.'),
(2622, 1, 6, 'diet', 'diet', 'A sub property of instrument. The diet used in this action.'),
(2623, 1, 6, 'normalRange', 'normalRange', 'Range of acceptable values for a typical patient, when applicable.'),
(2624, 1, 6, 'boardingGroup', 'boardingGroup', 'The airline-specific indicator of boarding order / preference.'),
(2625, 1, 6, 'applicationContact', 'applicationContact', 'Contact details for further information relevant to this job posting.'),
(2626, 1, 6, 'numChildren', 'numChildren', 'The number of children staying in the unit.'),
(2627, 1, 6, 'sportsActivityLocation', 'sportsActivityLocation', 'A sub property of location. The sports activity location where this action occurred.'),
(2628, 1, 6, 'target', 'target', 'Indicates a target EntryPoint, or url, for an Action.'),
(2629, 1, 6, 'billingPeriod', 'billingPeriod', 'The time interval used to compute the invoice.'),
(2630, 1, 6, 'dissolutionDate', 'dissolutionDate', 'The date that this organization was dissolved.'),
(2631, 1, 6, 'interpretedAsClaim', 'interpretedAsClaim', 'Used to indicate a specific claim contained, implied, translated or refined from the content of a [[MediaObject]] or other [[CreativeWork]]. The interpreting party can be indicated using [[claimInterpreter]].'),
(2632, 1, 6, 'fileSize', 'fileSize', 'Size of the application / package (e.g. 18MB). In the absence of a unit (MB, KB etc.), KB will be assumed.'),
(2633, 1, 6, 'availableService', 'availableService', 'A medical service available from this provider.'),
(2634, 1, 6, 'subtitleLanguage', 'subtitleLanguage', 'Languages in which subtitles/captions are available, in [IETF BCP 47 standard format](http://tools.ietf.org/html/bcp47).'),
(2635, 1, 6, 'postalCodeBegin', 'postalCodeBegin', 'First postal code in a range (included).'),
(2636, 1, 6, 'loanMortgageMandateAmount', 'loanMortgageMandateAmount', 'Amount of mortgage mandate that can be converted into a proper mortgage at a later stage.'),
(2637, 1, 6, 'totalPaymentDue', 'totalPaymentDue', 'The total amount due.'),
(2638, 1, 6, 'trainNumber', 'trainNumber', 'The unique identifier for the train.'),
(2639, 1, 6, 'gameItem', 'gameItem', 'An item is an object within the game world that can be collected by a player or, occasionally, a non-player character.'),
(2640, 1, 6, 'targetDescription', 'targetDescription', 'The description of a node in an established educational framework.'),
(2641, 1, 6, 'availableLanguage', 'availableLanguage', 'A language someone may use with or at the item, service or place. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[inLanguage]].'),
(2642, 1, 6, 'exerciseType', 'exerciseType', 'Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.'),
(2643, 1, 6, 'mileageFromOdometer', 'mileageFromOdometer', 'The total distance travelled by the particular vehicle since its initial production, as read from its odometer.\\n\\nTypical unit code(s): KMT for kilometers, SMI for statute miles'),
(2644, 1, 6, 'wheelbase', 'wheelbase', 'The distance between the centers of the front and rear wheels.\\n\\nTypical unit code(s): CMT for centimeters, MTR for meters, INH for inches, FOT for foot/feet'),
(2645, 1, 6, 'estimatedFlightDuration', 'estimatedFlightDuration', 'The estimated time the flight will take.'),
(2646, 1, 6, 'activityFrequency', 'activityFrequency', 'How often one should engage in the activity.'),
(2647, 1, 6, 'prepTime', 'prepTime', 'The length of time it takes to prepare the items to be used in instructions or a direction, in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).'),
(2648, 1, 6, 'returnShippingFeesAmount', 'returnShippingFeesAmount', 'Amount of shipping costs for product returns (for any reason). Applicable when property [[returnFees]] equals [[ReturnShippingFees]].'),
(2649, 1, 6, 'educationalRole', 'educationalRole', 'An educationalRole of an EducationalAudience.'),
(2650, 1, 6, 'isUnlabelledFallback', 'isUnlabelledFallback', 'This can be marked \'true\' to indicate that some published [[DeliveryTimeSettings]] or [[ShippingRateSettings]] are intended to apply to all [[OfferShippingDetails]] published by the same merchant, when referenced by a [[shippingSettingsLink]] in those settings. It is not meaningful to use a \'true\' value for this property alongside a transitTimeLabel (for [[DeliveryTimeSettings]]) or shippingLabel (for [[ShippingRateSettings]]), since this property is for use with unlabelled settings.'),
(2651, 1, 6, 'supportingData', 'supportingData', 'Supporting data for a SoftwareApplication.'),
(2652, 1, 6, 'salaryUponCompletion', 'salaryUponCompletion', 'The expected salary upon completing the training.'),
(2653, 1, 6, 'orderedItem', 'orderedItem', 'The item ordered.'),
(2654, 1, 6, 'geoWithin', 'geoWithin', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to one that contains it, i.e. it is inside (i.e. within) its interior. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(2655, 1, 6, 'subReservation', 'subReservation', 'The individual reservations included in the package. Typically a repeated property.'),
(2656, 1, 6, 'doseSchedule', 'doseSchedule', 'A dosing schedule for the drug for a given population, either observed, recommended, or maximum dose based on the type used.'),
(2657, 1, 6, 'bloodSupply', 'bloodSupply', 'The blood vessel that carries blood from the heart to the muscle.'),
(2658, 1, 6, 'ownedFrom', 'ownedFrom', 'The date and time of obtaining the product.'),
(2659, 1, 6, 'healthPlanNetworkId', 'healthPlanNetworkId', 'Name or unique ID of network. (Networks are often reused across different insurance plans.)'),
(2660, 1, 6, 'reportNumber', 'reportNumber', 'The number or other unique designator assigned to a Report by the publishing organization.'),
(2661, 1, 6, 'sourceOrganization', 'sourceOrganization', 'The Organization on whose behalf the creator was working.'),
(2662, 1, 6, 'browserRequirements', 'browserRequirements', 'Specifies browser requirements in human-readable text. For example, \'requires HTML5 support\'.'),
(2663, 1, 6, 'legislationPassedBy', 'legislationPassedBy', 'The person or organization that originally passed or made the law: typically parliament (for primary legislation) or government (for secondary legislation). This indicates the \"legal author\" of the law, as opposed to its physical author.'),
(2664, 1, 6, 'creator', 'creator', 'The creator/author of this CreativeWork. This is the same as the Author property for CreativeWork.'),
(2665, 1, 6, 'dosageForm', 'dosageForm', 'A dosage form in which this drug/supplement is available, e.g. \'tablet\', \'suspension\', \'injection\'.'),
(2666, 1, 6, 'byMonthDay', 'byMonthDay', 'Defines the day(s) of the month on which a recurring [[Event]] takes place. Specified as an [[Integer]] between 1-31.'),
(2667, 1, 6, 'locationCreated', 'locationCreated', 'The location where the CreativeWork was created, which may not be the same as the location depicted in the CreativeWork.'),
(2668, 1, 6, 'timeToComplete', 'timeToComplete', 'The expected length of time to complete the program if attending full-time.'),
(2669, 1, 6, 'durationOfWarranty', 'durationOfWarranty', 'The duration of the warranty promise. Common unitCode values are ANN for year, MON for months, or DAY for days.'),
(2670, 1, 6, 'namedPosition', 'namedPosition', 'A position played, performed or filled by a person or organization, as part of an organization. For example, an athlete in a SportsTeam might play in the position named \'Quarterback\'.'),
(2671, 1, 6, 'roleName', 'roleName', 'A role played, performed or filled by a person or organization. For example, the team of creators for a comic book might fill the roles named \'inker\', \'penciller\', and \'letterer\'; or an athlete in a SportsTeam might play in the position named \'Quarterback\'.'),
(2672, 1, 6, 'observedNode', 'observedNode', 'The observedNode of an [[Observation]], often a [[StatisticalPopulation]].'),
(2673, 1, 6, 'applicableCountry', 'applicableCountry', 'A country where a particular merchant return policy applies to, for example the two-letter ISO 3166-1 alpha-2 country code.'),
(2674, 1, 6, 'softwareAddOn', 'softwareAddOn', 'Additional content for a software application.'),
(2675, 1, 6, 'noBylinesPolicy', 'noBylinesPolicy', 'For a [[NewsMediaOrganization]] or other news-related [[Organization]], a statement explaining when authors of articles are not named in bylines.'),
(2676, 1, 6, 'legislationLegalForce', 'legislationLegalForce', 'Whether the legislation is currently in force, not in force, or partially in force.'),
(2677, 1, 6, 'torque', 'torque', 'The torque (turning force) of the vehicle\'s engine.\\n\\nTypical unit code(s): NU for newton metre (N m), F17 for pound-force per foot, or F48 for pound-force per inch\\n\\n* Note 1: You can link to information about how the given value has been determined (e.g. reference RPM) using the [[valueReference]] property.\\n* Note 2: You can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2678, 1, 6, 'toLocation', 'toLocation', 'A sub property of location. The final location of the object or the agent after the action.'),
(2679, 1, 6, 'readBy', 'readBy', 'A person who reads (performs) the audiobook.'),
(2680, 1, 6, 'sdDatePublished', 'sdDatePublished', 'Indicates the date on which the current structured data was generated / published. Typically used alongside [[sdPublisher]]'),
(2681, 1, 6, 'flightNumber', 'flightNumber', 'The unique identifier for a flight including the airline IATA code. For example, if describing United flight 110, where the IATA code for United is \'UA\', the flightNumber is \'UA110\'.'),
(2682, 1, 6, 'sku', 'sku', 'The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.'),
(2683, 1, 6, 'loanPaymentFrequency', 'loanPaymentFrequency', 'Frequency of payments due, i.e. number of months between payments. This is defined as a frequency, i.e. the reciprocal of a period of time.'),
(2684, 1, 6, 'isProprietary', 'isProprietary', 'True if this item\'s name is a proprietary/brand name (vs. generic name).'),
(2685, 1, 6, 'expertConsiderations', 'expertConsiderations', 'Medical expert advice related to the plan.'),
(2686, 1, 6, 'baseSalary', 'baseSalary', 'The base salary of the job or of an employee in an EmployeeRole.'),
(2687, 1, 6, 'hasCourseInstance', 'hasCourseInstance', 'An offering of the course at a specific time and place or through specific media or mode of study or to a specific section of students.'),
(2688, 1, 6, 'isConsumableFor', 'isConsumableFor', 'A pointer to another product (or multiple products) for which this product is a consumable.'),
(2689, 1, 6, 'menu', 'menu', 'Either the actual menu as a structured representation, as text, or a URL of the menu.'),
(2690, 1, 6, 'hasMenu', 'hasMenu', 'Either the actual menu as a structured representation, as text, or a URL of the menu.'),
(2691, 1, 6, 'deliveryLeadTime', 'deliveryLeadTime', 'The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup.'),
(2692, 1, 6, 'signDetected', 'signDetected', 'A sign detected by the test.'),
(2693, 1, 6, 'isLocatedInSubcellularLocation', 'isLocatedInSubcellularLocation', 'Subcellular location where this BioChemEntity is located; please use PropertyValue if you want to include any evidence.'),
(2694, 1, 6, 'stepValue', 'stepValue', 'The stepValue attribute indicates the granularity that is expected (and required) of the value in a PropertyValueSpecification.'),
(2695, 1, 6, 'tissueSample', 'tissueSample', 'The type of tissue sample required for the test.'),
(2696, 1, 6, 'producer', 'producer', 'The person or organization who produced the work (e.g. music album, movie, TV/radio series etc.).'),
(2697, 1, 6, 'publicTransportClosuresInfo', 'publicTransportClosuresInfo', 'Information about public transport closures.'),
(2698, 1, 6, 'performerIn', 'performerIn', 'Event that this person is a performer or participant in.'),
(2699, 1, 6, 'requiredCollateral', 'requiredCollateral', 'Assets required to secure loan or credit repayments. It may take form of third party pledge, goods, financial instruments (cash, securities, etc.)'),
(2700, 1, 6, 'enginePower', 'enginePower', 'The power of the vehicle\'s engine.\n    Typical unit code(s): KWT for kilowatt, BHP for brake horsepower, N12 for metric horsepower (PS, with 1 PS = 735,49875 W)\\n\\n* Note 1: There are many different ways of measuring an engine\'s power. For an overview, see  [http://en.wikipedia.org/wiki/Horsepower#Engine\\_power\\_test\\_codes](http://en.wikipedia.org/wiki/Horsepower#Engine_power_test_codes).\\n* Note 2: You can link to information about how the given value has been determined using the [[valueReference]] property.\\n* Note 3: You can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2701, 1, 6, 'sportsEvent', 'sportsEvent', 'A sub property of location. The sports event where this action occurred.'),
(2702, 1, 6, 'validIn', 'validIn', 'The geographic area where a permit or similar thing is valid.'),
(2703, 1, 6, 'vatID', 'vatID', 'The Value-added Tax ID of the organization or person.'),
(2704, 1, 6, 'subTest', 'subTest', 'A component test of the panel.'),
(2705, 1, 6, 'runsTo', 'runsTo', 'The vasculature the lymphatic structure runs, or efferents, to.'),
(2706, 1, 6, 'hasMolecularFunction', 'hasMolecularFunction', 'Molecular function performed by this BioChemEntity; please use PropertyValue if you want to include any evidence.'),
(2707, 1, 6, 'parentItem', 'parentItem', 'The parent of a question, answer or item in general.'),
(2708, 1, 6, 'byArtist', 'byArtist', 'The artist that performed this album or recording.'),
(2709, 1, 6, 'box', 'box', 'A box is the area enclosed by the rectangle formed by two points. The first point is the lower corner, the second point is the upper corner. A box is expressed as two points separated by a space character.'),
(2710, 1, 6, 'replacer', 'replacer', 'A sub property of object. The object that replaces.'),
(2711, 1, 6, 'isrcCode', 'isrcCode', 'The International Standard Recording Code for the recording.'),
(2712, 1, 6, 'itemDefectReturnFees', 'itemDefectReturnFees', 'The type of return fees for returns of defect products.'),
(2713, 1, 6, 'includesHealthPlanFormulary', 'includesHealthPlanFormulary', 'Formularies covered by this plan.'),
(2714, 1, 6, 'meetsEmissionStandard', 'meetsEmissionStandard', 'Indicates that the vehicle meets the respective emission standard.'),
(2715, 1, 6, 'releasedEvent', 'releasedEvent', 'The place and time the release was issued, expressed as a PublicationEvent.'),
(2716, 1, 6, 'itemDefectReturnLabelSource', 'itemDefectReturnLabelSource', 'The method (from an enumeration) by which the customer obtains a return shipping label for a defect product.'),
(2717, 1, 6, 'preOp', 'preOp', 'A description of the workup, testing, and other preparations required before implanting this device.'),
(2718, 1, 6, 'composer', 'composer', 'The person or organization who wrote a composition, or who is the composer of a work performed at some event.'),
(2719, 1, 6, 'replyToUrl', 'replyToUrl', 'The URL at which a reply may be posted to the specified UserComment.'),
(2720, 1, 6, 'organizer', 'organizer', 'An organizer of an Event.'),
(2721, 1, 6, 'lodgingUnitDescription', 'lodgingUnitDescription', 'A full description of the lodging unit.'),
(2722, 1, 6, 'recommendationStrength', 'recommendationStrength', 'Strength of the guideline\'s recommendation (e.g. \'class I\').'),
(2723, 1, 6, 'legislationType', 'legislationType', 'The type of the legislation. Examples of values are \"law\", \"act\", \"directive\", \"decree\", \"regulation\", \"statutory instrument\", \"loi organique\", \"règlement grand-ducal\", etc., depending on the country.'),
(2724, 1, 6, 'genre', 'genre', 'Genre of the creative work, broadcast channel or group.'),
(2725, 1, 6, 'bioChemSimilarity', 'bioChemSimilarity', 'A similar BioChemEntity, e.g., obtained by fingerprint similarity algorithms.'),
(2726, 1, 6, 'partOfInvoice', 'partOfInvoice', 'The order is being paid as part of the referenced Invoice.'),
(2727, 1, 6, 'honorificSuffix', 'honorificSuffix', 'An honorific suffix following a Person\'s name such as M.D./PhD/MSCSW.'),
(2728, 1, 6, 'spouse', 'spouse', 'The person\'s spouse.'),
(2729, 1, 6, 'gtin14', 'gtin14', 'The GTIN-14 code of the product, or the product to which the offer refers. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.'),
(2730, 1, 6, 'countriesNotSupported', 'countriesNotSupported', 'Countries for which the application is not supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.'),
(2731, 1, 6, 'mpn', 'mpn', 'The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.'),
(2732, 1, 6, 'merchant', 'merchant', '\'merchant\' is an out-dated term for \'seller\'.'),
(2733, 1, 6, 'seller', 'seller', 'An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider.'),
(2734, 1, 6, 'productGroupID', 'productGroupID', 'Indicates a textual identifier for a ProductGroup.'),
(2735, 1, 6, 'faxNumber', 'faxNumber', 'The fax number.'),
(2736, 1, 6, 'estimatedSalary', 'estimatedSalary', 'An estimated salary for a job posting or occupation, based on a variety of variables including, but not limited to industry, job title, and location. Estimated salaries  are often computed by outside organizations rather than the hiring organization, who may not have committed to the estimated value.'),
(2737, 1, 6, 'serviceOperator', 'serviceOperator', 'The operating organization, if different from the provider.  This enables the representation of services that are provided by an organization, but operated by another organization like a subcontractor.'),
(2738, 1, 6, 'materialExtent', 'materialExtent', 'The quantity of the materials being described or an expression of the physical space they occupy.'),
(2739, 1, 6, 'orderStatus', 'orderStatus', 'The current status of the order.'),
(2740, 1, 6, 'benefits', 'benefits', 'Description of benefits associated with the job.'),
(2741, 1, 6, 'jobBenefits', 'jobBenefits', 'Description of benefits associated with the job.'),
(2742, 1, 6, 'numberOfAxles', 'numberOfAxles', 'The number of axles.\\n\\nTypical unit code(s): C62');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(2743, 1, 6, 'hasHealthAspect', 'hasHealthAspect', 'Indicates the aspect or aspects specifically addressed in some [[HealthTopicContent]]. For example, that the content is an overview, or that it talks about treatment, self-care, treatments or their side-effects.'),
(2744, 1, 6, 'medicalAudience', 'medicalAudience', 'Medical audience for page.'),
(2745, 1, 6, 'height', 'height', 'The height of the item.'),
(2746, 1, 6, 'seatSection', 'seatSection', 'The section location of the reserved seat (e.g. Orchestra).'),
(2747, 1, 6, 'warrantyScope', 'warrantyScope', 'The scope of the warranty promise.'),
(2748, 1, 6, 'multipleValues', 'multipleValues', 'Whether multiple values are allowed for the property.  Default is false.'),
(2749, 1, 6, 'employerOverview', 'employerOverview', 'A description of the employer, career opportunities and work environment for this position.'),
(2750, 1, 6, 'healthPlanCopay', 'healthPlanCopay', 'The copay amount.'),
(2751, 1, 6, 'percentile25', 'percentile25', 'The 25th percentile value.'),
(2752, 1, 6, 'parentService', 'parentService', 'A broadcast service to which the broadcast service may belong to such as regional variations of a national channel.'),
(2753, 1, 6, 'ticketedSeat', 'ticketedSeat', 'The seat associated with the ticket.'),
(2754, 1, 6, 'error', 'error', 'For failed actions, more information on the cause of the failure.'),
(2755, 1, 6, 'pageEnd', 'pageEnd', 'The page on which the work ends; for example \"138\" or \"xvi\".'),
(2756, 1, 6, 'engineDisplacement', 'engineDisplacement', 'The volume swept by all of the pistons inside the cylinders of an internal combustion engine in a single movement. \\n\\nTypical unit code(s): CMQ for cubic centimeter, LTR for liters, INQ for cubic inches\\n* Note 1: You can link to information about how the given value has been determined using the [[valueReference]] property.\\n* Note 2: You can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2757, 1, 6, 'maximumIntake', 'maximumIntake', 'Recommended intake of this supplement for a given population as defined by a specific recommending authority.'),
(2758, 1, 6, 'possibleComplication', 'possibleComplication', 'A possible unexpected and unfavorable evolution of a medical condition. Complications may include worsening of the signs or symptoms of the disease, extension of the condition to other organ systems, etc.'),
(2759, 1, 6, 'serviceUrl', 'serviceUrl', 'The website to access the service.'),
(2760, 1, 6, 'serviceLocation', 'serviceLocation', 'The location (e.g. civic structure, local business, etc.) where a person can go to access the service.'),
(2761, 1, 6, 'pattern', 'pattern', 'A pattern that something has, for example \'polka dot\', \'striped\', \'Canadian flag\'. Values are typically expressed as text, although links to controlled value schemes are also supported.'),
(2762, 1, 6, 'broadcastDisplayName', 'broadcastDisplayName', 'The name displayed in the channel guide. For many US affiliates, it is the network name.'),
(2763, 1, 6, 'artMedium', 'artMedium', 'The material used. (E.g. Oil, Watercolour, Acrylic, Linoprint, Marble, Cyanotype, Digital, Lithograph, DryPoint, Intaglio, Pastel, Woodcut, Pencil, Mixed Media, etc.)'),
(2764, 1, 6, 'material', 'material', 'A material that something is made from, e.g. leather, wool, cotton, paper.'),
(2765, 1, 6, 'usesHealthPlanIdStandard', 'usesHealthPlanIdStandard', 'The standard for interpreting the Plan ID. The preferred is \"HIOS\". See the Centers for Medicare & Medicaid Services for more details.'),
(2766, 1, 6, 'relatedDrug', 'relatedDrug', 'Any other drug related to this one, for example commonly-prescribed alternatives.'),
(2767, 1, 6, 'usedToDiagnose', 'usedToDiagnose', 'A condition the test is used to diagnose.'),
(2768, 1, 6, 'memoryRequirements', 'memoryRequirements', 'Minimum memory requirements.'),
(2769, 1, 6, 'leaseLength', 'leaseLength', 'Length of the lease for some [[Accommodation]], either particular to some [[Offer]] or in some cases intrinsic to the property.'),
(2770, 1, 6, 'webFeed', 'webFeed', 'The URL for a feed, e.g. associated with a podcast series, blog, or series of date-stamped updates. This is usually RSS or Atom.'),
(2771, 1, 6, 'creditText', 'creditText', 'Text that can be used to credit person(s) and/or organization(s) associated with a published Creative Work.'),
(2772, 1, 6, 'reservationStatus', 'reservationStatus', 'The current status of the reservation.'),
(2773, 1, 6, 'insertion', 'insertion', 'The place of attachment of a muscle, or what the muscle moves.'),
(2774, 1, 6, 'fileFormat', 'fileFormat', 'Media type, typically MIME format (see [IANA site](http://www.iana.org/assignments/media-types/media-types.xhtml)) of the content, e.g. application/zip of a SoftwareApplication binary. In cases where a CreativeWork has several media type representations, \'encoding\' can be used to indicate each MediaObject alongside particular fileFormat information. Unregistered or niche file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia entry.'),
(2775, 1, 6, 'encodingFormat', 'encodingFormat', 'Media type typically expressed using a MIME format (see [IANA site](http://www.iana.org/assignments/media-types/media-types.xhtml) and [MDN reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types)), e.g. application/zip for a SoftwareApplication binary, audio/mpeg for .mp3 etc.\n\nIn cases where a [[CreativeWork]] has several media type representations, [[encoding]] can be used to indicate each [[MediaObject]] alongside particular [[encodingFormat]] information.\n\nUnregistered or niche encoding and file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia/Wikidata entry.'),
(2776, 1, 6, 'scheduledTime', 'scheduledTime', 'The time the object is scheduled to.'),
(2777, 1, 6, 'availabilityEnds', 'availabilityEnds', 'The end of the availability of the product or service included in the offer.'),
(2778, 1, 6, 'video', 'video', 'An embedded video object.'),
(2779, 1, 6, 'fuelConsumption', 'fuelConsumption', 'The amount of fuel consumed for traveling a particular distance or temporal duration with the given vehicle (e.g. liters per 100 km).\\n\\n* Note 1: There are unfortunately no standard unit codes for liters per 100 km.  Use [[unitText]] to indicate the unit of measurement, e.g. L/100 km.\\n* Note 2: There are two ways of indicating the fuel consumption, [[fuelConsumption]] (e.g. 8 liters per 100 km) and [[fuelEfficiency]] (e.g. 30 miles per gallon). They are reciprocal.\\n* Note 3: Often, the absolute value is useful only when related to driving speed (\"at 80 km/h\") or usage pattern (\"city traffic\"). You can use [[valueReference]] to link the value for the fuel consumption to another value.'),
(2780, 1, 6, 'greaterOrEqual', 'greaterOrEqual', 'This ordering relation for qualitative values indicates that the subject is greater than or equal to the object.'),
(2781, 1, 6, 'layoutImage', 'layoutImage', 'A schematic image showing the floorplan layout.'),
(2782, 1, 6, 'broadcastAffiliateOf', 'broadcastAffiliateOf', 'The media network(s) whose content is broadcast on this station.'),
(2783, 1, 6, 'siblings', 'siblings', 'A sibling of the person.'),
(2784, 1, 6, 'sibling', 'sibling', 'A sibling of the person.'),
(2785, 1, 6, 'returnFees', 'returnFees', 'The type of return fees for purchased products (for any return reason).'),
(2786, 1, 6, 'defaultValue', 'defaultValue', 'The default value of the input.  For properties that expect a literal, the default is a literal value, for properties that expect an object, it\'s an ID reference to one of the current values.'),
(2787, 1, 6, 'foundingLocation', 'foundingLocation', 'The place where the Organization was founded.'),
(2788, 1, 6, 'childMinAge', 'childMinAge', 'Minimal age of the child.'),
(2789, 1, 6, 'followee', 'followee', 'A sub property of object. The person or organization being followed.'),
(2790, 1, 6, 'claimInterpreter', 'claimInterpreter', 'For a [[Claim]] interpreted from [[MediaObject]] content\n    sed to indicate a claim contained, implied or refined from the content of a [[MediaObject]].'),
(2791, 1, 6, 'dietFeatures', 'dietFeatures', 'Nutritional information specific to the dietary plan. May include dietary recommendations on what foods to avoid, what foods to consume, and specific alterations/deviations from the USDA or other regulatory body\'s approved dietary guidelines.'),
(2792, 1, 6, 'bookingAgent', 'bookingAgent', '\'bookingAgent\' is an out-dated term indicating a \'broker\' that serves as a booking agent.'),
(2793, 1, 6, 'broker', 'broker', 'An entity that arranges for an exchange between a buyer and a seller.  In most cases a broker never acquires or releases ownership of a product or service involved in an exchange.  If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred.'),
(2794, 1, 6, 'bodyType', 'bodyType', 'Indicates the design and body style of the vehicle (e.g. station wagon, hatchback, etc.).'),
(2795, 1, 6, 'geo', 'geo', 'The geo coordinates of the place.'),
(2796, 1, 6, 'skills', 'skills', 'A statement of knowledge, skill, ability, task or any other assertion expressing a competency that is desired or required to fulfill this role or to work in this occupation.'),
(2797, 1, 6, 'hasMenuItem', 'hasMenuItem', 'A food or drink item contained in a menu or menu section.'),
(2798, 1, 6, 'cargoVolume', 'cargoVolume', 'The available volume for cargo or luggage. For automobiles, this is usually the trunk volume.\\n\\nTypical unit code(s): LTR for liters, FTQ for cubic foot/feet\\n\\nNote: You can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2799, 1, 6, 'minimumPaymentDue', 'minimumPaymentDue', 'The minimum payment required at this time.'),
(2800, 1, 6, 'hospitalAffiliation', 'hospitalAffiliation', 'A hospital with which the physician or office is affiliated.'),
(2801, 1, 6, 'scheduledPaymentDate', 'scheduledPaymentDate', 'The date the invoice is scheduled to be paid.'),
(2802, 1, 6, 'targetUrl', 'targetUrl', 'The URL of a node in an established educational framework.'),
(2803, 1, 6, 'overdosage', 'overdosage', 'Any information related to overdose on a drug, including signs or symptoms, treatments, contact information for emergency response.'),
(2804, 1, 6, 'legislationResponsible', 'legislationResponsible', 'An individual or organization that has some kind of responsibility for the legislation. Typically the ministry who is/was in charge of elaborating the legislation, or the adressee for potential questions about the legislation once it is published.'),
(2805, 1, 6, 'safetyConsideration', 'safetyConsideration', 'Any potential safety concern associated with the supplement. May include interactions with other drugs and foods, pregnancy, breastfeeding, known adverse reactions, and documented efficacy of the supplement.'),
(2806, 1, 6, 'hasMeasurement', 'hasMeasurement', 'A product measurement, for example the inseam of pants, the wheel size of a bicycle, or the gauge of a screw. Usually an exact measurement, but can also be a range of measurements for adjustable products, for example belts and ski bindings.'),
(2807, 1, 6, 'smokingAllowed', 'smokingAllowed', 'Indicates whether it is allowed to smoke in the place, e.g. in the restaurant, hotel or hotel room.'),
(2808, 1, 6, 'correction', 'correction', 'Indicates a correction to a [[CreativeWork]], either via a [[CorrectionComment]], textually or in another document.'),
(2809, 1, 6, 'studyDesign', 'studyDesign', 'Specifics about the observational study design (enumerated).'),
(2810, 1, 6, 'artform', 'artform', 'e.g. Painting, Drawing, Sculpture, Print, Photograph, Assemblage, Collage, etc.'),
(2811, 1, 6, 'fatContent', 'fatContent', 'The number of grams of fat.'),
(2812, 1, 6, 'costOrigin', 'costOrigin', 'Additional details to capture the origin of the cost data. For example, \'Medicare Part B\'.'),
(2813, 1, 6, 'aspect', 'aspect', 'An aspect of medical practice that is considered on the page, such as \'diagnosis\', \'treatment\', \'causes\', \'prognosis\', \'etiology\', \'epidemiology\', etc.'),
(2814, 1, 6, 'mainContentOfPage', 'mainContentOfPage', 'Indicates if this web page element is the main subject of the page.'),
(2815, 1, 6, 'transitTimeLabel', 'transitTimeLabel', 'Label to match an [[OfferShippingDetails]] with a [[DeliveryTimeSettings]] (within the context of a [[shippingSettingsLink]] cross-reference).'),
(2816, 1, 6, 'nerveMotor', 'nerveMotor', 'The neurological pathway extension that involves muscle control.'),
(2817, 1, 6, 'alignmentType', 'alignmentType', 'A category of alignment between the learning resource and the framework node. Recommended values include: \'requires\', \'textComplexity\', \'readingLevel\', and \'educationalSubject\'.'),
(2818, 1, 6, 'tongueWeight', 'tongueWeight', 'The permitted vertical load (TWR) of a trailer attached to the vehicle. Also referred to as Tongue Load Rating (TLR) or Vertical Load Rating (VLR).\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n\\n* Note 1: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 2: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]].\\n* Note 3: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(2819, 1, 6, 'predecessorOf', 'predecessorOf', 'A pointer from a previous, often discontinued variant of the product to its newer variant.'),
(2820, 1, 6, 'paymentAccepted', 'paymentAccepted', 'Cash, Credit Card, Cryptocurrency, Local Exchange Tradings System, etc.'),
(2821, 1, 6, 'sportsTeam', 'sportsTeam', 'A sub property of participant. The sports team that participated on this action.'),
(2822, 1, 6, 'wordCount', 'wordCount', 'The number of words in the text of the Article.'),
(2823, 1, 6, 'vendor', 'vendor', '\'vendor\' is an earlier term for \'seller\'.'),
(2824, 1, 6, 'seatingType', 'seatingType', 'The type/class of the seat.'),
(2825, 1, 6, 'driveWheelConfiguration', 'driveWheelConfiguration', 'The drive wheel configuration, i.e. which roadwheels will receive torque from the vehicle\'s engine via the drivetrain.'),
(2826, 1, 6, 'expires', 'expires', 'Date the content expires and is no longer useful or available. For example a [[VideoObject]] or [[NewsArticle]] whose availability or relevance is time-limited, or a [[ClaimReview]] fact check whose publisher wants to indicate that it may no longer be relevant (or helpful to highlight) after some date.'),
(2827, 1, 6, 'yearlyRevenue', 'yearlyRevenue', 'The size of the business in annual revenue.'),
(2828, 1, 6, 'replacee', 'replacee', 'A sub property of object. The object that is being replaced.'),
(2829, 1, 6, 'departureAirport', 'departureAirport', 'The airport where the flight originates.'),
(2830, 1, 6, 'availableFrom', 'availableFrom', 'When the item is available for pickup from the store, locker, etc.'),
(2831, 1, 6, 'follows', 'follows', 'The most generic uni-directional social relation.'),
(2832, 1, 6, 'workHours', 'workHours', 'The typical working hours for this job (e.g. 1st shift, night shift, 8am-5pm).'),
(2833, 1, 6, 'sampleType', 'sampleType', 'What type of code sample: full (compile ready) solution, code snippet, inline code, scripts, template.'),
(2834, 1, 6, 'codeSampleType', 'codeSampleType', 'What type of code sample: full (compile ready) solution, code snippet, inline code, scripts, template.'),
(2835, 1, 6, 'confirmationNumber', 'confirmationNumber', 'A number that confirms the given order or payment has been received.'),
(2836, 1, 6, 'isBasedOnUrl', 'isBasedOnUrl', 'A resource that was used in the creation of this resource. This term can be repeated for multiple sources. For example, http://example.com/great-multiplication-intro.html.'),
(2837, 1, 6, 'isBasedOn', 'isBasedOn', 'A resource from which this work is derived or from which it is a modification or adaption.'),
(2838, 1, 6, 'travelBans', 'travelBans', 'Information about travel bans, e.g. in the context of a pandemic.'),
(2839, 1, 6, 'value', 'value', 'The value of the quantitative value or property value node.\\n\\n* For [[QuantitativeValue]] and [[MonetaryAmount]], the recommended type for values is \'Number\'.\\n* For [[PropertyValue]], it can be \'Text\', \'Number\', \'Boolean\', or \'StructuredValue\'.\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(2840, 1, 6, 'proprietaryName', 'proprietaryName', 'Proprietary name given to the diet plan, typically by its originator or creator.'),
(2841, 1, 6, 'hoursAvailable', 'hoursAvailable', 'The hours during which this service or contact is available.'),
(2842, 1, 6, 'vehicleTransmission', 'vehicleTransmission', 'The type of component used for transmitting the power from a rotating power source to the wheels or other relevant component(s) (\"gearbox\" for cars).'),
(2843, 1, 6, 'ratingExplanation', 'ratingExplanation', 'A short explanation (e.g. one to two sentences) providing background context and other information that led to the conclusion expressed in the rating. This is particularly applicable to ratings associated with \"fact check\" markup using [[ClaimReview]].'),
(2844, 1, 6, 'artist', 'artist', 'The primary artist for a work\n    	in a medium other than pencils or digital line art--for example, if the\n    	primary artwork is done in watercolors or digital paints.'),
(2845, 1, 6, 'itemLocation', 'itemLocation', 'Current location of the item.'),
(2846, 1, 6, 'cvdFacilityId', 'cvdFacilityId', 'Identifier of the NHSN facility that this data record applies to. Use [[cvdFacilityCounty]] to indicate the county. To provide other details, [[healthcareReportingData]] can be used on a [[Hospital]] entry.'),
(2847, 1, 6, 'translator', 'translator', 'Organization or person who adapts a creative work to different languages, regional differences and technical requirements of a target market, or that translates during some event.'),
(2848, 1, 6, 'eligibilityToWorkRequirement', 'eligibilityToWorkRequirement', 'The legal requirements such as citizenship, visa and other documentation required for an applicant to this job.'),
(2849, 1, 6, 'rangeIncludes', 'rangeIncludes', 'Relates a property to a class that constitutes (one of) the expected type(s) for values of the property.'),
(2850, 1, 6, 'lowPrice', 'lowPrice', 'The lowest price of all offers available.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(2851, 1, 6, 'loanTerm', 'loanTerm', 'The duration of the loan or credit agreement.'),
(2852, 1, 6, 'duration', 'duration', 'The duration of the item (movie, audio recording, event, etc.) in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601).'),
(2853, 1, 6, 'percentile75', 'percentile75', 'The 75th percentile value.'),
(2854, 1, 6, 'tocEntry', 'tocEntry', 'Indicates a [[HyperTocEntry]] in a [[HyperToc]].'),
(2855, 1, 6, 'hasPart', 'hasPart', 'Indicates an item or CreativeWork that is part of this item, or CreativeWork (in some sense).'),
(2856, 1, 6, 'busName', 'busName', 'The name of the bus (e.g. Bolt Express).'),
(2857, 1, 6, 'interestRate', 'interestRate', 'The interest rate, charged or paid, applicable to the financial product. Note: This is different from the calculated annualPercentageRate.'),
(2858, 1, 6, 'hasEnergyEfficiencyCategory', 'hasEnergyEfficiencyCategory', 'Defines the energy efficiency Category (which could be either a rating out of range of values or a yes/no certification) for a product according to an international energy efficiency standard.'),
(2859, 1, 6, 'illustrator', 'illustrator', 'The illustrator of the book.'),
(2860, 1, 6, 'eligibleTransactionVolume', 'eligibleTransactionVolume', 'The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.'),
(2861, 1, 6, 'additionalType', 'additionalType', 'An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax. This is a relationship between something and a class that the thing is in. In RDFa syntax, it is better to use the native RDFa syntax - the \'typeof\' attribute - for multiple types. Schema.org tools may have only weaker understanding of extra types, in particular those defined externally.'),
(2862, 1, 6, 'exifData', 'exifData', 'exif data for this object.'),
(2863, 1, 6, 'imagingTechnique', 'imagingTechnique', 'Imaging technique used.'),
(2864, 1, 6, 'ownedThrough', 'ownedThrough', 'The date and time of giving up ownership on the product.'),
(2865, 1, 6, 'targetPopulation', 'targetPopulation', 'Characteristics of the population for which this is intended, or which typically uses it, e.g. \'adults\'.'),
(2866, 1, 6, 'referenceQuantity', 'referenceQuantity', 'The reference quantity for which a certain price applies, e.g. 1 EUR per 4 kWh of electricity. This property is a replacement for unitOfMeasurement for the advanced cases where the price does not relate to a standard unit.'),
(2867, 1, 6, 'howPerformed', 'howPerformed', 'How the procedure is performed.'),
(2868, 1, 6, 'signOrSymptom', 'signOrSymptom', 'A sign or symptom of this condition. Signs are objective or physically observable manifestations of the medical condition while symptoms are the subjective experience of the medical condition.'),
(2869, 1, 6, 'isInvolvedInBiologicalProcess', 'isInvolvedInBiologicalProcess', 'Biological process this BioChemEntity is involved in; please use PropertyValue if you want to include any evidence.'),
(2870, 1, 6, 'preparation', 'preparation', 'Typical preparation that a patient must undergo before having the procedure performed.'),
(2871, 1, 6, 'winner', 'winner', 'A sub property of participant. The winner of the action.'),
(2872, 1, 6, 'muscleAction', 'muscleAction', 'The movement the muscle generates.'),
(2873, 1, 6, 'numberOfAirbags', 'numberOfAirbags', 'The number or type of airbags in the vehicle.'),
(2874, 1, 6, 'expectsAcceptanceOf', 'expectsAcceptanceOf', 'An Offer which must be accepted before the user can perform the Action. For example, the user may need to buy a movie before being able to watch it.'),
(2875, 1, 6, 'courseWorkload', 'courseWorkload', 'The amount of work expected of students taking the course, often provided as a figure per week or per month, and may be broken down by type. For example, \"2 hours of lectures, 1 hour of lab work and 3 hours of independent study per week\".'),
(2876, 1, 6, 'issuedThrough', 'issuedThrough', 'The service through which the permit was granted.'),
(2877, 1, 6, 'depth', 'depth', 'The depth of the item.'),
(2878, 1, 6, 'transmissionMethod', 'transmissionMethod', 'How the disease spreads, either as a route or vector, for example \'direct contact\', \'Aedes aegypti\', etc.'),
(2879, 1, 6, 'petsAllowed', 'petsAllowed', 'Indicates whether pets are allowed to enter the accommodation or lodging business. More detailed information can be put in a text value.'),
(2880, 1, 6, 'fromLocation', 'fromLocation', 'A sub property of location. The original location of the object or the agent before the action.'),
(2881, 1, 6, 'editor', 'editor', 'Specifies the Person who edited the CreativeWork.'),
(2882, 1, 6, 'ineligibleRegion', 'ineligibleRegion', 'The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is not valid, e.g. a region where the transaction is not allowed.\\n\\nSee also [[eligibleRegion]].\n      '),
(2883, 1, 6, 'events', 'events', 'Upcoming or past events associated with this place or organization.'),
(2884, 1, 6, 'event', 'event', 'Upcoming or past event associated with this place, organization, or action.'),
(2885, 1, 6, 'modifiedTime', 'modifiedTime', 'The date and time the reservation was modified.'),
(2886, 1, 6, 'nerve', 'nerve', 'The underlying innervation associated with the muscle.'),
(2887, 1, 6, 'customerRemorseReturnFees', 'customerRemorseReturnFees', 'The type of return fees if the product is returned due to customer remorse.'),
(2888, 1, 6, 'associatedMedia', 'associatedMedia', 'A media object that encodes this CreativeWork. This property is a synonym for encoding.'),
(2889, 1, 6, 'educationalUse', 'educationalUse', 'The purpose of a work in the context of education; for example, \'assignment\', \'group work\'.'),
(2890, 1, 6, 'numberOfPlayers', 'numberOfPlayers', 'Indicate how many people can play this game (minimum, maximum, or range).'),
(2891, 1, 6, 'width', 'width', 'The width of the item.'),
(2892, 1, 6, 'conditionsOfAccess', 'conditionsOfAccess', 'Conditions that affect the availability of, or method(s) of access to, an item. Typically used for real world items such as an [[ArchiveComponent]] held by an [[ArchiveOrganization]]. This property is not suitable for use as a general Web access control mechanism. It is expressed only in natural language.\\n\\nFor example \"Available by appointment from the Reading Room\" or \"Accessible only from logged-in accounts \". '),
(2893, 1, 6, 'bodyLocation', 'bodyLocation', 'Location in the body of the anatomical structure.'),
(2894, 1, 6, 'nutrition', 'nutrition', 'Nutrition information about the recipe or menu item.'),
(2895, 1, 6, 'eligibleQuantity', 'eligibleQuantity', 'The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.'),
(2896, 1, 6, 'owns', 'owns', 'Products owned by the organization or person.'),
(2897, 1, 6, 'breadcrumb', 'breadcrumb', 'A set of links that can help a user understand and navigate a website hierarchy.'),
(2898, 1, 6, 'percentile10', 'percentile10', 'The 10th percentile value.'),
(2899, 1, 6, 'dateSent', 'dateSent', 'The date/time at which the message was sent.'),
(2900, 1, 6, 'healthPlanCopayOption', 'healthPlanCopayOption', 'Whether the copay is before or after deductible, etc. TODO: Is this a closed set?'),
(2901, 1, 6, 'birthPlace', 'birthPlace', 'The place where the person was born.'),
(2902, 1, 6, 'name', 'name', 'The name of the item.'),
(2903, 1, 6, 'permittedUsage', 'permittedUsage', 'Indications regarding the permitted usage of the accommodation.'),
(2904, 1, 6, 'includedDataCatalog', 'includedDataCatalog', 'A data catalog which contains this dataset (this property was previously \'catalog\', preferred name is now \'includedInDataCatalog\').'),
(2905, 1, 6, 'dependencies', 'dependencies', 'Prerequisites needed to fulfill steps in article.'),
(2906, 1, 6, 'actionAccessibilityRequirement', 'actionAccessibilityRequirement', 'A set of requirements that must be fulfilled in order to perform an Action. If more than one value is specified, fulfilling one set of requirements will allow the Action to be performed.'),
(2907, 1, 6, 'inPlaylist', 'inPlaylist', 'The playlist to which this recording belongs.'),
(2908, 1, 6, 'geoIntersects', 'geoIntersects', 'Represents spatial relations in which two geometries (or the places they represent) have at least one point in common. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(2909, 1, 6, 'openingHours', 'openingHours', 'The general opening hours for a business. Opening hours can be specified as a weekly time range, starting with days, then times per day. Multiple days can be listed with commas \',\' separating each day. Day or time ranges are specified using a hyphen \'-\'.\\n\\n* Days are specified using the following two-letter combinations: ```Mo```, ```Tu```, ```We```, ```Th```, ```Fr```, ```Sa```, ```Su```.\\n* Times are specified using 24:00 format. For example, 3pm is specified as ```15:00```, 10am as ```10:00```. \\n* Here is an example: <code>&lt;time itemprop=\"openingHours\" datetime=&quot;Tu,Th 16:00-20:00&quot;&gt;Tuesdays and Thursdays 4-8pm&lt;/time&gt;</code>.\\n* If a business is open 7 days a week, then it can be specified as <code>&lt;time itemprop=&quot;openingHours&quot; datetime=&quot;Mo-Su&quot;&gt;Monday through Sunday, all day&lt;/time&gt;</code>.'),
(2910, 1, 6, 'familyName', 'familyName', 'Family name. In the U.S., the last name of a Person.'),
(2911, 1, 6, 'nextItem', 'nextItem', 'A link to the ListItem that follows the current one.'),
(2912, 1, 6, 'maps', 'maps', 'A URL to a map of the place.'),
(2913, 1, 6, 'fuelCapacity', 'fuelCapacity', 'The capacity of the fuel tank or in the case of electric cars, the battery. If there are multiple components for storage, this should indicate the total of all storage of the same type.\\n\\nTypical unit code(s): LTR for liters, GLL of US gallons, GLI for UK / imperial gallons, AMH for ampere-hours (for electrical vehicles).'),
(2914, 1, 6, 'maximumVirtualAttendeeCapacity', 'maximumVirtualAttendeeCapacity', 'The maximum physical attendee capacity of an [[Event]] whose [[eventAttendanceMode]] is [[OnlineEventAttendanceMode]] (or the online aspects, in the case of a [[MixedEventAttendanceMode]]). '),
(2915, 1, 6, 'itemCondition', 'itemCondition', 'A predefined value from OfferItemCondition specifying the condition of the product or service, or the products or services included in the offer. Also used for product return policies to specify the condition of products accepted for returns.'),
(2916, 1, 6, 'cvdNumVentUse', 'cvdNumVentUse', 'numventuse - MECHANICAL VENTILATORS IN USE: Total number of ventilators in use.'),
(2917, 1, 6, 'modelDate', 'modelDate', 'The release date of a vehicle model (often used to differentiate versions of the same make and model).'),
(2918, 1, 6, 'monoisotopicMolecularWeight', 'monoisotopicMolecularWeight', 'The monoisotopic mass is the sum of the masses of the atoms in a molecule using the unbound, ground-state, rest mass of the principal (most abundant) isotope for each element instead of the isotopic average mass. Please include the units in the form \'&lt;Number&gt; &lt;unit&gt;\', for example \'770.230488 g/mol\' or as \'&lt;QuantitativeValue&gt;.'),
(2919, 1, 6, 'polygon', 'polygon', 'A polygon is the area enclosed by a point-to-point path for which the starting and ending points are the same. A polygon is expressed as a series of four or more space delimited points where the first and final points are identical.'),
(2920, 1, 6, 'legalStatus', 'legalStatus', 'The drug or supplement\'s legal status, including any controlled substance schedules that apply.'),
(2921, 1, 6, 'servesCuisine', 'servesCuisine', 'The cuisine of the restaurant.'),
(2922, 1, 6, 'answerExplanation', 'answerExplanation', 'A step-by-step or full explanation about Answer. Can outline how this Answer was achieved or contain more broad clarification or statement about it. '),
(2923, 1, 6, 'childMaxAge', 'childMaxAge', 'Maximal age of the child.'),
(2924, 1, 6, 'lender', 'lender', 'A sub property of participant. The person that lends the object being borrowed.'),
(2925, 1, 6, 'significance', 'significance', 'The significance associated with the superficial anatomy; as an example, how characteristics of the superficial anatomy can suggest underlying medical conditions or courses of treatment.'),
(2926, 1, 6, 'relatedTo', 'relatedTo', 'The most generic familial relation.'),
(2927, 1, 6, 'shippingSettingsLink', 'shippingSettingsLink', 'Link to a page containing [[ShippingRateSettings]] and [[DeliveryTimeSettings]] details.'),
(2928, 1, 6, 'hasMerchantReturnPolicy', 'hasMerchantReturnPolicy', 'Specifies a MerchantReturnPolicy that may be applicable.'),
(2929, 1, 6, 'variableMeasured', 'variableMeasured', 'The variableMeasured property can indicate (repeated as necessary) the  variables that are measured in some dataset, either described as text or as pairs of identifier and description using PropertyValue.'),
(2930, 1, 6, 'acquireLicensePage', 'acquireLicensePage', 'Indicates a page documenting how licenses can be purchased or otherwise acquired, for the current item.'),
(2931, 1, 6, 'usageInfo', 'usageInfo', 'The schema.org [[usageInfo]] property indicates further information about a [[CreativeWork]]. This property is applicable both to works that are freely available and to those that require payment or other transactions. It can reference additional information, e.g. community expectations on preferred linking and citation conventions, as well as purchasing details. For something that can be commercially licensed, usageInfo can provide detailed, resource-specific information about licensing options.\n\nThis property can be used alongside the license property which indicates license(s) applicable to some piece of content. The usageInfo property can provide information about other licensing options, e.g. acquiring commercial usage rights for an image that is also available under non-commercial creative commons licenses.'),
(2932, 1, 6, 'reviewedBy', 'reviewedBy', 'People or organizations that have reviewed the content on this web page for accuracy and/or completeness.'),
(2933, 1, 6, 'availableDeliveryMethod', 'availableDeliveryMethod', 'The delivery method(s) available for this offer.'),
(2934, 1, 6, 'embedUrl', 'embedUrl', 'A URL pointing to a player for a specific video. In general, this is the information in the ```src``` element of an ```embed``` tag and should not be the same as the content of the ```loc``` tag.'),
(2935, 1, 6, 'option', 'option', 'A sub property of object. The options subject to this action.'),
(2936, 1, 6, 'actionOption', 'actionOption', 'A sub property of object. The options subject to this action.'),
(2937, 1, 6, 'collection', 'collection', 'A sub property of object. The collection target of the action.'),
(2938, 1, 6, 'targetCollection', 'targetCollection', 'A sub property of object. The collection target of the action.'),
(2939, 1, 6, 'encodingType', 'encodingType', 'The supported encoding type(s) for an EntryPoint request.'),
(2940, 1, 6, 'musicReleaseFormat', 'musicReleaseFormat', 'Format of this release (the type of recording media used, i.e. compact disc, digital media, LP, etc.).'),
(2941, 1, 6, 'interactionCount', 'interactionCount', 'This property is deprecated, alongside the UserInteraction types on which it depended.'),
(2942, 1, 6, 'interactionStatistic', 'interactionStatistic', 'The number of interactions for the CreativeWork using the WebSite or SoftwareApplication. The most specific child type of InteractionCounter should be used.'),
(2943, 1, 6, 'worstRating', 'worstRating', 'The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.'),
(2944, 1, 6, 'providerMobility', 'providerMobility', 'Indicates the mobility of a provided service (e.g. \'static\', \'dynamic\').'),
(2945, 1, 6, 'trackingUrl', 'trackingUrl', 'Tracking url for the parcel delivery.'),
(2946, 1, 6, 'departureGate', 'departureGate', 'Identifier of the flight\'s departure gate.'),
(2947, 1, 6, 'paymentStatus', 'paymentStatus', 'The status of payment; whether the invoice has been paid or not.'),
(2948, 1, 6, 'valueAddedTaxIncluded', 'valueAddedTaxIncluded', 'Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.'),
(2949, 1, 6, 'carrier', 'carrier', '\'carrier\' is an out-dated term indicating the \'provider\' for parcel delivery and flights.'),
(2950, 1, 6, 'provider', 'provider', 'The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.'),
(2951, 1, 6, 'geoDisjoint', 'geoDisjoint', 'Represents spatial relations in which two geometries (or the places they represent) are topologically disjoint: \"they have no point in common. They form a set of disconnected geometries.\" (A symmetric relationship, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).)'),
(2952, 1, 6, 'unsaturatedFatContent', 'unsaturatedFatContent', 'The number of grams of unsaturated fat.'),
(2953, 1, 6, 'schemaVersion', 'schemaVersion', 'Indicates (by URL or string) a particular version of a schema used in some CreativeWork. This property was created primarily to\n    indicate the use of a specific schema.org release, e.g. ```10.0``` as a simple string, or more explicitly via URL, ```https://schema.org/docs/releases.html#v10.0```. There may be situations in which other schemas might usefully be referenced this way, e.g. ```http://dublincore.org/specifications/dublin-core/dces/1999-07-02/``` but this has not been carefully explored in the community.'),
(2954, 1, 6, 'speechToTextMarkup', 'speechToTextMarkup', 'Form of markup used. eg. [SSML](https://www.w3.org/TR/speech-synthesis11) or [IPA](https://www.wikidata.org/wiki/Property:P898).'),
(2955, 1, 6, 'reviewCount', 'reviewCount', 'The count of total number of reviews.'),
(2956, 1, 6, 'sourcedFrom', 'sourcedFrom', 'The neurological pathway that originates the neurons.'),
(2957, 1, 6, 'videoFrameSize', 'videoFrameSize', 'The frame size of the video.'),
(2958, 1, 6, 'inProductGroupWithID', 'inProductGroupWithID', 'Indicates the [[productGroupID]] for a [[ProductGroup]] that this product [[isVariantOf]]. '),
(2959, 1, 6, 'numberOfDoors', 'numberOfDoors', 'The number of doors.\\n\\nTypical unit code(s): C62'),
(2960, 1, 6, 'issuedBy', 'issuedBy', 'The organization issuing the ticket or permit.'),
(2961, 1, 6, 'orderItemStatus', 'orderItemStatus', 'The current status of the order item.'),
(2962, 1, 6, 'healthPlanNetworkTier', 'healthPlanNetworkTier', 'The tier(s) for this network.'),
(2963, 1, 6, 'copyrightHolder', 'copyrightHolder', 'The party holding the legal copyright to the CreativeWork.'),
(2964, 1, 6, 'accessibilitySummary', 'accessibilitySummary', 'A human-readable summary of specific accessibility features or deficiencies, consistent with the other accessibility metadata but expressing subtleties such as \"short descriptions are present but long descriptions will be needed for non-visual users\" or \"short descriptions are present and no long descriptions are needed.\"'),
(2965, 1, 6, 'monthsOfExperience', 'monthsOfExperience', 'Indicates the minimal number of months of experience required for a position.'),
(2966, 1, 6, 'primaryImageOfPage', 'primaryImageOfPage', 'Indicates the main image on the page.'),
(2967, 1, 6, 'transcript', 'transcript', 'If this MediaObject is an AudioObject or VideoObject, the transcript of that object.'),
(2968, 1, 6, 'accountOverdraftLimit', 'accountOverdraftLimit', 'An overdraft is an extension of credit from a lending institution when an account reaches zero. An overdraft allows the individual to continue withdrawing money even if the account has no funds in it. Basically the bank allows people to borrow a set amount of money.'),
(2969, 1, 6, 'cvdNumICUBeds', 'cvdNumICUBeds', 'numicubeds - ICU BEDS: Total number of staffed inpatient intensive care unit (ICU) beds.'),
(2970, 1, 6, 'contactType', 'contactType', 'A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.'),
(2971, 1, 6, 'timeRequired', 'timeRequired', 'Approximate or typical time it takes to work with or through this learning resource for the typical intended target audience, e.g. \'PT30M\', \'PT1H25M\'.'),
(2972, 1, 6, 'endorsee', 'endorsee', 'A sub property of participant. The person/organization being supported.'),
(2973, 1, 6, 'relatedLink', 'relatedLink', 'A link related to this web page, for example to other related web pages.'),
(2974, 1, 6, 'tickerSymbol', 'tickerSymbol', 'The exchange traded instrument associated with a Corporation object. The tickerSymbol is expressed as an exchange and an instrument name separated by a space character. For the exchange component of the tickerSymbol attribute, we recommend using the controlled vocabulary of Market Identifier Codes (MIC) specified in ISO 15022.'),
(2975, 1, 6, 'url', 'url', 'URL of the item.'),
(2976, 1, 6, 'associatedArticle', 'associatedArticle', 'A NewsArticle associated with the Media Object.'),
(2977, 1, 6, 'coverageEndTime', 'coverageEndTime', 'The time when the live blog will stop covering the Event. Note that coverage may continue after the Event concludes.'),
(2978, 1, 6, 'publisher', 'publisher', 'The publisher of the creative work.'),
(2979, 1, 6, 'interactivityType', 'interactivityType', 'The predominant mode of learning supported by the learning resource. Acceptable values are \'active\', \'expositive\', or \'mixed\'.'),
(2980, 1, 6, 'studySubject', 'studySubject', 'A subject of the study, i.e. one of the medical conditions, therapies, devices, drugs, etc. investigated by the study.'),
(2981, 1, 6, 'mechanismOfAction', 'mechanismOfAction', 'The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.'),
(2982, 1, 6, 'educationalFramework', 'educationalFramework', 'The framework to which the resource being described is aligned.'),
(2983, 1, 6, 'accessModeSufficient', 'accessModeSufficient', 'A list of single or combined accessModes that are sufficient to understand all the intellectual content of a resource. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessModeSufficient-vocabulary).'),
(2984, 1, 6, 'cookingMethod', 'cookingMethod', 'The method of cooking, such as Frying, Steaming, ...'),
(2985, 1, 6, 'xpath', 'xpath', 'An XPath, e.g. of a [[SpeakableSpecification]] or [[WebPageElement]]. In the latter case, multiple matches within a page can constitute a single conceptual \"Web page element\".'),
(2986, 1, 6, 'printColumn', 'printColumn', 'The number of the column in which the NewsArticle appears in the print edition.'),
(2987, 1, 6, 'surface', 'surface', 'A material used as a surface in some artwork, e.g. Canvas, Paper, Wood, Board, etc.'),
(2988, 1, 6, 'artworkSurface', 'artworkSurface', 'The supporting materials for the artwork, e.g. Canvas, Paper, Wood, Board, etc.'),
(2989, 1, 6, 'trainName', 'trainName', 'The name of the train (e.g. The Orient Express).'),
(2990, 1, 6, 'broadcastFrequencyValue', 'broadcastFrequencyValue', 'The frequency in MHz for a particular broadcast.'),
(2991, 1, 6, 'distance', 'distance', 'The distance travelled, e.g. exercising or travelling.'),
(2992, 1, 6, 'totalJobOpenings', 'totalJobOpenings', 'The number of positions open for this job posting. Use a positive integer. Do not use if the number of positions is unclear or not known.'),
(2993, 1, 6, 'opens', 'opens', 'The opening hour of the place or service on the given day(s) of the week.'),
(2994, 1, 6, 'availableThrough', 'availableThrough', 'After this date, the item will no longer be available for pickup.'),
(2995, 1, 6, 'cheatCode', 'cheatCode', 'Cheat codes to the game.'),
(2996, 1, 6, 'cholesterolContent', 'cholesterolContent', 'The number of milligrams of cholesterol.'),
(2997, 1, 6, 'departurePlatform', 'departurePlatform', 'The platform from which the train departs.'),
(2998, 1, 6, 'upvoteCount', 'upvoteCount', 'The number of upvotes this question, answer or comment has received from the community.'),
(2999, 1, 6, 'termsPerYear', 'termsPerYear', 'The number of times terms of study are offered per year. Semesters and quarters are common units for term. For example, if the student can only take 2 semesters for the program in one year, then termsPerYear should be 2.'),
(3000, 1, 6, 'deliveryStatus', 'deliveryStatus', 'New entry added as the package passes through each leg of its journey (from shipment to final delivery).'),
(3001, 1, 6, 'releaseNotes', 'releaseNotes', 'Description of what changed in this version.'),
(3002, 1, 6, 'warning', 'warning', 'Any FDA or other warnings about the drug (text or URL).'),
(3003, 1, 6, 'businessFunction', 'businessFunction', 'The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.'),
(3004, 1, 6, 'hasEnergyConsumptionDetails', 'hasEnergyConsumptionDetails', 'Defines the energy efficiency Category (also known as \"class\" or \"rating\") for a product according to an international energy efficiency standard.'),
(3005, 1, 6, 'device', 'device', 'Device required to run the application. Used in cases where a specific make/model is required to run the application.'),
(3006, 1, 6, 'availableOnDevice', 'availableOnDevice', 'Device required to run the application. Used in cases where a specific make/model is required to run the application.'),
(3007, 1, 6, 'numberOfPages', 'numberOfPages', 'The number of pages in the book.'),
(3008, 1, 6, 'requiredMaxAge', 'requiredMaxAge', 'Audiences defined by a person\'s maximum age.'),
(3009, 1, 6, 'ticketNumber', 'ticketNumber', 'The unique identifier for the ticket.'),
(3010, 1, 6, 'clincalPharmacology', 'clincalPharmacology', 'Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).'),
(3011, 1, 6, 'clinicalPharmacology', 'clinicalPharmacology', 'Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).'),
(3012, 1, 6, 'softwareHelp', 'softwareHelp', 'Software application help.'),
(3013, 1, 6, 'securityScreening', 'securityScreening', 'The type of security screening the passenger is subject to.'),
(3014, 1, 6, 'downloadUrl', 'downloadUrl', 'If the file can be downloaded, URL to download the binary.'),
(3015, 1, 6, 'incentives', 'incentives', 'Description of bonus and commission compensation aspects of the job.'),
(3016, 1, 6, 'incentiveCompensation', 'incentiveCompensation', 'Description of bonus and commission compensation aspects of the job.'),
(3017, 1, 6, 'deathPlace', 'deathPlace', 'The place where the person died.'),
(3018, 1, 6, 'connectedTo', 'connectedTo', 'Other anatomical structures to which this structure is connected.'),
(3019, 1, 6, 'specialty', 'specialty', 'One of the domain specialities to which this web page\'s content applies.'),
(3020, 1, 6, 'accommodationFloorPlan', 'accommodationFloorPlan', 'A floorplan of some [[Accommodation]].'),
(3021, 1, 6, 'jobStartDate', 'jobStartDate', 'The date on which a successful applicant for this job would be expected to start work. Choose a specific date in the future or use the jobImmediateStart property to indicate the position is to be filled as soon as possible.'),
(3022, 1, 6, 'hasDeliveryMethod', 'hasDeliveryMethod', 'Method used for delivery or shipping.'),
(3023, 1, 6, 'procedureType', 'procedureType', 'The type of procedure, for example Surgical, Noninvasive, or Percutaneous.'),
(3024, 1, 6, 'liveBlogUpdate', 'liveBlogUpdate', 'An update to the LiveBlog.'),
(3025, 1, 6, 'license', 'license', 'A license document that applies to this content, typically indicated by URL.'),
(3026, 1, 6, 'iso6523Code', 'iso6523Code', 'An organization identifier as defined in ISO 6523(-1). Note that many existing organization identifiers such as [leiCode](https://schema.org/leiCode), [duns](https://schema.org/duns) and [vatID](https://schema.org/vatID) can be expressed as an ISO 6523 identifier by setting the ICD part of the ISO 6523 identifier accordingly. '),
(3027, 1, 6, 'expectedPrognosis', 'expectedPrognosis', 'The likely outcome in either the short term or long term of the medical condition.'),
(3028, 1, 6, 'programmingLanguage', 'programmingLanguage', 'The computer programming language.'),
(3029, 1, 6, 'contentSize', 'contentSize', 'File size in (mega/kilo)bytes.'),
(3030, 1, 6, 'tocContinuation', 'tocContinuation', 'A [[HyperTocEntry]] can have a [[tocContinuation]] indicated, which is another [[HyperTocEntry]] that would be the default next item to play or render.'),
(3031, 1, 6, 'contentRating', 'contentRating', 'Official rating of a piece of content&#x2014;for example, \'MPAA PG-13\'.'),
(3032, 1, 6, 'albumProductionType', 'albumProductionType', 'Classification of the album by its type of content: soundtrack, live album, studio album, etc.'),
(3033, 1, 6, 'articleBody', 'articleBody', 'The actual body of the article.'),
(3034, 1, 6, 'accountId', 'accountId', 'The identifier for the account the payment will be applied to.'),
(3035, 1, 6, 'paymentMethodId', 'paymentMethodId', 'An identifier for the method of payment used (e.g. the last 4 digits of the credit card).'),
(3036, 1, 6, 'weight', 'weight', 'The weight of the product or person.'),
(3037, 1, 6, 'potentialAction', 'potentialAction', 'Indicates a potential Action, which describes an idealized action in which this thing would play an \'object\' role.'),
(3038, 1, 6, 'suggestedMeasurement', 'suggestedMeasurement', 'A suggested range of body measurements for the intended audience or person, for example inseam between 32 and 34 inches or height between 170 and 190 cm. Typically found on a size chart for wearable products.'),
(3039, 1, 6, 'softwareVersion', 'softwareVersion', 'Version of the software instance.'),
(3040, 1, 6, 'streetAddress', 'streetAddress', 'The street address. For example, 1600 Amphitheatre Pkwy.'),
(3041, 1, 6, 'serviceSmsNumber', 'serviceSmsNumber', 'The number to access the service by text message.'),
(3042, 1, 6, 'webCheckinTime', 'webCheckinTime', 'The time when a passenger can check into the flight online.'),
(3043, 1, 6, 'tributary', 'tributary', 'The anatomical or organ system that the vein flows into; a larger structure that the vein connects to.'),
(3044, 1, 6, 'discussionUrl', 'discussionUrl', 'A link to the page containing the comments of the CreativeWork.'),
(3045, 1, 6, 'parentTaxon', 'parentTaxon', 'Closest parent taxon of the taxon in question.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(3046, 1, 6, 'childTaxon', 'childTaxon', 'Closest child taxa of the taxon in question.'),
(3047, 1, 6, 'subjectOf', 'subjectOf', 'A CreativeWork or Event about this Thing.'),
(3048, 1, 6, 'about', 'about', 'The subject matter of the content.'),
(3049, 1, 6, 'holdingArchive', 'holdingArchive', '[[ArchiveOrganization]] that holds, keeps or maintains the [[ArchiveComponent]].'),
(3050, 1, 6, 'archiveHeld', 'archiveHeld', 'Collection, [fonds](https://en.wikipedia.org/wiki/Fonds), or item held, kept or maintained by an [[ArchiveOrganization]].'),
(3051, 1, 6, 'dataset', 'dataset', 'A dataset contained in this catalog.'),
(3052, 1, 6, 'offeredBy', 'offeredBy', 'A pointer to the organization or person making the offer.'),
(3053, 1, 6, 'makesOffer', 'makesOffer', 'A pointer to products or services offered by the organization or person.'),
(3054, 1, 6, 'offers', 'offers', 'An offer to provide this item&#x2014;for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use [[businessFunction]] to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a [[Demand]]. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.\n      '),
(3055, 1, 6, 'itemOffered', 'itemOffered', 'An item being offered (or demanded). The transactional nature of the offer or demand is documented using [[businessFunction]], e.g. sell, lease etc. While several common expected types are listed explicitly in this definition, others can be used. Using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.'),
(3056, 1, 6, 'mainEntityOfPage', 'mainEntityOfPage', 'Indicates a page (or other CreativeWork) for which this thing is the main entity being described. See [background notes](/docs/datamodel.html#mainEntityBackground) for details.'),
(3057, 1, 6, 'mainEntity', 'mainEntity', 'Indicates the primary entity described in some page or other CreativeWork.'),
(3058, 1, 6, 'hasBioChemEntityPart', 'hasBioChemEntityPart', 'Indicates a BioChemEntity that (in some sense) has this BioChemEntity as a part. '),
(3059, 1, 6, 'isPartOfBioChemEntity', 'isPartOfBioChemEntity', 'Indicates a BioChemEntity that is (in some sense) a part of this BioChemEntity. '),
(3060, 1, 6, 'funding', 'funding', 'A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].'),
(3061, 1, 6, 'fundedItem', 'fundedItem', 'Indicates something directly or indirectly funded or sponsored through a [[Grant]]. See also [[ownershipFundingInfo]].'),
(3062, 1, 6, 'isEncodedByBioChemEntity', 'isEncodedByBioChemEntity', 'Another BioChemEntity encoding by this one.'),
(3063, 1, 6, 'encodesBioChemEntity', 'encodesBioChemEntity', 'Another BioChemEntity encoded by this one. '),
(3064, 1, 6, 'providesBroadcastService', 'providesBroadcastService', 'The BroadcastService offered on this channel.'),
(3065, 1, 6, 'hasBroadcastChannel', 'hasBroadcastChannel', 'A broadcast channel of a broadcast service.'),
(3066, 1, 6, 'recordedAs', 'recordedAs', 'An audio recording of the work.'),
(3067, 1, 6, 'recordingOf', 'recordingOf', 'The composition this track is a recording of.'),
(3068, 1, 6, 'releaseOf', 'releaseOf', 'The album this is a release of.'),
(3069, 1, 6, 'albumRelease', 'albumRelease', 'A release of this album.'),
(3070, 1, 6, 'partOfTrip', 'partOfTrip', 'Identifies that this [[Trip]] is a subTrip of another Trip.  For example Day 1, Day 2, etc. of a multi-day trip.'),
(3071, 1, 6, 'subTrip', 'subTrip', 'Identifies a [[Trip]] that is a subTrip of this Trip.  For example Day 1, Day 2, etc. of a multi-day trip.'),
(3072, 1, 6, 'encodesCreativeWork', 'encodesCreativeWork', 'The CreativeWork encoded by this media object.'),
(3073, 1, 6, 'subOrganization', 'subOrganization', 'A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific \'department\' property.'),
(3074, 1, 6, 'isVariantOf', 'isVariantOf', 'Indicates the kind of product that this is a variant of. In the case of [[ProductModel]], this is a pointer (from a ProductModel) to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive. In the case of a [[ProductGroup]], the group description also serves as a template, representing a set of Products that vary on explicitly defined, specific dimensions only (so it defines both a set of variants, as well as which values distinguish amongst those variants). When used with [[ProductGroup]], this property can apply to any [[Product]] included in the group.'),
(3075, 1, 6, 'hasVariant', 'hasVariant', 'Indicates a [[Product]] that is a member of this [[ProductGroup]] (or [[ProductModel]]).'),
(3076, 1, 6, 'gameServer', 'gameServer', 'The server on which  it is possible to play the game.'),
(3077, 1, 6, 'game', 'game', 'Video game which is played on this server.'),
(3078, 1, 6, 'containsSeason', 'containsSeason', 'A season that is part of the media series.'),
(3079, 1, 6, 'workTranslation', 'workTranslation', 'A work that is a translation of the content of this work. E.g. 西遊記 has an English workTranslation “Journey to the West”, a German workTranslation “Monkeys Pilgerfahrt” and a Vietnamese  translation Tây du ký bình khảo.'),
(3080, 1, 6, 'translationOfWork', 'translationOfWork', 'The work that this work has been translated from. E.g. 物种起源 is a translationOf “On the Origin of Species”.'),
(3081, 1, 6, 'alumniOf', 'alumniOf', 'An organization that the person is an alumni of.'),
(3082, 1, 6, 'alumni', 'alumni', 'Alumni of an organization.'),
(3083, 1, 6, 'recordedAt', 'recordedAt', 'The Event where the CreativeWork was recorded. The CreativeWork may capture all or part of the event.'),
(3084, 1, 6, 'recordedIn', 'recordedIn', 'The CreativeWork that captured all or part of this Event.'),
(3085, 1, 6, 'containsPlace', 'containsPlace', 'The basic containment relation between a place and another that it contains.'),
(3086, 1, 6, 'exampleOfWork', 'exampleOfWork', 'A creative work that this work is an example/instance/realization/derivation of.'),
(3087, 1, 6, 'contentLocation', 'contentLocation', 'The location depicted or described in the content. For example, the location in a photograph or painting.'),
(3088, 1, 6, 'superEvent', 'superEvent', 'An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(1, 1, 23, NULL, NULL, 'Organisaties A-Z', 1, '2023-04-06 09:13:58', '2023-04-06 09:15:57', 'Omeka\\Entity\\ItemSet'),
(2, 1, 23, NULL, NULL, 'Personen 0-9', 1, '2023-04-06 09:14:15', '2023-04-06 09:15:48', 'Omeka\\Entity\\ItemSet'),
(3, 1, NULL, NULL, NULL, 'AAA', 1, '2023-04-06 09:14:39', '2023-04-06 09:14:39', 'Omeka\\Entity\\Item'),
(4, 1, NULL, NULL, NULL, 'BBB', 1, '2023-04-06 09:14:51', '2023-04-06 09:14:51', 'Omeka\\Entity\\Item'),
(5, 1, NULL, NULL, NULL, 'CCC', 1, '2023-04-06 09:15:02', '2023-04-06 09:15:02', 'Omeka\\Entity\\Item'),
(6, 1, NULL, NULL, NULL, 'DDD', 1, '2023-04-06 09:15:12', '2023-04-06 09:15:12', 'Omeka\\Entity\\Item'),
(7, 1, NULL, NULL, NULL, '111', 1, '2023-04-06 09:16:10', '2023-04-06 09:16:10', 'Omeka\\Entity\\Item'),
(8, 1, NULL, NULL, NULL, '222', 1, '2023-04-06 09:16:26', '2023-04-06 09:16:26', 'Omeka\\Entity\\Item'),
(9, 1, NULL, NULL, NULL, '333', 1, '2023-04-06 09:16:35', '2023-04-06 09:16:35', 'Omeka\\Entity\\Item'),
(10, 1, NULL, NULL, NULL, '444', 1, '2023-04-06 09:16:52', '2023-04-06 09:16:52', 'Omeka\\Entity\\Item'),
(21, 1, 1604, 9, NULL, 'personen.ttl', 1, '2023-04-26 16:01:53', '2023-04-26 16:11:43', 'Omeka\\Entity\\Item'),
(22, 1, 1681, 8, NULL, 'Personen', 1, '2023-04-26 16:03:29', '2023-04-26 16:03:29', 'Omeka\\Entity\\Item'),
(23, 1, 1788, 7, NULL, 'Test', 1, '2023-04-26 16:04:53', '2023-04-26 16:05:13', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(999, 1, 6, 'HinduTemple', 'HinduTemple', 'A Hindu temple.'),
(1000, 1, 6, 'FMRadioChannel', 'FMRadioChannel', 'A radio channel that uses FM.'),
(1001, 1, 6, 'BikeStore', 'BikeStore', 'A bike store.'),
(1002, 1, 6, 'HVACBusiness', 'HVACBusiness', 'A business that provides Heating, Ventilation and Air Conditioning services.'),
(1003, 1, 6, 'ChildrensEvent', 'ChildrensEvent', 'Event type: Children\'s event.'),
(1004, 1, 6, 'TireShop', 'TireShop', 'A tire shop.'),
(1005, 1, 6, 'ComedyEvent', 'ComedyEvent', 'Event type: Comedy event.'),
(1006, 1, 6, 'HardwareStore', 'HardwareStore', 'A hardware store.'),
(1007, 1, 6, 'SpreadsheetDigitalDocument', 'SpreadsheetDigitalDocument', 'A spreadsheet file.'),
(1008, 1, 6, 'PreventionIndication', 'PreventionIndication', 'An indication for preventing an underlying condition, symptom, etc.'),
(1009, 1, 6, 'Hotel', 'Hotel', 'A hotel is an establishment that provides lodging paid on a short-term basis (source: Wikipedia, the free encyclopedia, see http://en.wikipedia.org/wiki/Hotel).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1010, 1, 6, 'ReviewNewsArticle', 'ReviewNewsArticle', 'A [[NewsArticle]] and [[CriticReview]] providing a professional critic\'s assessment of a service, product, performance, or artistic or literary work.'),
(1011, 1, 6, 'ScheduleAction', 'ScheduleAction', 'Scheduling future actions, events, or tasks.\\n\\nRelated actions:\\n\\n* [[ReserveAction]]: Unlike ReserveAction, ScheduleAction allocates future actions (e.g. an event, a task, etc) towards a time slot / spatial allocation.'),
(1012, 1, 6, 'AutoBodyShop', 'AutoBodyShop', 'Auto body shop.'),
(1013, 1, 6, 'ToyStore', 'ToyStore', 'A toy store.'),
(1014, 1, 6, 'ReportageNewsArticle', 'ReportageNewsArticle', 'The [[ReportageNewsArticle]] type is a subtype of [[NewsArticle]] representing\n news articles which are the result of journalistic news reporting conventions.\n\nIn practice many news publishers produce a wide variety of article types, many of which might be considered a [[NewsArticle]] but not a [[ReportageNewsArticle]]. For example, opinion pieces, reviews, analysis, sponsored or satirical articles, or articles that combine several of these elements.\n\nThe [[ReportageNewsArticle]] type is based on a stricter ideal for \"news\" as a work of journalism, with articles based on factual information either observed or verified by the author, or reported and verified from knowledgeable sources.  This often includes perspectives from multiple viewpoints on a particular issue (distinguishing news reports from public relations or propaganda).  News reports in the [[ReportageNewsArticle]] sense de-emphasize the opinion of the author, with commentary and value judgements typically expressed elsewhere.\n\nA [[ReportageNewsArticle]] which goes deeper into analysis can also be marked with an additional type of [[AnalysisNewsArticle]].\n'),
(1015, 1, 6, 'AnalysisNewsArticle', 'AnalysisNewsArticle', 'An AnalysisNewsArticle is a [[NewsArticle]] that, while based on factual reporting, incorporates the expertise of the author/producer, offering interpretations and conclusions.'),
(1016, 1, 6, 'Dentist', 'Dentist', 'A dentist.'),
(1017, 1, 6, 'SubscribeAction', 'SubscribeAction', 'The act of forming a personal connection with someone/something (object) unidirectionally/asymmetrically to get updates pushed to.\\n\\nRelated actions:\\n\\n* [[FollowAction]]: Unlike FollowAction, SubscribeAction implies that the subscriber acts as a passive agent being constantly/actively pushed for updates.\\n* [[RegisterAction]]: Unlike RegisterAction, SubscribeAction implies that the agent is interested in continuing receiving updates from the object.\\n* [[JoinAction]]: Unlike JoinAction, SubscribeAction implies that the agent is interested in continuing receiving updates from the object.'),
(1018, 1, 6, 'BowlingAlley', 'BowlingAlley', 'A bowling alley.'),
(1019, 1, 6, 'InvestmentFund', 'InvestmentFund', 'A company or fund that gathers capital from a number of investors to create a pool of money that is then re-invested into stocks, bonds and other assets.'),
(1020, 1, 6, 'RadioSeason', 'RadioSeason', 'Season dedicated to radio broadcast and associated online delivery.'),
(1021, 1, 6, 'MovieClip', 'MovieClip', 'A short segment/part of a movie.'),
(1022, 1, 6, 'OfferForPurchase', 'OfferForPurchase', 'An [[OfferForPurchase]] in Schema.org represents an [[Offer]] to sell something, i.e. an [[Offer]] whose\n  [[businessFunction]] is [sell](http://purl.org/goodrelations/v1#Sell.). See [Good Relations](https://en.wikipedia.org/wiki/GoodRelations) for\n  background on the underlying concepts.\n  '),
(1023, 1, 6, 'ImageObjectSnapshot', 'ImageObjectSnapshot', 'A specific and exact (byte-for-byte) version of an [[ImageObject]]. Two byte-for-byte identical files, for the purposes of this type, considered identical. If they have different embedded metadata (e.g. XMP, EXIF) the files will differ. Different external facts about the files, e.g. creator or dateCreated that aren\'t represented in their actual content, do not affect this notion of identity.'),
(1024, 1, 6, 'NailSalon', 'NailSalon', 'A nail salon.'),
(1025, 1, 6, 'WPHeader', 'WPHeader', 'The header section of the page.'),
(1026, 1, 6, 'DryCleaningOrLaundry', 'DryCleaningOrLaundry', 'A dry-cleaning business.'),
(1027, 1, 6, 'RiverBodyOfWater', 'RiverBodyOfWater', 'A river (for example, the broad majestic Shannon).'),
(1028, 1, 6, 'UnRegisterAction', 'UnRegisterAction', 'The act of un-registering from a service.\\n\\nRelated actions:\\n\\n* [[RegisterAction]]: antonym of UnRegisterAction.\\n* [[LeaveAction]]: Unlike LeaveAction, UnRegisterAction implies that you are unregistering from a service you were previously registered, rather than leaving a team/group of people.'),
(1029, 1, 6, 'Drawing', 'Drawing', 'A picture or diagram made with a pencil, pen, or crayon rather than paint.'),
(1030, 1, 6, 'MedicalRiskCalculator', 'MedicalRiskCalculator', 'A complex mathematical calculation requiring an online calculator, used to assess prognosis. Note: use the url property of Thing to record any URLs for online calculators.'),
(1031, 1, 6, 'RadioStation', 'RadioStation', 'A radio station.'),
(1032, 1, 6, 'BackgroundNewsArticle', 'BackgroundNewsArticle', 'A [[NewsArticle]] providing historical context, definition and detail on a specific topic (aka \"explainer\" or \"backgrounder\"). For example, an in-depth article or frequently-asked-questions ([FAQ](https://en.wikipedia.org/wiki/FAQ)) document on topics such as Climate Change or the European Union. Other kinds of background material from a non-news setting are often described using [[Book]] or [[Article]], in particular [[ScholarlyArticle]]. See also [[NewsArticle]] for related vocabulary from a learning/education perspective.'),
(1033, 1, 6, 'DiscussionForumPosting', 'DiscussionForumPosting', 'A posting to a discussion forum.'),
(1034, 1, 6, 'UserTweets', 'UserTweets', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1035, 1, 6, 'Festival', 'Festival', 'Event type: Festival.'),
(1036, 1, 6, 'ResearchOrganization', 'ResearchOrganization', 'A Research Organization (e.g. scientific institute, research company).'),
(1037, 1, 6, 'Mountain', 'Mountain', 'A mountain, like Mount Whitney or Mount Everest.'),
(1038, 1, 6, 'Motorcycle', 'Motorcycle', 'A motorcycle or motorbike is a single-track, two-wheeled motor vehicle.'),
(1039, 1, 6, 'VeterinaryCare', 'VeterinaryCare', 'A vet\'s office.'),
(1040, 1, 6, 'FoodService', 'FoodService', 'A food service, like breakfast, lunch, or dinner.'),
(1041, 1, 6, 'MobilePhoneStore', 'MobilePhoneStore', 'A store that sells mobile phones and related accessories.'),
(1042, 1, 6, 'ApprovedIndication', 'ApprovedIndication', 'An indication for a medical therapy that has been formally specified or approved by a regulatory body that regulates use of the therapy; for example, the US FDA approves indications for most drugs in the US.'),
(1043, 1, 6, 'TelevisionChannel', 'TelevisionChannel', 'A unique instance of a television BroadcastService on a CableOrSatelliteService lineup.'),
(1044, 1, 6, 'DiagnosticProcedure', 'DiagnosticProcedure', 'A medical procedure intended primarily for diagnostic, as opposed to therapeutic, purposes.'),
(1045, 1, 6, 'Statement', 'Statement', 'A statement about something, for example a fun or interesting fact. If known, the main entity this statement is about can be indicated using mainEntity. For more formal claims (e.g. in Fact Checking), consider using [[Claim]] instead. Use the [[text]] property to capture the text of the statement.'),
(1046, 1, 6, 'Cemetery', 'Cemetery', 'A graveyard.'),
(1047, 1, 6, 'TravelAgency', 'TravelAgency', 'A travel agency.'),
(1048, 1, 6, 'BusinessEvent', 'BusinessEvent', 'Event type: Business event.'),
(1049, 1, 6, 'CurrencyConversionService', 'CurrencyConversionService', 'A service to convert funds from one currency to another currency.'),
(1050, 1, 6, 'UserPlusOnes', 'UserPlusOnes', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1051, 1, 6, 'Reservoir', 'Reservoir', 'A reservoir of water, typically an artificially created lake, like the Lake Kariba reservoir.'),
(1052, 1, 6, 'SuspendAction', 'SuspendAction', 'The act of momentarily pausing a device or application (e.g. pause music playback or pause a timer).'),
(1053, 1, 6, 'LiquorStore', 'LiquorStore', 'A shop that sells alcoholic drinks such as wine, beer, whisky and other spirits.'),
(1054, 1, 6, 'IceCreamShop', 'IceCreamShop', 'An ice cream shop.'),
(1055, 1, 6, 'DaySpa', 'DaySpa', 'A day spa.'),
(1056, 1, 6, 'RegisterAction', 'RegisterAction', 'The act of registering to be a user of a service, product or web page.\\n\\nRelated actions:\\n\\n* [[JoinAction]]: Unlike JoinAction, RegisterAction implies you are registering to be a user of a service, *not* a group/team of people.\\n* [[FollowAction]]: Unlike FollowAction, RegisterAction doesn\'t imply that the agent is expecting to poll for updates from the object.\\n* [[SubscribeAction]]: Unlike SubscribeAction, RegisterAction doesn\'t imply that the agent is expecting updates from the object.'),
(1057, 1, 6, 'PostOffice', 'PostOffice', 'A post office.'),
(1058, 1, 6, 'CafeOrCoffeeShop', 'CafeOrCoffeeShop', 'A cafe or coffee shop.'),
(1059, 1, 6, 'PsychologicalTreatment', 'PsychologicalTreatment', 'A process of care relying upon counseling, dialogue and communication  aimed at improving a mental health condition without use of drugs.'),
(1060, 1, 6, 'BookSeries', 'BookSeries', 'A series of books. Included books can be indicated with the hasPart property.'),
(1061, 1, 6, 'AgreeAction', 'AgreeAction', 'The act of expressing a consistency of opinion with the object. An agent agrees to/about an object (a proposition, topic or theme) with participants.'),
(1062, 1, 6, 'GolfCourse', 'GolfCourse', 'A golf course.'),
(1063, 1, 6, 'ArriveAction', 'ArriveAction', 'The act of arriving at a place. An agent arrives at a destination from a fromLocation, optionally with participants.'),
(1064, 1, 6, 'TheaterEvent', 'TheaterEvent', 'Event type: Theater performance.'),
(1065, 1, 6, 'CampingPitch', 'CampingPitch', 'A [[CampingPitch]] is an individual place for overnight stay in the outdoors, typically being part of a larger camping site, or [[Campground]].\\n\\n\nIn British English a campsite, or campground, is an area, usually divided into a number of pitches, where people can camp overnight using tents or camper vans or caravans; this British English use of the word is synonymous with the American English expression campground. In American English the term campsite generally means an area where an individual, family, group, or military unit can pitch a tent or park a camper; a campground may contain many campsites.\n(Source: Wikipedia, see [https://en.wikipedia.org/wiki/Campsite](https://en.wikipedia.org/wiki/Campsite).)\\n\\n\nSee also the dedicated [document on the use of schema.org for marking up hotels and other forms of accommodations](/docs/hotels.html).\n'),
(1066, 1, 6, 'InternetCafe', 'InternetCafe', 'An internet cafe.'),
(1067, 1, 6, 'ClothingStore', 'ClothingStore', 'A clothing store.'),
(1068, 1, 6, 'MovingCompany', 'MovingCompany', 'A moving company.'),
(1069, 1, 6, 'MotorcycleDealer', 'MotorcycleDealer', 'A motorcycle dealer.'),
(1070, 1, 6, 'Researcher', 'Researcher', 'Researchers.'),
(1071, 1, 6, 'DepositAccount', 'DepositAccount', 'A type of Bank Account with a main purpose of depositing funds to gain interest or other benefits.'),
(1072, 1, 6, 'PodcastSeason', 'PodcastSeason', 'A single season of a podcast. Many podcasts do not break down into separate seasons. In that case, PodcastSeries should be used.'),
(1073, 1, 6, 'OnlineStore', 'OnlineStore', 'An eCommerce site.'),
(1074, 1, 6, 'LikeAction', 'LikeAction', 'The act of expressing a positive sentiment about the object. An agent likes an object (a proposition, topic or theme) with participants.'),
(1075, 1, 6, 'WPFooter', 'WPFooter', 'The footer section of the page.'),
(1076, 1, 6, 'ExhibitionEvent', 'ExhibitionEvent', 'Event type: Exhibition event, e.g. at a museum, library, archive, tradeshow, ...'),
(1077, 1, 6, 'RecyclingCenter', 'RecyclingCenter', 'A recycling center.'),
(1078, 1, 6, 'HealthClub', 'HealthClub', 'A health club.'),
(1079, 1, 6, 'CovidTestingFacility', 'CovidTestingFacility', 'A CovidTestingFacility is a [[MedicalClinic]] where testing for the COVID-19 Coronavirus\n      disease is available. If the facility is being made available from an established [[Pharmacy]], [[Hotel]], or other\n      non-medical organization, multiple types can be listed. This makes it easier to re-use existing schema.org information\n      about that place, e.g. contact info, address, opening hours. Note that in an emergency, such information may not always be reliable.\n      '),
(1080, 1, 6, 'NightClub', 'NightClub', 'A nightclub or discotheque.'),
(1081, 1, 6, 'UserBlocks', 'UserBlocks', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1082, 1, 6, 'OnDemandEvent', 'OnDemandEvent', 'A publication event, e.g. catch-up TV or radio podcast, during which a program is available on-demand.'),
(1083, 1, 6, 'ListenAction', 'ListenAction', 'The act of consuming audio content.'),
(1084, 1, 6, 'ProfessionalService', 'ProfessionalService', 'Original definition: \"provider of professional services.\"\\n\\nThe general [[ProfessionalService]] type for local businesses was deprecated due to confusion with [[Service]]. For reference, the types that it included were: [[Dentist]],\n        [[AccountingService]], [[Attorney]], [[Notary]], as well as types for several kinds of [[HomeAndConstructionBusiness]]: [[Electrician]], [[GeneralContractor]],\n        [[HousePainter]], [[Locksmith]], [[Plumber]], [[RoofingContractor]]. [[LegalService]] was introduced as a more inclusive supertype of [[Attorney]].'),
(1085, 1, 6, 'MovieRentalStore', 'MovieRentalStore', 'A movie rental store.'),
(1086, 1, 6, 'BarOrPub', 'BarOrPub', 'A bar or pub.'),
(1087, 1, 6, 'AutoPartsStore', 'AutoPartsStore', 'An auto parts store.'),
(1088, 1, 6, 'CreditCard', 'CreditCard', 'A card payment method of a particular brand or name.  Used to mark up a particular payment method and/or the financial product/service that supplies the card account.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#AmericanExpress\\n* http://purl.org/goodrelations/v1#DinersClub\\n* http://purl.org/goodrelations/v1#Discover\\n* http://purl.org/goodrelations/v1#JCB\\n* http://purl.org/goodrelations/v1#MasterCard\\n* http://purl.org/goodrelations/v1#VISA\n       '),
(1089, 1, 6, 'OceanBodyOfWater', 'OceanBodyOfWater', 'An ocean (for example, the Pacific).'),
(1090, 1, 6, 'AutoDealer', 'AutoDealer', 'An car dealership.'),
(1091, 1, 6, 'PhysicalTherapy', 'PhysicalTherapy', 'A process of progressive physical care and rehabilitation aimed at improving a health condition.'),
(1092, 1, 6, 'PodcastEpisode', 'PodcastEpisode', 'A single episode of a podcast series.'),
(1093, 1, 6, 'WorkersUnion', 'WorkersUnion', 'A Workers Union (also known as a Labor Union, Labour Union, or Trade Union) is an organization that promotes the interests of its worker members by collectively bargaining with management, organizing, and political lobbying.'),
(1094, 1, 6, 'QuoteAction', 'QuoteAction', 'An agent quotes/estimates/appraises an object/product/service with a price at a location/store.'),
(1095, 1, 6, 'Zoo', 'Zoo', 'A zoo.'),
(1096, 1, 6, 'FundingScheme', 'FundingScheme', 'A FundingScheme combines organizational, project and policy aspects of grant-based funding\n    that sets guidelines, principles and mechanisms to support other kinds of projects and activities.\n    Funding is typically organized via [[Grant]] funding. Examples of funding schemes: Swiss Priority Programmes (SPPs); EU Framework 7 (FP7); Horizon 2020; the NIH-R01 Grant Program; Wellcome institutional strategic support fund. For large scale public sector funding, the management and administration of grant awards is often handled by other, dedicated, organizations - [[FundingAgency]]s such as ERC, REA, ...'),
(1097, 1, 6, 'AutomatedTeller', 'AutomatedTeller', 'ATM/cash machine.'),
(1098, 1, 6, 'CompleteDataFeed', 'CompleteDataFeed', 'A [[CompleteDataFeed]] is a [[DataFeed]] whose standard representation includes content for every item currently in the feed.\n\nThis is the equivalent of Atom\'s element as defined in Feed Paging and Archiving [RFC 5005](https://tools.ietf.org/html/rfc5005), for example (and as defined for Atom), when using data from a feed that represents a collection of items that varies over time (e.g. \"Top Twenty Records\") there is no need to have newer entries mixed in alongside older, obsolete entries. By marking this feed as a CompleteDataFeed, old entries can be safely discarded when the feed is refreshed, since we can assume the feed has provided descriptions for all current items.'),
(1099, 1, 6, 'NoteDigitalDocument', 'NoteDigitalDocument', 'A file containing a note, primarily for the author.'),
(1100, 1, 6, 'TelevisionStation', 'TelevisionStation', 'A television station.'),
(1101, 1, 6, 'SportingGoodsStore', 'SportingGoodsStore', 'A sporting goods store.'),
(1102, 1, 6, 'BloodTest', 'BloodTest', 'A medical test performed on a sample of a patient\'s blood.'),
(1103, 1, 6, 'SaleEvent', 'SaleEvent', 'Event type: Sales event.'),
(1104, 1, 6, 'AutoRental', 'AutoRental', 'A car rental business.'),
(1105, 1, 6, 'MusicVenue', 'MusicVenue', 'A music venue.'),
(1106, 1, 6, 'Pond', 'Pond', 'A pond.'),
(1107, 1, 6, 'PrependAction', 'PrependAction', 'The act of inserting at the beginning if an ordered collection.'),
(1108, 1, 6, 'AMRadioChannel', 'AMRadioChannel', 'A radio channel that uses AM.'),
(1109, 1, 6, 'Casino', 'Casino', 'A casino.'),
(1110, 1, 6, 'UserDownloads', 'UserDownloads', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1111, 1, 6, 'Volcano', 'Volcano', 'A volcano, like Fujisan.'),
(1112, 1, 6, 'AmpStory', 'AmpStory', 'A creative work with a visual storytelling format intended to be viewed online, particularly on mobile devices.'),
(1113, 1, 6, 'Notary', 'Notary', 'A notary.'),
(1114, 1, 6, 'HowToTip', 'HowToTip', 'An explanation in the instructions for how to achieve a result. It provides supplementary information about a technique, supply, author\'s preference, etc. It can explain what could be done, or what should not be done, but doesn\'t specify what should be done (see HowToDirection).'),
(1115, 1, 6, 'Campground', 'Campground', 'A camping site, campsite, or [[Campground]] is a place used for overnight stay in the outdoors, typically containing individual [[CampingPitch]] locations. \\n\\n\nIn British English a campsite is an area, usually divided into a number of pitches, where people can camp overnight using tents or camper vans or caravans; this British English use of the word is synonymous with the American English expression campground. In American English the term campsite generally means an area where an individual, family, group, or military unit can pitch a tent or park a camper; a campground may contain many campsites (source: Wikipedia, see [https://en.wikipedia.org/wiki/Campsite](https://en.wikipedia.org/wiki/Campsite)).\\n\\n\n\nSee also the dedicated [document on the use of schema.org for marking up hotels and other forms of accommodations](/docs/hotels.html).\n'),
(1116, 1, 6, 'SchoolDistrict', 'SchoolDistrict', 'A School District is an administrative area for the administration of schools.'),
(1117, 1, 6, 'WearAction', 'WearAction', 'The act of dressing oneself in clothing.'),
(1118, 1, 6, 'WPSideBar', 'WPSideBar', 'A sidebar section of the page.'),
(1119, 1, 6, 'PublicToilet', 'PublicToilet', 'A public toilet is a room or small building containing one or more toilets (and possibly also urinals) which is available for use by the general public, or by customers or employees of certain businesses.'),
(1120, 1, 6, 'ReserveAction', 'ReserveAction', 'Reserving a concrete object.\\n\\nRelated actions:\\n\\n* [[ScheduleAction]]: Unlike ScheduleAction, ReserveAction reserves concrete objects (e.g. a table, a hotel) towards a time slot / spatial allocation.'),
(1121, 1, 6, 'TrainReservation', 'TrainReservation', 'A reservation for train travel.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(1122, 1, 6, 'DeleteAction', 'DeleteAction', 'The act of editing a recipient by removing one of its objects.'),
(1123, 1, 6, 'AmusementPark', 'AmusementPark', 'An amusement park.'),
(1124, 1, 6, 'Painting', 'Painting', 'A painting.'),
(1125, 1, 6, 'UserCheckins', 'UserCheckins', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1126, 1, 6, 'BoatReservation', 'BoatReservation', 'A reservation for boat travel.\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(1127, 1, 6, 'FAQPage', 'FAQPage', 'A [[FAQPage]] is a [[WebPage]] presenting one or more \"[Frequently asked questions](https://en.wikipedia.org/wiki/FAQ)\" (see also [[QAPage]]).'),
(1128, 1, 6, 'TattooParlor', 'TattooParlor', 'A tattoo parlor.'),
(1129, 1, 6, 'GovernmentPermit', 'GovernmentPermit', 'A permit issued by a government agency.'),
(1130, 1, 6, 'Barcode', 'Barcode', 'An image of a visual machine-readable code such as a barcode or QR code.'),
(1131, 1, 6, 'DiscoverAction', 'DiscoverAction', 'The act of discovering/finding an object.'),
(1132, 1, 6, 'CatholicChurch', 'CatholicChurch', 'A Catholic church.'),
(1133, 1, 6, 'DrinkAction', 'DrinkAction', 'The act of swallowing liquids.'),
(1134, 1, 6, 'ResearchProject', 'ResearchProject', 'A Research project.'),
(1135, 1, 6, 'DislikeAction', 'DislikeAction', 'The act of expressing a negative sentiment about the object. An agent dislikes an object (a proposition, topic or theme) with participants.'),
(1136, 1, 6, 'LibrarySystem', 'LibrarySystem', 'A [[LibrarySystem]] is a collaborative system amongst several libraries.'),
(1137, 1, 6, 'UserPlays', 'UserPlays', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1138, 1, 6, 'ConfirmAction', 'ConfirmAction', 'The act of notifying someone that a future event/action is going to happen as expected.\\n\\nRelated actions:\\n\\n* [[CancelAction]]: The antonym of ConfirmAction.'),
(1139, 1, 6, 'LandmarksOrHistoricalBuildings', 'LandmarksOrHistoricalBuildings', 'An historical landmark or building.'),
(1140, 1, 6, 'OpinionNewsArticle', 'OpinionNewsArticle', 'An [[OpinionNewsArticle]] is a [[NewsArticle]] that primarily expresses opinions rather than journalistic reporting of news and events. For example, a [[NewsArticle]] consisting of a column or [[Blog]]/[[BlogPosting]] entry in the Opinions section of a news publication. '),
(1141, 1, 6, 'Restaurant', 'Restaurant', 'A restaurant.'),
(1142, 1, 6, 'PreOrderAction', 'PreOrderAction', 'An agent orders a (not yet released) object/product/service to be delivered/sent.'),
(1143, 1, 6, 'MotorcycleRepair', 'MotorcycleRepair', 'A motorcycle repair shop.'),
(1144, 1, 6, 'ConvenienceStore', 'ConvenienceStore', 'A convenience store.'),
(1145, 1, 6, 'HighSchool', 'HighSchool', 'A high school.'),
(1146, 1, 6, 'Museum', 'Museum', 'A museum.'),
(1147, 1, 6, 'PublicSwimmingPool', 'PublicSwimmingPool', 'A public swimming pool.'),
(1148, 1, 6, 'Park', 'Park', 'A park.'),
(1149, 1, 6, 'SatiricalArticle', 'SatiricalArticle', 'An [[Article]] whose content is primarily [[satirical]](https://en.wikipedia.org/wiki/Satire) in nature, i.e. unlikely to be literally true. A satirical article is sometimes but not necessarily also a [[NewsArticle]]. [[ScholarlyArticle]]s are also sometimes satirized.'),
(1150, 1, 6, 'ComedyClub', 'ComedyClub', 'A comedy club.'),
(1151, 1, 6, 'OfficeEquipmentStore', 'OfficeEquipmentStore', 'An office equipment store.'),
(1152, 1, 6, 'RadiationTherapy', 'RadiationTherapy', 'A process of care using radiation aimed at improving a health condition.'),
(1153, 1, 6, 'PresentationDigitalDocument', 'PresentationDigitalDocument', 'A file containing slides or used for a presentation.'),
(1154, 1, 6, 'HousePainter', 'HousePainter', 'A house painting service.'),
(1155, 1, 6, 'BookmarkAction', 'BookmarkAction', 'An agent bookmarks/flags/labels/tags/marks an object.'),
(1156, 1, 6, 'DisagreeAction', 'DisagreeAction', 'The act of expressing a difference of opinion with the object. An agent disagrees to/about an object (a proposition, topic or theme) with participants.'),
(1157, 1, 6, 'InstallAction', 'InstallAction', 'The act of installing an application.'),
(1158, 1, 6, 'MarryAction', 'MarryAction', 'The act of marrying a person.'),
(1159, 1, 6, 'PawnShop', 'PawnShop', 'A shop that will buy, or lend money against the security of, personal possessions.'),
(1160, 1, 6, 'VisualArtsEvent', 'VisualArtsEvent', 'Event type: Visual arts event.'),
(1161, 1, 6, 'Playground', 'Playground', 'A playground.'),
(1162, 1, 6, 'CheckOutAction', 'CheckOutAction', 'The act of an agent communicating (service provider, social media, etc) their departure of a previously reserved service (e.g. flight check-in) or place (e.g. hotel).\\n\\nRelated actions:\\n\\n* [[CheckInAction]]: The antonym of CheckOutAction.\\n* [[DepartAction]]: Unlike DepartAction, CheckOutAction implies that the agent is informing/confirming the end of a previously reserved service.\\n* [[CancelAction]]: Unlike CancelAction, CheckOutAction implies that the agent is informing/confirming the end of a previously reserved service.'),
(1163, 1, 6, 'FurnitureStore', 'FurnitureStore', 'A furniture store.'),
(1164, 1, 6, 'JewelryStore', 'JewelryStore', 'A jewelry store.'),
(1165, 1, 6, 'Waterfall', 'Waterfall', 'A waterfall, like Niagara.'),
(1166, 1, 6, 'Synagogue', 'Synagogue', 'A synagogue.'),
(1167, 1, 6, 'Quiz', 'Quiz', 'Quiz: A test of knowledge, skills and abilities.'),
(1168, 1, 6, 'BefriendAction', 'BefriendAction', 'The act of forming a personal connection with someone (object) mutually/bidirectionally/symmetrically.\\n\\nRelated actions:\\n\\n* [[FollowAction]]: Unlike FollowAction, BefriendAction implies that the connection is reciprocal.'),
(1169, 1, 6, 'Hackathon', 'Hackathon', 'A [hackathon](https://en.wikipedia.org/wiki/Hackathon) event.'),
(1170, 1, 6, 'State', 'State', 'A state or province of a country.'),
(1171, 1, 6, 'CityHall', 'CityHall', 'A city hall.'),
(1172, 1, 6, 'BrokerageAccount', 'BrokerageAccount', 'An account that allows an investor to deposit funds and place investment orders with a licensed broker or brokerage firm.'),
(1173, 1, 6, 'TennisComplex', 'TennisComplex', 'A tennis complex.'),
(1174, 1, 6, 'CheckAction', 'CheckAction', 'An agent inspects, determines, investigates, inquires, or examines an object\'s accuracy, quality, condition, or state.'),
(1175, 1, 6, 'WPAdBlock', 'WPAdBlock', 'An advertising section of the page.'),
(1176, 1, 6, 'WantAction', 'WantAction', 'The act of expressing a desire about the object. An agent wants an object.'),
(1177, 1, 6, 'ComicCoverArt', 'ComicCoverArt', 'The artwork on the cover of a comic.'),
(1178, 1, 6, 'City', 'City', 'A city or town.'),
(1179, 1, 6, 'Mosque', 'Mosque', 'A mosque.'),
(1180, 1, 6, 'PaymentService', 'PaymentService', 'A Service to transfer funds from a person or organization to a beneficiary person or organization.'),
(1181, 1, 6, 'VideoObjectSnapshot', 'VideoObjectSnapshot', 'A specific and exact (byte-for-byte) version of a [[VideoObject]]. Two byte-for-byte identical files, for the purposes of this type, considered identical. If they have different embedded metadata the files will differ. Different external facts about the files, e.g. creator or dateCreated that aren\'t represented in their actual content, do not affect this notion of identity.'),
(1182, 1, 6, 'DeactivateAction', 'DeactivateAction', 'The act of stopping or deactivating a device or application (e.g. stopping a timer or turning off a flashlight).'),
(1183, 1, 6, 'OccupationalTherapy', 'OccupationalTherapy', 'A treatment of people with physical, emotional, or social problems, using purposeful activity to help them overcome or learn to deal with their problems.'),
(1184, 1, 6, 'EndorsementRating', 'EndorsementRating', 'An EndorsementRating is a rating that expresses some level of endorsement, for example inclusion in a \"critic\'s pick\" blog, a\n\"Like\" or \"+1\" on a social network. It can be considered the [[result]] of an [[EndorseAction]] in which the [[object]] of the action is rated positively by\nsome [[agent]]. As is common elsewhere in schema.org, it is sometimes more useful to describe the results of such an action without explicitly describing the [[Action]].\n\nAn [[EndorsementRating]] may be part of a numeric scale or organized system, but this is not required: having an explicit type for indicating a positive,\nendorsement rating is particularly useful in the absence of numeric scales as it helps consumers understand that the rating is broadly positive.\n'),
(1185, 1, 6, 'UserPageVisits', 'UserPageVisits', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1186, 1, 6, 'TieAction', 'TieAction', 'The act of reaching a draw in a competitive activity.'),
(1187, 1, 6, 'Distillery', 'Distillery', 'A distillery.'),
(1188, 1, 6, 'ImageGallery', 'ImageGallery', 'Web page type: Image gallery page.'),
(1189, 1, 6, 'Poster', 'Poster', 'A large, usually printed placard, bill, or announcement, often illustrated, that is posted to advertise or publicize something.'),
(1190, 1, 6, 'ViewAction', 'ViewAction', 'The act of consuming static visual content.'),
(1191, 1, 6, 'QAPage', 'QAPage', 'A QAPage is a WebPage focussed on a specific Question and its Answer(s), e.g. in a question answering site or documenting Frequently Asked Questions (FAQs).'),
(1192, 1, 6, 'ContactPage', 'ContactPage', 'Web page type: Contact page.'),
(1193, 1, 6, 'EmailMessage', 'EmailMessage', 'An email message.'),
(1194, 1, 6, 'FundingAgency', 'FundingAgency', 'A FundingAgency is an organization that implements one or more [[FundingScheme]]s and manages\n    the granting process (via [[Grant]]s, typically [[MonetaryGrant]]s).\n    A funding agency is not always required for grant funding, e.g. philanthropic giving, corporate sponsorship etc.\n    \nExamples of funding agencies include ERC, REA, NIH, Bill and Melinda Gates Foundation, ...\n    '),
(1195, 1, 6, 'AudioObjectSnapshot', 'AudioObjectSnapshot', 'A specific and exact (byte-for-byte) version of an [[AudioObject]]. Two byte-for-byte identical files, for the purposes of this type, considered identical. If they have different embedded metadata the files will differ. Different external facts about the files, e.g. creator or dateCreated that aren\'t represented in their actual content, do not affect this notion of identity.'),
(1196, 1, 6, 'SearchRescueOrganization', 'SearchRescueOrganization', 'A Search and Rescue organization of some kind.'),
(1197, 1, 6, 'GatedResidenceCommunity', 'GatedResidenceCommunity', 'Residence type: Gated community.'),
(1198, 1, 6, 'GardenStore', 'GardenStore', 'A garden store.'),
(1199, 1, 6, 'Ligament', 'Ligament', 'A short band of tough, flexible, fibrous connective tissue that functions to connect multiple bones, cartilages, and structurally support joints.'),
(1200, 1, 6, 'ComicSeries', 'ComicSeries', 'A sequential publication of comic stories under a\n    	unifying title, for example \"The Amazing Spider-Man\" or \"Groo the\n    	Wanderer\".'),
(1201, 1, 6, 'InsuranceAgency', 'InsuranceAgency', 'An Insurance agency.'),
(1202, 1, 6, 'Taxi', 'Taxi', 'A taxi.'),
(1203, 1, 6, 'Sculpture', 'Sculpture', 'A piece of sculpture.'),
(1204, 1, 6, 'AdvertiserContentArticle', 'AdvertiserContentArticle', 'An [[Article]] that an external entity has paid to place or to produce to its specifications. Includes [advertorials](https://en.wikipedia.org/wiki/Advertorial), sponsored content, native advertising and other paid content.'),
(1205, 1, 6, 'Crematorium', 'Crematorium', 'A crematorium.'),
(1206, 1, 6, 'SeaBodyOfWater', 'SeaBodyOfWater', 'A sea (for example, the Caspian sea).'),
(1207, 1, 6, 'Plumber', 'Plumber', 'A plumbing service.'),
(1208, 1, 6, 'MedicalSymptom', 'MedicalSymptom', 'Any complaint sensed and expressed by the patient (therefore defined as subjective)  like stomachache, lower-back pain, or fatigue.'),
(1209, 1, 6, 'ShareAction', 'ShareAction', 'The act of distributing content to people for their amusement or edification.'),
(1210, 1, 6, 'ParkingFacility', 'ParkingFacility', 'A parking lot or other parking facility.'),
(1211, 1, 6, 'SurgicalProcedure', 'SurgicalProcedure', 'A medical procedure involving an incision with instruments; performed for diagnose, or therapeutic purposes.'),
(1212, 1, 6, 'Bridge', 'Bridge', 'A bridge.'),
(1213, 1, 6, 'ElectronicsStore', 'ElectronicsStore', 'An electronics store.'),
(1214, 1, 6, 'UserReview', 'UserReview', 'A review created by an end-user (e.g. consumer, purchaser, attendee etc.), in contrast with [[CriticReview]].'),
(1215, 1, 6, 'Attorney', 'Attorney', 'Professional service: Attorney. \\n\\nThis type is deprecated - [[LegalService]] is more inclusive and less ambiguous.'),
(1216, 1, 6, 'MusicVideoObject', 'MusicVideoObject', 'A music video file.'),
(1217, 1, 6, 'MeetingRoom', 'MeetingRoom', 'A meeting room, conference room, or conference hall is a room provided for singular events such as business conferences and meetings (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Conference_hall\">http://en.wikipedia.org/wiki/Conference_hall</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1218, 1, 6, 'GovernmentOrganization', 'GovernmentOrganization', 'A governmental organization or agency.'),
(1219, 1, 6, 'ReadAction', 'ReadAction', 'The act of consuming written content.'),
(1220, 1, 6, 'Winery', 'Winery', 'A winery.'),
(1221, 1, 6, 'HairSalon', 'HairSalon', 'A hair salon.'),
(1222, 1, 6, 'ArtGallery', 'ArtGallery', 'An art gallery.'),
(1223, 1, 6, 'Library', 'Library', 'A library.'),
(1224, 1, 6, 'EventVenue', 'EventVenue', 'An event venue.'),
(1225, 1, 6, 'ShoppingCenter', 'ShoppingCenter', 'A shopping center or mall.'),
(1226, 1, 6, 'MensClothingStore', 'MensClothingStore', 'A men\'s clothing store.'),
(1227, 1, 6, 'Consortium', 'Consortium', 'A Consortium is a membership [[Organization]] whose members are typically Organizations.'),
(1228, 1, 6, 'Code', 'Code', 'Computer programming source code. Example: Full (compile ready) solutions, code snippet samples, scripts, templates.'),
(1229, 1, 6, 'ShortStory', 'ShortStory', 'Short story or tale. A brief work of literature, usually written in narrative prose.'),
(1230, 1, 6, 'VideoGameClip', 'VideoGameClip', 'A short segment/part of a video game.'),
(1231, 1, 6, 'Optician', 'Optician', 'A store that sells reading glasses and similar devices for improving vision.'),
(1232, 1, 6, 'ActivateAction', 'ActivateAction', 'The act of starting or activating a device or application (e.g. starting a timer or turning on a flashlight).'),
(1233, 1, 6, 'RVPark', 'RVPark', 'A place offering space for \"Recreational Vehicles\", Caravans, mobile homes and the like.'),
(1234, 1, 6, 'Manuscript', 'Manuscript', 'A book, document, or piece of music written by hand rather than typed or printed.'),
(1235, 1, 6, 'OfferForLease', 'OfferForLease', 'An [[OfferForLease]] in Schema.org represents an [[Offer]] to lease out something, i.e. an [[Offer]] whose\n  [[businessFunction]] is [lease out](http://purl.org/goodrelations/v1#LeaseOut.). See [Good Relations](https://en.wikipedia.org/wiki/GoodRelations) for\n  background on the underlying concepts.\n  '),
(1236, 1, 6, 'MusicEvent', 'MusicEvent', 'Event type: Music event.'),
(1237, 1, 6, 'Newspaper', 'Newspaper', 'A publication containing information about varied topics that are pertinent to general information, a geographic area, or a specific subject matter (i.e. business, culture, education). Often published daily.'),
(1238, 1, 6, 'ChildCare', 'ChildCare', 'A Childcare center.'),
(1239, 1, 6, 'BedAndBreakfast', 'BedAndBreakfast', 'Bed and breakfast.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1240, 1, 6, 'PaintAction', 'PaintAction', 'The act of producing a painting, typically with paint and canvas as instruments.'),
(1241, 1, 6, 'CheckInAction', 'CheckInAction', 'The act of an agent communicating (service provider, social media, etc) their arrival by registering/confirming for a previously reserved service (e.g. flight check-in) or at a place (e.g. hotel), possibly resulting in a result (boarding pass, etc).\\n\\nRelated actions:\\n\\n* [[CheckOutAction]]: The antonym of CheckInAction.\\n* [[ArriveAction]]: Unlike ArriveAction, CheckInAction implies that the agent is informing/confirming the start of a previously reserved service.\\n* [[ConfirmAction]]: Unlike ConfirmAction, CheckInAction implies that the agent is informing/confirming the *start* of a previously reserved service rather than its validity/existence.'),
(1242, 1, 6, 'SiteNavigationElement', 'SiteNavigationElement', 'A navigation element of the page.'),
(1243, 1, 6, 'AssignAction', 'AssignAction', 'The act of allocating an action/event/task to some destination (someone or something).'),
(1244, 1, 6, 'AcceptAction', 'AcceptAction', 'The act of committing to/adopting an object.\\n\\nRelated actions:\\n\\n* [[RejectAction]]: The antonym of AcceptAction.'),
(1245, 1, 6, 'GroceryStore', 'GroceryStore', 'A grocery store.'),
(1246, 1, 6, 'Float', 'Float', 'Data type: Floating number.'),
(1247, 1, 6, 'Season', 'Season', 'A media season, e.g. TV, radio, video game etc.'),
(1248, 1, 6, 'School', 'School', 'A school.'),
(1249, 1, 6, 'Continent', 'Continent', 'One of the continents (for example, Europe or Africa).'),
(1250, 1, 6, 'VitalSign', 'VitalSign', 'Vital signs are measures of various physiological functions in order to assess the most basic body functions.'),
(1251, 1, 6, 'DanceEvent', 'DanceEvent', 'Event type: A social dance.'),
(1252, 1, 6, 'Conversation', 'Conversation', 'One or more messages between organizations or people on a particular topic. Individual messages can be linked to the conversation with isPartOf or hasPart properties.'),
(1253, 1, 6, 'Beach', 'Beach', 'Beach.'),
(1254, 1, 6, 'MusicStore', 'MusicStore', 'A music store.'),
(1255, 1, 6, 'SheetMusic', 'SheetMusic', 'Printed music, as opposed to performed or recorded music.'),
(1256, 1, 6, 'TheaterGroup', 'TheaterGroup', 'A theater group or company, for example, the Royal Shakespeare Company or Druid Theatre.'),
(1257, 1, 6, 'AutoWash', 'AutoWash', 'A car wash business.'),
(1258, 1, 6, 'MotorizedBicycle', 'MotorizedBicycle', 'A motorized bicycle is a bicycle with an attached motor used to power the vehicle, or to assist with pedaling.'),
(1259, 1, 6, 'DrawAction', 'DrawAction', 'The act of producing a visual/graphical representation of an object, typically with a pen/pencil and paper as instruments.'),
(1260, 1, 6, 'IgnoreAction', 'IgnoreAction', 'The act of intentionally disregarding the object. An agent ignores an object.'),
(1261, 1, 6, 'MedicalGuidelineContraindication', 'MedicalGuidelineContraindication', 'A guideline contraindication that designates a process as harmful and where quality of the data supporting the contraindication is sound.'),
(1262, 1, 6, 'SearchResultsPage', 'SearchResultsPage', 'Web page type: Search results page.'),
(1263, 1, 6, 'RadioEpisode', 'RadioEpisode', 'A radio episode which can be part of a series or season.'),
(1264, 1, 6, 'BusReservation', 'BusReservation', 'A reservation for bus travel. \\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(1265, 1, 6, 'ShoeStore', 'ShoeStore', 'A shoe store.'),
(1266, 1, 6, 'FireStation', 'FireStation', 'A fire station. With firemen.'),
(1267, 1, 6, 'Pharmacy', 'Pharmacy', 'A pharmacy or drugstore.'),
(1268, 1, 6, 'ApplyAction', 'ApplyAction', 'The act of registering to an organization/service without the guarantee to receive it.\\n\\nRelated actions:\\n\\n* [[RegisterAction]]: Unlike RegisterAction, ApplyAction has no guarantees that the application will be accepted.'),
(1269, 1, 6, 'Aquarium', 'Aquarium', 'Aquarium.'),
(1270, 1, 6, 'LegislativeBuilding', 'LegislativeBuilding', 'A legislative building&#x2014;for example, the state capitol.'),
(1271, 1, 6, 'Preschool', 'Preschool', 'A preschool.'),
(1272, 1, 6, 'DefenceEstablishment', 'DefenceEstablishment', 'A defence establishment, such as an army or navy base.'),
(1273, 1, 6, 'Hostel', 'Hostel', 'A hostel - cheap accommodation, often in shared dormitories.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1274, 1, 6, 'EatAction', 'EatAction', 'The act of swallowing solid objects.'),
(1275, 1, 6, 'LiteraryEvent', 'LiteraryEvent', 'Event type: Literary event.'),
(1276, 1, 6, 'BookStore', 'BookStore', 'A bookstore.'),
(1277, 1, 6, 'EmployerReview', 'EmployerReview', 'An [[EmployerReview]] is a review of an [[Organization]] regarding its role as an employer, written by a current or former employee of that organization.'),
(1278, 1, 6, 'ComputerStore', 'ComputerStore', 'A computer store.'),
(1279, 1, 6, 'RoofingContractor', 'RoofingContractor', 'A roofing contractor.'),
(1280, 1, 6, 'RadioBroadcastService', 'RadioBroadcastService', 'A delivery service through which radio content is provided via broadcast over the air or online.'),
(1281, 1, 6, 'AutoRepair', 'AutoRepair', 'Car repair business.'),
(1282, 1, 6, 'WholesaleStore', 'WholesaleStore', 'A wholesale store.'),
(1283, 1, 6, 'Bone', 'Bone', 'Rigid connective tissue that comprises up the skeletal structure of the human body.'),
(1284, 1, 6, 'PetStore', 'PetStore', 'A pet store.'),
(1285, 1, 6, 'BuddhistTemple', 'BuddhistTemple', 'A Buddhist temple.'),
(1286, 1, 6, 'EmployerAggregateRating', 'EmployerAggregateRating', 'An aggregate rating of an Organization related to its role as an employer.'),
(1287, 1, 6, 'AskPublicNewsArticle', 'AskPublicNewsArticle', 'A [[NewsArticle]] expressing an open call by a [[NewsMediaOrganization]] asking the public for input, insights, clarifications, anecdotes, documentation, etc., on an issue, for reporting purposes.'),
(1288, 1, 6, 'ItemPage', 'ItemPage', 'A page devoted to a single item, such as a particular product or hotel.'),
(1289, 1, 6, 'PoliceStation', 'PoliceStation', 'A police station.'),
(1290, 1, 6, 'Courthouse', 'Courthouse', 'A courthouse.'),
(1291, 1, 6, 'TreatmentIndication', 'TreatmentIndication', 'An indication for treating an underlying condition, symptom, etc.'),
(1292, 1, 6, 'DownloadAction', 'DownloadAction', 'The act of downloading an object.'),
(1293, 1, 6, 'DepartmentStore', 'DepartmentStore', 'A department store.'),
(1294, 1, 6, 'Play', 'Play', 'A play is a form of literature, usually consisting of dialogue between characters, intended for theatrical performance rather than just reading. Note: A performance of a Play would be a [[TheaterEvent]] or [[BroadcastEvent]] - the *Play* being the [[workPerformed]].'),
(1295, 1, 6, 'VideoGallery', 'VideoGallery', 'Web page type: Video gallery page.'),
(1296, 1, 6, 'Brewery', 'Brewery', 'Brewery.'),
(1297, 1, 6, 'NGO', 'NGO', 'Organization: Non-governmental Organization.'),
(1298, 1, 6, 'MiddleSchool', 'MiddleSchool', 'A middle school (typically for children aged around 11-14, although this varies somewhat).'),
(1299, 1, 6, 'Electrician', 'Electrician', 'An electrician.'),
(1300, 1, 6, 'CollegeOrUniversity', 'CollegeOrUniversity', 'A college, university, or other third-level educational institution.'),
(1301, 1, 6, 'PerformingArtsTheater', 'PerformingArtsTheater', 'A theater or other performing art center.'),
(1302, 1, 6, 'Florist', 'Florist', 'A florist.'),
(1303, 1, 6, 'AccountingService', 'AccountingService', 'Accountancy business.\\n\\nAs a [[LocalBusiness]] it can be described as a [[provider]] of one or more [[Service]]\\(s).\n      '),
(1304, 1, 6, 'CheckoutPage', 'CheckoutPage', 'Web page type: Checkout page.'),
(1305, 1, 6, 'SubwayStation', 'SubwayStation', 'A subway station.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1306, 1, 6, 'UserLikes', 'UserLikes', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1307, 1, 6, 'WatchAction', 'WatchAction', 'The act of consuming dynamic/moving visual content.'),
(1308, 1, 6, 'Table', 'Table', 'A table on a Web page.'),
(1309, 1, 6, 'ProfilePage', 'ProfilePage', 'Web page type: Profile page.'),
(1310, 1, 6, 'PalliativeProcedure', 'PalliativeProcedure', 'A medical procedure intended primarily for palliative purposes, aimed at relieving the symptoms of an underlying health condition.'),
(1311, 1, 6, 'GeneralContractor', 'GeneralContractor', 'A general contractor.'),
(1312, 1, 6, 'GasStation', 'GasStation', 'A gas station.'),
(1313, 1, 6, 'Motel', 'Motel', 'A motel.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1314, 1, 6, 'SocialEvent', 'SocialEvent', 'Event type: Social event.'),
(1315, 1, 6, 'Atlas', 'Atlas', 'A collection or bound volume of maps, charts, plates or tables, physical or in media form illustrating any subject.'),
(1316, 1, 6, 'CancelAction', 'CancelAction', 'The act of asserting that a future event/action is no longer going to happen.\\n\\nRelated actions:\\n\\n* [[ConfirmAction]]: The antonym of CancelAction.'),
(1317, 1, 6, 'FastFoodRestaurant', 'FastFoodRestaurant', 'A fast-food restaurant.'),
(1318, 1, 6, 'TouristInformationCenter', 'TouristInformationCenter', 'A tourist information center.'),
(1319, 1, 6, 'EventReservation', 'EventReservation', 'A reservation for an event like a concert, sporting event, or lecture.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(1320, 1, 6, 'HobbyShop', 'HobbyShop', 'A store that sells materials useful or necessary for various hobbies.'),
(1321, 1, 6, 'EmploymentAgency', 'EmploymentAgency', 'An employment agency.'),
(1322, 1, 6, 'SelfStorage', 'SelfStorage', 'A self-storage facility.'),
(1323, 1, 6, 'TakeAction', 'TakeAction', 'The act of gaining ownership of an object from an origin. Reciprocal of GiveAction.\\n\\nRelated actions:\\n\\n* [[GiveAction]]: The reciprocal of TakeAction.\\n* [[ReceiveAction]]: Unlike ReceiveAction, TakeAction implies that ownership has been transferred.'),
(1324, 1, 6, 'ReportedDoseSchedule', 'ReportedDoseSchedule', 'A patient-reported or observed dosing schedule for a drug or supplement.'),
(1325, 1, 6, 'RejectAction', 'RejectAction', 'The act of rejecting to/adopting an object.\\n\\nRelated actions:\\n\\n* [[AcceptAction]]: The antonym of RejectAction.'),
(1326, 1, 6, 'BeautySalon', 'BeautySalon', 'Beauty salon.'),
(1327, 1, 6, 'ElementarySchool', 'ElementarySchool', 'An elementary school.'),
(1328, 1, 6, 'ResumeAction', 'ResumeAction', 'The act of resuming a device or application which was formerly paused (e.g. resume music playback or resume a timer).'),
(1329, 1, 6, 'RadioClip', 'RadioClip', 'A short radio program or a segment/part of a radio program.'),
(1330, 1, 6, 'DepartAction', 'DepartAction', 'The act of  departing from a place. An agent departs from a fromLocation for a destination, optionally with participants.'),
(1331, 1, 6, 'Locksmith', 'Locksmith', 'A locksmith.'),
(1332, 1, 6, 'PhotographAction', 'PhotographAction', 'The act of capturing still images of objects using a camera.'),
(1333, 1, 6, 'SportsClub', 'SportsClub', 'A sports club.'),
(1334, 1, 6, 'StadiumOrArena', 'StadiumOrArena', 'A stadium.'),
(1335, 1, 6, 'TextDigitalDocument', 'TextDigitalDocument', 'A file composed primarily of text.'),
(1336, 1, 6, 'FilmAction', 'FilmAction', 'The act of capturing sound and moving images on film, video, or digitally.'),
(1337, 1, 6, 'Bakery', 'Bakery', 'A bakery.'),
(1338, 1, 6, 'Embassy', 'Embassy', 'An embassy.'),
(1339, 1, 6, 'OutletStore', 'OutletStore', 'An outlet store.'),
(1340, 1, 6, 'EventSeries', 'EventSeries', 'A series of [[Event]]s. Included events can relate with the series using the [[superEvent]] property.\n\nAn EventSeries is a collection of events that share some unifying characteristic. For example, \"The Olympic Games\" is a series, which\nis repeated regularly. The \"2012 London Olympics\" can be presented both as an [[Event]] in the series \"Olympic Games\", and as an\n[[EventSeries]] that included a number of sporting competitions as Events.\n\nThe nature of the association between the events in an [[EventSeries]] can vary, but typical examples could\ninclude a thematic event series (e.g. topical meetups or classes), or a series of regular events that share a location, attendee group and/or organizers.\n\nEventSeries has been defined as a kind of Event to make it easy for publishers to use it in an Event context without\nworrying about which kinds of series are really event-like enough to call an Event. In general an EventSeries\nmay seem more Event-like when the period of time is compact and when aspects such as location are fixed, but\nit may also sometimes prove useful to describe a longer-term series as an Event.\n   '),
(1341, 1, 6, 'ExerciseGym', 'ExerciseGym', 'A gym.'),
(1342, 1, 6, 'DanceGroup', 'DanceGroup', 'A dance group&#x2014;for example, the Alvin Ailey Dance Theater or Riverdance.'),
(1343, 1, 6, 'SkiResort', 'SkiResort', 'A ski resort.'),
(1344, 1, 6, 'LakeBodyOfWater', 'LakeBodyOfWater', 'A lake (for example, Lake Pontrachain).'),
(1345, 1, 6, 'AppendAction', 'AppendAction', 'The act of inserting at the end if an ordered collection.'),
(1346, 1, 6, 'AdultEntertainment', 'AdultEntertainment', 'An adult entertainment establishment.'),
(1347, 1, 6, 'TaxiStand', 'TaxiStand', 'A taxi stand.'),
(1348, 1, 6, 'Canal', 'Canal', 'A canal, like the Panama Canal.'),
(1349, 1, 6, 'HomeGoodsStore', 'HomeGoodsStore', 'A home goods store.'),
(1350, 1, 6, 'AnimalShelter', 'AnimalShelter', 'Animal shelter.'),
(1351, 1, 6, 'URL', 'URL', 'Data type: URL.'),
(1352, 1, 6, 'Diet', 'Diet', 'A strategy of regulating the intake of food to achieve or maintain a specific health-related goal.'),
(1353, 1, 6, 'Organization', 'Organization', 'An organization such as a school, NGO, corporation, club, etc.'),
(1354, 1, 6, 'StructuredValue', 'StructuredValue', 'Structured values are used when the value of a property has a more complex structure than simply being a textual value or a reference to another thing.'),
(1355, 1, 6, 'MediaReviewItem', 'MediaReviewItem', 'Represents an item or group of closely related items treated as a unit for the sake of evaluation in a [[MediaReview]]. Authorship etc. apply to the items rather than to the curation/grouping or reviewing party.'),
(1356, 1, 6, 'MusicRelease', 'MusicRelease', 'A MusicRelease is a specific release of a music album.'),
(1357, 1, 6, 'Answer', 'Answer', 'An answer offered to a question; perhaps correct, perhaps opinionated or wrong.'),
(1358, 1, 6, 'Ticket', 'Ticket', 'Used to describe a ticket to an event, a flight, a bus ride, etc.'),
(1359, 1, 6, 'ReactAction', 'ReactAction', 'The act of responding instinctively and emotionally to an object, expressing a sentiment.'),
(1360, 1, 6, 'MedicalProcedureType', 'MedicalProcedureType', 'An enumeration that describes different types of medical procedures.'),
(1361, 1, 6, 'FinancialProduct', 'FinancialProduct', 'A product provided to consumers and businesses by financial institutions such as banks, insurance companies, brokerage firms, consumer finance companies, and investment companies which comprise the financial services industry.'),
(1362, 1, 6, 'ReplyAction', 'ReplyAction', 'The act of responding to a question/message asked/sent by the object. Related to [[AskAction]].\\n\\nRelated actions:\\n\\n* [[AskAction]]: Appears generally as an origin of a ReplyAction.'),
(1363, 1, 6, 'ChemicalSubstance', 'ChemicalSubstance', 'A chemical substance is \'a portion of matter of constant composition, composed of molecular entities of the same type or of different types\' (source: [ChEBI:59999](https://www.ebi.ac.uk/chebi/searchId.do?chebiId=59999)).'),
(1364, 1, 6, 'Language', 'Language', 'Natural languages such as Spanish, Tamil, Hindi, English, etc. Formal language code tags expressed in [BCP 47](https://en.wikipedia.org/wiki/IETF_language_tag) can be used via the [[alternateName]] property. The Language type previously also covered programming languages such as Scheme and Lisp, which are now best represented using [[ComputerLanguage]].'),
(1365, 1, 6, 'HyperToc', 'HyperToc', 'A HyperToc represents a hypertext table of contents for complex media objects, such as [[VideoObject]], [[AudioObject]]. Items in the table of contents are indicated using the [[tocEntry]] property, and typed [[HyperTocEntry]]. For cases where the same larger work is split into multiple files, [[associatedMedia]] can be used on individual [[HyperTocEntry]] items.'),
(1366, 1, 6, 'Person', 'Person', 'A person (alive, dead, undead, or fictional).'),
(1367, 1, 6, 'BodyMeasurementTypeEnumeration', 'BodyMeasurementTypeEnumeration', 'Enumerates types (or dimensions) of a person\'s body measurements, for example for fitting of clothes.'),
(1368, 1, 6, 'Observation', 'Observation', 'Instances of the class [[Observation]] are used to specify observations about an entity (which may or may not be an instance of a [[StatisticalPopulation]]), at a particular time. The principal properties of an [[Observation]] are [[observedNode]], [[measuredProperty]], [[measuredValue]] (or [[median]], etc.) and [[observationDate]] ([[measuredProperty]] properties can, but need not always, be W3C RDF Data Cube \"measure properties\", as in the [lifeExpectancy example](https://www.w3.org/TR/vocab-data-cube/#dsd-example)).\nSee also [[StatisticalPopulation]], and the [data and datasets](/docs/data-and-datasets.html) overview for more details.\n  '),
(1369, 1, 6, 'QuantitativeValueDistribution', 'QuantitativeValueDistribution', 'A statistical distribution of values.'),
(1370, 1, 6, 'ReplaceAction', 'ReplaceAction', 'The act of editing a recipient by replacing an old object with a new object.'),
(1371, 1, 6, 'FlightReservation', 'FlightReservation', 'A reservation for air travel.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(1372, 1, 6, 'CommunicateAction', 'CommunicateAction', 'The act of conveying information to another person via a communication medium (instrument) such as speech, email, or telephone conversation.'),
(1373, 1, 6, 'Vehicle', 'Vehicle', 'A vehicle is a device that is designed or used to transport people or cargo over land, water, air, or through space.'),
(1374, 1, 6, 'TouristTrip', 'TouristTrip', 'A tourist trip. A created itinerary of visits to one or more places of interest ([[TouristAttraction]]/[[TouristDestination]]) often linked by a similar theme, geographic area, or interest to a particular [[touristType]]. The [UNWTO](http://www2.unwto.org/) defines tourism trip as the Trip taken by visitors.\n  (See examples below.)'),
(1375, 1, 6, 'Report', 'Report', 'A Report generated by governmental or non-governmental organization.'),
(1376, 1, 6, 'Taxon', 'Taxon', 'A set of organisms asserted to represent a natural cohesive biological unit.'),
(1377, 1, 6, 'ArchiveOrganization', 'ArchiveOrganization', 'An organization with archival holdings. An organization which keeps and preserves archival material and typically makes it accessible to the public.'),
(1378, 1, 6, 'DataFeedItem', 'DataFeedItem', 'A single item within a larger data feed.'),
(1379, 1, 6, 'HowToItem', 'HowToItem', 'An item used as either a tool or supply when performing the instructions for how to achieve a result.'),
(1380, 1, 6, 'PriceTypeEnumeration', 'PriceTypeEnumeration', 'Enumerates different price types, for example list price, invoice price, and sale price.'),
(1381, 1, 6, 'ExerciseAction', 'ExerciseAction', 'The act of participating in exertive activity for the purposes of improving health and fitness.'),
(1382, 1, 6, 'ScreeningEvent', 'ScreeningEvent', 'A screening of a movie or other video.'),
(1383, 1, 6, 'PronounceableText', 'PronounceableText', 'Data type: PronounceableText.'),
(1384, 1, 6, 'SportsOrganization', 'SportsOrganization', 'Represents the collection of all sports organizations, including sports teams, governing bodies, and sports associations.'),
(1385, 1, 6, 'ActionStatusType', 'ActionStatusType', 'The status of an Action.'),
(1386, 1, 6, 'IndividualProduct', 'IndividualProduct', 'A single, identifiable product instance (e.g. a laptop with a particular serial number).'),
(1387, 1, 6, 'InteractionCounter', 'InteractionCounter', 'A summary of how users have interacted with this CreativeWork. In most cases, authors will use a subtype to specify the specific type of interaction.'),
(1388, 1, 6, 'Event', 'Event', 'An event happening at a certain time and location, such as a concert, lecture, or festival. Ticketing information may be added via the [[offers]] property. Repeated events may be structured as separate Event objects.'),
(1389, 1, 6, 'CookAction', 'CookAction', 'The act of producing/preparing food.'),
(1390, 1, 6, 'HealthPlanCostSharingSpecification', 'HealthPlanCostSharingSpecification', 'A description of costs to the patient under a given network or formulary.'),
(1391, 1, 6, 'EnergyStarEnergyEfficiencyEnumeration', 'EnergyStarEnergyEfficiencyEnumeration', 'Used to indicate whether a product is EnergyStar certified.'),
(1392, 1, 6, 'MedicalAudienceType', 'MedicalAudienceType', 'Target audiences types for medical web pages. Enumerated type.'),
(1393, 1, 6, 'SendAction', 'SendAction', 'The act of physically/electronically dispatching an object for transfer from an origin to a destination. Related actions:\\n\\n* [[ReceiveAction]]: The reciprocal of SendAction.\\n* [[GiveAction]]: Unlike GiveAction, SendAction does not imply the transfer of ownership (e.g. I can send you my laptop, but I\'m not necessarily giving it to you).'),
(1394, 1, 6, 'RentAction', 'RentAction', 'The act of giving money in return for temporary use, but not ownership, of an object such as a vehicle or property. For example, an agent rents a property from a landlord in exchange for a periodic payment.'),
(1395, 1, 6, 'Thesis', 'Thesis', 'A thesis or dissertation document submitted in support of candidature for an academic degree or professional qualification.'),
(1396, 1, 6, 'EducationalOccupationalProgram', 'EducationalOccupationalProgram', 'A program offered by an institution which determines the learning progress to achieve an outcome, usually a credential like a degree or certificate. This would define a discrete set of opportunities (e.g., job, courses) that together constitute a program with a clear start, end, set of requirements, and transition to a new occupational opportunity (e.g., a job), or sometimes a higher educational opportunity (e.g., an advanced degree).'),
(1397, 1, 6, 'OrderItem', 'OrderItem', 'An order item is a line of an order. It includes the quantity and shipping details of a bought offer.'),
(1398, 1, 6, 'Audiobook', 'Audiobook', 'An audiobook.'),
(1399, 1, 6, 'Duration', 'Duration', 'Quantity: Duration (use [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601)).'),
(1400, 1, 6, 'CreateAction', 'CreateAction', 'The act of deliberately creating/producing/generating/building a result out of the agent.'),
(1401, 1, 6, 'MedicalRiskFactor', 'MedicalRiskFactor', 'A risk factor is anything that increases a person\'s likelihood of developing or contracting a disease, medical condition, or complication.'),
(1402, 1, 6, 'MenuItem', 'MenuItem', 'A food or drink item listed in a menu or menu section.'),
(1403, 1, 6, 'PaymentStatusType', 'PaymentStatusType', 'A specific payment status. For example, PaymentDue, PaymentComplete, etc.'),
(1404, 1, 6, 'MedicalDevicePurpose', 'MedicalDevicePurpose', 'Categories of medical devices, organized by the purpose or intended use of the device.'),
(1405, 1, 6, 'PriceSpecification', 'PriceSpecification', 'A structured value representing a price or price range. Typically, only the subclasses of this type are used for markup. It is recommended to use [[MonetaryAmount]] to describe independent amounts of money such as a salary, credit card limits, etc.'),
(1406, 1, 6, 'InvestmentOrDeposit', 'InvestmentOrDeposit', 'A type of financial product that typically requires the client to transfer funds to a financial service in return for potential beneficial financial return.'),
(1407, 1, 6, 'AdministrativeArea', 'AdministrativeArea', 'A geographical region, typically under the jurisdiction of a particular government.'),
(1408, 1, 6, 'CategoryCode', 'CategoryCode', 'A Category Code.'),
(1409, 1, 6, 'Distance', 'Distance', 'Properties that take Distances as values are of the form \'&lt;Number&gt; &lt;Length unit of measure&gt;\'. E.g., \'7 ft\'.'),
(1410, 1, 6, 'InfectiousDisease', 'InfectiousDisease', 'An infectious disease is a clinically evident human disease resulting from the presence of pathogenic microbial agents, like pathogenic viruses, pathogenic bacteria, fungi, protozoa, multicellular parasites, and prions. To be considered an infectious disease, such pathogens are known to be able to cause this disease.'),
(1411, 1, 6, 'SizeSystemEnumeration', 'SizeSystemEnumeration', 'Enumerates common size systems for different categories of products, for example \"EN-13402\" or \"UK\" for wearables or \"Imperial\" for screws.'),
(1412, 1, 6, 'AboutPage', 'AboutPage', 'Web page type: About page.'),
(1413, 1, 6, 'MedicalSign', 'MedicalSign', 'Any physical manifestation of a person\'s medical condition discoverable by objective diagnostic tests or physical examination.'),
(1414, 1, 6, 'HomeAndConstructionBusiness', 'HomeAndConstructionBusiness', 'A construction business.\\n\\nA HomeAndConstructionBusiness is a [[LocalBusiness]] that provides services around homes and buildings.\\n\\nAs a [[LocalBusiness]] it can be described as a [[provider]] of one or more [[Service]]\\(s).'),
(1415, 1, 6, 'MedicalOrganization', 'MedicalOrganization', 'A medical organization (physical or not), such as hospital, institution or clinic.'),
(1416, 1, 6, 'PlayGameAction', 'PlayGameAction', 'The act of playing a video game.'),
(1417, 1, 6, 'Comment', 'Comment', 'A comment on an item - for example, a comment on a blog post. The comment\'s content is expressed via the [[text]] property, and its topic via [[about]], properties shared with all CreativeWorks.'),
(1418, 1, 6, 'Class', 'Class', 'A class, also often called a \'Type\'; equivalent to rdfs:Class.'),
(1419, 1, 6, 'BrainStructure', 'BrainStructure', 'Any anatomical structure which pertains to the soft nervous tissue functioning as the coordinating center of sensation and intellectual and nervous activity.'),
(1420, 1, 6, 'RsvpResponseType', 'RsvpResponseType', 'RsvpResponseType is an enumeration type whose instances represent responding to an RSVP request.'),
(1421, 1, 6, 'MusicRecording', 'MusicRecording', 'A music recording (track), usually a single song.'),
(1422, 1, 6, 'BankAccount', 'BankAccount', 'A product or service offered by a bank whereby one may deposit, withdraw or transfer money and in some cases be paid interest.'),
(1423, 1, 6, 'LegalValueLevel', 'LegalValueLevel', 'A list of possible levels for the legal validity of a legislation.'),
(1424, 1, 6, 'WebContent', 'WebContent', 'WebContent is a type representing all [[WebPage]], [[WebSite]] and [[WebPageElement]] content. It is sometimes the case that detailed distinctions between Web pages, sites and their parts are not always important or obvious. The  [[WebContent]] type makes it easier to describe Web-addressable content without requiring such distinctions to always be stated. (The intent is that the existing types [[WebPage]], [[WebSite]] and [[WebPageElement]] will eventually be declared as subtypes of [[WebContent]].)'),
(1425, 1, 6, 'AchieveAction', 'AchieveAction', 'The act of accomplishing something via previous efforts. It is an instantaneous action rather than an ongoing process.'),
(1426, 1, 6, 'DefinedRegion', 'DefinedRegion', 'A DefinedRegion is a geographic area defined by potentially arbitrary (rather than political, administrative or natural geographical) criteria. Properties are provided for defining a region by reference to sets of postal codes.\n\nExamples: a delivery destination when shopping. Region where regional pricing is configured.\n\nRequirement 1:\nCountry: US\nStates: \"NY\", \"CA\"\n\nRequirement 2:\nCountry: US\nPostalCode Set: { [94000-94585], [97000, 97999], [13000, 13599]}\n{ [12345, 12345], [78945, 78945], }\nRegion = state, canton, prefecture, autonomous community...\n'),
(1427, 1, 6, 'Artery', 'Artery', 'A type of blood vessel that specifically carries blood away from the heart.'),
(1428, 1, 6, 'Accommodation', 'Accommodation', 'An accommodation is a place that can accommodate human beings, e.g. a hotel room, a camping pitch, or a meeting room. Many accommodations are for overnight stays, but this is not a mandatory requirement.\nFor more specific types of accommodations not defined in schema.org, one can use additionalType with external vocabularies.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1429, 1, 6, 'ComicStory', 'ComicStory', 'The term \"story\" is any indivisible, re-printable\n    	unit of a comic, including the interior stories, covers, and backmatter. Most\n    	comics have at least two stories: a cover (ComicCoverArt) and an interior story.'),
(1430, 1, 6, 'UserInteraction', 'UserInteraction', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1431, 1, 6, 'FloorPlan', 'FloorPlan', 'A FloorPlan is an explicit representation of a collection of similar accommodations, allowing the provision of common information (room counts, sizes, layout diagrams) and offers for rental or sale. In typical use, some [[ApartmentComplex]] has an [[accommodationFloorPlan]] which is a [[FloorPlan]].  A FloorPlan is always in the context of a particular place, either a larger [[ApartmentComplex]] or a single [[Apartment]]. The visual/spatial aspects of a floor plan (i.e. room layout, [see wikipedia](https://en.wikipedia.org/wiki/Floor_plan)) can be indicated using [[image]]. '),
(1432, 1, 6, 'CategoryCodeSet', 'CategoryCodeSet', 'A set of Category Code values.'),
(1433, 1, 6, 'GovernmentOffice', 'GovernmentOffice', 'A government office&#x2014;for example, an IRS or DMV office.'),
(1434, 1, 6, 'Corporation', 'Corporation', 'Organization: A business corporation.'),
(1435, 1, 6, 'MedicalObservationalStudyDesign', 'MedicalObservationalStudyDesign', 'Design models for observational medical studies. Enumerated type.'),
(1436, 1, 6, 'NLNonprofitType', 'NLNonprofitType', 'NLNonprofitType: Non-profit organization type originating from the Netherlands.'),
(1437, 1, 6, 'LendAction', 'LendAction', 'The act of providing an object under an agreement that it will be returned at a later date. Reciprocal of BorrowAction.\\n\\nRelated actions:\\n\\n* [[BorrowAction]]: Reciprocal of LendAction.'),
(1438, 1, 6, 'AudioObject', 'AudioObject', 'An audio file.'),
(1439, 1, 6, 'AdultOrientedEnumeration', 'AdultOrientedEnumeration', 'Enumeration of considerations that make a product relevant or potentially restricted for adults only.'),
(1440, 1, 6, 'AnatomicalStructure', 'AnatomicalStructure', 'Any part of the human body, typically a component of an anatomical system. Organs, tissues, and cells are all anatomical structures.'),
(1441, 1, 6, 'Boolean', 'Boolean', 'Boolean: True or False.'),
(1442, 1, 6, 'MedicalCondition', 'MedicalCondition', 'Any condition of the human body that affects the normal functioning of a person, whether physically or mentally. Includes diseases, injuries, disabilities, disorders, syndromes, etc.'),
(1443, 1, 6, 'PublicationEvent', 'PublicationEvent', 'A PublicationEvent corresponds indifferently to the event of publication for a CreativeWork of any type, e.g. a broadcast event, an on-demand event, a book/journal publication via a variety of delivery media.'),
(1444, 1, 6, 'MedicalGuideline', 'MedicalGuideline', 'Any recommendation made by a standard society (e.g. ACC/AHA) or consensus statement that denotes how to diagnose and treat a particular condition. Note: this type should be used to tag the actual guideline recommendation; if the guideline recommendation occurs in a larger scholarly article, use MedicalScholarlyArticle to tag the overall article, not this type. Note also: the organization making the recommendation should be captured in the recognizingAuthority base property of MedicalEntity.'),
(1445, 1, 6, 'ChooseAction', 'ChooseAction', 'The act of expressing a preference from a set of options or a large or unbounded set of choices/options.'),
(1446, 1, 6, 'RefundTypeEnumeration', 'RefundTypeEnumeration', 'Enumerates several kinds of product return refund types.'),
(1447, 1, 6, 'GeoShape', 'GeoShape', 'The geographic shape of a place. A GeoShape can be described using several properties whose values are based on latitude/longitude pairs. Either whitespace or commas can be used to separate latitude and longitude; whitespace should be used when writing a list of several such points.'),
(1448, 1, 6, 'AllocateAction', 'AllocateAction', 'The act of organizing tasks/objects/events by associating resources to it.'),
(1449, 1, 6, 'InviteAction', 'InviteAction', 'The act of asking someone to attend an event. Reciprocal of RsvpAction.'),
(1450, 1, 6, 'ExchangeRateSpecification', 'ExchangeRateSpecification', 'A structured value representing exchange rate.'),
(1451, 1, 6, 'GovernmentBenefitsType', 'GovernmentBenefitsType', 'GovernmentBenefitsType enumerates several kinds of government benefits to support the COVID-19 situation. Note that this structure may not capture all benefits offered.'),
(1452, 1, 6, 'PublicationIssue', 'PublicationIssue', 'A part of a successively published publication such as a periodical or publication volume, often numbered, usually containing a grouping of works such as articles.\\n\\nSee also [blog post](http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html).'),
(1453, 1, 6, 'PhysicalActivity', 'PhysicalActivity', 'Any bodily activity that enhances or maintains physical fitness and overall health and wellness. Includes activity that is part of daily living and routine, structured exercise, and exercise prescribed as part of a medical treatment or recovery plan.'),
(1454, 1, 6, 'MedicalSpecialty', 'MedicalSpecialty', 'Any specific branch of medical science or practice. Medical specialities include clinical specialties that pertain to particular organ systems and their respective disease states, as well as allied health specialties. Enumerated type.'),
(1455, 1, 6, 'LoanOrCredit', 'LoanOrCredit', 'A financial product for the loaning of an amount of money, or line of credit, under agreed terms and charges.'),
(1456, 1, 6, 'MedicalProcedure', 'MedicalProcedure', 'A process of care used in either a diagnostic, therapeutic, preventive or palliative capacity that relies on invasive (surgical), non-invasive, or other techniques.'),
(1457, 1, 6, 'DrugClass', 'DrugClass', 'A class of medical drugs, e.g., statins. Classes can represent general pharmacological class, common mechanisms of action, common physiological effects, etc.'),
(1458, 1, 6, 'TrainTrip', 'TrainTrip', 'A trip on a commercial train line.'),
(1459, 1, 6, 'MerchantReturnEnumeration', 'MerchantReturnEnumeration', 'Enumerates several kinds of product return policies.'),
(1460, 1, 6, 'OnlineBusiness', 'OnlineBusiness', 'A particular online business, either standalone or the online part of a broader organization. Examples include an eCommerce site, an online travel booking site, an online learning site, an online logistics and shipping provider, an online (virtual) doctor, etc.'),
(1461, 1, 6, 'ReturnAction', 'ReturnAction', 'The act of returning to the origin that which was previously received (concrete objects) or taken (ownership).'),
(1462, 1, 6, 'SomeProducts', 'SomeProducts', 'A placeholder for multiple similar products of the same kind.'),
(1463, 1, 6, 'Course', 'Course', 'A description of an educational course which may be offered as distinct instances which take place at different times or take place at different locations, or be offered through different media or modes of study. An educational course is a sequence of one or more educational events and/or creative works which aims to build knowledge, competence or ability of learners.'),
(1464, 1, 6, 'ProductCollection', 'ProductCollection', 'A set of products (either [[ProductGroup]]s or specific variants) that are listed together e.g. in an [[Offer]].'),
(1465, 1, 6, 'DrugLegalStatus', 'DrugLegalStatus', 'The legal availability status of a medical drug.'),
(1466, 1, 6, 'WearableSizeSystemEnumeration', 'WearableSizeSystemEnumeration', 'Enumerates common size systems specific for wearable products'),
(1467, 1, 6, 'BusinessEntityType', 'BusinessEntityType', 'A business entity type is a conceptual entity representing the legal form, the size, the main line of business, the position in the value chain, or any combination thereof, of an organization or business person.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#Business\\n* http://purl.org/goodrelations/v1#Enduser\\n* http://purl.org/goodrelations/v1#PublicInstitution\\n* http://purl.org/goodrelations/v1#Reseller\n	  '),
(1468, 1, 6, 'HealthPlanFormulary', 'HealthPlanFormulary', 'For a given health insurance plan, the specification for costs and coverage of prescription drugs. '),
(1469, 1, 6, 'CDCPMDRecord', 'CDCPMDRecord', 'A CDCPMDRecord is a data structure representing a record in a CDC tabular data format\n      used for hospital data reporting. See [documentation](/docs/cdc-covid.html) for details, and the linked CDC materials for authoritative\n      definitions used as the source here.\n      '),
(1470, 1, 6, 'WarrantyScope', 'WarrantyScope', 'A range of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#Labor-BringIn\\n* http://purl.org/goodrelations/v1#PartsAndLabor-BringIn\\n* http://purl.org/goodrelations/v1#PartsAndLabor-PickUp\n      '),
(1471, 1, 6, 'Invoice', 'Invoice', 'A statement of the money due for goods or services; a bill.'),
(1472, 1, 6, 'AssessAction', 'AssessAction', 'The act of forming one\'s opinion, reaction or sentiment.'),
(1473, 1, 6, 'LegislationObject', 'LegislationObject', 'A specific object or file containing a Legislation. Note that the same Legislation can be published in multiple files. For example, a digitally signed PDF, a plain PDF and an HTML version.'),
(1474, 1, 6, 'MovieSeries', 'MovieSeries', 'A series of movies. Included movies can be indicated with the hasPart property.'),
(1475, 1, 6, 'ShippingDeliveryTime', 'ShippingDeliveryTime', 'ShippingDeliveryTime provides various pieces of information about delivery times for shipping.'),
(1476, 1, 6, 'Occupation', 'Occupation', 'A profession, may involve prolonged training and/or a formal qualification.'),
(1477, 1, 6, 'MediaGallery', 'MediaGallery', 'Web page type: Media gallery page. A mixed-media page that can contain media such as images, videos, and other multimedia.'),
(1478, 1, 6, 'RecommendedDoseSchedule', 'RecommendedDoseSchedule', 'A recommended dosing schedule for a drug or supplement as prescribed or recommended by an authority or by the drug/supplement\'s manufacturer. Capture the recommending authority in the recognizingAuthority property of MedicalEntity.'),
(1479, 1, 6, 'MedicalTest', 'MedicalTest', 'Any medical test, typically performed for diagnostic purposes.'),
(1480, 1, 6, 'SoftwareSourceCode', 'SoftwareSourceCode', 'Computer programming source code. Example: Full (compile ready) solutions, code snippet samples, scripts, templates.'),
(1481, 1, 6, 'ReservationPackage', 'ReservationPackage', 'A group of multiple reservations with common values for all sub-reservations.'),
(1482, 1, 6, 'MediaManipulationRatingEnumeration', 'MediaManipulationRatingEnumeration', ' Codes for use with the [[mediaAuthenticityCategory]] property, indicating the authenticity of a media object (in the context of how it was published or shared). In general these codes are not mutually exclusive, although some combinations (such as \'original\' versus \'transformed\', \'edited\' and \'staged\') would be contradictory if applied in the same [[MediaReview]]. Note that the application of these codes is with regard to a piece of media shared or published in a particular context.'),
(1483, 1, 6, 'LegalService', 'LegalService', 'A LegalService is a business that provides legally-oriented services, advice and representation, e.g. law firms.\\n\\nAs a [[LocalBusiness]] it can be described as a [[provider]] of one or more [[Service]]\\(s).'),
(1484, 1, 6, 'ReturnLabelSourceEnumeration', 'ReturnLabelSourceEnumeration', 'Enumerates several types of return labels for product returns.'),
(1485, 1, 6, 'TouristAttraction', 'TouristAttraction', 'A tourist attraction.  In principle any Thing can be a [[TouristAttraction]], from a [[Mountain]] and [[LandmarksOrHistoricalBuildings]] to a [[LocalBusiness]].  This Type can be used on its own to describe a general [[TouristAttraction]], or be used as an [[additionalType]] to add tourist attraction properties to any other type.  (See examples below)'),
(1486, 1, 6, 'AnatomicalSystem', 'AnatomicalSystem', 'An anatomical system is a group of anatomical structures that work together to perform a certain task. Anatomical systems, such as organ systems, are one organizing principle of anatomy, and can include circulatory, digestive, endocrine, integumentary, immune, lymphatic, muscular, nervous, reproductive, respiratory, skeletal, urinary, vestibular, and other systems.'),
(1487, 1, 6, 'ControlAction', 'ControlAction', 'An agent controls a device or application.'),
(1488, 1, 6, 'RealEstateAgent', 'RealEstateAgent', 'A real-estate agent.'),
(1489, 1, 6, 'Action', 'Action', 'An action performed by a direct agent and indirect participants upon a direct object. Optionally happens at a location with the help of an inanimate instrument. The execution of the action may produce a result. Specific action sub-type documentation specifies the exact expectation of each argument/role.\\n\\nSee also [blog post](http://blog.schema.org/2014/04/announcing-schemaorg-actions.html) and [Actions overview document](https://schema.org/docs/actions.html).'),
(1490, 1, 6, 'WorkBasedProgram', 'WorkBasedProgram', 'A program with both an educational and employment component. Typically based at a workplace and structured around work-based learning, with the aim of instilling competencies related to an occupation. WorkBasedProgram is used to distinguish programs such as apprenticeships from school, college or other classroom based educational programs.'),
(1491, 1, 6, 'PaymentChargeSpecification', 'PaymentChargeSpecification', 'The costs of settling the payment using a particular payment method.'),
(1492, 1, 6, 'WarrantyPromise', 'WarrantyPromise', 'A structured value representing the duration and scope of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.'),
(1493, 1, 6, 'SpecialAnnouncement', 'SpecialAnnouncement', 'A SpecialAnnouncement combines a simple date-stamped textual information update\n      with contextualized Web links and other structured data.  It represents an information update made by a\n      locally-oriented organization, for example schools, pharmacies, healthcare providers,  community groups, police,\n      local government.\n\nFor work in progress guidelines on Coronavirus-related markup see [this doc](https://docs.google.com/document/d/14ikaGCKxo50rRM7nvKSlbUpjyIk2WMQd3IkB1lItlrM/edit#).\n\nThe motivating scenario for SpecialAnnouncement is the [Coronavirus pandemic](https://en.wikipedia.org/wiki/2019%E2%80%9320_coronavirus_pandemic), and the initial vocabulary is oriented to this urgent situation. Schema.org\nexpect to improve the markup iteratively as it is deployed and as feedback emerges from use. In addition to our\nusual [Github entry](https://github.com/schemaorg/schemaorg/issues/2490), feedback comments can also be provided in [this document](https://docs.google.com/document/d/1fpdFFxk8s87CWwACs53SGkYv3aafSxz_DTtOQxMrBJQ/edit#).\n\n\nWhile this schema is designed to communicate urgent crisis-related information, it is not the same as an emergency warning technology like [CAP](https://en.wikipedia.org/wiki/Common_Alerting_Protocol), although there may be overlaps. The intent is to cover\nthe kinds of everyday practical information being posted to existing websites during an emergency situation.\n\nSeveral kinds of information can be provided:\n\nWe encourage the provision of \"name\", \"text\", \"datePosted\", \"expires\" (if appropriate), \"category\" and\n\"url\" as a simple baseline. It is important to provide a value for \"category\" where possible, most ideally as a well known\nURL from Wikipedia or Wikidata. In the case of the 2019-2020 Coronavirus pandemic, this should be \"https://en.wikipedia.org/w/index.php?title=2019-20\\_coronavirus\\_pandemic\" or \"https://www.wikidata.org/wiki/Q81068910\".\n\nFor many of the possible properties, values can either be simple links or an inline description, depending on whether a summary is available. For a link, provide just the URL of the appropriate page as the property\'s value. For an inline description, use a [[WebContent]] type, and provide the url as a property of that, alongside at least a simple \"[[text]]\" summary of the page. It is\nunlikely that a single SpecialAnnouncement will need all of the possible properties simultaneously.\n\nWe expect that in many cases the page referenced might contain more specialized structured data, e.g. contact info, [[openingHours]], [[Event]], [[FAQPage]] etc. By linking to those pages from a [[SpecialAnnouncement]] you can help make it clearer that the events are related to the situation (e.g. Coronavirus) indicated by the [[category]] property of the [[SpecialAnnouncement]].\n\nMany [[SpecialAnnouncement]]s will relate to particular regions and to identifiable local organizations. Use [[spatialCoverage]] for the region, and [[announcementLocation]] to indicate specific [[LocalBusiness]]es and [[CivicStructure]]s. If the announcement affects both a particular region and a specific location (for example, a library closure that serves an entire region), use both [[spatialCoverage]] and [[announcementLocation]].\n\nThe [[about]] property can be used to indicate entities that are the focus of the announcement. We now recommend using [[about]] only\nfor representing non-location entities (e.g. a [[Course]] or a [[RadioStation]]). For places, use [[announcementLocation]] and [[spatialCoverage]]. Consumers of this markup should be aware that the initial design encouraged the use of [[about]] for locations too.\n\nThe basic content of [[SpecialAnnouncement]] is similar to that of an [RSS](https://en.wikipedia.org/wiki/RSS) or [Atom](https://en.wikipedia.org/wiki/Atom_(Web_standard)) feed. For publishers without such feeds, basic feed-like information can be shared by posting\n[[SpecialAnnouncement]] updates in a page, e.g. using JSON-LD. For sites with Atom/RSS functionality, you can point to a feed\nwith the [[webFeed]] property. This can be a simple URL, or an inline [[DataFeed]] object, with [[encodingFormat]] providing\nmedia type information, e.g. \"application/rss+xml\" or \"application/atom+xml\".\n'),
(1494, 1, 6, 'Claim', 'Claim', 'A [[Claim]] in Schema.org represents a specific, factually-oriented claim that could be the [[itemReviewed]] in a [[ClaimReview]]. The content of a claim can be summarized with the [[text]] property. Variations on well known claims can have their common identity indicated via [[sameAs]] links, and summarized with a [[name]]. Ideally, a [[Claim]] description includes enough contextual information to minimize the risk of ambiguity or inclarity. In practice, many claims are better understood in the context in which they appear or the interpretations provided by claim reviews.\n\n  Beyond [[ClaimReview]], the Claim type can be associated with related creative works - for example a [[ScholarlyArticle]] or [[Question]] might be [[about]] some [[Claim]].\n\n  At this time, Schema.org does not define any types of relationship between claims. This is a natural area for future exploration.\n  '),
(1495, 1, 6, 'BedDetails', 'BedDetails', 'An entity holding detailed information about the available bed types, e.g. the quantity of twin beds for a hotel room. For the single case of just one bed of a certain type, you can use bed directly with a text. See also [[BedType]] (under development).'),
(1496, 1, 6, 'Blog', 'Blog', 'A [blog](https://en.wikipedia.org/wiki/Blog), sometimes known as a \"weblog\". Note that the individual posts ([[BlogPosting]]s) in a [[Blog]] are often colloquially referred to by the same term.'),
(1497, 1, 6, 'ReturnMethodEnumeration', 'ReturnMethodEnumeration', 'Enumerates several types of product return methods.'),
(1498, 1, 6, 'DateTime', 'DateTime', 'A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (see Chapter 5.4 of ISO 8601).'),
(1499, 1, 6, 'MedicalEntity', 'MedicalEntity', 'The most generic type of entity related to health and the practice of medicine.'),
(1500, 1, 6, 'DataType', 'DataType', 'The basic data types such as Integers, Strings, etc.'),
(1501, 1, 6, 'PriceComponentTypeEnumeration', 'PriceComponentTypeEnumeration', 'Enumerates different price components that together make up the total price for an offered product.'),
(1502, 1, 6, 'ComicIssue', 'ComicIssue', 'Individual comic issues are serially published as\n    	part of a larger series. For the sake of consistency, even one-shot issues\n    	belong to a series comprised of a single issue. All comic issues can be\n    	uniquely identified by: the combination of the name and volume number of the\n    	series to which the issue belongs; the issue number; and the variant\n    	description of the issue (if any).'),
(1503, 1, 6, 'MoveAction', 'MoveAction', 'The act of an agent relocating to a place.\\n\\nRelated actions:\\n\\n* [[TransferAction]]: Unlike TransferAction, the subject of the move is a living Person or Organization rather than an inanimate object.'),
(1504, 1, 6, 'TaxiService', 'TaxiService', 'A service for a vehicle for hire with a driver for local travel. Fares are usually calculated based on distance traveled.'),
(1505, 1, 6, 'DatedMoneySpecification', 'DatedMoneySpecification', 'A DatedMoneySpecification represents monetary values with optional start and end dates. For example, this could represent an employee\'s salary over a specific period of time. __Note:__ This type has been superseded by [[MonetaryAmount]], use of that type is recommended.'),
(1506, 1, 6, 'TravelAction', 'TravelAction', 'The act of traveling from a fromLocation to a destination by a specified mode of transport, optionally with participants.'),
(1507, 1, 6, 'Time', 'Time', 'A point in time recurring on multiple days in the form hh:mm:ss[Z|(+|-)hh:mm] (see [XML schema for details](http://www.w3.org/TR/xmlschema-2/#time)).'),
(1508, 1, 6, 'MedicalObservationalStudy', 'MedicalObservationalStudy', 'An observational study is a type of medical study that attempts to infer the possible effect of a treatment through observation of a cohort of subjects over a period of time. In an observational study, the assignment of subjects into treatment groups versus control groups is outside the control of the investigator. This is in contrast with controlled studies, such as the randomized controlled trials represented by MedicalTrial, where each subject is randomly assigned to a treatment group or a control group before the start of the treatment.'),
(1509, 1, 6, 'Chapter', 'Chapter', 'One of the sections into which a book is divided. A chapter usually has a section number or a name.'),
(1510, 1, 6, 'DrugCostCategory', 'DrugCostCategory', 'Enumerated categories of medical drug costs.'),
(1511, 1, 6, 'PodcastSeries', 'PodcastSeries', 'A podcast is an episodic series of digital audio or video files which a user can download and listen to.'),
(1512, 1, 6, 'Flight', 'Flight', 'An airline flight.'),
(1513, 1, 6, 'MusicReleaseFormatType', 'MusicReleaseFormatType', 'Format of this release (the type of recording media used, i.e. compact disc, digital media, LP, etc.).'),
(1514, 1, 6, 'CriticReview', 'CriticReview', 'A [[CriticReview]] is a more specialized form of Review written or published by a source that is recognized for its reviewing activities. These can include online columns, travel and food guides, TV and radio shows, blogs and other independent Web sites. [[CriticReview]]s are typically more in-depth and professionally written. For simpler, casually written user/visitor/viewer/customer reviews, it is more appropriate to use the [[UserReview]] type. Review aggregator sites such as Metacritic already separate out the site\'s user reviews from selected critic reviews that originate from third-party sources.'),
(1515, 1, 6, 'MediaReview', 'MediaReview', 'A [[MediaReview]] is a more specialized form of Review dedicated to the evaluation of media content online, typically in the context of fact-checking and misinformation.\n    For more general reviews of media in the broader sense, use [[UserReview]], [[CriticReview]] or other [[Review]] types. This definition is\n    a work in progress. While the [[MediaManipulationRatingEnumeration]] list reflects significant community review amongst fact-checkers and others working\n    to combat misinformation, the specific structures for representing media objects, their versions and publication context, are still evolving. Similarly, best practices for the relationship between [[MediaReview]] and [[ClaimReview]] markup have not yet been finalized.'),
(1516, 1, 6, 'EmergencyService', 'EmergencyService', 'An emergency service, such as a fire station or ER.'),
(1517, 1, 6, 'PayAction', 'PayAction', 'An agent pays a price to a participant.'),
(1518, 1, 6, 'Map', 'Map', 'A map.'),
(1519, 1, 6, 'Protein', 'Protein', 'Protein is here used in its widest possible definition, as classes of amino acid based molecules. Amyloid-beta Protein in human (UniProt P05067), eukaryota (e.g. an OrthoDB group) or even a single molecule that one can point to are all of type schema:Protein. A protein can thus be a subclass of another protein, e.g. schema:Protein as a UniProt record can have multiple isoforms inside it which would also be schema:Protein. They can be imagined, synthetic, hypothetical or naturally occurring.'),
(1520, 1, 6, 'ConsumeAction', 'ConsumeAction', 'The act of ingesting information/resources/food.'),
(1521, 1, 6, 'MedicalImagingTechnique', 'MedicalImagingTechnique', 'Any medical imaging modality typically used for diagnostic purposes. Enumerated type.'),
(1522, 1, 6, 'SolveMathAction', 'SolveMathAction', 'The action that takes in a math expression and directs users to a page potentially capable of solving/simplifying that expression.'),
(1523, 1, 6, 'DriveWheelConfigurationValue', 'DriveWheelConfigurationValue', 'A value indicating which roadwheels will receive torque.'),
(1524, 1, 6, 'MedicalClinic', 'MedicalClinic', 'A facility, often associated with a hospital or medical school, that is devoted to the specific diagnosis and/or healthcare. Previously limited to outpatients but with evolution it may be open to inpatients as well.'),
(1525, 1, 6, 'Question', 'Question', 'A specific question - e.g. from a user seeking answers online, or collected in a Frequently Asked Questions (FAQ) document.'),
(1526, 1, 6, 'BroadcastFrequencySpecification', 'BroadcastFrequencySpecification', 'The frequency in MHz and the modulation used for a particular BroadcastService.'),
(1527, 1, 6, 'DeliveryMethod', 'DeliveryMethod', 'A delivery method is a standardized procedure for transferring the product or service to the destination of fulfillment chosen by the customer. Delivery methods are characterized by the means of transportation used, and by the organization or group that is the contracting party for the sending organization or person.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#DeliveryModeDirectDownload\\n* http://purl.org/goodrelations/v1#DeliveryModeFreight\\n* http://purl.org/goodrelations/v1#DeliveryModeMail\\n* http://purl.org/goodrelations/v1#DeliveryModeOwnFleet\\n* http://purl.org/goodrelations/v1#DeliveryModePickUp\\n* http://purl.org/goodrelations/v1#DHL\\n* http://purl.org/goodrelations/v1#FederalExpress\\n* http://purl.org/goodrelations/v1#UPS\n        '),
(1528, 1, 6, 'Drug', 'Drug', 'A chemical or biologic substance, used as a medical therapy, that has a physiological effect on an organism. Here the term drug is used interchangeably with the term medicine although clinical knowledge makes a clear difference between them.'),
(1529, 1, 6, 'ItemList', 'ItemList', 'A list of items of any sort&#x2014;for example, Top 10 Movies About Weathermen, or Top 100 Party Songs. Not to be confused with HTML lists, which are often used only for formatting.'),
(1530, 1, 6, 'PerformAction', 'PerformAction', 'The act of participating in performance arts.'),
(1531, 1, 6, 'DigitalDocumentPermission', 'DigitalDocumentPermission', 'A permission for a particular person or group to access a particular file.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1532, 1, 6, 'Guide', 'Guide', '[[Guide]] is a page or article that recommends specific products or services, or aspects of a thing for a user to consider. A [[Guide]] may represent a Buying Guide and detail aspects of products or services for a user to consider. A [[Guide]] may represent a Product Guide and recommend specific products or services. A [[Guide]] may represent a Ranked List and recommend specific products or services with ranking.'),
(1533, 1, 6, 'SocialMediaPosting', 'SocialMediaPosting', 'A post to a social media platform, including blog posts, tweets, Facebook posts, etc.'),
(1534, 1, 6, 'TherapeuticProcedure', 'TherapeuticProcedure', 'A medical procedure intended primarily for therapeutic purposes, aimed at improving a health condition.'),
(1535, 1, 6, 'BoatTerminal', 'BoatTerminal', 'A terminal for boats, ships, and other water vessels.'),
(1536, 1, 6, 'Quotation', 'Quotation', 'A quotation. Often but not necessarily from some written work, attributable to a real world author and - if associated with a fictional character - to any fictional Person. Use [[isBasedOn]] to link to source/origin. The [[recordedIn]] property can be used to reference a Quotation from an [[Event]].'),
(1537, 1, 6, 'PublicationVolume', 'PublicationVolume', 'A part of a successively published publication such as a periodical or multi-volume work, often numbered. It may represent a time span, such as a year.\\n\\nSee also [blog post](http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html).'),
(1538, 1, 6, 'WebApplication', 'WebApplication', 'Web applications.'),
(1539, 1, 6, 'Substance', 'Substance', 'Any matter of defined composition that has discrete existence, whose origin may be biological, mineral or chemical.'),
(1540, 1, 6, 'CssSelectorType', 'CssSelectorType', 'Text representing a CSS selector.'),
(1541, 1, 6, 'BroadcastService', 'BroadcastService', 'A delivery service through which content is provided via broadcast over the air or online.'),
(1542, 1, 6, 'Place', 'Place', 'Entities that have a somewhat fixed, physical extension.'),
(1543, 1, 6, 'MaximumDoseSchedule', 'MaximumDoseSchedule', 'The maximum dosing schedule considered safe for a drug or supplement as recommended by an authority or by the drug/supplement\'s manufacturer. Capture the recommending authority in the recognizingAuthority property of MedicalEntity.'),
(1544, 1, 6, 'UKNonprofitType', 'UKNonprofitType', 'UKNonprofitType: Non-profit organization type originating from the United Kingdom.'),
(1545, 1, 6, 'DrugPregnancyCategory', 'DrugPregnancyCategory', 'Categories that represent an assessment of the risk of fetal injury due to a drug or pharmaceutical used as directed by the mother during pregnancy.'),
(1546, 1, 6, 'EmployeeRole', 'EmployeeRole', 'A subclass of OrganizationRole used to describe employee relationships.'),
(1547, 1, 6, 'Mass', 'Mass', 'Properties that take Mass as values are of the form \'&lt;Number&gt; &lt;Mass unit of measure&gt;\'. E.g., \'7 kg\'.'),
(1548, 1, 6, 'MedicalTestPanel', 'MedicalTestPanel', 'Any collection of tests commonly ordered together.'),
(1549, 1, 6, 'FinancialService', 'FinancialService', 'Financial services business.'),
(1550, 1, 6, 'CarUsageType', 'CarUsageType', 'A value indicating a special usage of a car, e.g. commercial rental, driving school, or as a taxi.'),
(1551, 1, 6, 'DietarySupplement', 'DietarySupplement', 'A product taken by mouth that contains a dietary ingredient intended to supplement the diet. Dietary ingredients may include vitamins, minerals, herbs or other botanicals, amino acids, and substances such as enzymes, organ tissues, glandulars and metabolites.'),
(1552, 1, 6, 'StatusEnumeration', 'StatusEnumeration', 'Lists or enumerations dealing with status types.'),
(1553, 1, 6, 'InteractAction', 'InteractAction', 'The act of interacting with another person or organization.'),
(1554, 1, 6, 'CivicStructure', 'CivicStructure', 'A public structure, such as a town hall or concert hall.'),
(1555, 1, 6, 'MedicalContraindication', 'MedicalContraindication', 'A condition or factor that serves as a reason to withhold a certain medical therapy. Contraindications can be absolute (there are no reasonable circumstances for undertaking a course of action) or relative (the patient is at higher risk of complications, but these risks may be outweighed by other considerations or mitigated by other measures).'),
(1556, 1, 6, 'LeaveAction', 'LeaveAction', 'An agent leaves an event / group with participants/friends at a location.\\n\\nRelated actions:\\n\\n* [[JoinAction]]: The antonym of LeaveAction.\\n* [[UnRegisterAction]]: Unlike UnRegisterAction, LeaveAction implies leaving a group/team of people rather than a service.'),
(1557, 1, 6, 'AskAction', 'AskAction', 'The act of posing a question / favor to someone.\\n\\nRelated actions:\\n\\n* [[ReplyAction]]: Appears generally as a response to AskAction.'),
(1558, 1, 6, 'OrderStatus', 'OrderStatus', 'Enumerated status values for Order.'),
(1559, 1, 6, 'CorrectionComment', 'CorrectionComment', 'A [[comment]] that corrects [[CreativeWork]].'),
(1560, 1, 6, 'RestrictedDiet', 'RestrictedDiet', 'A diet restricted to certain foods or preparations for cultural, religious, health or lifestyle reasons. '),
(1561, 1, 6, 'Text', 'Text', 'Data type: Text.'),
(1562, 1, 6, 'CollectionPage', 'CollectionPage', 'Web page type: Collection page.'),
(1563, 1, 6, 'MusicComposition', 'MusicComposition', 'A musical composition.'),
(1564, 1, 6, 'LodgingBusiness', 'LodgingBusiness', 'A lodging business, such as a motel, hotel, or inn.'),
(1565, 1, 6, 'OrderAction', 'OrderAction', 'An agent orders an object/product/service to be delivered/sent.'),
(1566, 1, 6, 'VideoObject', 'VideoObject', 'A video file.'),
(1567, 1, 6, 'MedicalCause', 'MedicalCause', 'The causative agent(s) that are responsible for the pathophysiologic process that eventually results in a medical condition, symptom or sign. In this schema, unless otherwise specified this is meant to be the proximate cause of the medical condition, symptom or sign. The proximate cause is defined as the causative agent that most directly results in the medical condition, symptom or sign. For example, the HIV virus could be considered a cause of AIDS. Or in a diagnostic context, if a patient fell and sustained a hip fracture and two days later sustained a pulmonary embolism which eventuated in a cardiac arrest, the cause of the cardiac arrest (the proximate cause) would be the pulmonary embolism and not the fall. Medical causes can include cardiovascular, chemical, dermatologic, endocrine, environmental, gastroenterologic, genetic, hematologic, gynecologic, iatrogenic, infectious, musculoskeletal, neurologic, nutritional, obstetric, oncologic, otolaryngologic, pharmacologic, psychiatric, pulmonary, renal, rheumatologic, toxic, traumatic, or urologic causes; medical conditions can be causes as well.'),
(1568, 1, 6, 'TouristDestination', 'TouristDestination', 'A tourist destination. In principle any [[Place]] can be a [[TouristDestination]] from a [[City]], Region or [[Country]] to an [[AmusementPark]] or [[Hotel]]. This Type can be used on its own to describe a general [[TouristDestination]], or be used as an [[additionalType]] to add tourist relevant properties to any other [[Place]].  A [[TouristDestination]] is defined as a [[Place]] that contains, or is colocated with, one or more [[TouristAttraction]]s, often linked by a similar theme or interest to a particular [[touristType]]. The [UNWTO](http://www2.unwto.org/) defines Destination (main destination of a tourism trip) as the place visited that is central to the decision to take the trip.\n  (See examples below.)'),
(1569, 1, 6, 'PhysicalExam', 'PhysicalExam', 'A type of physical examination of a patient performed by a physician. '),
(1570, 1, 6, 'LegalForceStatus', 'LegalForceStatus', 'A list of possible statuses for the legal force of a legislation.'),
(1571, 1, 6, 'ItemListOrderType', 'ItemListOrderType', 'Enumerated for values for itemListOrder for indicating how an ordered ItemList is organized.'),
(1572, 1, 6, 'SportsEvent', 'SportsEvent', 'Event type: Sports event.'),
(1573, 1, 6, 'WearableMeasurementTypeEnumeration', 'WearableMeasurementTypeEnumeration', 'Enumerates common types of measurement for wearables products.'),
(1574, 1, 6, 'Patient', 'Patient', 'A patient is any person recipient of health care services.'),
(1575, 1, 6, 'Store', 'Store', 'A retail good store.'),
(1576, 1, 6, 'NonprofitType', 'NonprofitType', 'NonprofitType enumerates several kinds of official non-profit types of which a non-profit organization can be.'),
(1577, 1, 6, '3DModel', '3DModel', 'A 3D model represents some kind of 3D content, which may have [[encoding]]s in one or more [[MediaObject]]s. Many 3D formats are available (e.g. see [Wikipedia](https://en.wikipedia.org/wiki/Category:3D_graphics_file_formats)); specific encoding formats can be represented using the [[encodingFormat]] property applied to the relevant [[MediaObject]]. For the\ncase of a single file published after Zip compression, the convention of appending \'+zip\' to the [[encodingFormat]] can be used. Geospatial, AR/VR, artistic/animation, gaming, engineering and scientific content can all be represented using [[3DModel]].'),
(1578, 1, 6, 'Car', 'Car', 'A car is a wheeled, self-powered motor vehicle used for transportation.'),
(1579, 1, 6, 'DayOfWeek', 'DayOfWeek', 'The day of the week, e.g. used to specify to which day the opening hours of an OpeningHoursSpecification refer.\n\nOriginally, URLs from [GoodRelations](http://purl.org/goodrelations/v1) were used (for [[Monday]], [[Tuesday]], [[Wednesday]], [[Thursday]], [[Friday]], [[Saturday]], [[Sunday]] plus a special entry for [[PublicHolidays]]); these have now been integrated directly into schema.org.\n      '),
(1580, 1, 6, 'TypeAndQuantityNode', 'TypeAndQuantityNode', 'A structured value indicating the quantity, unit of measurement, and business function of goods included in a bundle offer.'),
(1581, 1, 6, 'ShippingRateSettings', 'ShippingRateSettings', 'A ShippingRateSettings represents re-usable pieces of shipping information. It is designed for publication on an URL that may be referenced via the [[shippingSettingsLink]] property of an [[OfferShippingDetails]]. Several occurrences can be published, distinguished and matched (i.e. identified/referenced) by their different values for [[shippingLabel]].'),
(1582, 1, 6, 'PaymentCard', 'PaymentCard', 'A payment method using a credit, debit, store or other card to associate the payment with an account.'),
(1583, 1, 6, 'MedicalStudy', 'MedicalStudy', 'A medical study is an umbrella type covering all kinds of research studies relating to human medicine or health, including observational studies and interventional trials and registries, randomized, controlled or not. When the specific type of study is known, use one of the extensions of this type, such as MedicalTrial or MedicalObservationalStudy. Also, note that this type should be used to mark up data that describes the study itself; to tag an article that publishes the results of a study, use MedicalScholarlyArticle. Note: use the code property of MedicalEntity to store study IDs, e.g. clinicaltrials.gov ID.'),
(1584, 1, 6, 'MortgageLoan', 'MortgageLoan', 'A loan in which property or real estate is used as collateral. (A loan securitized against some real estate.)'),
(1585, 1, 6, 'Collection', 'Collection', 'A collection of items, e.g. creative works or products.'),
(1586, 1, 6, 'InfectiousAgentClass', 'InfectiousAgentClass', 'Classes of agents or pathogens that transmit infectious diseases. Enumerated type.'),
(1587, 1, 6, 'APIReference', 'APIReference', 'Reference documentation for application programming interfaces (APIs).'),
(1588, 1, 6, 'Country', 'Country', 'A country.'),
(1589, 1, 6, 'PropertyValue', 'PropertyValue', 'A property-value pair, e.g. representing a feature of a product or place. Use the \'name\' property for the name of the property. If there is an additional human-readable version of the value, put that into the \'description\' property.\\n\\n Always use specific schema.org properties when a) they exist and b) you can populate them. Using PropertyValue as a substitute will typically not trigger the same effect as using the original, specific property.\n    '),
(1590, 1, 6, 'HowToSupply', 'HowToSupply', 'A supply consumed when performing the instructions for how to achieve a result.'),
(1591, 1, 6, 'StatisticalPopulation', 'StatisticalPopulation', 'A StatisticalPopulation is a set of instances of a certain given type that satisfy some set of constraints. The property [[populationType]] is used to specify the type. Any property that can be used on instances of that type can appear on the statistical population. For example, a [[StatisticalPopulation]] representing all [[Person]]s with a [[homeLocation]] of East Podunk California would be described by applying the appropriate [[homeLocation]] and [[populationType]] properties to a [[StatisticalPopulation]] item that stands for that set of people.\nThe properties [[numConstraints]] and [[constrainingProperty]] are used to specify which of the populations properties are used to specify the population. Note that the sense of \"population\" used here is the general sense of a statistical\npopulation, and does not imply that the population consists of people. For example, a [[populationType]] of [[Event]] or [[NewsArticle]] could be used. See also [[Observation]], and the [data and datasets](/docs/data-and-datasets.html) overview for more details.\n  '),
(1592, 1, 6, 'Periodical', 'Periodical', 'A publication in any medium issued in successive parts bearing numerical or chronological designations and intended to continue indefinitely, such as a magazine, scholarly journal, or newspaper.\\n\\nSee also [blog post](http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html).'),
(1593, 1, 6, 'Hospital', 'Hospital', 'A hospital.'),
(1594, 1, 6, 'WebAPI', 'WebAPI', 'An application programming interface accessible over Web/Internet technologies.'),
(1595, 1, 6, 'ActionAccessSpecification', 'ActionAccessSpecification', 'A set of requirements that must be fulfilled in order to perform an Action.'),
(1596, 1, 6, 'QualitativeValue', 'QualitativeValue', 'A predefined value for a product characteristic, e.g. the power cord plug type \'US\' or the garment sizes \'S\', \'M\', \'L\', and \'XL\'.'),
(1597, 1, 6, 'BroadcastChannel', 'BroadcastChannel', 'A unique instance of a BroadcastService on a CableOrSatelliteService lineup.'),
(1598, 1, 6, 'WriteAction', 'WriteAction', 'The act of authoring written creative content.'),
(1599, 1, 6, 'Rating', 'Rating', 'A rating is an evaluation on a numeric scale, such as 1 to 5 stars.'),
(1600, 1, 6, 'Trip', 'Trip', 'A trip or journey. An itinerary of visits to one or more places.'),
(1601, 1, 6, 'TradeAction', 'TradeAction', 'The act of participating in an exchange of goods and services for monetary compensation. An agent trades an object, product or service with a participant in exchange for a one time or periodic payment.'),
(1602, 1, 6, 'GeospatialGeometry', 'GeospatialGeometry', '(Eventually to be defined as) a supertype of GeoShape designed to accommodate definitions from Geo-Spatial best practices.'),
(1603, 1, 6, 'EnergyEfficiencyEnumeration', 'EnergyEfficiencyEnumeration', 'Enumerates energy efficiency levels (also known as \"classes\" or \"ratings\") and certifications that are part of several international energy efficiency standards.'),
(1604, 1, 6, 'DataDownload', 'DataDownload', 'All or part of a [[Dataset]] in downloadable form. '),
(1605, 1, 6, 'ReturnFeesEnumeration', 'ReturnFeesEnumeration', 'Enumerates several kinds of policies for product return fees.'),
(1606, 1, 6, 'LinkRole', 'LinkRole', 'A Role that represents a Web link, e.g. as expressed via the \'url\' property. Its linkRelationship property can indicate URL-based and plain textual link types, e.g. those in IANA link registry or others such as \'amphtml\'. This structure provides a placeholder where details from HTML\'s link element can be represented outside of HTML, e.g. in JSON-LD feeds.'),
(1607, 1, 6, 'NewsArticle', 'NewsArticle', 'A NewsArticle is an article whose content reports news, or provides background context and supporting materials for understanding the news.\n\nA more detailed overview of [schema.org News markup](/docs/news.html) is also available.\n'),
(1608, 1, 6, 'Game', 'Game', 'The Game type represents things which are games. These are typically rule-governed recreational activities, e.g. role-playing games in which players assume the role of characters in a fictional setting.'),
(1609, 1, 6, 'ParcelDelivery', 'ParcelDelivery', 'The delivery of a parcel either via the postal service or a commercial service.'),
(1610, 1, 6, 'GameServerStatus', 'GameServerStatus', 'Status of a game server.'),
(1611, 1, 6, 'Demand', 'Demand', 'A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services. For describing demand using this type, the very same properties used for Offer apply.'),
(1612, 1, 6, 'MathSolver', 'MathSolver', 'A math solver which is capable of solving a subset of mathematical problems.'),
(1613, 1, 6, 'WebPageElement', 'WebPageElement', 'A web page element, like a table or an image.'),
(1614, 1, 6, 'MedicalGuidelineRecommendation', 'MedicalGuidelineRecommendation', 'A guideline recommendation that is regarded as efficacious and where quality of the data supporting the recommendation is sound.'),
(1615, 1, 6, 'TVSeason', 'TVSeason', 'Season dedicated to TV broadcast and associated online delivery.'),
(1616, 1, 6, 'SearchAction', 'SearchAction', 'The act of searching for an object.\\n\\nRelated actions:\\n\\n* [[FindAction]]: SearchAction generally leads to a FindAction, but not necessarily.'),
(1617, 1, 6, 'CableOrSatelliteService', 'CableOrSatelliteService', 'A service which provides access to media programming like TV or radio. Access may be via cable or satellite.'),
(1618, 1, 6, 'MonetaryAmountDistribution', 'MonetaryAmountDistribution', 'A statistical distribution of monetary amounts.'),
(1619, 1, 6, 'BusStop', 'BusStop', 'A bus stop.'),
(1620, 1, 6, 'ExercisePlan', 'ExercisePlan', 'Fitness-related activity designed for a specific health-related purpose, including defined exercise routines as well as activity prescribed by a clinician.'),
(1621, 1, 6, 'Photograph', 'Photograph', 'A photograph.'),
(1622, 1, 6, 'MenuSection', 'MenuSection', 'A sub-grouping of food or drink items in a menu. E.g. courses (such as \'Dinner\', \'Breakfast\', etc.), specific type of dishes (such as \'Meat\', \'Vegan\', \'Drinks\', etc.), or some other classification made by the menu provider.'),
(1623, 1, 6, 'Order', 'Order', 'An order is a confirmation of a transaction (a receipt), which can contain multiple line items, each represented by an Offer that has been accepted by the customer.'),
(1624, 1, 6, 'AlignmentObject', 'AlignmentObject', 'An intangible item that describes an alignment between a learning resource and a node in an educational framework.\n\nShould not be used where the nature of the alignment can be described using a simple property, for example to express that a resource [[teaches]] or [[assesses]] a competency.'),
(1625, 1, 6, 'Legislation', 'Legislation', 'A legal document such as an act, decree, bill, etc. (enforceable or not) or a component of a legal act (like an article).'),
(1626, 1, 6, 'ApartmentComplex', 'ApartmentComplex', 'Residence type: Apartment complex.'),
(1627, 1, 6, 'WearableSizeGroupEnumeration', 'WearableSizeGroupEnumeration', 'Enumerates common size groups (also known as \"size types\") for wearable products.'),
(1628, 1, 6, 'Project', 'Project', 'An enterprise (potentially individual but typically collaborative), planned to achieve a particular aim.\nUse properties from [[Organization]], [[subOrganization]]/[[parentOrganization]] to indicate project sub-structures. \n   '),
(1629, 1, 6, 'DefinedTermSet', 'DefinedTermSet', 'A set of defined terms, for example a set of categories or a classification scheme, a glossary, dictionary or enumeration.'),
(1630, 1, 6, 'SteeringPositionValue', 'SteeringPositionValue', 'A value indicating a steering position.'),
(1631, 1, 6, 'BusTrip', 'BusTrip', 'A trip on a commercial bus line.'),
(1632, 1, 6, 'DeliveryTimeSettings', 'DeliveryTimeSettings', 'A DeliveryTimeSettings represents re-usable pieces of shipping information, relating to timing. It is designed for publication on an URL that may be referenced via the [[shippingSettingsLink]] property of an [[OfferShippingDetails]]. Several occurrences can be published, distinguished (and identified/referenced) by their different values for [[transitTimeLabel]].'),
(1633, 1, 6, 'OfferCatalog', 'OfferCatalog', 'An OfferCatalog is an ItemList that contains related Offers and/or further OfferCatalogs that are offeredBy the same provider.'),
(1634, 1, 6, 'MedicalTrialDesign', 'MedicalTrialDesign', 'Design models for medical trials. Enumerated type.'),
(1635, 1, 6, 'CoverArt', 'CoverArt', 'The artwork on the outer surface of a CreativeWork.'),
(1636, 1, 6, 'PhysicalActivityCategory', 'PhysicalActivityCategory', 'Categories of physical activity, organized by physiologic classification.'),
(1637, 1, 6, 'Product', 'Product', 'Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.'),
(1638, 1, 6, 'InsertAction', 'InsertAction', 'The act of adding at a specific location in an ordered collection.'),
(1639, 1, 6, 'BuyAction', 'BuyAction', 'The act of giving money to a seller in exchange for goods or services rendered. An agent buys an object, product, or service from a seller for a price. Reciprocal of SellAction.'),
(1640, 1, 6, 'MoneyTransfer', 'MoneyTransfer', 'The act of transferring money from one place to another place. This may occur electronically or physically.'),
(1641, 1, 6, 'MapCategoryType', 'MapCategoryType', 'An enumeration of several kinds of Map.'),
(1642, 1, 6, 'SoftwareApplication', 'SoftwareApplication', 'A software application.'),
(1643, 1, 6, 'BreadcrumbList', 'BreadcrumbList', 'A BreadcrumbList is an ItemList consisting of a chain of linked Web pages, typically described using at least their URL and their name, and typically ending with the current page.\\n\\nThe [[position]] property is used to reconstruct the order of the items in a BreadcrumbList. The convention is that a breadcrumb list has an [[itemListOrder]] of [[ItemListOrderAscending]] (lower values listed first), and that the first items in this list correspond to the \"top\" or beginning of the breadcrumb trail, e.g. with a site or section homepage. The specific values of \'position\' are not assigned meaning for a BreadcrumbList, but they should be integers, e.g. beginning with \'1\' for the first item in the list.\n      '),
(1644, 1, 6, 'ItemAvailability', 'ItemAvailability', 'A list of possible product availability options.'),
(1645, 1, 6, 'Airline', 'Airline', 'An organization that provides flights for passengers.'),
(1646, 1, 6, 'BoatTrip', 'BoatTrip', 'A trip on a commercial ferry line.'),
(1647, 1, 6, 'SpeakableSpecification', 'SpeakableSpecification', 'A SpeakableSpecification indicates (typically via [[xpath]] or [[cssSelector]]) sections of a document that are highlighted as particularly [[speakable]]. Instances of this type are expected to be used primarily as values of the [[speakable]] property.'),
(1648, 1, 6, 'HealthAndBeautyBusiness', 'HealthAndBeautyBusiness', 'Health and beauty.'),
(1649, 1, 6, 'MonetaryGrant', 'MonetaryGrant', 'A monetary grant.'),
(1650, 1, 6, 'Article', 'Article', 'An article, such as a news article or piece of investigative report. Newspapers and magazines have articles of many different types and this is intended to cover them all.\\n\\nSee also [blog post](http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html).'),
(1651, 1, 6, 'OpeningHoursSpecification', 'OpeningHoursSpecification', 'A structured value providing information about the opening hours of a place or a certain service inside a place.\\n\\n\nThe place is __open__ if the [[opens]] property is specified, and __closed__ otherwise.\\n\\nIf the value for the [[closes]] property is less than the value for the [[opens]] property then the hour range is assumed to span over the next day.\n      '),
(1652, 1, 6, 'Audience', 'Audience', 'Intended audience for an item, i.e. the group for whom the item was created.'),
(1653, 1, 6, 'ClaimReview', 'ClaimReview', 'A fact-checking review of claims made (or reported) in some creative work (referenced via itemReviewed).'),
(1654, 1, 6, 'EducationalOrganization', 'EducationalOrganization', 'An educational organization.'),
(1655, 1, 6, 'LodgingReservation', 'LodgingReservation', 'A reservation for lodging at a hotel, motel, inn, etc.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(1656, 1, 6, 'DataFeed', 'DataFeed', 'A single feed providing structured information about one or more entities or topics.'),
(1657, 1, 6, 'HealthPlanNetwork', 'HealthPlanNetwork', 'A US-style health insurance plan network. '),
(1658, 1, 6, 'HowToDirection', 'HowToDirection', 'A direction indicating a single action to do in the instructions for how to achieve a result.'),
(1659, 1, 6, 'MedicalAudience', 'MedicalAudience', 'Target audiences for medical web pages.'),
(1660, 1, 6, 'BioChemEntity', 'BioChemEntity', 'Any biological, chemical, or biochemical thing. For example: a protein; a gene; a chemical; a synthetic chemical.'),
(1661, 1, 6, 'SellAction', 'SellAction', 'The act of taking money from a buyer in exchange for goods or services rendered. An agent sells an object, product, or service to a buyer for a price. Reciprocal of BuyAction.'),
(1662, 1, 6, 'OccupationalExperienceRequirements', 'OccupationalExperienceRequirements', 'Indicates employment-related experience requirements, e.g. [[monthsOfExperience]].'),
(1663, 1, 6, 'TechArticle', 'TechArticle', 'A technical article - Example: How-to (task) topics, step-by-step, procedural troubleshooting, specifications, etc.'),
(1664, 1, 6, 'Schedule', 'Schedule', 'A schedule defines a repeating time period used to describe a regularly occurring [[Event]]. At a minimum a schedule will specify [[repeatFrequency]] which describes the interval between occurrences of the event. Additional information can be provided to specify the schedule more precisely.\n      This includes identifying the day(s) of the week or month when the recurring event will take place, in addition to its start and end time. Schedules may also\n      have start and end dates to indicate when they are active, e.g. to define a limited calendar of events.'),
(1665, 1, 6, 'ArchiveComponent', 'ArchiveComponent', 'An intangible type to be applied to any archive content, carrying with it a set of properties required to describe archival items and collections.'),
(1666, 1, 6, 'Permit', 'Permit', 'A permit issued by an organization, e.g. a parking pass.'),
(1667, 1, 6, 'QuantitativeValue', 'QuantitativeValue', ' A point value or interval for product characteristics and other purposes.'),
(1668, 1, 6, 'RepaymentSpecification', 'RepaymentSpecification', 'A structured value representing repayment.'),
(1669, 1, 6, 'OwnershipInfo', 'OwnershipInfo', 'A structured value providing information about when a certain organization or person owned a certain product.'),
(1670, 1, 6, 'Gene', 'Gene', 'A discrete unit of inheritance which affects one or more biological traits (Source: [https://en.wikipedia.org/wiki/Gene](https://en.wikipedia.org/wiki/Gene)). Examples include FOXP2 (Forkhead box protein P2), SCARNA21 (small Cajal body-specific RNA 21), A- (agouti genotype).'),
(1671, 1, 6, 'Resort', 'Resort', 'A resort is a place used for relaxation or recreation, attracting visitors for holidays or vacations. Resorts are places, towns or sometimes commercial establishments operated by a single company (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Resort\">http://en.wikipedia.org/wiki/Resort</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n    '),
(1672, 1, 6, 'UnitPriceSpecification', 'UnitPriceSpecification', 'The price asked for a given offer by the respective organization or person.'),
(1673, 1, 6, 'HowToStep', 'HowToStep', 'A step in the instructions for how to achieve a result. It is an ordered list with HowToDirection and/or HowToTip items.'),
(1674, 1, 6, 'RsvpAction', 'RsvpAction', 'The act of notifying an event organizer as to whether you expect to attend the event.'),
(1675, 1, 6, 'TVSeries', 'TVSeries', 'CreativeWorkSeries dedicated to TV broadcast and associated online delivery.'),
(1676, 1, 6, 'DigitalPlatformEnumeration', 'DigitalPlatformEnumeration', 'Enumerates some common technology platforms, for use with properties such as [[actionPlatform]]. It is not supposed to be comprehensive - when a suitable code is not enumerated here, textual or URL values can be used instead. These codes are at a fairly high level and do not deal with versioning and other nuance. Additional codes can be suggested [in github](https://github.com/schemaorg/schemaorg/issues/3057). '),
(1677, 1, 6, 'USNonprofitType', 'USNonprofitType', 'USNonprofitType: Non-profit organization type originating from the United States.'),
(1678, 1, 6, 'MedicalWebPage', 'MedicalWebPage', 'A web page that provides medical information.'),
(1679, 1, 6, 'FollowAction', 'FollowAction', 'The act of forming a personal connection with someone/something (object) unidirectionally/asymmetrically to get updates polled from.\\n\\nRelated actions:\\n\\n* [[BefriendAction]]: Unlike BefriendAction, FollowAction implies that the connection is *not* necessarily reciprocal.\\n* [[SubscribeAction]]: Unlike SubscribeAction, FollowAction implies that the follower acts as an active agent constantly/actively polling for updates.\\n* [[RegisterAction]]: Unlike RegisterAction, FollowAction implies that the agent is interested in continuing receiving updates from the object.\\n* [[JoinAction]]: Unlike JoinAction, FollowAction implies that the agent is interested in getting updates from the object.\\n* [[TrackAction]]: Unlike TrackAction, FollowAction refers to the polling of updates of all aspects of animate objects rather than the location of inanimate objects (e.g. you track a package, but you don\'t follow it).'),
(1680, 1, 6, 'Movie', 'Movie', 'A movie.'),
(1681, 1, 6, 'Dataset', 'Dataset', 'A body of structured information describing some topic(s) of interest.'),
(1682, 1, 6, 'Offer', 'Offer', 'An offer to transfer some rights to an item or to provide a service — for example, an offer to sell tickets to an event, to rent the DVD of a movie, to stream a TV show over the internet, to repair a motorcycle, or to loan a book.\\n\\nNote: As the [[businessFunction]] property, which identifies the form of offer (e.g. sell, lease, repair, dispose), defaults to http://purl.org/goodrelations/v1#Sell; an Offer without a defined businessFunction value can be assumed to be an offer to sell.\\n\\nFor [GTIN](http://www.gs1.org/barcodes/technical/idkeys/gtin)-related fields, see [Check Digit calculator](http://www.gs1.org/barcodes/support/check_digit_calculator) and [validation guide](http://www.gs1us.org/resources/standards/gtin-validation-guide) from [GS1](http://www.gs1.org/).'),
(1683, 1, 6, 'Book', 'Book', 'A book.'),
(1684, 1, 6, 'NewsMediaOrganization', 'NewsMediaOrganization', 'A News/Media organization such as a newspaper or TV station.'),
(1685, 1, 6, 'PaymentMethod', 'PaymentMethod', 'A payment method is a standardized procedure for transferring the monetary amount for a purchase. Payment methods are characterized by the legal and technical structures used, and by the organization or group carrying out the transaction.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#ByBankTransferInAdvance\\n* http://purl.org/goodrelations/v1#ByInvoice\\n* http://purl.org/goodrelations/v1#Cash\\n* http://purl.org/goodrelations/v1#CheckInAdvance\\n* http://purl.org/goodrelations/v1#COD\\n* http://purl.org/goodrelations/v1#DirectDebit\\n* http://purl.org/goodrelations/v1#GoogleCheckout\\n* http://purl.org/goodrelations/v1#PayPal\\n* http://purl.org/goodrelations/v1#PaySwarm\n        '),
(1686, 1, 6, 'CompoundPriceSpecification', 'CompoundPriceSpecification', 'A compound price specification is one that bundles multiple prices that all apply in combination for different dimensions of consumption. Use the name property of the attached unit price specification for indicating the dimension of a price component (e.g. \"electricity\" or \"final cleaning\").'),
(1687, 1, 6, 'BusStation', 'BusStation', 'A bus station.'),
(1688, 1, 6, 'DrugStrength', 'DrugStrength', 'A specific strength in which a medical drug is available in a specific country.'),
(1689, 1, 6, 'Brand', 'Brand', 'A brand is a name used by an organization or business person for labeling a product, product group, or similar.'),
(1690, 1, 6, 'BoardingPolicyType', 'BoardingPolicyType', 'A type of boarding policy used by an airline.'),
(1691, 1, 6, 'PerformingGroup', 'PerformingGroup', 'A performance group, such as a band, an orchestra, or a circus.'),
(1692, 1, 6, 'Service', 'Service', 'A service provided by an organization, e.g. delivery service, print services, etc.'),
(1693, 1, 6, 'TrackAction', 'TrackAction', 'An agent tracks an object for updates.\\n\\nRelated actions:\\n\\n* [[FollowAction]]: Unlike FollowAction, TrackAction refers to the interest on the location of innanimates objects.\\n* [[SubscribeAction]]: Unlike SubscribeAction, TrackAction refers to  the interest on the location of innanimate objects.'),
(1694, 1, 6, 'GovernmentService', 'GovernmentService', 'A service provided by a government organization, e.g. food stamps, veterans benefits, etc.'),
(1695, 1, 6, 'MovieTheater', 'MovieTheater', 'A movie theater.'),
(1696, 1, 6, 'MonetaryAmount', 'MonetaryAmount', 'A monetary value or range. This type can be used to describe an amount of money such as $50 USD, or a range as in describing a bank account being suitable for a balance between £1,000 and £1,000,000 GBP, or the value of a salary, etc. It is recommended to use [[PriceSpecification]] Types to describe the price of an Offer, Invoice, etc.'),
(1697, 1, 6, 'MedicineSystem', 'MedicineSystem', 'Systems of medical practice.'),
(1698, 1, 6, 'MerchantReturnPolicySeasonalOverride', 'MerchantReturnPolicySeasonalOverride', 'A seasonal override of a return policy, for example used for holidays.'),
(1699, 1, 6, 'BankOrCreditUnion', 'BankOrCreditUnion', 'Bank or credit union.'),
(1700, 1, 6, 'HyperTocEntry', 'HyperTocEntry', 'A HyperToEntry is an item within a [[HyperToc]], which represents a hypertext table of contents for complex media objects, such as [[VideoObject]], [[AudioObject]]. The media object itself is indicated using [[associatedMedia]]. Each section of interest within that content can be described with a [[HyperTocEntry]], with associated [[startOffset]] and [[endOffset]]. When several entries are all from the same file, [[associatedMedia]] is used on the overarching [[HyperTocEntry]]; if the content has been split into multiple files, they can be referenced using [[associatedMedia]] on each [[HyperTocEntry]].'),
(1701, 1, 6, 'PostalCodeRangeSpecification', 'PostalCodeRangeSpecification', 'Indicates a range of postal codes, usually defined as the set of valid codes between [[postalCodeBegin]] and [[postalCodeEnd]], inclusively.'),
(1702, 1, 6, 'GovernmentBuilding', 'GovernmentBuilding', 'A government building.'),
(1703, 1, 6, 'ContactPointOption', 'ContactPointOption', 'Enumerated options related to a ContactPoint.'),
(1704, 1, 6, 'Message', 'Message', 'A single message from a sender to one or more organizations or people.'),
(1705, 1, 6, 'Role', 'Role', 'Represents additional information about a relationship or property. For example a Role can be used to say that a \'member\' role linking some SportsTeam to a player occurred during a particular time period. Or that a Person\'s \'actor\' role in a Movie was for some particular characterName. Such properties can be attached to a Role entity, which is then associated with the main entities using ordinary properties like \'member\' or \'actor\'.\\n\\nSee also [blog post](http://blog.schema.org/2014/06/introducing-role.html).'),
(1706, 1, 6, 'LearningResource', 'LearningResource', 'The LearningResource type can be used to indicate [[CreativeWork]]s (whether physical or digital) that have a particular and explicit orientation towards learning, education, skill acquisition, and other educational purposes.\n\n[[LearningResource]] is expected to be used as an addition to a primary type such as [[Book]], [[VideoObject]], [[Product]] etc.\n\n[[EducationEvent]] serves a similar purpose for event-like things (e.g. a [[Trip]]). A [[LearningResource]] may be created as a result of an [[EducationEvent]], for example by recording one.'),
(1707, 1, 6, 'BedType', 'BedType', 'A type of bed. This is used for indicating the bed or beds available in an accommodation.'),
(1708, 1, 6, 'MusicAlbumReleaseType', 'MusicAlbumReleaseType', 'The kind of release which this album is: single, EP or album.'),
(1709, 1, 6, 'MerchantReturnPolicy', 'MerchantReturnPolicy', 'A MerchantReturnPolicy provides information about product return policies associated with an [[Organization]], [[Product]], or [[Offer]].'),
(1710, 1, 6, 'GameServer', 'GameServer', 'Server that provides game interaction in a multiplayer game.'),
(1711, 1, 6, 'PlaceOfWorship', 'PlaceOfWorship', 'Place of worship, such as a church, synagogue, or mosque.'),
(1712, 1, 6, 'UseAction', 'UseAction', 'The act of applying an object to its intended purpose.'),
(1713, 1, 6, 'Grant', 'Grant', 'A grant, typically financial or otherwise quantifiable, of resources. Typically a [[funder]] sponsors some [[MonetaryAmount]] to an [[Organization]] or [[Person]],\n    sometimes not necessarily via a dedicated or long-lived [[Project]], resulting in one or more outputs, or [[fundedItem]]s. For financial sponsorship, indicate the [[funder]] of a [[MonetaryGrant]]. For non-financial support, indicate [[sponsor]] of [[Grant]]s of resources (e.g. office space).\n\nGrants support  activities directed towards some agreed collective goals, often but not always organized as [[Project]]s. Long-lived projects are sometimes sponsored by a variety of grants over time, but it is also common for a project to be associated with a single grant.\n\nThe amount of a [[Grant]] is represented using [[amount]] as a [[MonetaryAmount]].\n    '),
(1714, 1, 6, 'PerformanceRole', 'PerformanceRole', 'A PerformanceRole is a Role that some entity places with regard to a theatrical performance, e.g. in a Movie, TVSeries etc.'),
(1715, 1, 6, 'SportsActivityLocation', 'SportsActivityLocation', 'A sports location, such as a playing field.'),
(1716, 1, 6, 'MedicalRiskScore', 'MedicalRiskScore', 'A simple system that adds up the number of risk factors to yield a score that is associated with prognosis, e.g. CHAD score, TIMI risk score.'),
(1717, 1, 6, 'Seat', 'Seat', 'Used to describe a seat, such as a reserved seat in an event reservation.'),
(1718, 1, 6, 'PropertyValueSpecification', 'PropertyValueSpecification', 'A Property value specification.'),
(1719, 1, 6, 'Recipe', 'Recipe', 'A recipe. For dietary restrictions covered by the recipe, a few common restrictions are enumerated via [[suitableForDiet]]. The [[keywords]] property can also be used to add more detail.'),
(1720, 1, 6, 'LocationFeatureSpecification', 'LocationFeatureSpecification', 'Specifies a location feature by providing a structured value representing a feature of an accommodation as a property-value pair of varying degrees of formality.'),
(1721, 1, 6, 'CreativeWorkSeason', 'CreativeWorkSeason', 'A media season, e.g. TV, radio, video game etc.'),
(1722, 1, 6, 'LymphaticVessel', 'LymphaticVessel', 'A type of blood vessel that specifically carries lymph fluid unidirectionally toward the heart.'),
(1723, 1, 6, 'JoinAction', 'JoinAction', 'An agent joins an event/group with participants/friends at a location.\\n\\nRelated actions:\\n\\n* [[RegisterAction]]: Unlike RegisterAction, JoinAction refers to joining a group/team of people.\\n* [[SubscribeAction]]: Unlike SubscribeAction, JoinAction does not imply that you\'ll be receiving updates.\\n* [[FollowAction]]: Unlike FollowAction, JoinAction does not imply that you\'ll be polling for updates.'),
(1724, 1, 6, 'PathologyTest', 'PathologyTest', 'A medical test performed by a laboratory that typically involves examination of a tissue sample by a pathologist.'),
(1725, 1, 6, 'GiveAction', 'GiveAction', 'The act of transferring ownership of an object to a destination. Reciprocal of TakeAction.\\n\\nRelated actions:\\n\\n* [[TakeAction]]: Reciprocal of GiveAction.\\n* [[SendAction]]: Unlike SendAction, GiveAction implies that ownership is being transferred (e.g. I may send my laptop to you, but that doesn\'t mean I\'m giving it to you).'),
(1726, 1, 6, 'ScholarlyArticle', 'ScholarlyArticle', 'A scholarly article.'),
(1727, 1, 6, 'AuthorizeAction', 'AuthorizeAction', 'The act of granting permission to an object.'),
(1728, 1, 6, 'TipAction', 'TipAction', 'The act of giving money voluntarily to a beneficiary in recognition of services rendered.'),
(1729, 1, 6, 'Vessel', 'Vessel', 'A component of the human body circulatory system comprised of an intricate network of hollow tubes that transport blood throughout the entire body.'),
(1730, 1, 6, 'TaxiReservation', 'TaxiReservation', 'A reservation for a taxi.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(1731, 1, 6, 'ImagingTest', 'ImagingTest', 'Any medical imaging modality typically used for diagnostic purposes.'),
(1732, 1, 6, 'MedicalIndication', 'MedicalIndication', 'A condition or factor that indicates use of a medical therapy, including signs, symptoms, risk factors, anatomical states, etc.'),
(1733, 1, 6, 'DDxElement', 'DDxElement', 'An alternative, closely-related condition typically considered later in the differential diagnosis process along with the signs that are used to distinguish it.'),
(1734, 1, 6, 'SingleFamilyResidence', 'SingleFamilyResidence', 'Residence type: Single-family home.'),
(1735, 1, 6, 'GenderType', 'GenderType', 'An enumeration of genders.'),
(1736, 1, 6, 'GameAvailabilityEnumeration', 'GameAvailabilityEnumeration', 'For a [[VideoGame]], such as used with a [[PlayGameAction]], an enumeration of the kind of game availability offered. '),
(1737, 1, 6, 'Reservation', 'Reservation', 'Describes a reservation for travel, dining or an event. Some reservations require tickets. \\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, restaurant reservations, flights, or rental cars, use [[Offer]].'),
(1738, 1, 6, 'DonateAction', 'DonateAction', 'The act of providing goods, services, or money without compensation, often for philanthropic reasons.'),
(1739, 1, 6, 'Vein', 'Vein', 'A type of blood vessel that specifically carries blood to the heart.'),
(1740, 1, 6, 'MusicAlbum', 'MusicAlbum', 'A collection of music tracks.'),
(1741, 1, 6, 'GamePlayMode', 'GamePlayMode', 'Indicates whether this game is multi-player, co-op or single-player.'),
(1742, 1, 6, 'MeasurementTypeEnumeration', 'MeasurementTypeEnumeration', 'Enumeration of common measurement types (or dimensions), for example \"chest\" for a person, \"inseam\" for pants, \"gauge\" for screws, or \"wheel\" for bicycles.'),
(1743, 1, 6, 'MolecularEntity', 'MolecularEntity', 'Any constitutionally or isotopically distinct atom, molecule, ion, ion pair, radical, radical ion, complex, conformer etc., identifiable as a separately distinguishable entity.'),
(1744, 1, 6, 'EducationalOccupationalCredential', 'EducationalOccupationalCredential', 'An educational or occupational credential. A diploma, academic degree, certification, qualification, badge, etc., that may be awarded to a person or other entity that meets the requirements defined by the credentialer.'),
(1745, 1, 6, 'EducationEvent', 'EducationEvent', 'Event type: Education event.'),
(1746, 1, 6, 'Joint', 'Joint', 'The anatomical location at which two or more bones make contact.'),
(1747, 1, 6, 'ReceiveAction', 'ReceiveAction', 'The act of physically/electronically taking delivery of an object that has been transferred from an origin to a destination. Reciprocal of SendAction.\\n\\nRelated actions:\\n\\n* [[SendAction]]: The reciprocal of ReceiveAction.\\n* [[TakeAction]]: Unlike TakeAction, ReceiveAction does not imply that the ownership has been transferred (e.g. I can receive a package, but it does not mean the package is now mine).'),
(1748, 1, 6, 'DeliveryChargeSpecification', 'DeliveryChargeSpecification', 'The price for the delivery of an offer using a particular delivery method.'),
(1749, 1, 6, 'ListItem', 'ListItem', 'An list item, e.g. a step in a checklist or how-to description.'),
(1750, 1, 6, 'XPathType', 'XPathType', 'Text representing an XPath (typically but not necessarily version 1.0).'),
(1751, 1, 6, 'VideoGame', 'VideoGame', 'A video game is an electronic game that involves human interaction with a user interface to generate visual feedback on a video device.'),
(1752, 1, 6, 'WinAction', 'WinAction', 'The act of achieving victory in a competitive activity.'),
(1753, 1, 6, 'BodyOfWater', 'BodyOfWater', 'A body of water, such as a sea, ocean, or lake.'),
(1754, 1, 6, 'EnergyConsumptionDetails', 'EnergyConsumptionDetails', 'EnergyConsumptionDetails represents information related to the energy efficiency of a product that consumes energy. The information that can be provided is based on international regulations such as for example [EU directive 2017/1369](https://eur-lex.europa.eu/eli/reg/2017/1369/oj) for energy labeling and the [Energy labeling rule](https://www.ftc.gov/enforcement/rules/rulemaking-regulatory-reform-proceedings/energy-water-use-labeling-consumer) under the Energy Policy and Conservation Act (EPCA) in the US.'),
(1755, 1, 6, 'EntryPoint', 'EntryPoint', 'An entry point, within some Web-based protocol.'),
(1756, 1, 6, 'TVEpisode', 'TVEpisode', 'A TV episode which can be part of a series or season.'),
(1757, 1, 6, 'MedicalSignOrSymptom', 'MedicalSignOrSymptom', 'Any feature associated or not with a medical condition. In medicine a symptom is generally subjective while a sign is objective.'),
(1758, 1, 6, 'OfferItemCondition', 'OfferItemCondition', 'A list of possible conditions for the item.'),
(1759, 1, 6, 'DeliveryEvent', 'DeliveryEvent', 'An event involving the delivery of an item.'),
(1760, 1, 6, 'PlanAction', 'PlanAction', 'The act of planning the execution of an event/task/action/reservation/plan to a future date.'),
(1761, 1, 6, 'Nerve', 'Nerve', 'A common pathway for the electrochemical nerve impulses that are transmitted along each of the axons.'),
(1762, 1, 6, 'HowToTool', 'HowToTool', 'A tool used (but not consumed) when performing instructions for how to achieve a result.'),
(1763, 1, 6, 'Review', 'Review', 'A review of an item - for example, of a restaurant, movie, or store.'),
(1764, 1, 6, 'EUEnergyEfficiencyEnumeration', 'EUEnergyEfficiencyEnumeration', 'Enumerates the EU energy efficiency classes A-G as well as A+, A++, and A+++ as defined in EU directive 2017/1369.'),
(1765, 1, 6, 'FoodEstablishment', 'FoodEstablishment', 'A food-related business.'),
(1766, 1, 6, 'ParentAudience', 'ParentAudience', 'A set of characteristics describing parents, who can be interested in viewing some content.'),
(1767, 1, 6, 'AggregateRating', 'AggregateRating', 'The average rating based on multiple ratings or reviews.'),
(1768, 1, 6, 'CreativeWork', 'CreativeWork', 'The most generic kind of creative work, including books, movies, photographs, software programs, etc.'),
(1769, 1, 6, 'HowToSection', 'HowToSection', 'A sub-grouping of steps in the instructions for how to achieve a result (e.g. steps for making a pie crust within a pie recipe).'),
(1770, 1, 6, 'TrainStation', 'TrainStation', 'A train station.'),
(1771, 1, 6, 'ReservationStatusType', 'ReservationStatusType', 'Enumerated status values for Reservation.'),
(1772, 1, 6, 'HealthTopicContent', 'HealthTopicContent', '[[HealthTopicContent]] is [[WebContent]] that is about some aspect of a health topic, e.g. a condition, its symptoms or treatments. Such content may be comprised of several parts or sections and use different types of media. Multiple instances of [[WebContent]] (and hence [[HealthTopicContent]]) can be related using [[hasPart]] / [[isPartOf]] where there is some kind of content hierarchy, and their content described with [[about]] and [[mentions]] e.g. building upon the existing [[MedicalCondition]] vocabulary.\n  '),
(1773, 1, 6, 'AutomotiveBusiness', 'AutomotiveBusiness', 'Car repair, sales, or parts.'),
(1774, 1, 6, 'Residence', 'Residence', 'The place where a person lives.'),
(1775, 1, 6, 'ImageObject', 'ImageObject', 'An image file.'),
(1776, 1, 6, 'MedicalEnumeration', 'MedicalEnumeration', 'Enumerations related to health and the practice of medicine: A concept that is used to attribute a quality to another concept, as a qualifier, a collection of items or a listing of all of the elements of a set in medicine practice.'),
(1777, 1, 6, 'MediaSubscription', 'MediaSubscription', 'A subscription which allows a user to access media including audio, video, books, etc.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1778, 1, 6, 'House', 'House', 'A house is a building or structure that has the ability to be occupied for habitation by humans or other creatures (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/House\">http://en.wikipedia.org/wiki/House</a>).'),
(1779, 1, 6, 'MedicalConditionStage', 'MedicalConditionStage', 'A stage of a medical condition, such as \'Stage IIIa\'.'),
(1780, 1, 6, 'LocalBusiness', 'LocalBusiness', 'A particular physical business or branch of an organization. Examples of LocalBusiness include a restaurant, a particular branch of a restaurant chain, a branch of a bank, a medical practice, a club, a bowling alley, etc.'),
(1781, 1, 6, 'Date', 'Date', 'A date value in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601).'),
(1782, 1, 6, 'LiveBlogPosting', 'LiveBlogPosting', 'A [[LiveBlogPosting]] is a [[BlogPosting]] intended to provide a rolling textual coverage of an ongoing event through continuous updates.'),
(1783, 1, 6, 'RentalCarReservation', 'RentalCarReservation', 'A reservation for a rental car.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(1784, 1, 6, 'Apartment', 'Apartment', 'An apartment (in American English) or flat (in British English) is a self-contained housing unit (a type of residential real estate) that occupies only part of a building (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Apartment\">http://en.wikipedia.org/wiki/Apartment</a>).'),
(1785, 1, 6, 'MobileApplication', 'MobileApplication', 'A software application designed specifically to work well on a mobile device such as a telephone.'),
(1786, 1, 6, 'Property', 'Property', 'A property, used to indicate attributes and relationships of some Thing; equivalent to rdf:Property.'),
(1787, 1, 6, 'ProductGroup', 'ProductGroup', 'A ProductGroup represents a group of [[Product]]s that vary only in certain well-described ways, such as by [[size]], [[color]], [[material]] etc.\n\nWhile a ProductGroup itself is not directly offered for sale, the various varying products that it represents can be. The ProductGroup serves as a prototype or template, standing in for all of the products who have an [[isVariantOf]] relationship to it. As such, properties (including additional types) can be applied to the ProductGroup to represent characteristics shared by each of the (possibly very many) variants. Properties that reference a ProductGroup are not included in this mechanism; neither are the following specific properties [[variesBy]], [[hasVariant]], [[url]]. '),
(1788, 1, 6, 'DataCatalog', 'DataCatalog', 'A collection of datasets.'),
(1789, 1, 6, 'Muscle', 'Muscle', 'A muscle is an anatomical structure consisting of a contractile form of tissue that animals use to effect movement.'),
(1790, 1, 6, 'Recommendation', 'Recommendation', '[[Recommendation]] is a type of [[Review]] that suggests or proposes something as the best option or best course of action. Recommendations may be for products or services, or other concrete things, as in the case of a ranked list or product guide. A [[Guide]] may list multiple recommendations for different categories. For example, in a [[Guide]] about which TVs to buy, the author may have several [[Recommendation]]s.'),
(1791, 1, 6, 'SeekToAction', 'SeekToAction', 'This is the [[Action]] of navigating to a specific [[startOffset]] timestamp within a [[VideoObject]], typically represented with a URL template structure.'),
(1792, 1, 6, 'Menu', 'Menu', 'A structured representation of food or drink items available from a FoodEstablishment.'),
(1793, 1, 6, 'OrganizationRole', 'OrganizationRole', 'A subclass of Role used to describe roles within organizations.'),
(1794, 1, 6, 'EventAttendanceModeEnumeration', 'EventAttendanceModeEnumeration', 'An EventAttendanceModeEnumeration value is one of potentially several modes of organising an event, relating to whether it is online or offline.'),
(1795, 1, 6, 'Enumeration', 'Enumeration', 'Lists or enumerations—for example, a list of cuisines or music genres, etc.'),
(1796, 1, 6, 'HealthAspectEnumeration', 'HealthAspectEnumeration', 'HealthAspectEnumeration enumerates several aspects of health content online, each of which might be described using [[hasHealthAspect]] and [[HealthTopicContent]].'),
(1797, 1, 6, 'PeopleAudience', 'PeopleAudience', 'A set of characteristics belonging to people, e.g. who compose an item\'s target audience.'),
(1798, 1, 6, 'BusinessFunction', 'BusinessFunction', 'The business function specifies the type of activity or access (i.e., the bundle of rights) offered by the organization or business person through the offer. Typical are sell, rental or lease, maintenance or repair, manufacture / produce, recycle / dispose, engineering / construction, or installation. Proprietary specifications of access rights are also instances of this class.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#ConstructionInstallation\\n* http://purl.org/goodrelations/v1#Dispose\\n* http://purl.org/goodrelations/v1#LeaseOut\\n* http://purl.org/goodrelations/v1#Maintain\\n* http://purl.org/goodrelations/v1#ProvideService\\n* http://purl.org/goodrelations/v1#Repair\\n* http://purl.org/goodrelations/v1#Sell\\n* http://purl.org/goodrelations/v1#Buy\n        '),
(1799, 1, 6, 'EventStatusType', 'EventStatusType', 'EventStatusType is an enumeration type whose instances represent several states that an Event may be in.'),
(1800, 1, 6, 'Landform', 'Landform', 'A landform or physical feature.  Landform elements include mountains, plains, lakes, rivers, seascape and oceanic waterbody interface features such as bays, peninsulas, seas and so forth, including sub-aqueous terrain features such as submersed mountain ranges, volcanoes, and the great ocean basins.'),
(1801, 1, 6, 'FindAction', 'FindAction', 'The act of finding an object.\\n\\nRelated actions:\\n\\n* [[SearchAction]]: FindAction is generally lead by a SearchAction, but not necessarily.'),
(1802, 1, 6, 'RadioChannel', 'RadioChannel', 'A unique instance of a radio BroadcastService on a CableOrSatelliteService lineup.'),
(1803, 1, 6, 'MedicalEvidenceLevel', 'MedicalEvidenceLevel', 'Level of evidence for a medical guideline. Enumerated type.'),
(1804, 1, 6, 'MusicAlbumProductionType', 'MusicAlbumProductionType', 'Classification of the album by its type of content: soundtrack, live album, studio album, etc.'),
(1805, 1, 6, 'Airport', 'Airport', 'An airport.'),
(1806, 1, 6, 'HealthInsurancePlan', 'HealthInsurancePlan', 'A US-style health insurance plan, including PPOs, EPOs, and HMOs. '),
(1807, 1, 6, 'AddAction', 'AddAction', 'The act of editing by adding an object to a collection.'),
(1808, 1, 6, 'MedicalStudyStatus', 'MedicalStudyStatus', 'The status of a medical study. Enumerated type.'),
(1809, 1, 6, 'TransferAction', 'TransferAction', 'The act of transferring/moving (abstract or concrete) animate or inanimate objects from one place to another.'),
(1810, 1, 6, 'EndorseAction', 'EndorseAction', 'An agent approves/certifies/likes/supports/sanctions an object.'),
(1811, 1, 6, 'DiagnosticLab', 'DiagnosticLab', 'A medical laboratory that offers on-site or off-site diagnostic services.'),
(1812, 1, 6, 'WebPage', 'WebPage', 'A web page. Every web page is implicitly assumed to be declared to be of type WebPage, so the various properties about that webpage, such as <code>breadcrumb</code> may be used. We recommend explicit declaration if these properties are specified, but if they are found outside of an itemscope, they will be assumed to be about the page.'),
(1813, 1, 6, 'Number', 'Number', 'Data type: Number.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(1814, 1, 6, 'InformAction', 'InformAction', 'The act of notifying someone of information pertinent to them, with no expectation of a response.'),
(1815, 1, 6, 'Suite', 'Suite', 'A suite in a hotel or other public accommodation, denotes a class of luxury accommodations, the key feature of which is multiple rooms (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Suite_(hotel)\">http://en.wikipedia.org/wiki/Suite_(hotel)</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1816, 1, 6, 'DoseSchedule', 'DoseSchedule', 'A specific dosing schedule for a drug or supplement.'),
(1817, 1, 6, 'VisualArtwork', 'VisualArtwork', 'A work of art that is primarily visual in character.'),
(1818, 1, 6, 'GeoCircle', 'GeoCircle', 'A GeoCircle is a GeoShape representing a circular geographic area. As it is a GeoShape\n          it provides the simple textual property \'circle\', but also allows the combination of postalCode alongside geoRadius.\n          The center of the circle can be indicated via the \'geoMidpoint\' property, or more approximately using \'address\', \'postalCode\'.\n       '),
(1819, 1, 6, 'MediaObject', 'MediaObject', 'A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset, i.e. DataDownload. Note that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 [[AudioObject]]s).'),
(1820, 1, 6, 'GeoCoordinates', 'GeoCoordinates', 'The geographic coordinates of a place or event.'),
(1821, 1, 6, 'MedicalScholarlyArticle', 'MedicalScholarlyArticle', 'A scholarly article in the medical domain.'),
(1822, 1, 6, 'MedicalCode', 'MedicalCode', 'A code for a medical entity.'),
(1823, 1, 6, 'DigitalDocumentPermissionType', 'DigitalDocumentPermissionType', 'A type of permission which can be granted for accessing a digital document.'),
(1824, 1, 6, 'JobPosting', 'JobPosting', 'A listing that describes a job opening in a certain organization.'),
(1825, 1, 6, 'DrugCost', 'DrugCost', 'The cost per unit of a medical drug. Note that this type is not meant to represent the price in an offer of a drug for sale; see the Offer type for that. This type will typically be used to tag wholesale or average retail cost of a drug, or maximum reimbursable cost. Costs of medical drugs vary widely depending on how and where they are paid for, so while this type captures some of the variables, costs should be used with caution by consumers of this schema\'s markup.'),
(1826, 1, 6, 'DrugPrescriptionStatus', 'DrugPrescriptionStatus', 'Indicates whether this drug is available by prescription or over-the-counter.'),
(1827, 1, 6, 'NutritionInformation', 'NutritionInformation', 'Nutritional information about the recipe.'),
(1828, 1, 6, 'PostalAddress', 'PostalAddress', 'The mailing address.'),
(1829, 1, 6, 'Thing', 'Thing', 'The most generic type of item.'),
(1830, 1, 6, 'BroadcastEvent', 'BroadcastEvent', 'An over the air or online broadcast event.'),
(1831, 1, 6, 'ServiceChannel', 'ServiceChannel', 'A means for accessing a service, e.g. a government office location, web site, or phone number.'),
(1832, 1, 6, 'LoseAction', 'LoseAction', 'The act of being defeated in a competitive activity.'),
(1833, 1, 6, 'BlogPosting', 'BlogPosting', 'A blog post.'),
(1834, 1, 6, 'ReviewAction', 'ReviewAction', 'The act of producing a balanced opinion about the object for an audience. An agent reviews an object with participants resulting in a review.'),
(1835, 1, 6, 'RadioSeries', 'RadioSeries', 'CreativeWorkSeries dedicated to radio broadcast and associated online delivery.'),
(1836, 1, 6, 'HotelRoom', 'HotelRoom', 'A hotel room is a single room in a hotel.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1837, 1, 6, 'Specialty', 'Specialty', 'Any branch of a field in which people typically develop specific expertise, usually after significant study, time, and effort.'),
(1838, 1, 6, 'MusicGroup', 'MusicGroup', 'A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.'),
(1839, 1, 6, 'ProductModel', 'ProductModel', 'A datasheet or vendor specification of a product (in the sense of a prototypical description).'),
(1840, 1, 6, 'Intangible', 'Intangible', 'A utility class that serves as the umbrella for a number of \'intangible\' things such as quantities, structured values, etc.'),
(1841, 1, 6, 'Integer', 'Integer', 'Data type: Integer.'),
(1842, 1, 6, 'EngineSpecification', 'EngineSpecification', 'Information about the engine of the vehicle. A vehicle can have multiple engines represented by multiple engine specification entities.'),
(1843, 1, 6, 'AggregateOffer', 'AggregateOffer', 'When a single product is associated with multiple offers (for example, the same pair of shoes is offered by different merchants), then AggregateOffer can be used.\\n\\nNote: AggregateOffers are normally expected to associate multiple offers that all share the same defined [[businessFunction]] value, or default to http://purl.org/goodrelations/v1#Sell if businessFunction is not explicitly defined.'),
(1844, 1, 6, 'ComputerLanguage', 'ComputerLanguage', 'This type covers computer programming languages such as Scheme and Lisp, as well as other language-like computer representations. Natural languages are best represented with the [[Language]] type.'),
(1845, 1, 6, 'MedicalIntangible', 'MedicalIntangible', 'A utility class that serves as the umbrella for a number of \'intangible\' things in the medical space.'),
(1846, 1, 6, 'HowTo', 'HowTo', 'Instructions that explain how to achieve a result by performing a sequence of steps.'),
(1847, 1, 6, 'Series', 'Series', 'A Series in schema.org is a group of related items, typically but not necessarily of the same kind. See also [[CreativeWorkSeries]], [[EventSeries]].'),
(1848, 1, 6, 'OfferShippingDetails', 'OfferShippingDetails', 'OfferShippingDetails represents information about shipping destinations.\n\nMultiple of these entities can be used to represent different shipping rates for different destinations:\n\nOne entity for Alaska/Hawaii. A different one for continental US. A different one for all France.\n\nMultiple of these entities can be used to represent different shipping costs and delivery times.\n\nTwo entities that are identical but differ in rate and time:\n\nE.g. Cheaper and slower: $5 in 5-7 days\nor Fast and expensive: $15 in 1-2 days.'),
(1849, 1, 6, 'LifestyleModification', 'LifestyleModification', 'A process of care involving exercise, changes to diet, fitness routines, and other lifestyle changes aimed at improving a health condition.'),
(1850, 1, 6, 'BookFormatType', 'BookFormatType', 'The publication format of the book.'),
(1851, 1, 6, 'EducationalAudience', 'EducationalAudience', 'An EducationalAudience.'),
(1852, 1, 6, 'CommentAction', 'CommentAction', 'The act of generating a comment about a subject.'),
(1853, 1, 6, 'MedicalDevice', 'MedicalDevice', 'Any object used in a medical capacity, such as to diagnose or treat a patient.'),
(1854, 1, 6, 'DefinedTerm', 'DefinedTerm', 'A word, name, acronym, phrase, etc. with a formal definition. Often used in the context of category or subject classification, glossaries or dictionaries, product or creative work types, etc. Use the name property for the term being defined, use termCode if the term has an alpha-numeric code allocated, use description to provide the definition of the term.'),
(1855, 1, 6, 'VideoGameSeries', 'VideoGameSeries', 'A video game series.'),
(1856, 1, 6, 'MedicalTherapy', 'MedicalTherapy', 'Any medical intervention designed to prevent, treat, and cure human diseases and medical conditions, including both curative and palliative therapies. Medical therapies are typically processes of care relying upon pharmacotherapy, behavioral therapy, supportive therapy (with fluid or nutrition for example), or detoxification (e.g. hemodialysis) aimed at improving or preventing a health condition.'),
(1857, 1, 6, 'OrganizeAction', 'OrganizeAction', 'The act of manipulating/administering/supervising/controlling one or more objects.'),
(1858, 1, 6, 'RealEstateListing', 'RealEstateListing', 'A [[RealEstateListing]] is a listing that describes one or more real-estate [[Offer]]s (whose [[businessFunction]] is typically to lease out, or to sell).\n  The [[RealEstateListing]] type itself represents the overall listing, as manifested in some [[WebPage]].\n  '),
(1859, 1, 6, 'MedicalBusiness', 'MedicalBusiness', 'A particular physical or virtual business of an organization for medical purposes. Examples of MedicalBusiness include different businesses run by health professionals.'),
(1860, 1, 6, 'UpdateAction', 'UpdateAction', 'The act of managing by changing/editing the state of the object.'),
(1861, 1, 6, 'BorrowAction', 'BorrowAction', 'The act of obtaining an object under an agreement to return it at a later date. Reciprocal of LendAction.\\n\\nRelated actions:\\n\\n* [[LendAction]]: Reciprocal of BorrowAction.'),
(1862, 1, 6, 'MedicalTrial', 'MedicalTrial', 'A medical trial is a type of medical study that uses a scientific process to compare the safety and efficacy of medical therapies or medical procedures. In general, medical trials are controlled and subjects are allocated at random to the different treatment and/or control groups.'),
(1863, 1, 6, 'VirtualLocation', 'VirtualLocation', 'An online or virtual location for attending events. For example, one may attend an online seminar or educational event. While a virtual location may be used as the location of an event, virtual locations should not be confused with physical locations in the real world.'),
(1864, 1, 6, 'SizeSpecification', 'SizeSpecification', 'Size related properties of a product, typically a size code ([[name]]) and optionally a [[sizeSystem]], [[sizeGroup]], and product measurements ([[hasMeasurement]]). In addition, the intended audience can be defined through [[suggestedAge]], [[suggestedGender]], and suggested body measurements ([[suggestedMeasurement]]).'),
(1865, 1, 6, 'Physician', 'Physician', 'A doctor\'s office.'),
(1866, 1, 6, 'SuperficialAnatomy', 'SuperficialAnatomy', 'Anatomical features that can be observed by sight (without dissection), including the form and proportions of the human body as well as surface landmarks that correspond to deeper subcutaneous structures. Superficial anatomy plays an important role in sports medicine, phlebotomy, and other medical specialties as underlying anatomical structures can be identified through surface palpation. For example, during back surgery, superficial anatomy can be used to palpate and count vertebrae to find the site of incision. Or in phlebotomy, superficial anatomy can be used to locate an underlying vein; for example, the median cubital vein can be located by palpating the borders of the cubital fossa (such as the epicondyles of the humerus) and then looking for the superficial signs of the vein, such as size, prominence, ability to refill after depression, and feel of surrounding tissue support. As another example, in a subluxation (dislocation) of the glenohumeral joint, the bony structure becomes pronounced with the deltoid muscle failing to cover the glenohumeral joint allowing the edges of the scapula to be superficially visible. Here, the superficial anatomy is the visible edges of the scapula, implying the underlying dislocation of the joint (the related anatomical structure).'),
(1867, 1, 6, 'ProgramMembership', 'ProgramMembership', 'Used to describe membership in a loyalty programs (e.g. \"StarAliance\"), traveler clubs (e.g. \"AAA\"), purchase clubs (\"Safeway Club\"), etc.'),
(1868, 1, 6, 'UserComments', 'UserComments', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(1869, 1, 6, 'EntertainmentBusiness', 'EntertainmentBusiness', 'A business providing entertainment.'),
(1870, 1, 6, 'SizeGroupEnumeration', 'SizeGroupEnumeration', 'Enumerates common size groups for various product categories.'),
(1871, 1, 6, 'Episode', 'Episode', 'A media episode (e.g. TV, radio, video game) which can be part of a series or season.'),
(1872, 1, 6, 'CourseInstance', 'CourseInstance', 'An instance of a [[Course]] which is distinct from other instances because it is offered at a different time or location or through different media or modes of study or to a specific section of students.'),
(1873, 1, 6, 'Room', 'Room', 'A room is a distinguishable space within a structure, usually separated from other spaces by interior walls (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Room\">http://en.wikipedia.org/wiki/Room</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(1874, 1, 6, 'Energy', 'Energy', 'Properties that take Energy as values are of the form \'&lt;Number&gt; &lt;Energy unit of measure&gt;\'.'),
(1875, 1, 6, 'FoodEstablishmentReservation', 'FoodEstablishmentReservation', 'A reservation to dine at a food-related business.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(1876, 1, 6, 'BusOrCoach', 'BusOrCoach', 'A bus (also omnibus or autobus) is a road vehicle designed to carry passengers. Coaches are luxury busses, usually in service for long distance travel.'),
(1877, 1, 6, 'Clip', 'Clip', 'A short TV or radio program or a segment/part of a program.'),
(1878, 1, 6, 'MedicalRiskEstimator', 'MedicalRiskEstimator', 'Any rule set or interactive tool for estimating the risk of developing a complication or condition.'),
(1879, 1, 6, 'Church', 'Church', 'A church.'),
(1880, 1, 6, 'SportsTeam', 'SportsTeam', 'Organization: Sports team.'),
(1881, 1, 6, 'FoodEvent', 'FoodEvent', 'Event type: Food event.'),
(1882, 1, 6, 'TVClip', 'TVClip', 'A short TV program or a segment/part of a TV program.'),
(1883, 1, 6, 'MusicPlaylist', 'MusicPlaylist', 'A collection of music tracks in playlist form.'),
(1884, 1, 6, 'CreativeWorkSeries', 'CreativeWorkSeries', 'A CreativeWorkSeries in schema.org is a group of related items, typically but not necessarily of the same kind. CreativeWorkSeries are usually organized into some order, often chronological. Unlike [[ItemList]] which is a general purpose data structure for lists of things, the emphasis with CreativeWorkSeries is on published materials (written e.g. books and periodicals, or media such as TV, radio and games).\\n\\nSpecific subtypes are available for describing [[TVSeries]], [[RadioSeries]], [[MovieSeries]], [[BookSeries]], [[Periodical]] and [[VideoGameSeries]]. In each case, the [[hasPart]] / [[isPartOf]] properties can be used to relate the CreativeWorkSeries to its parts. The general CreativeWorkSeries type serves largely just to organize these more specific and practical subtypes.\\n\\nIt is common for properties applicable to an item from the series to be usefully applied to the containing group. Schema.org attempts to anticipate some of these cases, but publishers should be free to apply properties of the series parts to the series as a whole wherever they seem appropriate.\n	  '),
(1885, 1, 6, 'BusinessAudience', 'BusinessAudience', 'A set of characteristics belonging to businesses, e.g. who compose an item\'s target audience.'),
(1886, 1, 6, 'Quantity', 'Quantity', 'Quantities such as distance, time, mass, weight, etc. Particular instances of say Mass are entities like \'3 kg\' or \'4 milligrams\'.'),
(1887, 1, 6, 'PlayAction', 'PlayAction', 'The act of playing/exercising/training/performing for enjoyment, leisure, recreation, competition or exercise.\\n\\nRelated actions:\\n\\n* [[ListenAction]]: Unlike ListenAction (which is under ConsumeAction), PlayAction refers to performing for an audience or at an event, rather than consuming music.\\n* [[WatchAction]]: Unlike WatchAction (which is under ConsumeAction), PlayAction refers to showing/displaying for an audience or at an event, rather than consuming visual content.'),
(1888, 1, 6, 'WebSite', 'WebSite', 'A WebSite is a set of related web pages and other items typically served from a single web domain and accessible via URLs.'),
(1889, 1, 6, 'DigitalDocument', 'DigitalDocument', 'An electronic file or document.'),
(1890, 1, 6, 'ContactPoint', 'ContactPoint', 'A contact point&#x2014;for example, a Customer Complaints department.'),
(1891, 1, 6, 'VoteAction', 'VoteAction', 'The act of expressing a preference from a fixed/finite/structured set of choices/options.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(7, 1, 1788, 2902, 2189, 'LDS Datacatalog'),
(8, 1, 1681, 2902, 2189, 'LDS Dataset'),
(9, 1, 1604, 2902, 2189, 'LDS Distribution'),
(10, 1, 1353, 2902, 2975, 'LDS Organization'),
(11, 1, 1366, 2902, 2452, 'LDS Person');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(64, 7, 2902, 'Naam', 'The name of the data catalog.', 1, NULL, 1, 0, NULL),
(65, 7, 2189, 'Beschrijving', 'A description of the data catalog.', 2, '[\"literal\"]', 0, 0, NULL),
(66, 7, 3051, 'Datasets', 'The datasets that are contained in the data catalog.', 3, '[\"resource:item\"]', 0, 0, NULL),
(67, 7, 2978, 'Uitgever', 'The publisher of the data catalog.', 4, '[\"resource:item\"]', 1, 0, NULL),
(68, 8, 2902, 'Naam', 'The name of the dataset.', 1, NULL, 1, 0, NULL),
(69, 8, 2189, 'Beschrijving', 'A description of the dataset.', 2, NULL, 0, 0, NULL),
(70, 8, 2978, 'Uitgever', 'The publisher of the dataset.', 3, '[\"resource:item\"]', 1, 0, NULL),
(71, 8, 3025, 'Licentie', 'The URL of the (open) license under which the dataset can be used.', 4, '[\"customvocab:6\"]', 1, 0, NULL),
(72, 8, 1734, 'Distributie', 'Distributions tell consumers where and how they can get the data. Distributions can be data dumps in RDF or some other format such as CSV, live SPARQL endpoints, OAI-PMH endpoints or other APIs.', 5, '[\"resource:item\"]', 0, 0, NULL),
(73, 8, 2664, 'Maker', 'The owner of the dataset.', 6, '[\"resource:item\"]', 0, 0, NULL),
(74, 8, 1932, 'Financier', NULL, 7, '[\"resource:item\"]', 0, 0, NULL),
(75, 8, 2931, 'Informatie omtrent gebruik', 'The URL of dataset this dataset is based on.', 8, '[\"uri\"]', 0, 0, NULL),
(76, 8, 2373, 'Creatiedatum', 'The date on which  the dataset description was originally created.', 9, '[\"numeric:timestamp\"]', 0, 0, NULL),
(77, 8, 2007, 'Publicatiedatum', 'The date on which  the dataset description was originally published.', 10, '[\"numeric:timestamp\"]', 0, 0, NULL),
(78, 8, 2403, 'Wijzigingsdatum', 'The date on which  the dataset description was last modified.', 11, '[\"numeric:timestamp\"]', 0, 0, NULL),
(79, 8, 2062, 'Versie', NULL, 12, NULL, 0, 0, NULL),
(80, 8, 3056, 'Geeft informatie over', 'URL of a webpage where the dataset is described OR Item set', 13, '[\"uri\",\"resource:itemset\"]', 0, 0, NULL),
(81, 8, 2218, 'Taal', NULL, 14, '[\"customvocab:5\"]', 0, 0, NULL),
(82, 8, 2837, 'Is gebaseerd op', 'A reference to a dataset on which this dataset was based.', 15, NULL, 0, 0, NULL),
(83, 8, 2090, 'Citatie', 'A citation or reference for the dataset.', 16, NULL, 0, 0, NULL),
(84, 8, 2724, NULL, NULL, 17, NULL, 0, 0, NULL),
(85, 8, 2223, 'Trefwoorden', 'One or more keyword which describe the dataset.', 18, NULL, 0, 0, NULL),
(86, 8, 1750, 'Ruimtelijke dekking', 'Indicates the place(s) which are the focus of the dataset.', 19, NULL, 0, 0, NULL),
(87, 8, 1677, 'Tijdelijke dekking', 'Indicates the period that the dataset applies to.', 20, NULL, 0, 0, NULL),
(88, 8, 1820, 'Onderdeel van datacatalogus', NULL, 21, '[\"resource:item\"]', 0, 0, NULL),
(89, 9, 2902, 'Naam', 'Name of the distribution, depicting the type of distribution.', 1, NULL, 0, 0, NULL),
(90, 9, 2189, 'Beschrijving', 'A description of the the distribution.', 2, NULL, 0, 0, NULL),
(91, 9, 2775, 'Coderingsformaat', 'The distribution’s MIME format.', 3, '[\"customvocab:7\"]', 1, 0, NULL),
(92, 9, 2288, 'Inhouds-URL', 'The URL where the distribution can be directly accessed.', 4, '[\"uri\"]', 1, 0, NULL),
(93, 9, 2007, 'Publicatiedatum', 'Date (or datetime) the distribution was published.', 5, '[\"numeric:timestamp\"]', 0, 0, NULL),
(94, 9, 2403, 'Wijzigingsdatum', 'Date (or datetime) the distribution was last updated.', 6, '[\"numeric:timestamp\"]', 0, 0, NULL),
(95, 9, 2218, 'Taal', NULL, 7, '[\"customvocab:5\"]', 0, 0, NULL),
(96, 9, 3025, 'Licentie', 'The URL of the (open) license under which the distribution can be used. ', 8, '[\"customvocab:6\"]', 0, 0, NULL),
(97, 9, 3029, 'Inhoudsgrootte', 'A measure indicating the size of the distribution.', 9, '[\"numeric:integer\"]', 0, 0, NULL),
(98, 9, 2931, 'Gebruiksinformatie', 'A link to the API documentation; required if custom API', 10, '[\"uri\"]', 0, 0, NULL),
(99, 10, 2902, 'Naam', 'The name of the organization.', 1, NULL, 1, 0, NULL),
(100, 10, 2975, 'Internetadres', NULL, 2, '[\"uri\"]', 0, 0, NULL),
(101, 10, 1914, 'Alternatieve naam of afkorting', 'Alternative names such as an abbreviation that the organization is known under.', 3, NULL, 0, 0, NULL),
(102, 10, 2583, 'Hetzelfde als', 'Links to the organization in other databases.', 4, '[\"uri\"]', 0, 0, NULL),
(103, 10, 1851, 'Contactpersoon', NULL, 5, '[\"resource:item\"]', 0, 0, NULL),
(104, 11, 2902, NULL, NULL, 1, NULL, 0, 0, NULL),
(105, 11, 2452, NULL, NULL, 2, NULL, 0, 0, NULL),
(106, 11, 2163, NULL, NULL, 3, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('018detis994pk49ucc6qqodjla', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630392e3339323536373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223031386465746973393934706b34397563633671716f646a6c61223b7d7d, 1681400609),
('01v24jjv6meoel9nsbro3ev5cs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030302e3433343838383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230317632346a6a76366d656f656c396e7362726f336576356373223b7d7d, 1681400000),
('02eq39miv762jcebi7tf1ab69n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736332e3235323231313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223032657133396d69763736326a6365626937746631616236396e223b7d7d, 1681399763),
('04vsu9vth0fme9g075btvm3d35', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830302e3635353433343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230347673753976746830666d6539673037356274766d33643335223b7d7d, 1681399800),
('053n4fi84efb8jn82281lf4cd2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935382e3835393237343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223035336e3466693834656662386a6e38323238316c6634636432223b7d7d, 1681399958),
('0641tfmkk7fiodpbnp91tvcre1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373336302e3039303037383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223036343174666d6b6b3766696f6470626e703931747663726531223b7d7d, 1681397360),
('06v4d5artt4oj6ol63k0t2482a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338362e36373834343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230367634643561727474346f6a366f6c36336b30743234383261223b7d7d, 1681397386),
('077equpku155546f6bt9g5uadc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331332e3737353633313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22303737657175706b753135353534366636627439673575616463223b7d7d, 1681385313),
('08n84f363s7esu4t1idkt2364m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631372e3535303931363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230386e383466333633733765737534743169646b74323336346d223b7d7d, 1681401617),
('0a5k7h3hb2mbdcg5fp86rpanf6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136372e3530323537313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223061356b3768336862326d6264636735667038367270616e6636223b7d7d, 1681401167),
('0b334kapgljna5fbqr83urrgon', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030362e3532353430393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230623333346b6170676c6a6e6135666271723833757272676f6e223b7d7d, 1681400006),
('0bau2gp9lcf5i8ertihs5d46up', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936362e3834333737393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230626175326770396c6366356938657274696873356434367570223b7d7d, 1681400966),
('0cha4h9486t5v07unkjmcq46r3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935312e3030363933333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306368613468393438367435763037756e6b6a6d637134367233223b7d7d, 1681399951),
('0d60dsebiro6vdoiucbkjpt3a8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939332e3231303531333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306436306473656269726f3676646f697563626b6a7074336138223b7d7d, 1681400993),
('0e9sqsc9j73nu3sfj9706rfbe9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435342e3737313533323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230653973717363396a37336e753373666a393730367266626539223b7d7d, 1681399454),
('0ef4b2ndh6lc5pql69ndi02o8g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033312e3734373534393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223065663462326e6468366c633570716c36396e646930326f3867223b7d7d, 1681401031),
('0h66muuf6ofv46n5th2hah5on6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537312e3730383036373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306836366d757566366f667634366e35746832686168356f6e36223b7d7d, 1681400571),
('0j1ffd7li1d0oqohqq3p9ugd2v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132322e3039353134333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306a31666664376c693164306f716f6871713370397567643276223b7d7d, 1681401122),
('0l69tlirhm5q4nkv16brr75nrl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633332e3939383036323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306c3639746c6972686d3571346e6b76313662727237356e726c223b7d7d, 1681401634),
('0lm1keee8gceb2mjmkbfu25qvi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630312e3334373439383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306c6d316b6565653867636562326d6a6d6b6266753235717669223b7d7d, 1681401601),
('0lso8jnn6v2ncc70tdotjl2q09', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335392e3439343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306c736f386a6e6e3676326e6363373074646f746a6c32713039223b7d7d, 1681397359),
('0ml0ecs39fl9mqjaijf4jg4ett', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537302e3833313039393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306d6c306563733339666c396d716a61696a66346a6734657474223b7d7d, 1681400570),
('0nin3co99ckn90e1760hq1ja3a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833332e3733313637333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306e696e33636f3939636b6e393065313736306871316a613361223b7d7d, 1681397833),
('0nud0iegmlp7fmrab7b3nn2qjt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132322e3339303437323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306e7564306965676d6c7037666d7261623762336e6e32716a74223b7d7d, 1681401122),
('0q5k37ebu6trmso0gsmmvqo57s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537322e3237383735333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223071356b33376562753674726d736f3067736d6d76716f353773223b7d7d, 1681400572),
('0qml7nu4up4m9hjfs5ccko6fds', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313635312e3538313639313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230716d6c376e75347570346d39686a66733563636b6f36666473223b7d7d, 1681401651),
('0qp5arp4gjje31g5eto3ali63h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133342e3530333933323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223071703561727034676a6a653331673565746f33616c69363368223b7d7d, 1681401134),
('0raikj1eobhiftvf58ib54q7mv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631362e3038373239353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22307261696b6a31656f6268696674766635386962353471376d76223b7d7d, 1681401616),
('0rs2qvhjo16n6bj965787tkvip', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030342e3639313534373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22307273327176686a6f31366e36626a393635373837746b766970223b7d7d, 1681400004),
('0s2p9unsh068pbi9m736mlbbvt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536372e3434343936353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223073327039756e7368303638706269396d3733366d6c62627674223b7d7d, 1681209567),
('0sn856tf7q6j30jak3hjcu40lu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732372e3839313932313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230736e38353674663771366a33306a616b33686a637534306c75223b7d7d, 1681287727),
('0tsf631q26tbbedd3hut1k91e7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630302e3132313333333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223074736636333171323674626265646433687574316b39316537223b7d7d, 1681401600),
('0u6tlm84p0qheho8ct9ajr3oft', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313131392e3733363030393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22307536746c6d38347030716865686f38637439616a72336f6674223b7d7d, 1681401119),
('0u96c03e5912je17ua2kvenjcb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631312e3134313239323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223075393663303365353931326a6531377561326b76656e6a6362223b7d7d, 1681400611),
('0u9uv9u7e4cu6v3ub8dk19t0gr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537332e3731383732363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22307539757639753765346375367633756238646b313974306772223b7d7d, 1681400573),
('10dlp7kpgv9ffc28bkjg3qcdii', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833322e3235393933363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223130646c70376b706776396666633238626b6a67337163646969223b7d7d, 1681397832),
('11bfsaukg6jreb8jd8s3gtf6e6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538322e3834333730383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22313162667361756b67366a726562386a64387333677466366536223b7d7d, 1681400582),
('11udd4daomfmnt2oua3jvlcpmm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033342e31353939363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231317564643464616f6d666d6e74326f7561336a766c63706d6d223b7d7d, 1681401034),
('1331tf3ruchqpma66han348ij4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538372e3737333933323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22313333317466337275636871706d61363668616e333438696a34223b7d7d, 1681400587),
('13ee4pjm244kimqpghbm102qpe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631352e3439303338363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223133656534706a6d3234346b696d71706768626d313032717065223b7d7d, 1681400615),
('13oq0527h1q0600uthhdgco0nc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437322e3737383732363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231336f713035323768317130363030757468686467636f306e63223b7d7d, 1681290472),
('14ss8t83v20jkc6r4a2o78npao', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530372e3239333637383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231347373387438337632306a6b6336723461326f37386e70616f223b7d7d, 1681399507),
('155t60s7vegptp2l2grtg48seo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030372e3532323938363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223135357436307337766567707470326c3267727467343873656f223b7d7d, 1681401007),
('164mi374j8ajbersvt8o794b3f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032362e3331363439383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223136346d693337346a38616a626572737674386f373934623366223b7d7d, 1681401026),
('1c8l75s4fbenr3hehms4op4b8b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530352e3231323531373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223163386c373573346662656e72336865686d73346f7034623862223b7d7d, 1681399505),
('1cmj1tfvms46da02od65trvemv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937392e3632363939373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231636d6a317466766d733436646130326f643635747276656d76223b7d7d, 1681400979),
('1crf783fa315trmq7vgsqg5dpm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938322e3036303937373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231637266373833666133313574726d713776677371673564706d223b7d7d, 1681400982),
('1dcnq5of8lmt3ibp2djiousgap', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338392e3032343933353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223164636e71356f66386c6d743369627032646a696f7573676170223b7d7d, 1681397389),
('1fvcq7rfogu2aks68a07oijoad', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437342e3937353139313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231667663713772666f677532616b7336386130376f696a6f6164223b7d7d, 1681290474),
('1fvqid0vp7g2f9c0634ve84pp8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303634332e3937343532353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223166767169643076703767326639633036333476653834707038223b7d7d, 1681400643),
('1gsui3kbg6uavj8sg09dkiqbdo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938382e3739373837313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223167737569336b6267367561766a3873673039646b697162646f223b7d7d, 1681400988),
('1gta96t3dp5t9u60ouoe337aju', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137362e3536383037393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316774613936743364703574397536306f756f65333337616a75223b7d7d, 1681401176),
('1ivfja9oj9gkmkntve1k9koj52', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136342e3238373335393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316976666a61396f6a39676b6d6b6e747665316b396b6f6a3532223b7d7d, 1681401164),
('1jar61g725m9glcnjkelhov2tu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630372e3838383631363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316a61723631673732356d39676c636e6a6b656c686f76327475223b7d7d, 1681400607),
('1jn0250790qhv81jrh7pe2j5n3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634302e3136373130333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316a6e3032353037393071687638316a7268377065326a356e33223b7d7d, 1681401640),
('1jnlo9doqdl76g6pm6icu98kqe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537382e3234393439313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316a6e6c6f39646f71646c37366736706d3669637539386b7165223b7d7d, 1681401578),
('1l6cjp1j2t99tsusvi4ii7ch86', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530302e3432363939393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316c36636a70316a327439397473757376693469693763683836223b7d7d, 1681399500),
('1ll8a0dpniqc1rn0ei6ouif8og', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437352e3433363433323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316c6c38613064706e69716331726e306569366f756966386f67223b7d7d, 1681290475),
('1me86875611knni6uar0opv2ru', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132362e3932393037353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316d6538363837353631316b6e6e6936756172306f7076327275223b7d7d, 1681401126),
('1mtqldfh1612i8m5rmn2semk3i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634342e33303038373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316d74716c6466683136313269386d35726d6e3273656d6b3369223b7d7d, 1681401644),
('1nf5leho5tdg2fb2fuejh63pum', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732342e36343331343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316e66356c65686f35746467326662326675656a68363370756d223b7d7d, 1681287724),
('1o3862dfhgmf2v6sobfb2ec5jt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537352e383132373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316f33383632646668676d66327636736f626662326563356a74223b7d7d, 1681400575),
('1o4159r3h4vprs72f0t5vvb8to', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331342e3036363436363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316f34313539723368347670727337326630743576766238746f223b7d7d, 1681385314),
('1obajreef84m38207j3rhl2qg7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837342e3037333130333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316f62616a7265656638346d33383230376a3372686c32716737223b7d7d, 1681397874),
('1ofp65qablp8u2oqclnk0vracs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634392e3734353638373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316f667036357161626c703875326f71636c6e6b307672616373223b7d7d, 1681401649),
('1p78gqqjv5k2sn0ls42qs0vek0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135312e3130373733353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22317037386771716a76356b32736e306c73343271733076656b30223b7d7d, 1681401151),
('1pioo51c6e14e05lv5b43nug80', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538352e3933383537373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223170696f6f353163366531346530356c76356234336e75673830223b7d7d, 1681400585),
('1pnk5abv6b1d9o9nb31oejf569', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138372e3032323037333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231706e6b3561627636623164396f396e6233316f656a66353639223b7d7d, 1681401187),
('1pp5nt6cainhdi40phsl0m7bqg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630392e3233303939323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22317070356e74366361696e68646934307068736c306d37627167223b7d7d, 1681401609),
('1pq7oajcuptq8kbcjo90nd6qfa', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537392e3036363636313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22317071376f616a6375707471386b62636a6f39306e6436716661223b7d7d, 1681400579),
('1q4je4db206nsjuo984u0cqma5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031332e3836363738333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223171346a653464623230366e736a756f393834753063716d6135223b7d7d, 1681401013),
('1rdp9paqtsc7l5trreosp6hr6c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736372e3239373938323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223172647039706171747363376c35747272656f73703668723663223b7d7d, 1681399767),
('1rle2o9g95kfe2rv7suf9iu9v4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732382e3333373633373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231726c65326f396739356b666532727637737566396975397634223b7d7d, 1681287728),
('1sflps8t7c108pesgdp870gp3g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137372e3135393233323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223173666c70733874376331303870657367647038373067703367223b7d7d, 1681401177),
('1sib74c0cmradamikqjaorubi4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030312e3636313334353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223173696237346330636d726164616d696b716a616f7275626934223b7d7d, 1681400001),
('1td6umgdshb8h5jbspvl2fhspk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536352e3432363739373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231746436756d67647368623868356a627370766c32666873706b223b7d7d, 1681206565),
('1u14l3gan14q63ecg93n88sjtv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538322e3138353331343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22317531346c3367616e313471363365636739336e3838736a7476223b7d7d, 1681401582),
('1u6phlsl4j6to6bf4h14rj3og9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030342e3735363935353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231753670686c736c346a36746f36626634683134726a336f6739223b7d7d, 1681401004),
('1u833p4k0u7bq8nn783ksbnlmg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135382e3039323034343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22317538333370346b3075376271386e6e3738336b73626e6c6d67223b7d7d, 1681401158),
('20c0vedomcns0kj83tko8g0pkc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736332e3536303238373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22323063307665646f6d636e73306b6a3833746b6f386730706b63223b7d7d, 1681399763),
('216uj9842cbh0lg2n84137fe27', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830312e35323931313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22323136756a39383432636268306c67326e383431333766653237223b7d7d, 1681399801),
('224ma6er5ibekcnd5gi4elt75k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032332e3230343335373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223232346d61366572356962656b636e6435676934656c7437356b223b7d7d, 1681401023),
('22r0tcjpc8il4btljl009nlu53', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937332e3531303630353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223232723074636a706338696c3462746c6a6c3030396e6c753533223b7d7d, 1681399973),
('25ls6r2220h35umhlaordeo0l0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634372e3839343539323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232356c73367232323230683335756d686c616f7264656f306c30223b7d7d, 1681401647),
('26i2np6p8csgd70ld5ko563h9e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833352e3830393435333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22323669326e703670386373676437306c64356b6f353633683965223b7d7d, 1681397835),
('26sbfl6t7ao9bd1fdm34bkof5i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630362e3136383032373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232367362666c367437616f3962643166646d3334626b6f663569223b7d7d, 1681401606),
('27o46ahh7c8bm8heaknck0a7d4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631352e3830343630333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232376f3436616868376338626d386865616b6e636b3061376434223b7d7d, 1681401615),
('27qqvveb34mda2aupmvh880ndt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133352e3732353539353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22323771717676656233346d6461326175706d76683838306e6474223b7d7d, 1681401135),
('2911c8bqef750oasac58pb4h9k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830302e3934343637343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22323931316338627165663735306f61736163353870623468396b223b7d7d, 1681399800),
('2935d4f0i1vselgc4no3bj4sfu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393938382e3936373937323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22323933356434663069317673656c6763346e6f33626a34736675223b7d7d, 1681399988),
('2bg8m9ktpvuhfht3h6t3mo292p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335372e3339373935343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326267386d396b747076756866687433683674336d6f32393270223b7d7d, 1681397357),
('2c2p6ri4mje6aergs1p2udfi06', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632382e3538313032373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232633270367269346d6a65366165726773317032756466693036223b7d7d, 1681401628),
('2c77rto4jntbqanuidint76q6a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393836392e3331383435343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223263373772746f346a6e746271616e756964696e743736713661223b7d7d, 1681399869),
('2dmb48kardfufvojnocgqssjan', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634312e3435313830373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232646d6234386b617264667566766f6a6e6f63677173736a616e223b7d7d, 1681401641),
('2g0jjuiq4nl73hp4pv8voo7flp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536332e303339363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223267306a6a756971346e6c3733687034707638766f6f37666c70223b7d7d, 1681206563),
('2gd0fl2ulkjdt438rhobgdcrbv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031372e3033323937363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232676430666c32756c6b6a647434333872686f62676463726276223b7d7d, 1681401017),
('2gm4ghphb26dlmggtn4s3h7cfd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632302e3630323534313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232676d3467687068623236646c6d6767746e3473336837636664223b7d7d, 1681401620),
('2hs1cks6lb9d7u2sqtas4slh7c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330362e3536343439393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232687331636b73366c623964377532737174617334736c683763223b7d7d, 1681385306),
('2iii3cgpupjqlo7ha0m7fahjae', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134302e3131373935333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326969693363677075706a716c6f376861306d376661686a6165223b7d7d, 1681401140),
('2irbaqkektl8ufegh4b0opmuue', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939392e3831343333313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223269726261716b656b746c3875666567683462306f706d757565223b7d7d, 1681399999),
('2ja4lora9k92k0tm2f88s4uund', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238362e34343037373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326a61346c6f7261396b39326b30746d32663838733475756e64223b7d7d, 1681393286),
('2l4g8rg89tmjf5cfo4ua19lgn4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330382e3630343736383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326c34673872673839746d6a663563666f34756131396c676e34223b7d7d, 1681385308),
('2l8g7r2g1cn2k688tm4t4cjqii', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333372e3639393335363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326c38673772326731636e326b363838746d347434636a716969223b7d7d, 1681385337),
('2ljk1shptg5d6ouk4pduai8073', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736382e3734363032383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326c6a6b3173687074673564366f756b34706475616938303733223b7d7d, 1681399768),
('2lp4op3lmmaikqbl2v54f56pmh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238332e34323731363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326c70346f70336c6d6d61696b71626c32763534663536706d68223b7d7d, 1681393283),
('2mdut69bml66q1k4muk9dqqsqv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030322e3432343333343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326d6475743639626d6c363671316b346d756b39647171737176223b7d7d, 1681401002),
('2nrde0s3i62v2l1ttssre2glr3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238342e3332383433393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326e72646530733369363276326c3174747373726532676c7233223b7d7d, 1681393284),
('2o3o0mb9s5tec8v5deaukocom9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937382e3231323132383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326f336f306d62397335746563387635646561756b6f636f6d39223b7d7d, 1681399978),
('2s0094qfej3rj8nk4d63cqqido', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630322e3535363935393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223273303039347166656a33726a386e6b3464363363717169646f223b7d7d, 1681401602),
('2si9vrunuteqqtun025akb66ev', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938352e3137333635323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22327369397672756e757465717174756e303235616b6236366576223b7d7d, 1681400985),
('2t3r9vi1ku6s8750plrnqm38jf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833362e3432313936313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232743372397669316b75367338373530706c726e716d33386a66223b7d7d, 1681397836),
('2v52g34p82mkm4r92s4glb6o07', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937372e3630353837313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22327635326733347038326d6b6d347239327334676c62366f3037223b7d7d, 1681399977),
('309399f9njqnn44robbh3h7ad4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032302e3730323234343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233303933393966396e6a716e6e3434726f626268336837616434223b7d7d, 1681401020),
('309ts2pf2brb543its01clfmqa', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338382e3433333432393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223330397473327066326272623534336974733031636c666d7161223b7d7d, 1681397388),
('30pkqm7vlajjtkekada7gnr70l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538342e3739373636393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223330706b716d37766c616a6a746b656b61646137676e7237306c223b7d7d, 1681401584),
('31sdf3h23omsn38sltl69eu15e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135352e3931313132393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223331736466336832336f6d736e3338736c746c36396575313565223b7d7d, 1681401155),
('322dur2kl0qdgvgi2papl2rnui', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434352e3433373831383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22333232647572326b6c30716467766769327061706c32726e7569223b7d7d, 1681399445),
('323qq9ufc842a48lc5j6nbd2lc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937352e3233353935373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223332337171397566633834326134386c63356a366e6264326c63223b7d7d, 1681399975),
('330ju97u3k4k63ifg9l308k4i9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632352e3434363934353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223333306a75393775336b346b3633696667396c3330386b346939223b7d7d, 1681400625),
('332u7d49cdlij0e4kfho0e4l25', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630312e3634313232353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22333332753764343963646c696a3065346b66686f3065346c3235223b7d7d, 1681400601),
('3582v5t4appg54bgr21bmnvosm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631302e3237303137393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233353832763574346170706735346267723231626d6e766f736d223b7d7d, 1681400610),
('36hkugmbsr65vn9g8q96ev3sme', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132312e3739373433323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223336686b75676d6273723635766e396738713936657633736d65223b7d7d, 1681401121),
('3717darri48u8mdh7ntt3tnnni', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032312e3331343037373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22333731376461727269343875386d6468376e747433746e6e6e69223b7d7d, 1681401021),
('37o0eh67l9m48c0nrte9o48aki', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630382e3438383337313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233376f30656836376c396d343863306e727465396f3438616b69223b7d7d, 1681400608),
('3897s40scsigjcnk7vo5g7cjq7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134342e3939343636333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223338393773343073637369676a636e6b37766f356737636a7137223b7d7d, 1681401145),
('38ngc60b8pc9qkg03dpm2la5j8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383231302e3731363133383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233386e676336306238706339716b67303364706d326c61356a38223b7d7d, 1681398210),
('39c6bpvj4k2fu505sfae63ts2v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136362e3930353639393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22333963366270766a346b32667535303573666165363374733276223b7d7d, 1681401166),
('3a7mam345hhbrlfa7dfbdcv3mp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393739382e3932353135313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223361376d616d333435686862726c666137646662646376336d70223b7d7d, 1681399798),
('3aei032dgsu1i9igmn02l50am5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736322e3637323238323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336165693033326467737531693969676d6e30326c3530616d35223b7d7d, 1681399762),
('3bc0ic2sd38bq9mg0ffqf99klb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939312e3732363236363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233626330696332736433386271396d67306666716639396b6c62223b7d7d, 1681399991),
('3c5r9ekumlklhrv2lqr8o1fiph', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134352e3634393038383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223363357239656b756d6c6b6c687276326c7172386f3166697068223b7d7d, 1681401145),
('3cahe04ca91nhs0ua5mjjrahpr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937312e3638323633333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233636168653034636139316e6873307561356d6a6a7261687072223b7d7d, 1681399971),
('3eksr2ejjmbkjvg4f4t2uig9kg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333392e3231323737373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233656b737232656a6a6d626b6a76673466347432756967396b67223b7d7d, 1681385339),
('3fhhsvk8te0gldeollndi00ee0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837302e3832313436373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223366686873766b38746530676c64656f6c6c6e64693030656530223b7d7d, 1681399870),
('3gnn1r4r30r6368unhevil5ioj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030332e3330313336313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233676e6e3172347233307236333638756e686576696c35696f6a223b7d7d, 1681401003),
('3h5b8bhs198hhem9rblegvvne4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632322e3538313132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233683562386268733139386868656d3972626c656776766e6534223b7d7d, 1681401622),
('3h6p57bgdcgcp4vtmf36q4ba81', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e3235313639333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336836703537626764636763703476746d663336713462613831223b7d7d, 1681207047),
('3ik9tgh709040dhseh2g8224nf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530322e3731393635313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233696b3974676837303930343064687365683267383232346e66223b7d7d, 1681399502),
('3jbu7bthggr4eaj4d3ds76ueud', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631382e3638313930383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336a6275376274686767723465616a3464336473373675657564223b7d7d, 1681400618),
('3jebe4p5a7k1f2ih90eg21oqfp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439392e3831353532343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336a65626534703561376b31663269683930656732316f716670223b7d7d, 1681399499),
('3lrrb249s3419ojaf6gmjtr9rf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393934372e3834303334343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336c72726232343973333431396f6a616636676d6a7472397266223b7d7d, 1681399947);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('3mkne5idufgel61kp0pu48go5r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135372e3830393436383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336d6b6e65356964756667656c36316b703070753438676f3572223b7d7d, 1681401157),
('3n7ap4aoqvmpe8nj5hhpmrcgtd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537382e34323437353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336e37617034616f71766d7065386e6a356868706d7263677464223b7d7d, 1681400578),
('3nhra9b486mhte1u7p352jtveh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393932392e3437313133393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336e68726139623438366d687465317537703335326a74766568223b7d7d, 1681399929),
('3p294m3ia5ev0d89k95vem511m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393934392e3133323630313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233703239346d336961356576306438396b393576656d3531316d223b7d7d, 1681399949),
('3p94olnuvbqbggc0r4ql5o5snk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632362e3131333635323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22337039346f6c6e7576627162676763307234716c356f35736e6b223b7d7d, 1681401626),
('3q26994tjq1gsjg3nobrh0g81d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373336302e3939343431373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233713236393934746a713167736a67336e6f6272683067383164223b7d7d, 1681397361),
('3q80honsojr3u1debqkratce9s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338372e3835343533363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233713830686f6e736f6a72337531646562716b72617463653973223b7d7d, 1681397387),
('3qcdvaq5lrud17rt9emcmjlrv5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136382e3731333639353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233716364766171356c7275643137727439656d636d6a6c727635223b7d7d, 1681401168),
('3rbpk51ubm4pi10p8tkp33ln9i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633372e31353733343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22337262706b353175626d34706931307038746b7033336c6e3969223b7d7d, 1681401637),
('3rc27du69gafi4pdkoq8n89pc7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030302e39343232393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22337263323764753639676166693470646b6f71386e3839706337223b7d7d, 1681401000),
('3rfd2lttbs29rh4822du6c928q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639332e3137333035363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233726664326c7474627332397268343832326475366339323871223b7d7d, 1681396693),
('3rv9bn831vmrqrim3f8qh73tm2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135392e353636313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233727639626e383331766d727172696d33663871683733746d32223b7d7d, 1681401159),
('3sv8vo1li4k98tu804145jhqsq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338372e3237353631393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233737638766f316c69346b393874753830343134356a68717371223b7d7d, 1681397387),
('3tk7ht4gknet4o35f3u4oh9ek1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936312e33343439393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233746b37687434676b6e6574346f3335663375346f6839656b31223b7d7d, 1681399961),
('3v8k2b9r9701o76tnpl5p2mfvl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031392e3435353038393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223376386b32623972393730316f3736746e706c3570326d66766c223b7d7d, 1681401019),
('40hiaquuj9n3ir4dh965grd0hj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938332e3930393834353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234306869617175756a396e33697234646839363567726430686a223b7d7d, 1681400983),
('414dvbhslp35d6903ep4sjdfi2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935382e3234393636313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234313464766268736c7033356436393033657034736a64666932223b7d7d, 1681399958),
('41855to367r8iksvq0dgtljp2n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303634302e3431303434383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223431383535746f3336377238696b737671306467746c6a70326e223b7d7d, 1681400640),
('41j8dj6lemd91qgu2lsuqlrgah', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536362e3030333432313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234316a38646a366c656d643931716775326c7375716c72676168223b7d7d, 1681209566),
('43s45pokeiuh5ngct746m71aej', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631312e3731373839393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223433733435706f6b65697568356e6763743734366d373161656a223b7d7d, 1681401611),
('452oqjql6t3mtiu96tnvm5bud8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939372e3937323835373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223435326f716a716c3674336d7469753936746e766d3562756438223b7d7d, 1681400997),
('45j39jv555udtclgeijomckst3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334342e3133313531313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234356a33396a76353535756474636c6765696a6f6d636b737433223b7d7d, 1681385344),
('46c8o9o4upj6vp8kaohpsd24b2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530362e3132333934313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343663386f396f3475706a367670386b616f6870736432346232223b7d7d, 1681399506),
('48rv2ncbjm9mrrmvtlnbbus1i9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938382e3230303834343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234387276326e63626a6d396d72726d76746c6e62627573316939223b7d7d, 1681400988),
('48rvjl2vbjg4hlq0c8rpqami8b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833332e3432393634333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343872766a6c3276626a6734686c71306338727071616d693862223b7d7d, 1681397833),
('493ekalmjm7mtvi2cm6ccdkfj2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393932362e38343132323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343933656b616c6d6a6d376d74766932636d366363646b666a32223b7d7d, 1681399926),
('49b963ucvrnrf5fnu3ge781lon', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530302e3131383339373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343962393633756376726e726635666e753367653738316c6f6e223b7d7d, 1681399500),
('4abhdaioerfne5kf0oip9jqlok', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732372e36353533363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346162686461696f6572666e65356b66306f6970396a716c6f6b223b7d7d, 1681287727),
('4bujqgl3mr0tll1juebieiu8n8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3831363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223462756a71676c336d7230746c6c316a75656269656975386e38223b7d7d, 1681207045),
('4c414cc1d6u8e6u1oqh9a5k3la', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330392e3832313032383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346334313463633164367538653675316f71683961356b336c61223b7d7d, 1681385309),
('4cl3npq134m3j70dk4uk3624n1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135392e3236373136373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234636c336e70713133346d336a3730646b34756b333632346e31223b7d7d, 1681401159),
('4cog6aau03a9msv7e4epocoqoc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032302e3039313832393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234636f6736616175303361396d737637653465706f636f716f63223b7d7d, 1681401020),
('4da04155gbsr2inufhd834dgq3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030312e3035363037353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234646130343135356762737232696e7566686438333464677133223b7d7d, 1681400001),
('4dcj28h3gtn9mtf0dnqte4p80b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937342e3036343630343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223464636a3238683367746e396d746630646e7174653470383062223b7d7d, 1681400974),
('4fi3ii34imo7ekf1i49emt6eu4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238322e32353839373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223466693369693334696d6f37656b6631693439656d7436657534223b7d7d, 1681393282),
('4gij7epsrts363hojig3abssko', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393737312e3131363431313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223467696a37657073727473333633686f6a696733616273736b6f223b7d7d, 1681399771),
('4h5nhpf1jola10052c4elmen73', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137372e3734393137393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223468356e687066316a6f6c6131303035326334656c6d656e3733223b7d7d, 1681401177),
('4hhj54s1qavbunf2gfdsvuu9gp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393938382e3239303336363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223468686a3534733171617662756e663267666473767575396770223b7d7d, 1681399988),
('4hirrla0v9jik3v5vqkgc5m8d3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731302e3236313636343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234686972726c613076396a696b33763576716b6763356d386433223b7d7d, 1681396710),
('4ifjt0ebkupe0ir2rn701sp73h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e3230303133383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223469666a743065626b75706530697232726e3730317370373368223b7d7d, 1681207046),
('4j78vu146ik3aojhbrm68op477', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338372e3536353831343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346a37387675313436696b33616f6a6862726d36386f70343737223b7d7d, 1681397387),
('4jcdaq1l2m3qepu2egmgv7l2ir', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539312e37323835383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346a63646171316c326d33716570753265676d6776376c326972223b7d7d, 1681401591),
('4jhib1tlhkb98e592lob33ufp6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331322e3334393432353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346a68696231746c686b623938653539326c6f62333375667036223b7d7d, 1681385312),
('4k9g0r3heckgitoa16venfc6qn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736362e3431313930343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346b39673072336865636b6769746f61313676656e666336716e223b7d7d, 1681399766),
('4n1hf9vle0fos34e8e3a0iee89', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936332e3535333730393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346e31686639766c6530666f7333346538653361306965653839223b7d7d, 1681400963),
('4nfgjtobfc10raujp5mg1kgka1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632392e3936393032383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346e66676a746f62666331307261756a70356d67316b676b6131223b7d7d, 1681400629),
('4npogs60traksubhrsm203tmv8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633342e3336383837393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346e706f677336307472616b7375626872736d323033746d7638223b7d7d, 1681400634),
('4oe54bfrhgt26ld1m8qhgo16jm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132302e3331393833333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346f65353462667268677432366c64316d387168676f31366a6d223b7d7d, 1681401120),
('4prp8cl1k5of782db22f58ge9m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232392e3630313332373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223470727038636c316b356f66373832646232326635386765396d223b7d7d, 1681290229),
('4qoq33fgpso2ddfb1mihjkb2c1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539322e3932373437383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234716f713333666770736f3264646662316d69686a6b62326331223b7d7d, 1681401592),
('4rct5hi08jp85bb6lctmq5sfhf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434352e3130363037333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223472637435686930386a7038356262366c63746d713573666866223b7d7d, 1681399445),
('4rtjn1645rag4qlq72drde58n7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631342e3333323430343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223472746a6e3136343572616734716c7137326472646535386e37223b7d7d, 1681401614),
('4scfg5h33kmkitc054bnvj79le', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939342e3233303234323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223473636667356833336b6d6b697463303534626e766a37396c65223b7d7d, 1681399994),
('4sr3lbtbsukeoud7tbij07cdpo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731302e3833373636363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22347372336c62746273756b656f7564377462696a30376364706f223b7d7d, 1681396710),
('4svrlgs89e6fehhskdmebl2hg7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303634332e3338373831313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22347376726c67733839653666656868736b646d65626c32686737223b7d7d, 1681400643),
('4u1kscfiglu8uaeqvhj6tte8u7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331302e3130363833323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223475316b73636669676c75387561657176686a36747465387537223b7d7d, 1681385310),
('4v4ok8hsnrmd217v3ubf2e1q9j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536322e3438303338383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223476346f6b3868736e726d64323137763375626632653171396a223b7d7d, 1681206562),
('504rge64tbaatsf1cdoudvvm57', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338362e3038303230323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223530347267653634746261617473663163646f756476766d3537223b7d7d, 1681397386),
('515v5ljvp6jf9334gunats9694', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034342e3532393039323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235313576356c6a7670366a663933333467756e61747339363934223b7d7d, 1681207044),
('51jp8r77ac7bbs388gpn6mlldo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538332e3434303338343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235316a703872373761633762627333383867706e366d6c6c646f223b7d7d, 1681401583),
('52qpg9g442jrfbsrm4mbpf7t8r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437322e3439363032323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22353271706739673434326a72666273726d346d62706637743872223b7d7d, 1681290472),
('52shd5frhv4ju6o6bdi33f9552', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313232373036342e3431313739373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235327368643566726876346a75366f3662646933336639353532223b7d7d, 1681227064),
('52unpiap9cs2mvnp00olg7j9g0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136302e3734373237313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223532756e70696170396373326d766e7030306f6c67376a396730223b7d7d, 1681401160),
('53fsli0umtb6962sq9diuuqe50', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736302e3934343536393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22353366736c6930756d7462363936327371396469757571653530223b7d7d, 1681399760),
('53vfv0516imigq3cui4eaurpr0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936342e3738353433333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22353376667630353136696d696771336375693465617572707230223b7d7d, 1681400964),
('5406uqc4ampbs986batjl2epvk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937372e3331333735363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223534303675716334616d7062733938366261746a6c326570766b223b7d7d, 1681399977),
('54t0tnfq5n5dup7mnvamg1oqnp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232372e3639343038363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235347430746e6671356e35647570376d6e76616d67316f716e70223b7d7d, 1681290227),
('54vqvcfgpgs8f8cum315037t48', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3238353832353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22353476717663666770677338663863756d333135303337743438223b7d7d, 1681207045),
('56j7pjf3tfqa1g8bk58bmgot5u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939322e3033353532383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235366a37706a663374667161316738626b3538626d676f743575223b7d7d, 1681400992),
('572juff63r8d68t3hngbf5vp17', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437332e3237323131383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223537326a756666363372386436387433686e6762663576703137223b7d7d, 1681290473),
('57uubl1se5ibv95irtvm0pao2r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939352e3539343031383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235377575626c317365356962763935697274766d3070616f3272223b7d7d, 1681400995),
('59b8p51t70kht30gdaeses3er4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034342e3933363933363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22353962387035317437306b687433306764616573657333657234223b7d7d, 1681207044),
('59rm8qn3ivin473hkg3pp6gfem', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937352e3330343237353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223539726d38716e336976696e343733686b67337070366766656d223b7d7d, 1681400975),
('5ainhvdro35fqcc53qlllnhlop', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633342e3937313131383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223561696e687664726f3335667163633533716c6c6c6e686c6f70223b7d7d, 1681400634),
('5al2n66147anrom9sh9tf9o58e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136302e3435353134393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235616c326e3636313437616e726f6d397368397466396f353865223b7d7d, 1681401160),
('5bjeh20qpd4p300aoiamno4s23', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936332e3137303938313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235626a656832307170643470333030616f69616d6e6f34733233223b7d7d, 1681399963),
('5bnuq1dks6sk3hm95vlike7ce6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031302e3738303339393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235626e757131646b7336736b33686d3935766c696b6537636536223b7d7d, 1681401010),
('5c8ui48p9hu2ojkb9ijpptbf24', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393535352e3633363838313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269616f7574386f6c686163736e7432766b6f6337757532687231223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638313230383736323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638313231323936363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313638313231323838313b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e636f7265742e6f72672f646174612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223231396164383336393630636432616263653861633832643462353233633736223b733a33323a226665613764363332383937323538643538323436613237333832643130333166223b7d733a343a2268617368223b733a36353a2266656137643633323839373235386435383234366132373338326431303331662d3231396164383336393630636432616263653861633832643462353233633736223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33393a7b733a33323a226538393561353566353161653562393138353865376335313131623838343564223b733a33323a223435343364653030656531626130383039393965366535393766373662303936223b733a33323a226666643339363535326632613537373963633863393537343439333830666565223b733a33323a223966666232326530653362616466396465303332636433316130316431393237223b733a33323a223164653362326138653538336565663663356366633034653430643664363633223b733a33323a223866663338303861396330313732393732386538363434306634363837393331223b733a33323a223139323665383130363738383037336662303834653834383663393663616239223b733a33323a223263356232373537613865383230326336333139386464613233393862373036223b733a33323a223561396236346336336161353530376264343336376331643561343838383333223b733a33323a223331393831666432613563383130346563376465383261393734623761333064223b733a33323a226565663561666564663331316132303338393135623866386631383030663038223b733a33323a223666663364663462343134353030323337663030366362356166336133383338223b733a33323a223164613762373832303936346661633434616535643437373937313364303730223b733a33323a223636383139353837663636323339633262623437376436373638373830373836223b733a33323a226334393534616437333038616364653839613862376664376334343366383035223b733a33323a226432366461303733383035363332343362353234396533396436316532316261223b733a33323a226434653036653563633362353664303734613830333165393862623963613361223b733a33323a223135646432396535613335383735646463366533333836646261343361663637223b733a33323a223132383534373735386363316234313630663465393632653339383530353236223b733a33323a226139636135333565373365336461656137646635306531323838653662353334223b733a33323a223736363835376436366331343830363334393739626263336238653861616230223b733a33323a223833626565373666393539656134393035353134363161653031383036666164223b733a33323a226638306462396236316439323430663565643763633739393032336539636666223b733a33323a226164643964666633616330643165626330316464623631393861653961306138223b733a33323a223739656430363139633132383161396631323531333038303739353034613564223b733a33323a226233313064373765313861666439666236636438353437393031353732613765223b733a33323a223732363937396337383539633236636662653531323537313537323832626233223b733a33323a226131396234326330616531346334333936333230383862626233343738653435223b733a33323a226264643334653137633439653866623336663662326233663261623538323633223b733a33323a226433646666663064646465633535376562663734326139343563363434666130223b733a33323a223366363935373262636464363535616238303665396363333231333731613434223b733a33323a223463303161613736363738666165626130353936373166393062383033383465223b733a33323a223863643434343036643936643139346364393363376362656236666662643532223b733a33323a226431343662663630366339383263316432303137366263613266393464333161223b733a33323a223662343732316336623763366233636635633233363233356431303662326639223b733a33323a223534376462623564366663623835363932396637316565373833303639373765223b733a33323a223031393536613062613566323365396265643565336232363339343437613661223b733a33323a226563656239613837393130653965646233623734666131386531326635626264223b733a33323a223836316162396264653939373561643036633530333234623335316534643435223b733a33323a223934376464343830663436363939653963326531666165396136373763326633223b733a33323a226131306137336230313737613464316532633661393331656232326235323562223b733a33323a226663613530336365353632366264666465623864323734633835633931333630223b733a33323a226465333039623434656538666639343666316631313165346334303535316164223b733a33323a226130653730366162313136343438633063663431613263623866373966633033223b733a33323a223532623939313938346662353731343633633239643033376263646533303465223b733a33323a223261363362366439393637396565393434306234363137643462623931376431223b733a33323a223831643033303536633931303630363235623164303631313730663062353431223b733a33323a223131303537656636646134313831393237336236363834363637626562333438223b733a33323a223731383961346436386163303937323966333337353962373339303932373834223b733a33323a226362636531333562323764656333323536316664323237613466633334316531223b733a33323a223165656339393336616230616533313030366331653962343436643661353538223b733a33323a226566613661663933343762373238346436643038623066613036636233333231223b733a33323a223535356461323532656539313166663666353561373436373062643338346361223b733a33323a226438353561396534386661666439323438613861363036353536623137613137223b733a33323a226538313534663264653934313934373064366435653738366364386661646133223b733a33323a226134373731616337636539623266636538656635363664623763356162653335223b733a33323a226430663433393963326630313465633865633436393238633838316366636364223b733a33323a226238313166656135383037303431313437623534383630303036313239616338223b733a33323a223466326465626437386438326136653262393664356365666230323362333036223b733a33323a223535396165613637613764646138353833323261623138376538326537333630223b733a33323a223761623336653331616634666231373362386165383566323331323835653031223b733a33323a226335646430646438316231353537646165646661383764383563323030343764223b733a33323a223834373835356265323961336337333666336263323439303765626436363832223b733a33323a223663333933313438343535646665333266626265363332613766613963306633223b733a33323a223034313865303638303835636530373930386161663166306436366162633965223b733a33323a223733303634373563396265363930363461623065373333643531346664373832223b733a33323a223466366436646133653133376336306261346233356236653031353662363962223b733a33323a223261636265636433396261353130613734363233366237386433643864613034223b733a33323a226234626432373630613631373438353632346431323365653736323764313532223b733a33323a226136643135383034376235323534386237383131313533633638396137313531223b733a33323a226162343762663461363164383064316236636434383766353364356361303630223b733a33323a226536373761653734323734663763343563373666653133343639633935323631223b733a33323a223139373363343632623839616637333331353131663831613130313666306266223b733a33323a223233303661666239343333643639333561353431653466643039326465626633223b733a33323a223361386431353264613837376665643037323533333637636132346262656437223b733a33323a226131653533623732326137393662393561376234306638633030386335363234223b733a33323a223439653961353231623532373639613563373561616239636438333937366566223b733a33323a226164313035633166646162363739316130366662663261326166303838363234223b7d733a343a2268617368223b733a36353a2261643130356331666461623637393161303666626632613261663038383632342d3439653961353231623532373639613563373561616239636438333937366566223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226539373939313662376565613164613036643230323435623831653835666636223b733a33323a223537663538396532373562613236363063343465306539373839393530653035223b733a33323a223966323831376238613365313634326537626330356136303762326638303566223b733a33323a223062316438363165616137363334386337366464323939306436373639626238223b733a33323a226436356336653136343730353037633631323732303935353031646365316635223b733a33323a223566373031393334313365363865313237646631366437336362393530336462223b733a33323a226664323537613836656334653933333030613937323265653139306433383064223b733a33323a223737613332356535636465373434306365373137323134386632353037323533223b733a33323a223236356262643861306563366339333766646430616464386364663636643561223b733a33323a223937343336343635636239336430313236336264313962346564666333303432223b7d733a343a2268617368223b733a36353a2239373433363436356362393364303132363362643139623465646663333034322d3236356262643861306563366339333766646430616464386364663636643561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1681209555),
('5cocceqdcoahh2j0ikieo2otql', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334332e3535343933393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235636f6363657164636f616868326a30696b69656f326f74716c223b7d7d, 1681385343),
('5csmbt8v2cp4m839j08ovgdcli', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736312e3233303931353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223563736d62743876326370346d3833396a30386f766764636c69223b7d7d, 1681399761),
('5do523hlhusfr33p9hincel032', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938392e3430323634313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235646f353233686c68757366723333703968696e63656c303332223b7d7d, 1681400989),
('5fpp3p0uvqlf294as3a05adqm1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331302e3639333534313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356670703370307576716c663239346173336130356164716d31223b7d7d, 1681385310),
('5g3i977p6nhl6n7v9mlrvpj29t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338352e3439393033373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223567336939373770366e686c366e3776396d6c7276706a323974223b7d7d, 1681397385),
('5h0fuenq6sch4lec25dqrqvt1k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e3031303734353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223568306675656e7136736368346c65633235647172717674316b223b7d7d, 1681207046),
('5hb0sepcuq25a1j18jmn0lpi1s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135362e3935343237343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235686230736570637571323561316a31386a6d6e306c70693173223b7d7d, 1681401156),
('5iabdsb9lm1fbb5nj150khfb15', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030392e3438343538393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235696162647362396c6d31666262356e6a3135306b6866623135223b7d7d, 1681401009),
('5iel9tmli7d94gig9am0gnp5mo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937362e3732313339373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223569656c39746d6c693764393467696739616d30676e70356d6f223b7d7d, 1681399976),
('5ij0po7rgvoc4khl9k8oodqss3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639342e30373432323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235696a30706f377267766f63346b686c396b386f6f6471737333223b7d7d, 1681396694),
('5jdimd72cjt5t8t4a6qd4qhhsc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333372e39383038383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356a64696d643732636a74357438743461367164347168687363223b7d7d, 1681385337),
('5jdo1sduiau6s64fqp4ti6rjo0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633322e3436353538383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356a646f317364756961753673363466717034746936726a6f30223b7d7d, 1681400632),
('5l05aljqmokroc9r8alfiodgmu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434342e34363639323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356c3035616c6a716d6f6b726f63397238616c66696f64676d75223b7d7d, 1681399444),
('5mme6r60ie19tgvjaka2ep14vu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536362e3131303436353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356d6d6536723630696531397467766a616b6132657031347675223b7d7d, 1681206566),
('5nrfg31322v94t7nrvbdruui0t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033332e3536333139353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356e726667333133323276393474376e72766264727575693074223b7d7d, 1681401033),
('5oakkidqet5s8gij53osndk02t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331312e3439343936333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356f616b6b696471657435733867696a35336f736e646b303274223b7d7d, 1681385311),
('5oq77f604lci4gke80fdpp8sbu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539332e3139363035393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356f713737663630346c636934676b6538306664707038736275223b7d7d, 1681400593),
('5p6m5pcd9k4ous26bt2dj41bma', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134302e3733303033323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223570366d35706364396b346f75733236627432646a3431626d61223b7d7d, 1681401140),
('5primql883r52ve08kq1s0d684', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132322e39353831323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22357072696d716c383833723532766530386b7131733064363834223b7d7d, 1681401122),
('5qt6pqpt3hem1e3l7merbcf0je', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030362e3837343635313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235717436707170743368656d3165336c376d6572626366306a65223b7d7d, 1681401006),
('5r9dfpkmbns9ud6sv64jc24n96', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530342e3930383832393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223572396466706b6d626e7339756436737636346a6332346e3936223b7d7d, 1681399504);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('5s2au94ql9fmhuaf2jgee3k5vh', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638323532353739312e3738313431393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266736b32377631706f6665363471733369723168666d6c353562223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638313238383532383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638323532393330323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313638323532393039373b7d733a34383a224c616d696e61735f56616c696461746f725f437372665f73616c745f637573746f6d766f636162666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638323439373730343b7d733a35343a224c616d696e61735f56616c696461746f725f437372665f73616c745f637573746f6d766f636162696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638323439373839373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638323532393330323b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e636f7265742e6f72672f646174612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226661353162343832653565316332663166616437303630666166633164343839223b733a33323a223530633435356438366137646561396366323362373235303836373464643962223b7d733a343a2268617368223b733a36353a2235306334353564383661376465613963663233623732353038363734646439622d6661353162343832653565316332663166616437303630666166633164343839223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33393a7b733a33323a223636376337666131306365383634333538336238313963303963353330613161223b733a33323a223638303237633638323062336636633464663438376264663430353539666363223b733a33323a226462653630376633666333356435653232396531636662313464393162363931223b733a33323a226637333261303862623232373463353932393731656238313733663061643462223b733a33323a223335326533653863646233373435656534623263373162613232626136633235223b733a33323a223534326231386566646130666530636462646366643934613534663065623636223b733a33323a223734323630633763663539373038373735303839653663393530623561323638223b733a33323a226430313462363931306330353065313765383138323561623732306330333066223b733a33323a226334663437396361633861626665376338663265653534323064656137613831223b733a33323a223436326635303732303834616633646161643133396235646262636130633562223b733a33323a223931653339363664386265393361653237633633646238396238353630633966223b733a33323a223735306435663366373164383235616465383563393333346366363764393735223b733a33323a223032623463663265303637326137653366376536373732643764356662623837223b733a33323a223436353138333631306262336631356263346633383431343239363835616332223b733a33323a223236656665646335386531333730653664303638666565626264396630326361223b733a33323a226437653531643463646130323661356230396337396432613237396339636563223b733a33323a223562313335353830343132356131346239396164366261663463353435663663223b733a33323a223561653563363738383730656565376138356265303037366330663534633861223b733a33323a223363373064323432326365356330663566633962646664313932393337353630223b733a33323a226263303365373166393634643362626431616162613664626436336565623661223b733a33323a223735333134386634383430356635383733306130363038373338393362646536223b733a33323a223661353234366333326338643934313561383966323732326234366262323036223b733a33323a223531326666343161366230393565653237303937656236366561616664373031223b733a33323a223731656664313630323231356562643563613063313334663566393264306465223b733a33323a223663323733623165653434666637336262646361326339623763623237333834223b733a33323a223661373736613833393262643730656637316638613434323339393134336231223b733a33323a226131656337396438356261633930386662333435353533663235326163316238223b733a33323a223737326333363731613536343036396532323535313239313539366562336665223b733a33323a223066353232653535393537663637366130623364333233643662336437373763223b733a33323a223339336265326331666264663634306632376665386666333136346637613133223b733a33323a223731393831323630383535343062373437353131386163306332613062373061223b733a33323a226562313134383030316263616338626235633330383231613839316664623564223b733a33323a226337643861376538383439626162353063356632326335326562343764313363223b733a33323a223336383465376336613432353865623134336165343565346231346534653063223b733a33323a226464323435646632383138306332383735313231656365343437633737313564223b733a33323a223532316262396538326632663866663666303733656334323761613837383465223b733a33323a223363303630633663393131646532306335356531633162393333356236373463223b733a33323a223837316432313661353165616464643565393361666263643235613966326530223b733a33323a226432346332376538346138663339646430333832336635313964326461643831223b733a33323a223331333965323462653033663431386166343136613163663931623463633064223b733a33323a223635343535623230343961353836366361326231393563396539666530383534223b733a33323a223737303362366333393163643663373433653734396330383961313362316331223b733a33323a223438623135343033333365613936663866646231616134653233396566303663223b733a33323a226566356262646231656463633932643539376238663966353931366337656439223b733a33323a223336396263623039643662363730336134616235303130666561333730613237223b733a33323a223761396665326366323935393835623465353963316363393733353337313164223b733a33323a223361613935616237306431623336626634363031326163326234656361353035223b733a33323a223837303431656533346133633162373832306365393564313039373563316438223b733a33323a223033373439636531393937336434666562616637356165376131613132363634223b733a33323a226664316436333239636632626634633665636239666262363961626330363566223b733a33323a226164656662613564336634303065313436363063393161343237323034643633223b733a33323a223562613436353834303865346562313532353035646439386166353965383630223b733a33323a226633396561343630616137346338363936313538303939356466346265383232223b733a33323a223734383035316161313635393736643035313636373365353837396565306535223b733a33323a226162623061333362363564303234393934356663306161313234373936646233223b733a33323a223438363563653336333230613230333237643430653436663663613139353265223b733a33323a223961356662333431373630396265346135666431636561326464396366373166223b733a33323a226539353263616263663364653461376132336435316361326132323931336138223b733a33323a226364303435306531653464633933323737323335336332623433356537356662223b733a33323a223631383362613638306634656364656138333532653531376539663061306264223b733a33323a223235323538303261383962633732333937396534613639336539313732623430223b733a33323a223336343031396337326236343333343339336133376133643339633439343031223b733a33323a226565353338623139623532316239616337386664306631393962306237636163223b733a33323a223839316563653562333762653234616565393937663735666362373537633663223b733a33323a226231323862303738326462393163386562396637316266333439396465393932223b733a33323a226562636463396634646339313566613435656130343962313563323635343730223b733a33323a223534303339633730333737633830643362326566613137633532616663626365223b733a33323a223733663939343732313333383864633539663133356366323231323332376332223b733a33323a226462623535303463356332323537316230666338643461363535383430343962223b733a33323a226639323130306261653862353263333766343263316438353038363633373564223b733a33323a223034323337353939316133363534376266313861346536616661336661366637223b733a33323a223134313363396464363435616131383538396236343062353563626663613331223b733a33323a223530363735313436306363346437323861336365643864653030653338343731223b733a33323a223065323761336531343137316232373032316436326263643930383231393061223b733a33323a223239383964363236386461633963353034626638316331363263323962613466223b733a33323a223634623935323835333037636365663961396666306530343966356337393534223b733a33323a226563323335343531353663656264656362346230626233356337366261623963223b733a33323a226437303965336365636138626636336261386635303461616137613264343434223b7d733a343a2268617368223b733a36353a2264373039653363656361386266363362613866353034616161376132643434342d6563323335343531353663656264656362346230626233356337366261623963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31393a7b733a33323a226438343665313165393435643137666264313864396562346337663838623438223b733a33323a223632356465383434306234656561313933383936616362663737313366656162223b733a33323a226537363535313366373639343263393031653539396432376333643765366230223b733a33323a223131393536316166643236326464663339393535303734666233626465353434223b733a33323a226233646537613636306335663863313237653361646237323065323137393561223b733a33323a223432623462313165366338306133623565326331353662303830343639303865223b733a33323a223164323839303038336333393865656539656266636366363466343036333232223b733a33323a223966313437366333663765336661303131663933323264346535633164363833223b733a33323a226439613431316331623233333735633563333335343633316363663131373263223b733a33323a223665666235393466376633663730666638643032346538346664626137313561223b733a33323a226236643132656236333462386466653033373962323666303937373039306533223b733a33323a223330663233376362343931353238646166393637396565303830633836623039223b733a33323a223663333263353066313062623565383930383135383662393365643061333237223b733a33323a226365633165623531343865393363333635663661306133653835353033653937223b733a33323a223438373962303235643330326134336363323761393133643265316364613034223b733a33323a223962336433653338363433396230366331353532643837643661336634643435223b733a33323a223661666539356261323836646430363737633462333366393031333438366465223b733a33323a226232643031363433663866303238636162653535303431646630633066393066223b733a33323a223466306238363162323662626562656264343132343964613436363864666531223b733a33323a223366336664396334633336666565326535653264333065373162636235663336223b733a33323a226662336663313565373838656138393263626561326437373634653835393264223b733a33323a226233626163633361613861363566313131363863643039386230373636646335223b733a33323a223731396461643662613539646537323765356665383462336664663933336539223b733a33323a223434343664376364383362623166393630633834356131633961396666646135223b733a33323a226536613732313936336432653335336632396332323330383333393434376362223b733a33323a223737306139613165653966326532663837323862316462386339323938313864223b733a33323a223966363737353839396533656630613736636362663833633966323730383330223b733a33323a223734366234303861353439613836376435306133643461333266366562353635223b733a33323a223765333834626563323739376231356434316632633730623934616266326436223b733a33323a226131623032326664386263353934363932323832323033393964383363366435223b733a33323a223032333563393135383736323961373133396163336533316362643463373462223b733a33323a223262656133326239626134303031376635353032343563656136306566323763223b733a33323a223038663234653037643062393631663230396262373166363761333465626537223b733a33323a223338376561323666313364313461613234393965363661376339653064336339223b733a33323a226666643263383361666433636566333133613163323931393762336333623761223b733a33323a226233333062386564393030613932306433616137346666393466386361666266223b733a33323a223030616231376261336436343766383036643065666465653733326635323438223b733a33323a223164623563653730633637626363626130323535336166356333623261633037223b7d733a343a2268617368223b733a36353a2231646235636537306336376263636261303235353361663563336232616330372d3030616231376261336436343766383036643065666465653733326635323438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637573746f6d766f636162666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226563316163656562633839336539306138386237613930353161626562373932223b733a33323a226433366639326331336533306635383531323663613031623232663063303765223b7d733a343a2268617368223b733a36353a2264333666393263313365333066353835313236636130316232326630633037652d6563316163656562633839336539306138386237613930353161626562373932223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637573746f6d766f636162696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226561356166346239636661326637636262306164663039353237323137613239223b733a33323a223532363031363361343430653763663465636538636531633636623134653231223b7d733a343a2268617368223b733a36353a2235323630313633613434306537636634656365386365316336366231346532312d6561356166346239636661326637636262306164663039353237323137613239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223563326335616366343265663565326438383834666537376630653934386337223b733a33323a226434353861666133376334363039393133303966396566616632646633366238223b7d733a343a2268617368223b733a36353a2264343538616661333763343630393931333039663965666166326466333662382d3563326335616366343265663565326438383834666537376630653934386337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1682525791),
('5s8ee8hj9m33vm6dnlhsdcnb9p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132352e3030353633323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22357338656538686a396d3333766d36646e6c687364636e623970223b7d7d, 1681401125),
('5tmt88gi0e8qm9jbpgeqptt8c2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031372e36343031333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235746d7438386769306538716d396a6270676571707474386332223b7d7d, 1681401017),
('5v2lsuvj3fauve93870p1j7fs7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939372e3337303633353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223576326c7375766a336661757665393338373070316a37667337223b7d7d, 1681399997),
('5vcbu76tdvtp0rfa4l0e788voj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833362e3131363332353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235766362753736746476747030726661346c3065373838766f6a223b7d7d, 1681397836),
('633ga9ef2813pgprhn6t5630nt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137392e3639343835393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236333367613965663238313370677072686e3674353633306e74223b7d7d, 1681401179),
('6363fau4mdf6p390g1tv0hmrmk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383231322e3133323839343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236333633666175346d646636703339306731747630686d726d6b223b7d7d, 1681398212),
('64cudccr5vts2im40fdbthf8vi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338382e3135303534353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236346375646363723576747332696d3430666462746866387669223b7d7d, 1681397388),
('64ef7kf1rdrksvpadneah0cmpt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837352e3535303436343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236346566376b66317264726b73767061646e65616830636d7074223b7d7d, 1681397875),
('65197cft5170680h3r9b5g111k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937362e3133343135383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363531393763667435313730363830683372396235673131316b223b7d7d, 1681399976),
('65hart6fv6dsgleimmin6v0ld3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630312e3935383830353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363568617274366676366473676c65696d6d696e3676306c6433223b7d7d, 1681401601),
('679a64jp11hthnbmhcrmp2h7tt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030382e31363538363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223637396136346a7031316874686e626d6863726d703268377474223b7d7d, 1681401008),
('683j0jiqmb6kqgr9eti5sejp5p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536342e3638313032323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223638336a306a69716d62366b716772396574693573656a703570223b7d7d, 1681206564),
('6897ri51rrol7hbv83gs1s2sti', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034342e3632383238383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363839377269353172726f6c3768627638336773317332737469223b7d7d, 1681207044),
('6988acaetoceh8mimml4oh9b6h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632312e3134373239383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223639383861636165746f636568386d696d6d6c346f6839623668223b7d7d, 1681400621),
('6akkt3en897jsrdj09jvn2sfdm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333352e3639363737323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236616b6b7433656e3839376a7372646a30396a766e327366646d223b7d7d, 1681385335),
('6crofuk49fkovpisge06bmumpr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833342e3932333531393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223663726f66756b3439666b6f7670697367653036626d756d7072223b7d7d, 1681397834),
('6cscmnrnfn9j8bms4ks62h00ak', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033302e3533383539373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366373636d6e726e666e396a38626d73346b733632683030616b223b7d7d, 1681401030),
('6e5fcamo9hea6u1qa0pab5b9kf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630362e3831323835343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223665356663616d6f396865613675317161307061623562396b66223b7d7d, 1681401606),
('6eb4bqdc0l4p1mt2a9vb5m07kk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539382e36353737313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223665623462716463306c3470316d743261397662356d30376b6b223b7d7d, 1681400598),
('6f1ir1651pum5p8nivsmsoak0q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e3639383234373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236663169723136353170756d3570386e6976736d736f616b3071223b7d7d, 1681207046),
('6fhtr8e6adfuuqvagibia9578v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135362e3637313838313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223666687472386536616466757571766167696269613935373876223b7d7d, 1681401156),
('6g9qo946n1bhurf784902uc0a2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539322e3537383430363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366739716f3934366e3162687572663738343930327563306132223b7d7d, 1681400592),
('6gts9hpncqccigk5l76gsqp9nv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537312e3431333630373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366774733968706e6371636369676b356c373667737170396e76223b7d7d, 1681400571),
('6ieo34da9vqlh6ff4a940ejj5h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736352e3633383532313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223669656f333464613976716c683666663461393430656a6a3568223b7d7d, 1681399765),
('6iu1rj9ua7r3qjoddnbtdrvli0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536342e39353836373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236697531726a397561377233716a6f64646e62746472766c6930223b7d7d, 1681206564),
('6kq0bfo1lsbaead8q4l04aguma', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736312e3532343535343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366b713062666f316c7362616561643871346c30346167756d61223b7d7d, 1681399761),
('6osp4j62ssdub08h9he7f4ckku', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536352e32353335363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366f7370346a36327373647562303868396865376634636b6b75223b7d7d, 1681209565),
('6qhod2qcm9p695uagrr342rkp2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837322e3532303033363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223671686f643271636d39703639357561677272333432726b7032223b7d7d, 1681399872),
('6s6ckcosspjihe84vfe4jcgg3e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639362e3230303933393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22367336636b636f7373706a6968653834766665346a6367673365223b7d7d, 1681396696),
('6si3mh95bkemdv2t1n72fkqh6c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633362e3831313934313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22367369336d683935626b656d64763274316e3732666b71683663223b7d7d, 1681400636),
('6sjq98a6o290lr6huv7h202gqn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032342e3532353332313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236736a71393861366f3239306c7236687576376832303267716e223b7d7d, 1681401024),
('6su9pco1r0lqrobbp9bc3k1q02', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138372e3631383332383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223673753970636f3172306c71726f626270396263336b31713032223b7d7d, 1681401187),
('6svgev071q8sb39vp2hfgfmvq2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238312e3635383833353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22367376676576303731713873623339767032686667666d767132223b7d7d, 1681393281),
('6tijr4pdqsmgjpifd074s0k8g0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633392e3830393633313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223674696a7234706471736d676a7069666430373473306b386730223b7d7d, 1681400639),
('6um65v4jjdj90ao43hrli81td5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631302e3436353935343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236756d363576346a6a646a3930616f343368726c693831746435223b7d7d, 1681401610),
('6uv5fg69vacavpkkl6bqnec0h4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939372e3338313332323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236757635666736397661636176706b6b6c3662716e6563306834223b7d7d, 1681400997),
('6va53cj4om29os70ieh6r88g7a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030332e3436393435333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223676613533636a346f6d32396f73373069656836723838673761223b7d7d, 1681400003),
('6vm97sthk1sqaccovgqi7lpf1j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e3135393036323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236766d39377374686b3173716163636f76677169376c7066316a223b7d7d, 1681207047),
('711gt7v35usr40cv25uhhmt063', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938362e34303932313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223731316774377633357573723430637632357568686d74303633223b7d7d, 1681400986),
('74h4ct027ntsjtjus46pfku3vm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330372e3731343237333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223734683463743032376e74736a746a7573343670666b7533766d223b7d7d, 1681385307),
('74lche13jle7vhcbdfpv3bs4tp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935302e3338393737393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237346c63686531336a6c65377668636264667076336273347470223b7d7d, 1681399950),
('74ujd6ah08b684a9amgiekc2am', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133392e35303937373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223734756a643661683038623638346139616d6769656b6332616d223b7d7d, 1681401139),
('75ffruiktnrj35hnerlbkdpp1v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634342e3839303534333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22373566667275696b746e726a3335686e65726c626b6470703176223b7d7d, 1681401644),
('76gkaer15f1880539ehl2ofesi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434352e3734373134353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223736676b6165723135663138383035333965686c326f66657369223b7d7d, 1681399445),
('77pvrqlmevmeu2933jqp5lh0ao', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630352e3239333035393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223737707672716c6d65766d6575323933336a7170356c6830616f223b7d7d, 1681400605),
('7b64mc55hm3k75qlltcbj78udd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833352e3231393139343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376236346d633535686d336b3735716c6c7463626a3738756464223b7d7d, 1681397835),
('7caj7h034c2r9c929g60sk9ave', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132302e3630353330313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223763616a37683033346332723963393239673630736b39617665223b7d7d, 1681401120),
('7e3ijt34chf8067cllqtnl64kj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937372e3931343130383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376533696a74333463686638303637636c6c71746e6c36346b6a223b7d7d, 1681399977),
('7e85tb7aiukqtfp04t0bsoru98', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383231352e34353736373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376538357462376169756b717466703034743062736f72753938223b7d7d, 1681398215),
('7e902k8haeqvk5lmc6d19rcrk2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536342e3434393238313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237653930326b3868616571766b356c6d63366431397263726b32223b7d7d, 1681206564),
('7g91mh8nq98549k7e8q596t34b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132332e38303834343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376739316d68386e7139383534396b3765387135393674333462223b7d7d, 1681401123),
('7h570hk7psc49gn2sblf6gauc6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539322e3333353633323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223768353730686b377073633439676e3273626c66366761756336223b7d7d, 1681401592),
('7i54dqhbo0ueckdcpqqr912m9u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937392e3130393335333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237693534647168626f307565636b6463707171723931326d3975223b7d7d, 1681399979),
('7l784ondltl672pm04u40pdua6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536362e3235303033323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376c3738346f6e646c746c363732706d30347534307064756136223b7d7d, 1681209566),
('7md7p5n7dr0rb0g1o35l1260vl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537332e34323437373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376d643770356e3764723072623067316f33356c31323630766c223b7d7d, 1681400573),
('7mph5mhqvt8n73lvhgebbae8qt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935392e3531303032343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376d7068356d68717674386e37336c7668676562626165387174223b7d7d, 1681399959),
('7nif6gumume7nbn518lvloge8u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133382e3839373036343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376e69663667756d756d65376e626e3531386c766c6f67653875223b7d7d, 1681401138),
('7o0ejrvkm72mrn2atliqntrc3a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335382e3839373530393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376f30656a72766b6d37326d726e3261746c69716e7472633361223b7d7d, 1681397358),
('7o4nltkqkbsn2l5456l1e0ju0k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031302e3135373030373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376f346e6c746b716b62736e326c353435366c3165306a75306b223b7d7d, 1681400010),
('7o88cbsf0n0dkb9ueb099p1frq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634302e3739343838353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376f383863627366306e30646b62397565623039397031667271223b7d7d, 1681401640),
('7p2npigisnevulljbntn3aqr3s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331332e3439303536323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223770326e70696769736e6576756c6c6a626e746e336171723373223b7d7d, 1681385313),
('7pfijjuit79oqhu4ma8cg4tg4i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937382e3830373637393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22377066696a6a75697437396f716875346d613863673474673469223b7d7d, 1681399978),
('7pudf5j08pqf51nj2j18idf9iq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030322e3134333438323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223770756466356a303870716635316e6a326a3138696466396971223b7d7d, 1681401002),
('7qhqvccbk8gurl0en9du4666cb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383231342e3431313630313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237716871766363626b386775726c30656e396475343636366362223b7d7d, 1681398214),
('7rmdk3p1fv8j2ojp38ri7cmv57', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335382e3539383738353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237726d646b3370316676386a326f6a703338726937636d763537223b7d7d, 1681397358),
('7ug97vjmmpnsinrruopol6ge4o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e3739323433383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223775673937766a6d6d706e73696e7272756f706f6c366765346f223b7d7d, 1681207046),
('7urviiet05i48fl522u6qqfenu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631352e35313632363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237757276696965743035693438666c3532327536717166656e75223b7d7d, 1681401615),
('809ti6ocnf5pepnuhucqci99pn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135372e3532313132333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223830397469366f636e66357065706e756875637163693939706e223b7d7d, 1681401157),
('815paor6qqbitj86osao0s33un', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736322e3130343632333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238313570616f723671716269746a38366f73616f30733333756e223b7d7d, 1681399762),
('81neq1tir8c5kf4ke90lv1g46s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538302e3339353733313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238316e6571317469723863356b66346b6539306c763167343673223b7d7d, 1681400580),
('83hocvm2q4dpmgsh4jr5pq3b2k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333342e3534363433333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223833686f63766d32713464706d677368346a723570713362326b223b7d7d, 1681385334),
('85gkog1495r85cp1mj8n63h0v1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639322e3835363336363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223835676b6f67313439357238356370316d6a386e363368307631223b7d7d, 1681396692),
('85n2gt202bcbum2fi4njshm8kv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031362e3038333230373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238356e326774323032626362756d326669346e6a73686d386b76223b7d7d, 1681400016),
('885rh91pt1bvn8d00mbv9jvnp8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538312e3539383239373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223838357268393170743162766e386430306d6276396a766e7038223b7d7d, 1681400581),
('88inc6instdlqhsjp5a127ujpn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031382e3835373333353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223838696e6336696e7374646c7168736a703561313237756a706e223b7d7d, 1681401018),
('89injldledvnp4v8vtvo2no136', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936392e3138393937343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223839696e6a6c646c6564766e703476387674766f326e6f313336223b7d7d, 1681399969),
('8akinuupljm0cft96dacpr3165', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330372e3432333834393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238616b696e7575706c6a6d306366743936646163707233313635223b7d7d, 1681385307),
('8b0h25fek5stt46ig0947iaq23', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539302e3737313333373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238623068323566656b3573747434366967303934376961713233223b7d7d, 1681400590),
('8b2a089ujs59rjpmbal1qfps5g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393739392e3231373937353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238623261303839756a733539726a706d62616c31716670733567223b7d7d, 1681399799),
('8bmpm2vl3jf7g83vn4k2e4s1ra', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630382e3031363135343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238626d706d32766c336a6637673833766e346b32653473317261223b7d7d, 1681401608),
('8bt2v8ejteknvj2etc158ijem6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632322e3433343631353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386274327638656a74656b6e766a32657463313538696a656d36223b7d7d, 1681400622),
('8c3qh3pf96mbrkitd0uhh0o5j2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732362e3432313439363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386333716833706639366d62726b69746430756868306f356a32223b7d7d, 1681287726),
('8d1sp7mfrkm74vn1emd22ueoh0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939392e3230323339373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223864317370376d66726b6d3734766e31656d64323275656f6830223b7d7d, 1681399999),
('8d8kaj11hv1h3brpn946oe8jlq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633312e3631383930393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223864386b616a313168763168336272706e3934366f65386a6c71223b7d7d, 1681401631),
('8fatap2mbt37hph2nipn79j8ep', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338392e3932393039373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386661746170326d62743337687068326e69706e37396a386570223b7d7d, 1681397389),
('8htdfqt78qulqjnnfr11d616uq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232372e3231343231323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238687464667174373871756c716a6e6e66723131643631367571223b7d7d, 1681290227),
('8iq9l7cj8c6h9ai5u5qrg5vba4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363130342e3638323431323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386971396c37636a386336683961693575357172673576626134223b7d7d, 1681206104),
('8itkhhfdiuo6uj1mg77kj95tbq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393938372e3037333931393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223869746b6868666469756f36756a316d6737376b6a3935746271223b7d7d, 1681399987),
('8j0rtqe99bkhpvb1rp2pquulrb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633302e3634323336343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386a30727471653939626b6870766231727032707175756c7262223b7d7d, 1681400630),
('8jeieb06rbvj40kivpa2m2di45', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030352e3330393130363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386a6569656230367262766a34306b69767061326d3264693435223b7d7d, 1681400005),
('8js1rlv5f3mb1faos5nogtnbvu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132372e3536383334343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386a7331726c763566336d623166616f73356e6f67746e627675223b7d7d, 1681401127),
('8ju333o0r4n8sac11nikq16vvb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837342e3338323631383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386a753333336f3072346e3873616331316e696b713136767662223b7d7d, 1681397874),
('8jvoolgk79gp2tggmps353k895', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313139302e3030303638353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386a766f6f6c676b37396770327467676d70733335336b383935223b7d7d, 1681401190);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('8k3lfnn7848ef7itbel5pqi9uh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837312e3432383536343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386b336c666e6e37383438656637697462656c35707169397568223b7d7d, 1681399871),
('8kajv601g67o0lh2n6tf819t1u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632332e3034343730373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386b616a763630316736376f306c68326e367466383139743175223b7d7d, 1681400623),
('8khb4uuud44b96hmk9d906a3p0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393737302e3532393733323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386b686234757575643434623936686d6b396439303661337030223b7d7d, 1681399770),
('8khrt51lnkbj2pn8vc5tma4d2m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939312e3139323438373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386b68727435316c6e6b626a32706e38766335746d613464326d223b7d7d, 1681400991),
('8l5mi2cg8sr5k74n38bs8pds4k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936352e3936383633323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386c356d69326367387372356b37346e3338627338706473346b223b7d7d, 1681400965),
('8mkdfio0q0cjehfal5htjkb212', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134382e363938323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386d6b6466696f307130636a656866616c3568746a6b62323132223b7d7d, 1681401148),
('8n4j98queourvvo89macadn74u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631342e3137303435363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386e346a39387175656f757276766f38396d616361646e373475223b7d7d, 1681400614),
('8nrjmstsmpplgf5vv8h4jjpddn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939322e3937323633333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386e726a6d7374736d70706c67663576763868346a6a7064646e223b7d7d, 1681399992),
('8ohr0ccussmf1bv9269kkbvgir', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232392e33363435353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386f68723063637573736d66316276393236396b6b6276676972223b7d7d, 1681290229),
('8pc9bcead4lc4214j65s0719hh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631362e3133363039353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22387063396263656164346c63343231346a363573303731396868223b7d7d, 1681400616),
('8r2r1ve61tg6s8kb6s3b54qibf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383137392e3637343735383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238723272317665363174673673386b6236733362353471696266223b7d7d, 1681398179),
('8r9t6ea15krntr31aq9bimdvqm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034342e3733323038313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223872397436656131356b726e7472333161713962696d6476716d223b7d7d, 1681207044),
('8rrcnsjg8gf4lr9h006ddtbbuv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031362e34303532373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22387272636e736a67386766346c72396830303664647462627576223b7d7d, 1681401016),
('8rt7lrhh930co77e7iqobpfq0m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136332e3632393332363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22387274376c726868393330636f3737653769716f62706671306d223b7d7d, 1681401163),
('8tbrppqtbg4k4or7mdl720i03t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633382e3335313236323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238746272707071746267346b346f72376d646c37323069303374223b7d7d, 1681401638),
('8te32955d6m3nm3bononmilbor', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736392e3634353435353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22387465333239353564366d336e6d33626f6e6f6e6d696c626f72223b7d7d, 1681399769),
('8vb5nrq7foflfqpo0tug5fg4mk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393938392e3734383530393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22387662356e727137666f666c6671706f30747567356667346d6b223b7d7d, 1681399989),
('8vmsp750io6tqu9rlrdasothdh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633352e3230363133343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238766d7370373530696f3674717539726c726461736f74686468223b7d7d, 1681401635),
('90r9lbp90c0j7ug31sstdp0hdr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936372e3733393436313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22393072396c6270393063306a3775673331737374647030686472223b7d7d, 1681400967),
('915j3h174e7iofa7d7qilm8qv4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138392e3430393237343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223931356a33683137346537696f666137643771696c6d38717634223b7d7d, 1681401189),
('91rjkkfgd4k474l8nfp96p7qd8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736322e3338393338343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223931726a6b6b666764346b3437346c386e667039367037716438223b7d7d, 1681399762),
('92054ndsihul42erfhbm68jp2t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132382e3836343531313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239323035346e64736968756c343265726668626d36386a703274223b7d7d, 1681401128),
('9450ogjn6klo17qjv0b0lnlscf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e3937353635353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22393435306f676a6e366b6c6f3137716a763062306c6e6c736366223b7d7d, 1681207046),
('96ro4artjfm51o3iaqi879o4tl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837372e3934303237323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223936726f346172746a666d35316f33696171693837396f34746c223b7d7d, 1681397877),
('97n8h8urno1u5o6g7cni7b2jod', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633322e3832363034383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239376e38683875726e6f3175356f366737636e693762326a6f64223b7d7d, 1681401632),
('97op4veq8rjogv2c5bmdkhg2hs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539352e3632303030383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239376f703476657138726a6f6776326335626d646b6867326873223b7d7d, 1681400595),
('9914clvu574b3ht6a893gc8id8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830302e303834373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239393134636c7675353734623368743661383933676338696438223b7d7d, 1681399800),
('9981pmep7vif786j65087v827q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334302e3330383839343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239393831706d6570377669663738366a36353038377638323771223b7d7d, 1681385340),
('9bdu0rnsoagued19i389bf8pgb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132392e35313236383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223962647530726e736f6167756564313969333839626638706762223b7d7d, 1681401129),
('9cmn482mmuftuci83dpub1cf78', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939362e3039383539363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239636d6e3438326d6d7566747563693833647075623163663738223b7d7d, 1681399996),
('9ct8khb7u228t4t6r55nsklc36', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031352e3134303832313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396374386b68623775323238743474367235356e736b6c633336223b7d7d, 1681401015),
('9cv01ce419n4igs59pllvfrhra', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031382e3530313032393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396376303163653431396e346967733539706c6c766672687261223b7d7d, 1681400018),
('9d7ang0n6itm1fl1puv0ohvm00', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238332e3133333735353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396437616e67306e3669746d31666c31707576306f68766d3030223b7d7d, 1681393283),
('9di6hco91ncg9j3hd7h6bckhjn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939352e3438323730323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223964693668636f39316e6367396a33686437683662636b686a6e223b7d7d, 1681399995),
('9efcn91hieb3beuvh4jh8ae318', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330362e3834393435333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396566636e393168696562336265757668346a68386165333138223b7d7d, 1681385306),
('9gd0ln1d8s07rj2fd3objs1of9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303233302e3039373936383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396764306c6e316438733037726a326664336f626a73316f6639223b7d7d, 1681290230),
('9grls1phsg8vg4hekkevpnq3g6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435312e3236323530363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223967726c7331706873673876673468656b6b6576706e71336736223b7d7d, 1681399451),
('9hg50t1ngvjj9nab635d4vs752', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937372e3135323432373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396867353074316e67766a6a396e616236333564347673373532223b7d7d, 1681400977),
('9hpgf5v7539ldq7a9too4gfrej', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e36303133343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239687067663576373533396c6471376139746f6f34676672656a223b7d7d, 1681207046),
('9iat4usliklorhk7kskcmvturq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938302e3233363137353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396961743475736c696b6c6f72686b376b736b636d7674757271223b7d7d, 1681400980),
('9ireg9t8m63qv0d6qhbfnep2lf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539302e3134353639353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239697265673974386d36337176306436716862666e6570326c66223b7d7d, 1681400590),
('9itubbfogrq3uqprumn7nh3eou', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537342e3933373737353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396974756262666f6772713375717072756d6e376e6833656f75223b7d7d, 1681400574),
('9j5i4osduhdf0uao5qajk7u6bo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939332e3831303531313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396a3569346f7364756864663075616f3571616a6b377536626f223b7d7d, 1681400993),
('9jiuhpla1kaiflr7455rc4qjhk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736372e3837393131313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396a697568706c61316b6169666c7237343535726334716a686b223b7d7d, 1681399767),
('9k6lh6ibs8jovm4cpru6qi5vo3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439362e3830393738313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396b366c6836696273386a6f766d346370727536716935766f33223b7d7d, 1681399496),
('9l974aumrjasemaarrddic0ajh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393739392e35303935323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396c39373461756d726a6173656d616172726464696330616a68223b7d7d, 1681399799),
('9lbtjp4cml38ecre6i502fh75v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632382e3131393839353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396c62746a7034636d6c33386563726536693530326668373576223b7d7d, 1681400628),
('9mdvo1ru90i0d8kjc7ai92c24d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936342e3135373731393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396d64766f3172753930693064386b6a63376169393263323464223b7d7d, 1681400964),
('9rqfivi7dcv145s67flobem81s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631342e3633383132343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223972716669766937646376313435733637666c6f62656d383173223b7d7d, 1681401614),
('9rrgfhnnm9lqq6eql1l8pbj9ug', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132332e3532363132313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223972726766686e6e6d396c71713665716c316c3870626a397567223b7d7d, 1681401123),
('9s868ghcei3sp8r4h3236cee19', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538362e3535353737363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223973383638676863656933737038723468333233366365653139223b7d7d, 1681400586),
('9triok48m4meli3p15dvi59ilg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132382e3139353034373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22397472696f6b34386d346d656c69337031356476693539696c67223b7d7d, 1681401128),
('9u5s3j150e2o807710lo7kbatt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135382e3637383438333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239753573336a31353065326f3830373731306c6f376b62617474223b7d7d, 1681401158),
('9uukvutl4rk9a3en2uegg3qgh6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938372e3030393536333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223975756b7675746c34726b396133656e32756567673371676836223b7d7d, 1681400987),
('9vpmd41kailsqk8ufrrgvnr7l2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630352e3839303037323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223976706d6434316b61696c73716b387566727267766e72376c32223b7d7d, 1681400605),
('9vshakr5a137q9pnrfgosl4nlt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937342e3636303232343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239767368616b7235613133377139706e7266676f736c346e6c74223b7d7d, 1681400974),
('a0jiiinhlvt7qskvpt3050c21s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e3130323035343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261306a6969696e686c76743771736b7670743330353063323173223b7d7d, 1681207046),
('a20ctb4c6t4egq5ra0855a6dlq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939362e3735363338373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226132306374623463367434656771357261303835356136646c71223b7d7d, 1681399996),
('a2p6rtekuriq18dmapndvfcgqm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632342e323737323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22613270367274656b757269713138646d61706e6476666367716d223b7d7d, 1681401624),
('a2qlptedmfu96ngeekc0n50h21', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435342e3438323830353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226132716c707465646d667539366e6765656b63306e3530683231223b7d7d, 1681399454),
('a349n563ale9ift8rb50u6sn1j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335372e3639363831363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22613334396e353633616c653969667438726235307536736e316a223b7d7d, 1681397357),
('a35f4d8nhi4528mbd7cq3t5k5f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639332e3436373535383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22613335663464386e6869343532386d62643763713374356b3566223b7d7d, 1681396693),
('a3d9vhgo2834mre8de6441p24m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736392e3334333934393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22613364397668676f323833346d7265386465363434317032346d223b7d7d, 1681399769),
('a3fbm69a0e9r6hmo3715tkrc6v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330392e3231373634373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22613366626d3639613065397236686d6f33373135746b72633676223b7d7d, 1681385309),
('a3quebdfuj6sgl61o75ajvb4lg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132342e3130323437353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226133717565626466756a3673676c36316f3735616a7662346c67223b7d7d, 1681401124),
('a6sqd78f0n9e6n8th2n4b92jnk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539382e3237353335323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226136737164373866306e3965366e387468326e346239326a6e6b223b7d7d, 1681401598),
('a8miut4ltgi0cg7n57s3dvgqob', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631362e3936363837333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261386d697574346c746769306367376e35377333647667716f62223b7d7d, 1681401616),
('a8podvq45a308ns3qotr563la4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383234342e3634313435313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226138706f6476713435613330386e7333716f74723536336c6134223b7d7d, 1681398244),
('a9l0676ct7nu73sdmpe2nvqld6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238352e3232383036393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261396c303637366374376e75373373646d7065326e76716c6436223b7d7d, 1681393285),
('aaesqsmvs23pab4sn327ti6sm8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334322e3937333837393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226161657371736d7673323370616234736e333237746936736d38223b7d7d, 1681385342),
('aapato1os14m0qjimr35ae87oj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238342e3631393237323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261617061746f316f7331346d30716a696d723335616538376f6a223b7d7d, 1681393284),
('aatpd47f1j4lt3m1bti79fh7v9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434362e3037393030313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226161747064343766316a346c74336d3162746937396668377639223b7d7d, 1681399446),
('abiq7l8pqfb5jhtkp5k9bfl6k2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138382e3830353536373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261626971376c3870716662356a68746b70356b3962666c366b32223b7d7d, 1681401188),
('abivm067ossq5pisdsmmo229bu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434342e3737363437363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616269766d3036376f7373713570697364736d6d6f3232396275223b7d7d, 1681399444),
('ace9mui7sr7a542c95rrba6qn1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631362e3337343039313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616365396d756937737237613534326339357272626136716e31223b7d7d, 1681401616),
('ad516rt1jdvk6hqs8j1htkinkn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939392e3831353734383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261643531367274316a64766b36687173386a3168746b696e6b6e223b7d7d, 1681400999),
('adfmm3jurgveembcqon59cposl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330352e3936303439333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226164666d6d336a7572677665656d6263716f6e353963706f736c223b7d7d, 1681385305),
('ae8i6bc67i3vi1ug61uv7d1feb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632362e30343439313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226165386936626336376933766931756736317576376431666562223b7d7d, 1681400626),
('agt5835i9qjmn2cjrvba329rm4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033362e3034343333363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616774353833356939716a6d6e32636a72766261333239726d34223b7d7d, 1681401036),
('ahi34t5s5m0lk4l3s98gi3ct3u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937382e3338323439363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226168693334743573356d306c6b346c3373393867693363743375223b7d7d, 1681400978),
('aj928v38dj0sro0tqk2mpbf3d9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939342e3835323138353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616a393238763338646a3073726f3074716b326d706266336439223b7d7d, 1681399994),
('ak6feh26hkse0sj0uck5qg0v3q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539342e3730303433393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616b366665683236686b736530736a3075636b35716730763371223b7d7d, 1681401594),
('akgl05oj6gdjvildlg6sfo6b20', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437352e3230343239333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616b676c30356f6a3667646a76696c646c673673666f36623230223b7d7d, 1681290475),
('akhb2gqlmcjjebkf2sisaq1peq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136302e3136333432353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616b68623267716c6d636a6a65626b6632736973617131706571223b7d7d, 1681401160),
('am1ocmgkmecrqiiqeq8k65r1u8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334322e3037393331373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616d316f636d676b6d656372716969716571386b363572317538223b7d7d, 1681385342),
('aqr9rdcm9nfb5o495q779nr9hg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393836392e3632323037353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22617172397264636d396e6662356f343935713737396e72396867223b7d7d, 1681399869),
('ar0ldfi9g6k6cacedqpg3oa3gp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031312e3938303030373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226172306c6466693967366b366361636564717067336f61336770223b7d7d, 1681401011),
('as6856hab21h0m4i2ei1uifnc7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333382e3537323237353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22617336383536686162323168306d3469326569317569666e6337223b7d7d, 1681385338),
('asq7pv65nnlk8k58kvjil2i9pr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238352e3833373730393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261737137707636356e6e6c6b386b35386b766a696c3269397072223b7d7d, 1681393285),
('ass3ja8d8crlmbppfg47g3bolr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631372e34363438373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22617373336a6138643863726c6d627070666734376733626f6c72223b7d7d, 1681400617),
('atmfer952mgo16b9o2vcc7mbdg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132362e3238383634343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261746d6665723935326d676f313662396f32766363376d626467223b7d7d, 1681401126),
('au7nkeadqbemashhuknvucmjeo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393934372e3231363836393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226175376e6b6561647162656d61736868756b6e7675636d6a656f223b7d7d, 1681399947),
('av2klnir96e62vgll32ogrlbqd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383230362e3939373832353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226176326b6c6e6972393665363276676c6c33326f67726c627164223b7d7d, 1681398207),
('avo1o90op1ui9q4ee491q5hint', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630372e3539323134363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261766f316f39306f703175693971346565343931713568696e74223b7d7d, 1681400607),
('b01vpbov5t1umhp3geicnvo8n8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539362e3530343235343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226230317670626f76357431756d687033676569636e766f386e38223b7d7d, 1681401596),
('b546j6qd0s8ca7o6nc5k47dik2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536372e3638383239353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22623534366a3671643073386361376f366e63356b343764696b32223b7d7d, 1681209567),
('b62gi7pk0t2uf5e5u4l2uaoohd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536382e3631363132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22623632676937706b307432756635653575346c3275616f6f6864223b7d7d, 1681209568),
('b6699ahqianl83hk6mdd399hra', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937312e3035303430333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22623636393961687169616e6c3833686b366d6464333939687261223b7d7d, 1681399971),
('b67jeo7tp4cka4bs8t3avbgbpd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937322e3136323332343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226236376a656f37747034636b6134627338743361766267627064223b7d7d, 1681400972),
('b78d2t4arobpn035u113luq0ds', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537342e3032303133343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226237386432743461726f62706e303335753131336c7571306473223b7d7d, 1681400574),
('b7q6ra3n1jvou1njem3mq00fjj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938302e38343533353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22623771367261336e316a766f75316e6a656d336d713030666a6a223b7d7d, 1681400980),
('b7tv2us5irnrsq9tskfgpcjdf8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138322e3739363034313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22623774763275733569726e7273713974736b666770636a646638223b7d7d, 1681401182),
('b9698ip2g9mph7mn4r75jrd265', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731322e3631303438353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22623936393869703267396d7068376d6e347237356a7264323635223b7d7d, 1681396712),
('b9dutl10hfeqvmdpgn39od8hl4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936322e3536373935343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262396475746c313068666571766d6470676e33396f6438686c34223b7d7d, 1681399962),
('bb7utfa4msa9e7hfq2epamnl5q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732362e3636343331393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262623775746661346d7361396537686671326570616d6e6c3571223b7d7d, 1681287726),
('bb9kp7h16dsskjood967muqk6r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631392e33333334393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226262396b70376831366473736b6a6f6f643936376d75716b3672223b7d7d, 1681400619),
('bbamb6eqi3nq2s6772gmtb13af', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937362e3432373133333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226262616d6236657169336e71327336373732676d746231336166223b7d7d, 1681399976),
('bbo9368f0dralj0vobjfrh4r3c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031342e3235383537323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262626f3933363866306472616c6a30766f626a66726834723363223b7d7d, 1681400014),
('bbq2b839q1a9v6r8tf5cm3qd0p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935332e3437343639333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262627132623833397131613976367238746635636d3371643070223b7d7d, 1681399953),
('bdf7ci27s9sshda08bflg2f6oi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031302e3737323331383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626466376369323773397373686461303862666c673266366f69223b7d7d, 1681400010),
('bgp4g289jd408i41ni2fnq5ra0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632392e38323431323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262677034673238396a643430386934316e6932666e7135726130223b7d7d, 1681401629),
('bj1f7kc98vohobnkq421h37m5q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736372e3031303034383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626a3166376b633938766f686f626e6b713432316833376d3571223b7d7d, 1681399767),
('bje83h2ethvfnh0d1qeebnghql', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633392e3232373230373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626a653833683265746876666e68306431716565626e6768716c223b7d7d, 1681400639),
('bkbbptdhe259080a5t1dpvisbk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736322e3935353635363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626b62627074646865323539303830613574316470766973626b223b7d7d, 1681399762),
('bks0j1iodeh54echhp7kmfoee1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837332e3731383732343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626b73306a31696f64656835346563686870376b6d666f656531223b7d7d, 1681399873),
('bl8n4ndaj9b85nt7h7s52nevtu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936352e3637363039333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626c386e346e64616a396238356e743768377335326e65767475223b7d7d, 1681400965),
('bltarsn2vnd7rtb79dedj6rr2n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538312e32333732333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626c746172736e32766e643772746237396465646a367272326e223b7d7d, 1681401581),
('bnu1jm4hi2rj59uo90jlqdpvhp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330362e32373036343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626e75316a6d34686932726a3539756f39306a6c716470766870223b7d7d, 1681385306),
('bnv4tin0hktqsino0rve7625ti', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632332e3632343730393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626e763474696e30686b747173696e6f30727665373632357469223b7d7d, 1681400623),
('bo8k04edul3l11ihbn6ekralvn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132302e3032363833363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626f386b30346564756c336c31316968626e36656b72616c766e223b7d7d, 1681401120),
('booq838sjt1qa7r9nnmh802gh7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631372e3235373733383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626f6f71383338736a743171613772396e6e6d68383032676837223b7d7d, 1681401617),
('borlf8ijs57bdcoq93s7098a9t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138332e3939323435323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626f726c6638696a7335376264636f7139337337303938613974223b7d7d, 1681401184),
('bqdbjbr6c90l7n7qdd8h3t3dgo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630392e3038363431363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22627164626a6272366339306c376e37716464386833743364676f223b7d7d, 1681400609),
('bqgrlp5e68hllvtgi2u3o7t487', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935322e32353939373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22627167726c7035653638686c6c767467693275336f3774343837223b7d7d, 1681399952),
('br3903e71gaukfbpqqsfmnbltk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732372e3338303638373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226272333930336537316761756b666270717173666d6e626c746b223b7d7d, 1681287727),
('brp5f51dlvo7rbbgr9aba8i69m', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230353931312e3436343731323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262727035663531646c766f37726262677239616261386936396d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638313230393531313b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e636f7265742e6f72672f646174612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223433366664323436656464653239363861616336383764636439326563663831223b733a33323a226133626264306636366666653137666133663435333832383139316166306161223b7d733a343a2268617368223b733a36353a2261336262643066363666666531376661336634353338323831393161663061612d3433366664323436656464653239363861616336383764636439326563663831223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1681205911),
('bsit26i82h0hp8omrdk5fe4g09', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630372e3330393131383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262736974323669383268306870386f6d72646b35666534673039223b7d7d, 1681400607),
('bsl0rh1hjko9l5h226hlbdjnle', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303634312e3630313836373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262736c30726831686a6b6f396c3568323236686c62646a6e6c65223b7d7d, 1681400641),
('bt5hdtkaju2dia74l37ddh90vj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434362e3737313135393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226274356864746b616a753264696137346c33376464683930766a223b7d7d, 1681399446),
('btk1eja3f94enaj6mkv63g7cg5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032362e3931343731383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262746b31656a6133663934656e616a366d6b7636336737636735223b7d7d, 1681401026),
('btl6kocip7b9gib35e40jbn887', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032322e35323638343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262746c366b6f63697037623967696233356534306a626e383837223b7d7d, 1681401022),
('bu03aq3sm0h245lo5n7aiiidq6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538342e3130343334393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262753033617133736d30683234356c6f356e3761696969647136223b7d7d, 1681401584),
('buckdbsllksb9l3i0dlvcengut', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135372e3233393134383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226275636b6462736c6c6b7362396c336930646c7663656e677574223b7d7d, 1681401157),
('bvqj1uan9j7rmrklca0b4eo1l9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830322e3434333939353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226276716a3175616e396a37726d726b6c6361306234656f316c39223b7d7d, 1681399802),
('bvu6hkkotvkpo60oe9fl9uhjq6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313139332e3032383631393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262767536686b6b6f74766b706f36306f6539666c3975686a7136223b7d7d, 1681401193),
('c26ko7884bl8ashkksg1e8ko7s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232382e3632313633393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226332366b6f37383834626c386173686b6b73673165386b6f3773223b7d7d, 1681290228),
('c2aeibgh3u82rbd389gj4rvuvn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435332e3030373932333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22633261656962676833753832726264333839676a34727675766e223b7d7d, 1681399453),
('c3dcejk0evcm9b2v5b3p2tb3hj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230353536312e3633323131313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263336463656a6b306576636d396232763562337032746233686a223b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e636f7265742e6f72672f646174612f61646d696e223b, 1681205561);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('c5dim6p9nmh686fm840tmdd4nt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935372e3035353334393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22633564696d3670396e6d68363836666d383430746d6464346e74223b7d7d, 1681399957),
('c6p8vtls47jovihqj6qib9gh6o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530362e3939343836393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226336703876746c7334376a6f766968716a36716962396768366f223b7d7d, 1681399507),
('c6qdt46jb131421pa8q1p4743s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313635302e3336303631343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22633671647434366a623133313432317061387131703437343373223b7d7d, 1681401650),
('c77qld4ootgsqpgfeappbg12tv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633352e3831323437363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22633737716c64346f6f7467737170676665617070626731327476223b7d7d, 1681401635),
('c7a9l9879uif9f4dehs7drun6i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631342e39333733333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22633761396c3938373975696639663464656873376472756e3669223b7d7d, 1681401614),
('c8b5cftbdo02kp4nlp8psmvfda', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031332e3032313530383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226338623563667462646f30326b70346e6c703870736d76666461223b7d7d, 1681400013),
('c8mkav4gpd0mk9ge2idjjo74no', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539392e3236343833353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263386d6b617634677064306d6b3967653269646a6a6f37346e6f223b7d7d, 1681400599),
('c9qcvp3mc1j15kpm5s9k8e7uiv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939392e31393033333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22633971637670336d63316a31356b706d3573396b386537756976223b7d7d, 1681400999),
('caesm46d7d6i368levak1i08la', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634332e3333303738353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636165736d343664376436693336386c6576616b316930386c61223b7d7d, 1681401643),
('cauiitpaafc3bnoe7prhrbpcb5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632362e3634363733363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636175696974706161666333626e6f6537707268726270636235223b7d7d, 1681400626),
('cbgq6lveurfjhl8ac3kig32jfk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736392e3033363637353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263626771366c76657572666a686c386163336b696733326a666b223b7d7d, 1681399769),
('cbrkb8ib593nomjh2vdmfjqgvg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373336302e3639343036323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226362726b623869623539336e6f6d6a683276646d666a71677667223b7d7d, 1681397360),
('cfgtfe37l8gsuhslf2rkc49mba', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732382e3131343639383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263666774666533376c3867737568736c6632726b6334396d6261223b7d7d, 1681287728),
('chsno7on23kbu634uqp4a7as2m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632392e33323432383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226368736e6f376f6e32336b62753633347571703461376173326d223b7d7d, 1681400629),
('ci59ldlv2ggadagekatqavvf66', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133372e363836393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636935396c646c7632676761646167656b617471617676663636223b7d7d, 1681401137),
('cj48295i91jsordeoot260asn2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3732343735353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636a34383239356939316a736f7264656f6f7432363061736e32223b7d7d, 1681207045),
('cjbs655hf95oakgvf2tu8ikvas', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434362e3436393935353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636a6273363535686639356f616b67766632747538696b766173223b7d7d, 1681399446),
('cjhs9qjn623jfmjd0118i43nmi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232362e3933323437383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636a687339716a6e3632336a666d6a64303131386934336e6d69223b7d7d, 1681290226),
('cjsc8sclkrp0g8tv4m1vurbkfa', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238362e3133363037323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636a73633873636c6b72703067387476346d31767572626b6661223b7d7d, 1681393286),
('ckfmgumd20gl60ckan6iv9u4fa', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338392e3632353736313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636b666d67756d643230676c3630636b616e3669763975346661223b7d7d, 1681397389),
('ckho0k96o8tb3nla95ekhqtlog', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303634322e3138373730363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636b686f306b39366f387462336e6c613935656b6871746c6f67223b7d7d, 1681400642),
('clodvcuuolqelq38fqls4j8sei', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338352e3230383731333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636c6f64766375756f6c71656c71333866716c73346a38736569223b7d7d, 1681397385),
('cngk8t1f261kdd7m7im31oafh7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538372e3135313239383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636e676b387431663236316b6464376d37696d33316f61666837223b7d7d, 1681400587),
('co49dkr3pesp9besdpn0qna9du', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538302e3633393231363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636f3439646b7233706573703962657364706e30716e61396475223b7d7d, 1681401580),
('cootf9rgj1rvba0shqnakc4jr4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530302e3732373831333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636f6f74663972676a3172766261307368716e616b63346a7234223b7d7d, 1681399500),
('cr8k6tbmg4lt17v3iqgf7pv2dd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538302e3932393531323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226372386b3674626d67346c743137763369716766377076326464223b7d7d, 1681401580),
('ct0dg27unonguo009ktrafju2n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837322e3833333838393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263743064673237756e6f6e67756f3030396b747261666a75326e223b7d7d, 1681399872),
('cu3k507skmjioi5eqcihcmcso1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937302e3432353634333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226375336b353037736b6d6a696f69356571636968636d63736f31223b7d7d, 1681399970),
('cubdvb1ggad8i5fvg0s82imcct', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434392e3036383337333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22637562647662316767616438693566766730733832696d636374223b7d7d, 1681399449),
('cuo9gbm22mhefi38hfj1c058ft', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232392e3833353339373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263756f3967626d32326d68656669333868666a31633035386674223b7d7d, 1681290229),
('cuvof59a0kt8f5fo2gmdelfgld', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837332e3736353736373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226375766f66353961306b74386635666f32676d64656c66676c64223b7d7d, 1681397873),
('d13rdd9vkolcsddm3gbl9bmrgc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032392e3931313939353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264313372646439766b6f6c637364646d3367626c39626d726763223b7d7d, 1681401029),
('d3vs4ps82llmh8g9mejcfp8n20', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731312e3133303330393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226433767334707338326c6c6d683867396d656a636670386e3230223b7d7d, 1681396711),
('d589porq2civav265cvp83ub0r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536352e3230343032313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264353839706f7271326369766176323635637670383375623072223b7d7d, 1681206565),
('d61sblmml3l7n7v3rdesk2jmp1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936362e3831323333393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264363173626c6d6d6c336c376e377633726465736b326a6d7031223b7d7d, 1681399966),
('d78p2i0uqqcjtrso182g4cqrb6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031312e3337373135393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264373870326930757171636a7472736f31383267346371726236223b7d7d, 1681401011),
('ddt86dcdbcdbt0ruu1jao3ikdi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333352e3938373135383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226464743836646364626364627430727575316a616f33696b6469223b7d7d, 1681385336),
('de56p64e711pc98slhq3nvi0bq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539372e3435313532353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646535367036346537313170633938736c6871336e7669306271223b7d7d, 1681400597),
('deeinfv98k3c7vshh21gg6bu07', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537372e3736323239363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646565696e667639386b33633776736868323167673662753037223b7d7d, 1681400577),
('dh2gf8evndqkpsafcek5ouo6v7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132332e3235313730353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264683267663865766e64716b7073616663656b356f756f367637223b7d7d, 1681401123),
('dh40m7nqq2dlovhlnk53ue1mut', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833342e33323031363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646834306d376e717132646c6f76686c6e6b35337565316d7574223b7d7d, 1681397834),
('dhk6pnmo0v1fk36gis1farjkct', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732352e3638393739333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264686b36706e6d6f307631666b3336676973316661726a6b6374223b7d7d, 1681287725),
('dhmvho46dgvjrhl17dvourrqhe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134322e3535363436363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264686d76686f34366467766a72686c313764766f757272716865223b7d7d, 1681401142),
('di5v9da0dcupotbqs5sgdqjjqr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632312e3738353935333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226469357639646130646375706f7462717335736764716a6a7172223b7d7d, 1681400621),
('divq87kjf26cc31umq6s46proo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435352e3336353938323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226469767138376b6a66323663633331756d713673343670726f6f223b7d7d, 1681399455),
('dl2ug666q17peuv9osv6mccokb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536342e3135303031363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646c32756736363671313770657576396f7376366d63636f6b62223b7d7d, 1681206564),
('dljmesrpdambmdks421ioc8bg5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133322e3031313434323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646c6a6d6573727064616d626d646b73343231696f6338626735223b7d7d, 1681401132),
('dmstv2frb98afaoamal2jk26od', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936382e3939333930323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646d7374763266726239386166616f616d616c326a6b32366f64223b7d7d, 1681400969),
('dnop6firos4s5ff6a0fphnmsof', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537312e3939313037363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646e6f70366669726f7334733566663661306670686e6d736f66223b7d7d, 1681400572),
('dp5emmkjv8thks812m76en2qrb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936392e3538303832383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22647035656d6d6b6a763874686b733831326d3736656e32717262223b7d7d, 1681400969),
('dp7r0n5kcpub8cid9e64s2j7l3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136312e3334363536323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264703772306e356b63707562386369643965363473326a376c33223b7d7d, 1681401161),
('dr42jvrsnleaul97unplnb7et6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538342e3130343932343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22647234326a7672736e6c6561756c3937756e706c6e6237657436223b7d7d, 1681400584),
('drhq8rcrc5v9p864t4r4429rlg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639332e3736383135343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226472687138726372633576397038363474347234343239726c67223b7d7d, 1681396693),
('dti5n28ikt43h6lpenlfftub7a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030322e3838363434353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22647469356e3238696b74343368366c70656e6c66667475623761223b7d7d, 1681400002),
('dttmfhlm5d63kbmpgsd2mbqmqs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536332e3439363833373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226474746d66686c6d356436336b626d70677364326d62716d7173223b7d7d, 1681206563),
('duhjrt19h8f3j42vh7f0c5fs72', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632312e3236323234323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226475686a72743139683866336a34327668376630633566733732223b7d7d, 1681401621),
('dv6ir0r73rmpt7va3kg99oks23', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630302e3732383930363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22647636697230723733726d7074377661336b6739396f6b733233223b7d7d, 1681401600),
('dvaofmsndnuddmdmdhn2u1co2n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537392e31363737333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226476616f666d736e646e7564646d646d64686e327531636f326e223b7d7d, 1681401579),
('dvt1kirjkd2bqkm559ljafhk3f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437342e3233363635393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22647674316b69726a6b643262716b6d3535396c6a6166686b3366223b7d7d, 1681290474),
('e0bvcekf6smds47i7k3gg64a7i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938372e3631313134343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226530627663656b6636736d6473343769376b3367673634613769223b7d7d, 1681400987),
('e0fau6kc299j5brtt36q0849d3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537372e3036393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226530666175366b633239396a3562727474333671303834396433223b7d7d, 1681400577),
('e0ijgapktk0e13rj1b1ik4pvlj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135392e3836373531373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226530696a6761706b746b30653133726a316231696b3470766c6a223b7d7d, 1681401159),
('e36qnnv9e12an6e0si4vtgt6u4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238322e3534323035383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653336716e6e7639653132616e36653073693476746774367534223b7d7d, 1681393282),
('e3ep053o7s4je58m2tdma5p440', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837382e3533383530313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653365703035336f3773346a6535386d3274646d613570343430223b7d7d, 1681397878),
('e3ep59amgq4cr0sgphuhb8fv6k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631342e3034343337343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653365703539616d67713463723073677068756862386676366b223b7d7d, 1681401614),
('e3ib93o67o9hkbc1f2jlj7osr5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539372e3638393632393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226533696239336f36376f39686b62633166326a6c6a376f737235223b7d7d, 1681401597),
('e6cbi6ghgjiemqqi6shpkr4v6k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936392e3739353539333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226536636269366768676a69656d717169367368706b723476366b223b7d7d, 1681399969),
('e6i6ivrkcb6op0871h44hk3qcs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837342e3936353534363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653669366976726b6362366f7030383731683434686b33716373223b7d7d, 1681397874),
('e7kdb2faf88oprvrsu90dru2c3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363730382e3735383932363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265376b64623266616638386f7072767273753930647275326333223b7d7d, 1681396708),
('e9jes82oc4ba4o127ql329cvoe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136312e3035323830373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265396a657338326f63346261346f313237716c33323963766f65223b7d7d, 1681401161),
('e9v3mlb0o3pmv7uqr6h0pparr3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138352e3831393637363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653976336d6c62306f33706d7637757172366830707061727233223b7d7d, 1681401185),
('ea9mpj6afrsn7tn5ortb23k24k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393739382e3033313136363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226561396d706a36616672736e37746e356f72746232336b32346b223b7d7d, 1681399798),
('eb0oju415m7tpk573c9o0d1727', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937332e3436373432333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226562306f6a753431356d3774706b35373363396f306431373237223b7d7d, 1681400973),
('ec8ecs89q0di4fogdpeetu64eu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138342e3630363733353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265633865637338397130646934666f6764706565747536346575223b7d7d, 1681401184),
('edabdd7am8hce9a822cilv0r61', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630322e3235303138323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265646162646437616d38686365396138323263696c7630723631223b7d7d, 1681400602),
('edq0rpqg3qes0to1p6m3hb31cn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536342e3939343439323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265647130727071673371657330746f3170366d3368623331636e223b7d7d, 1681209565),
('eef65ort6hhd5t9gljq8d9lia6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331342e3933363932373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265656636356f727436686864357439676c6a713864396c696136223b7d7d, 1681385314),
('eh639938ql35qqi5ss6lo39pl2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736342e3437383838313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226568363339393338716c3335717169357373366c6f3339706c32223b7d7d, 1681399764),
('ehts03dm5ivtncm0930ms451o9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935312e3632373335363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656874733033646d356976746e636d303933306d733435316f39223b7d7d, 1681399951),
('ei8vqe3ka1vp1f2elnukbusoq3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632342e3832343635393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656938767165336b61317670316632656c6e756b6275736f7133223b7d7d, 1681400624),
('ekqq5lcpuq9661gvv94b0jca5l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539352e3331373535363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656b7171356c6370757139363631677676393462306a6361356c223b7d7d, 1681401595),
('elg6fvok0k3if3mtufa6erde0r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363638342e3439333736393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656c673666766f6b306b336966336d7475666136657264653072223b7d7d, 1681396684),
('em5vuohnctorn7l302dp7l1ceu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736332e38373033353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656d3576756f686e63746f726e376c3330326470376c31636575223b7d7d, 1681399763),
('em8d3l7cbr3944i3e1hmhhui4t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631322e3933373434393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656d3864336c376362723339343469336531686d686875693474223b7d7d, 1681401612),
('ema7d99qffgejljrrbe2ki3rg5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338362e3938333430333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656d613764393971666667656a6c6a72726265326b6933726735223b7d7d, 1681397386),
('enbue42muagfpn5pp8eqpe6nld', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383230332e3435323130313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656e62756534326d75616766706e3570703865717065366e6c64223b7d7d, 1681398203),
('eojo8q6isc3loehrps360b1qjg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238332e37313739333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656f6a6f387136697363336c6f65687270733336306231716a67223b7d7d, 1681393283),
('epp0le6sa17q3e3q8mm5u2rqjd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736352e30353233393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22657070306c6536736131377133653371386d6d35753272716a64223b7d7d, 1681399765),
('eptni5hmk9a2a2f7r3386t8jku', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939302e34303932393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226570746e6935686d6b39613261326637723333383674386a6b75223b7d7d, 1681399990),
('etrrboimufu1nph70b44qhlr7v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435352e3935393035333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265747272626f696d756675316e7068373062343471686c723776223b7d7d, 1681399455),
('f0to51er3cieqn1vogt03c0j9i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939332e3631343039383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226630746f3531657233636965716e31766f6774303363306a3969223b7d7d, 1681399993),
('f1qutr3dtbguf8gb3v30tt195o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363730392e3036383334363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22663171757472336474626775663867623376333074743139356f223b7d7d, 1681396709),
('f3k9cr17b8grshuie7ihsnouge', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031352e3739323330313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266336b3963723137623867727368756965376968736e6f756765223b7d7d, 1681401015),
('f40tgcm4eciiviptdtam5h1e2s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333352e3431353134343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226634307467636d3465636969766970746474616d356831653273223b7d7d, 1681385335),
('f4dldm6q5r2g7nql14afqrtf65', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530312e3032353334353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226634646c646d367135723267376e716c31346166717274663635223b7d7d, 1681399501),
('f5ie22l6p69n6v07906p69icsf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030312e3533343132313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226635696532326c367036396e3676303739303670363969637366223b7d7d, 1681401001),
('f623tep009osa8b4fb4otan9b3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830312e32333236333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22663632337465703030396f73613862346662346f74616e396233223b7d7d, 1681399801),
('f6d93fga1q4g47tv8ei77kt5au', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537372e3635393335383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226636643933666761317134673437747638656937376b74356175223b7d7d, 1681401577),
('f6dvnorr3c12jg1nql0eo29dr6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631302e353634353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22663664766e6f7272336331326a67316e716c30656f3239647236223b7d7d, 1681400610),
('f6plpm7gcnakooh8710ikescju', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031362e3637303739373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226636706c706d3767636e616b6f6f6838373130696b6573636a75223b7d7d, 1681400016),
('f7f2813p68librsc3kvo385bsq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631332e3733373339333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22663766323831337036386c6962727363336b766f333835627371223b7d7d, 1681401613),
('f7fdu0cdadg4frn7pi2e53k5fn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393739392e3739373833333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266376664753063646164673466726e377069326535336b35666e223b7d7d, 1681399799),
('f82i1c6h44cvr379s30sb9jcr4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633392e3536393237343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22663832693163366834346376723337397333307362396a637234223b7d7d, 1681401639),
('f867jolidb186kg3uj6l97pnsq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232362e3636323433393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22663836376a6f6c6964623138366b6733756a366c3937706e7371223b7d7d, 1681290226),
('f90l60b5jlevc7tf7uq56dts2v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437332e3938373838363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226639306c363062356a6c65766337746637757135366474733276223b7d7d, 1681290474),
('f9eq7i48ablsra0vbvl0tlcdad', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939322e3631333730343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22663965713769343861626c737261307662766c30746c63646164223b7d7d, 1681400992),
('fa2ca6pm698vmfja5a0s9ub64b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334312e3437323532323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666132636136706d363938766d666a6135613073397562363462223b7d7d, 1681385341),
('fa5j4qmtofolqipi1odt6l37n4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e3530363230393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226661356a34716d746f666f6c71697069316f6474366c33376e34223b7d7d, 1681207046),
('fbbcc9pq88q68vt4b1nv7snqs9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330382e3030393236353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226662626363397071383871363876743462316e7637736e717339223b7d7d, 1681385308),
('fc7e6qjblk2emfumqrqjm51p4o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031352e3438343337383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226663376536716a626c6b32656d66756d7172716a6d353170346f223b7d7d, 1681400015),
('fch0osqbgemt7f6bo6vso0fr70', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331362e313630353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666368306f73716267656d74376636626f3676736f3066723730223b7d7d, 1681385316),
('fdunkrdp5m11fapl6m7fm6ce3t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334312e3738343735373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226664756e6b726470356d31316661706c366d37666d3663653374223b7d7d, 1681385341),
('fh5c9grf42t1i7afqheeiafj57', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530322e3432323937333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266683563396772663432743169376166716865656961666a3537223b7d7d, 1681399502),
('fh91ebv4kk46hu1jlm5j8o17ce', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937322e3331343739313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266683931656276346b6b34366875316a6c6d356a386f31376365223b7d7d, 1681399972),
('fhh3k50g46kdflrgc9amg1sj46', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937382e35313234353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666868336b35306734366b64666c72676339616d6731736a3436223b7d7d, 1681399978),
('fi0r08lap5e481isq4rdjvlqv5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030322e3236353332373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226669307230386c617035653438316973713472646a766c717635223b7d7d, 1681400002),
('fkrrdtrm0rk4bmplbrmfgpd8st', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630332e3435373335313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666b72726474726d30726b34626d706c62726d66677064387374223b7d7d, 1681400603),
('fl8d4vv7nl48k91rq4rp3huqfn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435332e35383538353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666c3864347676376e6c34386b3931727134727033687571666e223b7d7d, 1681399453),
('flq0q2tcogfrfd48tmpmg88bal', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633312e3836373833383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666c7130713274636f67667266643438746d706d67383862616c223b7d7d, 1681400631),
('fnu7nojif1b7sn8nd6p8rihg6q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383139392e3039393035333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666e75376e6f6a6966316237736e386e64367038726968673671223b7d7d, 1681398199),
('fqkbdjbmbsn1f0s1091smbd5cr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3438343933383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266716b62646a626d62736e3166307331303931736d6264356372223b7d7d, 1681207045),
('ftvcgo5u1htbbr1od3c78geplc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833332e3133323838343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266747663676f3575316874626272316f64336337386765706c63223b7d7d, 1681397833),
('fu0dtniqeg8af1lgtutfj83946', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363638372e3832393035373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266753064746e69716567386166316c67747574666a3833393436223b7d7d, 1681396687),
('futt2gvq9cvt1jodc58pg19jrf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032352e313237393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22667574743267767139637674316a6f64633538706731396a7266223b7d7d, 1681401025),
('fvg158lbifq8hemobbpb4i3jhr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939372e3939323032333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226676673135386c626966713868656d6f626270623469336a6872223b7d7d, 1681399998),
('g103dupdrpi440mng42nhoc871', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539342e3130303937323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267313033647570647270693434306d6e6734326e686f63383731223b7d7d, 1681401594),
('g12ccs06n8j84qe3jc63edkvmu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736342e3736383931393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267313263637330366e386a38347165336a63363365646b766d75223b7d7d, 1681399764),
('g1ujlala0v2ghnnria3eijtse6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439392e3231363634323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226731756a6c616c6130763267686e6e7269613365696a74736536223b7d7d, 1681399499),
('g524al7oa98gkhuncu2dn61pkv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135322e3839343439343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267353234616c376f613938676b68756e637532646e3631706b76223b7d7d, 1681401152),
('g548a48p2hqmvhifmiv2i5kdgc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030312e3233393236343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267353438613438703268716d766869666d69763269356b646763223b7d7d, 1681401001),
('g5ff30cpeegjdjvuf19peum7us', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630382e3632313335323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267356666333063706565676a646a76756631397065756d377573223b7d7d, 1681401608),
('g5rig8ivli98cvlo42tp6ahjsg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732372e313339313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267357269673869766c69393863766c6f343274703661686a7367223b7d7d, 1681287727),
('g6p6ub4v3464ogtrh61uqumvea', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833352e3530393833393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226736703675623476333436346f6774726836317571756d766561223b7d7d, 1681397835),
('g7g843i31r75kutog1rrk078k3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138302e3933353037343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226737673834336933317237356b75746f673172726b3037386b33223b7d7d, 1681401180),
('g8p3lvd0vq32iue8dg5qh53uhi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030362e3235323834353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22673870336c766430767133326975653864673571683533756869223b7d7d, 1681401006),
('g9cm7lm85t7nl98fja4hooceo0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030352e3033363536313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226739636d376c6d383574376e6c3938666a6134686f6f63656f30223b7d7d, 1681401005),
('ga4bhjbgmsbr6skb62u2ohl23c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363730382e3435383435353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267613462686a62676d73627236736b62363275326f686c323363223b7d7d, 1681396708),
('gb84jm8sesscgm0dnkpq65rv1v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536352e3839313338373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676238346a6d387365737363676d30646e6b7071363572763176223b7d7d, 1681206565),
('gdh2q7eckm5g6ijbnhhf5ra27a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939362e3138313733393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267646832713765636b6d356736696a626e686866357261323761223b7d7d, 1681400996),
('gfopog7m1aehaebuca58i8f879', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939322e3336343637353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267666f706f67376d316165686165627563613538693866383739223b7d7d, 1681399992),
('gfoqp6g4o2oje3cuvnn4l5dnqf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731312e3432363135363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267666f71703667346f326f6a65336375766e6e346c35646e7166223b7d7d, 1681396711),
('gh6u0cgeb4mlu90p6qjuke0nva', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538362e3130303633343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676836753063676562346d6c7539307036716a756b65306e7661223b7d7d, 1681401586);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('gj0dqerf12c4ecn2mcl6efj6lr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939382e35373630343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676a3064716572663132633465636e326d636c3665666a366c72223b7d7d, 1681400998),
('gkjledie731svsa0b85afeigvj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439382e3034323036323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676b6a6c6564696537333173767361306238356166656967766a223b7d7d, 1681399498),
('gks4ofif30fp4ldkpv153f11eu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633332e3039383639353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676b73346f66696633306670346c646b70763135336631316575223b7d7d, 1681400633),
('gkstkns7umeqljjjeck377kedk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639352e3239353335393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676b73746b6e7337756d65716c6a6a6a65636b3337376b65646b223b7d7d, 1681396695),
('gm0b190qdrk9epqeqrfcqgoirn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536332e3236353233363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676d30623139307164726b39657071657172666371676f69726e223b7d7d, 1681206563),
('gm5723656hjmh2tfdieqcia61k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435302e3336333934383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676d35373233363536686a6d683274666469657163696136316b223b7d7d, 1681399450),
('gm643ebhbb7s75aig26bhfvk9j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935352e3837303637373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676d3634336562686262377337356169673236626866766b396a223b7d7d, 1681399955),
('gm80jf6h4tigoikp59ej9obkl5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538332e34373431313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676d38306a663668347469676f696b703539656a396f626b6c35223b7d7d, 1681400583),
('gmc9vk6n7oo04l5m6kmpjv290k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136392e3331343330323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676d6339766b366e376f6f30346c356d366b6d706a763239306b223b7d7d, 1681401169),
('gn7h5erm25q4j0pn4isseu4nls', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833342e3033303031383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676e37683565726d323571346a30706e346973736575346e6c73223b7d7d, 1681397834),
('gnk2kgeamqp0juu2q3d8sev7dg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338303432372e3532353031353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676e6b326b6765616d7170306a75753271336438736576376467223b7d7d, 1681380427),
('go2coaurqpj3997o7qigiug5lk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373336302e3338373231313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676f32636f61757271706a333939376f37716967697567356c6b223b7d7d, 1681397360),
('go9e44q8b1eg5v78tq2mte77qn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736392e3934313235383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676f39653434713862316567357637387471326d74653737716e223b7d7d, 1681399769),
('gosi300e76q5ltprn07hgip0f4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937302e3231313532313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676f736933303065373671356c7470726e303768676970306634223b7d7d, 1681400970),
('gpaus1bgc4ra8fjds7u3od5j6d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634322e3733333031323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267706175733162676334726138666a64733775336f64356a3664223b7d7d, 1681401642),
('gri9ualv22fkt8lpm42icq0qgp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033372e3235303032353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226772693975616c763232666b74386c706d343269637130716770223b7d7d, 1681401037),
('grohf9octke9nj1bnte2drmptv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630332e3134383037333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267726f6866396f63746b65396e6a31626e74653264726d707476223b7d7d, 1681401603),
('gu6ks43u4b35p5osn6atikj4tn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938322e36373135313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226775366b733433753462333570356f736e366174696b6a34746e223b7d7d, 1681400982),
('gu7v4jcg0aee3qc5tstjm2hdq4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435352e3037363532373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267753776346a636730616565337163357473746a6d3268647134223b7d7d, 1681399455),
('gvacoiar96qs9gcu2sn042n28u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032372e34393131323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22677661636f696172393671733967637532736e3034326e323875223b7d7d, 1681401027),
('gvsbvsticb0u0gpi48gvh65cpq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439392e3531363437333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226776736276737469636230753067706934386776683635637071223b7d7d, 1681399499),
('h00ei1oo4gf3jktejmdukk5att', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634382e35303231333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226830306569316f6f346766336a6b74656a6d64756b6b35617474223b7d7d, 1681401648),
('h1p1q8e61i7112s8v89p40hdhu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435322e3133343434333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226831703171386536316937313132733876383970343068646875223b7d7d, 1681399452),
('h25tucnjdmsd8crmfjlismlf8p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631312e3731383438313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226832357475636e6a646d73643863726d666a6c69736d6c663870223b7d7d, 1681400611),
('h2erms53ufdvg8cm99nnsj4c69', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837302e3233313134323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22683265726d733533756664766738636d39396e6e736a34633639223b7d7d, 1681399870),
('h6gqqprbsdc4kc4pp6heksorua', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630342e3638353433343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226836677171707262736463346b633470703668656b736f727561223b7d7d, 1681400604),
('h84ot3tb7lqe16npudoidcu7f2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939312e3037373630373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226838346f74337462376c716531366e7075646f69646375376632223b7d7d, 1681399991),
('ha25kuja8i53b1om98t7jjuo9c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633312e3235353832393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686132356b756a613869353362316f6d393874376a6a756f3963223b7d7d, 1681400631),
('hbbcj19q2pdqrfdjuakjg0gbj8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936372e393931353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686262636a313971327064717266646a75616b6a673067626a38223b7d7d, 1681399968),
('hbehav1j1ikb5jm7slkbtp07gr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e3934373538333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686265686176316a31696b62356a6d37736c6b62747030376772223b7d7d, 1681207047),
('hbp7st2amdlrpu4i5ra85jf8fr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833362e37323434313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268627037737432616d646c727075346935726138356a66386672223b7d7d, 1681397836),
('hbslgjfli1rrgeqk7a04b1hv49', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3033333030353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226862736c676a666c693172726765716b37613034623168763439223b7d7d, 1681207045),
('hcj76grmaun7484ot0garkfrim', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134312e3934383830313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268636a373667726d61756e373438346f74306761726b6672696d223b7d7d, 1681401141),
('hihe508v3ug6uq7qla2tffg1ja', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383230342e3839343937363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686968653530387633756736757137716c613274666667316a61223b7d7d, 1681398204),
('hj233b64hlrtbd78lq7jidahua', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536332e3933333532383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686a323333623634686c7274626437386c71376a696461687561223b7d7d, 1681206563),
('hkeke7ac66jlk06k91esbibosu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230353535392e3234383134343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686b656b6537616336366a6c6b30366b393165736269626f7375223b7d7d, 1681205559),
('hls0t22ao1nq5sq1odke82fg4n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135382e3937313433363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686c7330743232616f316e71357371316f646b6538326667346e223b7d7d, 1681401158),
('hnps5qi85qpar7vcra16ha4rel', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383230392e3335343436313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686e70733571693835717061723776637261313668613472656c223b7d7d, 1681398209),
('hq9rqvg4kt729juk12dfb3csi5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136352e3630363930373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268713972717667346b743732396a756b31326466623363736935223b7d7d, 1681401165),
('hrnbjaft1v87shf6ssf3gl7dg1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936372e3430313133393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268726e626a616674317638377368663673736633676c37646731223b7d7d, 1681399967),
('hs8cnbe1r0c28onjfe3a742351', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313131392e3434383639353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22687338636e62653172306332386f6e6a66653361373432333531223b7d7d, 1681401119),
('huqh0b6kqb5t91td763fp14v6c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536372e3932373133323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22687571683062366b716235743931746437363366703134763663223b7d7d, 1681209567),
('hvjk689kcnnmm8scdcaih49uv8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736382e3136323138383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268766a6b3638396b636e6e6d6d38736364636169683439757638223b7d7d, 1681399768),
('i02bjtdbg9n1ic605g4nvhn4rq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030342e3035363530353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22693032626a74646267396e31696336303567346e76686e347271223b7d7d, 1681400004),
('i0ljaa0lpq8ied9huvt77vi4kd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434382e34373835313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269306c6a6161306c707138696564396875767437377669346b64223b7d7d, 1681399448),
('i24ql9l8bluf0l5pcnp99ph64s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937312e3531313338393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22693234716c396c38626c7566306c3570636e7039397068363473223b7d7d, 1681400971),
('i474ehdu3915qearerr4np6njj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435312e3535343137393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269343734656864753339313571656172657272346e70366e6a6a223b7d7d, 1681399451),
('i4np7mvpo3re8juuv6a8msivqt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536352e3737303239333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269346e70376d76706f337265386a7575763661386d7369767174223b7d7d, 1681209565),
('i546prndqijjiro6993284b3b7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3931393830343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226935343670726e6471696a6a69726f3639393332383462336237223b7d7d, 1681207045),
('i5794um60qenfh5lkgk87hhfsm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135312e3730313239323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226935373934756d363071656e6668356c6b676b3837686866736d223b7d7d, 1681401151),
('i5pgoegrkdnp1hqj78ic7oi8ca', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631312e3039373335333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22693570676f6567726b646e703168716a37386963376f69386361223b7d7d, 1681401611),
('i5thrpvemrl7725ijugvhle2e9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393932342e3137313631353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269357468727076656d726c37373235696a756776686c65326539223b7d7d, 1681399924),
('i8mlvod0t1n6jafi3mhg5i6it1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936342e34373635333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269386d6c766f643074316e366a616669336d6867356936697431223b7d7d, 1681400964),
('i8nhm9p3eb6c8u07fihmjejjct', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937342e3933393432313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269386e686d39703365623663387530376669686d6a656a6a6374223b7d7d, 1681399974),
('i8uc6qp93o859pehv9kn69smiv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633382e3935383730343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226938756336717039336f38353970656876396b6e3639736d6976223b7d7d, 1681401638),
('i9i26u78j5fimv6ace2a9npjtd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935342e3038343135393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269396932367537386a3566696d76366163653261396e706a7464223b7d7d, 1681399954),
('ib3b75mfd33assihj16dtqqkj1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132312e3138333039383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226962336237356d6664333361737369686a3136647471716b6a31223b7d7d, 1681401121),
('ib7hhqa62tgp6qegvorhonjmfp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334342e3732393938313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269623768687161363274677036716567766f72686f6e6a6d6670223b7d7d, 1681385344),
('ic3uono49su2ot5lqivdqbv4ee', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132352e3634303533333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696333756f6e6f34397375326f74356c71697664716276346565223b7d7d, 1681401125),
('ie92s2m5bb65g0t1ju14t5dssd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331352e3236333935323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226965393273326d3562623635673074316a753134743564737364223b7d7d, 1681385315),
('ietimba2mpefcsf3i9jirs9rjr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538362e3735393936313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696574696d6261326d7065666373663369396a69727339726a72223b7d7d, 1681401586),
('if3htgdlrkqmg428c3146ps4el', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539392e3836313034383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696633687467646c726b716d673432386333313436707334656c223b7d7d, 1681400599),
('igaoud3h14qv8t8emifo8i97qp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539392e3530303334323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226967616f7564336831347176387438656d69666f386939377170223b7d7d, 1681401599),
('igshh9bs2k861qlmtn3c4oa68a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330382e3331303537323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226967736868396273326b383631716c6d746e3363346f61363861223b7d7d, 1681385308),
('ihhcj3uk42efajfv21tcd3dokm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338392e3331373234323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696868636a33756b34326566616a6676323174636433646f6b6d223b7d7d, 1681397389),
('ij3lfmh02jpnuqofhtsincveld', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303233302e3332313833393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696a336c666d6830326a706e75716f66687473696e6376656c64223b7d7d, 1681290230),
('ijaikooideqlgsmuitdkdoc2cm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3137373531383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696a61696b6f6f696465716c67736d756974646b646f6332636d223b7d7d, 1681207045),
('ijhdcuv7apno11b4qc5v5epqdg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393939382e3630303335353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696a68646375763761706e6f3131623471633576356570716467223b7d7d, 1681399998),
('ikf9aq9rp3746m3jvgft5lvkoj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3633333333393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696b66396171397270333734366d336a76676674356c766b6f6a223b7d7d, 1681207045),
('iko375p5b13vjugp0d8pqgmomo', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230353536312e38303831343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696b6f3337357035623133766a7567703064387071676d6f6d6f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313638313230393136313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223066353962373561363765653134366234393733333863633635663336373333223b733a33323a223662303766626537636434656238643834626465313337383966353666633631223b7d733a343a2268617368223b733a36353a2236623037666265376364346562386438346264653133373839663536666336312d3066353962373561363765653134366234393733333863633635663336373333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1681205561),
('iq1462mab5uo69e80qbk85iggv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630392e3835363035313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226971313436326d616235756f363965383071626b383569676776223b7d7d, 1681401609),
('iq54bhlst012mov6kenaif8lhm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135342e3731383931393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226971353462686c73743031326d6f76366b656e616966386c686d223b7d7d, 1681401154),
('irb3ki67qhqfkfu4ruckpajc4l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935352e3237373538353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22697262336b693637716871666b6675347275636b70616a63346c223b7d7d, 1681399955),
('irfr5bl0onroult9771lk10489', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333372e3133393837323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226972667235626c306f6e726f756c74393737316c6b3130343839223b7d7d, 1681385337),
('itqdjf46a1bm3b7bt80mrjj8dh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630382e3138323138323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22697471646a6634366131626d336237627438306d726a6a386468223b7d7d, 1681400608),
('itt59npqs6ij304gnej653mv20', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633342e3539383436343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269747435396e70717336696a333034676e656a3635336d763230223b7d7d, 1681401634),
('iu0eqjr2ke8pnt0n1e26jp5sst', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939362e3738363030383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269753065716a72326b6538706e74306e316532366a7035737374223b7d7d, 1681400996),
('iu7rf9iriqa0jemb4nauubhu3k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837382e3233393937313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226975377266396972697161306a656d62346e617575626875336b223b7d7d, 1681397878),
('iubt1u2aoak4pp0d129c27eikq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539382e3838333332363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269756274317532616f616b347070306431323963323765696b71223b7d7d, 1681401598),
('iudp9na2ljacda217vuq9mb03r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631302e3834393832373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269756470396e61326c6a61636461323137767571396d62303372223b7d7d, 1681400610),
('j18ksuq4sh3g3k02184316utmj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434392e3538313938383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a31386b7375713473683367336b303231383433313675746d6a223b7d7d, 1681399449),
('j1t4gjalbo57ja10qbgm13s57g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383132362e3632313738383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a317434676a616c626f35376a6131307162676d313373353767223b7d7d, 1681398126),
('j2qhns80gm0d5r5ue86dcd99et', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538302e3335323934383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a3271686e733830676d30643572357565383664636439396574223b7d7d, 1681401580),
('j4vhgkll4rukhud3n4i9s3kpk6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e3634333739363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a347668676b6c6c3472756b687564336e34693973336b706b36223b7d7d, 1681207047),
('j5s4c55n8ooertfgmmms9ulbet', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937302e3837343131333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a3573346335356e386f6f65727466676d6d6d7339756c626574223b7d7d, 1681400970),
('j7m45ivst6c6tlc613if22pob8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633302e3432383537333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a376d343569767374366336746c6336313369663232706f6238223b7d7d, 1681401630),
('j8jhdu37tf67lmb7ba7q2t1sj9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537302e3532363738393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a386a6864753337746636376c6d623762613771327431736a39223b7d7d, 1681400570),
('j9uglemoaqn5cbkdv2u9fd4jnb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530332e39323739313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a3975676c656d6f61716e3563626b64763275396664346a6e62223b7d7d, 1681399503),
('jar1b99eqt0mdu7k0vj7s4gpg4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138322e3138383232373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a617231623939657174306d6475376b30766a37733467706734223b7d7d, 1681401182),
('jbdtpr5907iqoumtn7ipdsr0v3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031302e31333534333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a62647470723539303769716f756d746e376970647372307633223b7d7d, 1681401010),
('jc95upbh2pob5a93cpu2dthsnr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134382e3130303130363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a6339357570626832706f623561393363707532647468736e72223b7d7d, 1681401148),
('jdu9c2q4dv1eneg5haimhfjj6s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030382e3334303930343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a64753963327134647631656e6567356861696d68666a6a3673223b7d7d, 1681400008),
('jftggrcne260fo3u9lpuqu6qnv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938312e34353534363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a6674676772636e65323630666f3375396c7075717536716e76223b7d7d, 1681400981),
('jq5madrlen0d85utmng1942pqk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537372e3036313639313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a71356d6164726c656e3064383575746d6e673139343270716b223b7d7d, 1681401577),
('jr8cps5sv8e0dqm1lr490bpfhr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030392e3536323638333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a723863707335737638653064716d316c723439306270666872223b7d7d, 1681400009),
('jum2cl4m57c2i3petm9htt7ktu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133362e3331373633353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a756d32636c346d3537633269337065746d39687474376b7475223b7d7d, 1681401136),
('k0gmlejsjs2ed0h59p5ihaai48', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334302e3030333235393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b30676d6c656a736a7332656430683539703569686161693438223b7d7d, 1681385340),
('k0m2ounhmtvvmkj8bto6jkkcan', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634372e3239323333373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b306d326f756e686d7476766d6b6a3862746f366a6b6b63616e223b7d7d, 1681401647),
('k13ck2v3c9c03jduijam3u0nn4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631382e3037363131333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b3133636b32763363396330336a6475696a616d3375306e6e34223b7d7d, 1681400618),
('k1692g5nksasmcdp9irmolmv4t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435342e3136323438313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b3136393267356e6b7361736d6364703969726d6f6c6d763474223b7d7d, 1681399454),
('k2ff6tikse7ksh74ppkmgvq9kk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333362e3237303732363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b3266663674696b7365376b7368373470706b6d677671396b6b223b7d7d, 1681385336),
('k3246g272spft0ppghicqokhn6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334302e3539353836353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b33323436673237327370667430707067686963716f6b686e36223b7d7d, 1681385340),
('k3mmsbn18e0iifbghcr05m5j3v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033322e3935373831343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b336d6d73626e31386530696966626768637230356d356a3376223b7d7d, 1681401032),
('k40j35sp830t3m2ihj038u78gd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434372e3739343834313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b34306a3335737038333074336d3269686a3033387537386764223b7d7d, 1681399447),
('k45hchpftus8olccsprteja0bf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033312e31343734333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b34356863687066747573386f6c636373707274656a61306266223b7d7d, 1681401031),
('k5bnouaulcluda2k2rribtf8qa', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133302e37333736363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b35626e6f7561756c636c756461326b32727269627466387161223b7d7d, 1681401130),
('k7im9f1dd1trhnt855u9gpjggg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633362e3230343734393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b37696d3966316464317472686e74383535753967706a676767223b7d7d, 1681400636),
('k900di1lnk5ijdojaf8n8k82ph', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530362e34313832393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b3930306469316c6e6b35696a646f6a6166386e386b38327068223b7d7d, 1681399506),
('ka0n6qlg1emqqs64jkcosnaalh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331322e3037303835383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b61306e36716c6731656d71717336346a6b636f736e61616c68223b7d7d, 1681385312),
('kb6jc52jquamfdas1408rgr7jl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935372e3635313639323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b62366a6335326a7175616d6664617331343038726772376a6c223b7d7d, 1681399957),
('kba02hmr5391amb8bkpv6nrpg8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031342e3836343631313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b62613032686d7235333931616d6238626b7076366e72706738223b7d7d, 1681400014),
('kbbsef8al9gml022bggavv19kk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232372e3931333731333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b626273656638616c39676d6c30323262676761767631396b6b223b7d7d, 1681290227),
('kcq37a17302754rg3hst92vmdo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537312e3131393037353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b637133376131373330323735347267336873743932766d646f223b7d7d, 1681400571),
('kd0tbfrakipar99tsm1aeeve2e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338362e3337373738333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b643074626672616b69706172393974736d3161656576653265223b7d7d, 1681397386),
('kd7fq0lpohi31sk5jdd9pvgofn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e3037313032343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b64376671306c706f68693331736b356a6464397076676f666e223b7d7d, 1681207047),
('kf6irmo2mb14datv8ih91fe606', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437342e34383638393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b663669726d6f326d6231346461747638696839316665363036223b7d7d, 1681290474),
('kga486bfn0sgh8863figb74fg8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537382e3836383430343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b676134383662666e3073676838383633666967623734666738223b7d7d, 1681401578),
('kh5uaninjk98o024pn48njfvgl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537392e3436333739313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b683575616e696e6a6b39386f303234706e34386e6a6676676c223b7d7d, 1681401579),
('kimt2b9olr1um26sgiap0vm6vh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034342e3832353833343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b696d743262396f6c7231756d3236736769617030766d367668223b7d7d, 1681207044),
('kitk730iho3rsq0jpeb5mptu1h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731322e30323837313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b69746b37333069686f33727371306a706562356d7074753168223b7d7d, 1681396712),
('kjsb52vamh09frt34jhrc4ki7c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439372e3433333736383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6a7362353276616d68303966727433346a687263346b693763223b7d7d, 1681399497),
('kkc5b0r6esn0u52m6526om74br', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837362e3135363630343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6b63356230723665736e307535326d363532366f6d37346272223b7d7d, 1681397876),
('kkotlc1lo06qtoliu79vtkokbi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031342e3531353436353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6b6f746c63316c6f303671746f6c6975373976746b6f6b6269223b7d7d, 1681401014),
('kl3uo3oblloegsmp79kob4b608', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830302e3336373034363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6c33756f336f626c6c6f6567736d7037396b6f623462363038223b7d7d, 1681399800),
('kmdqk2nhpcb2godrg3rhou6b5h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630322e3834383734333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6d64716b326e6870636232676f6472673372686f7536623568223b7d7d, 1681400602),
('kmn1o7uflkrk4e13csusmgoapr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435332e3330353537313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6d6e316f3775666c6b726b34653133637375736d676f617072223b7d7d, 1681399453),
('kn0rese9lnpo6ckg62d2voevpf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634362e3039323434353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6e3072657365396c6e706f36636b6736326432766f65767066223b7d7d, 1681401646),
('kn1mfcnh576nbq5tiq631et4cr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034382e3034333736353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6e316d66636e683537366e6271357469713633316574346372223b7d7d, 1681207048),
('kpd719f40gsb8l8aj2fmhpbpjd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539372e3039353332343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b7064373139663430677362386c38616a32666d687062706a64223b7d7d, 1681401597),
('kq52vg0qp409qu5j4ieddtsj8s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537362e3735373339393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b71353276673071703430397175356a346965646474736a3873223b7d7d, 1681401576),
('kqa7b56fkqtjej6ka33sjt2pjc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936302e3131383738343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b716137623536666b71746a656a366b613333736a7432706a63223b7d7d, 1681399960),
('krqeq7kc4pl5amtg9bunb5ehjf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634352e3439363437373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b72716571376b6334706c35616d74673962756e623565686a66223b7d7d, 1681401645),
('krsr7j4nlp5l4d0jpofu5kfes2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536382e3134363133323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b727372376a346e6c70356c3464306a706f6675356b66657332223b7d7d, 1681209568),
('kt41khe2pdh6b9rqp1v2392deg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439372e3734333130353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b7434316b686532706468366239727170317632333932646567223b7d7d, 1681399497),
('ktdhtjdcsim9crvghu0o90mrbj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639322e3535343936343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b746468746a646373696d39637276676875306f39306d72626a223b7d7d, 1681396692),
('kto62ho8pc03fhbcj22bb0vas8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937352e3534373538383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b746f3632686f3870633033666862636a323262623076617338223b7d7d, 1681399975),
('kvcj8j0gl8h5cr6f8s2nfaf8gn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030342e3137343932323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b76636a386a30676c386835637236663873326e66616638676e223b7d7d, 1681401004),
('l1dpccbioqk3thor7af3stmsol', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313139302e35393937343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c316470636362696f716b3374686f723761663373746d736f6c223b7d7d, 1681401190);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('l1t6oaj2tcfobosoghl8g9kug7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833322e3833373338383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c3174366f616a327463666f626f736f67686c3867396b756737223b7d7d, 1681397832),
('l1uafpae6sajdi8hc60ihmv38t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530332e3631333133343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c317561667061653673616a6469386863363069686d76333874223b7d7d, 1681399503),
('l39vkabn21j5loudtav3vqo14l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136382e3038393230393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c3339766b61626e32316a356c6f75647461763376716f31346c223b7d7d, 1681401168),
('l4es60e8iin41l6a8iu4fnrl12', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537342e3333323034363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c3465733630653869696e34316c366138697534666e726c3132223b7d7d, 1681400574),
('l4m3f8agln06bkq82o1si1pqi3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936332e3234383137353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c346d33663861676c6e3036626b7138326f3173693170716933223b7d7d, 1681400963),
('l6466gjsaukjuui8f4l0an7ttm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936352e3630393638383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c36343636676a7361756b6a7575693866346c30616e3774746d223b7d7d, 1681399965),
('l679t04oa9r6u1mr6kmfniqh06', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631322e30313339383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c3637397430346f6139723675316d72366b6d666e6971683036223b7d7d, 1681400612),
('l78mkjlolr8546s8vjqcp4otrv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439382e3633353433373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c37386d6b6a6c6f6c72383534367338766a716370346f747276223b7d7d, 1681399498),
('la5dfi84k317o279ruo61u902d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538352e3333343031373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c613564666938346b3331376f32373972756f36317539303264223b7d7d, 1681400585),
('lb13cnhq63ge46d4cahbluigd4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936362e3236393338353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c623133636e68713633676534366434636168626c7569676434223b7d7d, 1681400966),
('lb92cl4ialvugjdo1co5b7udlf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938352e3739383138373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c623932636c3469616c7675676a646f31636f35623775646c66223b7d7d, 1681400985),
('lbpdfp9lkcgosrr4trv6oq79u2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938332e3239323637323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6270646670396c6b63676f73727234747276366f7137397532223b7d7d, 1681400983),
('ldp5u52accjm21rnjource6l23', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537322e3834393237383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6470357535326163636a6d3231726e6a6f75726365366c3233223b7d7d, 1681400572),
('lg6vfmepjp4eegfhrvnpekepfu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530352e3532303333363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c673676666d65706a7034656567666872766e70656b65706675223b7d7d, 1681399505),
('lhcp8g67qlbcsb1m68v4qn4j7f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537372e3935313238333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c68637038673637716c62637362316d36387634716e346a3766223b7d7d, 1681401577),
('lilkbp6vrnmbsf1lvqcnqchmr7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383034382e3838363631373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c696c6b62703676726e6d627366316c7671636e7163686d7237223b7d7d, 1681398048),
('lim2irut9dp1tf3nl16t35nf98', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631392e3333343933333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c696d3269727574396470317466336e6c31367433356e663938223b7d7d, 1681401619),
('lk106vl25ekfvtom634bg2audj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634392e3132393439363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6b313036766c3235656b6676746f6d3633346267326175646a223b7d7d, 1681401649),
('lkam06dsb0h6drpqmcj9t04a5h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334332e3235393638343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6b616d3036647362306836647270716d636a39743034613568223b7d7d, 1681385343),
('ll48klo54mt77mtpqc2ds8648t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631392e3936303635363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6c34386b6c6f35346d7437376d747071633264733836343874223b7d7d, 1681401619),
('llogfc9c8dmjmuedkppe9t94bh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736312e3831343233333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6c6f676663396338646d6a6d7565646b707065397439346268223b7d7d, 1681399761),
('llsu98ljlq8s75g971bi6vmhif', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536332e37313231313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6c737539386c6a6c713873373567393731626936766d686966223b7d7d, 1681206563),
('ln3rsfbjqt76u7udbalk4275nq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033362e3634333732363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6e33727366626a717437367537756462616c6b343237356e71223b7d7d, 1681401036),
('lnodg1vcc1biradptk7mknjp1v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736342e3138363639383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6e6f64673176636331626972616470746b376d6b6e6a703176223b7d7d, 1681399764),
('lpm2irckn6f1s3i0g8ca5serpq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335392e3738363337393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c706d326972636b6e3666317333693067386361357365727071223b7d7d, 1681397359),
('lq5kqehd13i7jhjquugc5h5oaq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137342e3232313530333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c71356b71656864313369376a686a71757567633568356f6171223b7d7d, 1681401174),
('lrcfum4g4gr08il7u29496epoo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439382e3932383134393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c726366756d34673467723038696c3775323934393665706f6f223b7d7d, 1681399498),
('lrrnono8seg7si7d859btslokc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937342e3633393931373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c72726e6f6e6f3873656737736937643835396274736c6f6b63223b7d7d, 1681399974),
('ls4sirrvlqso2cbik1jncccutr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538382e3935333831313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c733473697272766c71736f326362696b316a6e636363757472223b7d7d, 1681400588),
('lt7fsjeip6g1fosvp5tloqi1pk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732352e3935383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c743766736a656970366731666f73767035746c6f716931706b223b7d7d, 1681287725),
('lu33ru89c5q4mtdmf1rfks0dgc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393934322e3437313731313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c75333372753839633571346d74646d663172666b7330646763223b7d7d, 1681399942),
('lu6aklc3omohtuc6vgg1dpsh4c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333372e3432303037323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c7536616b6c63336f6d6f687475633676676731647073683463223b7d7d, 1681385337),
('lv4f1o1cj9j23avrkqb7b5utg1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837312e3734323238393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c763466316f31636a396a32336176726b716237623575746731223b7d7d, 1681399871),
('m05revus4q5h2o4rt3tkbc43qo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633382e3633303034373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d3035726576757334713568326f34727433746b62633433716f223b7d7d, 1681400638),
('m2ukuf03lg5q1k2pgi5qrj4lh2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639352e35393134343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d32756b756630336c673571316b327067693571726a346c6832223b7d7d, 1681396695),
('m2uupbp491beche3g9q4qjf4cf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132312e3439383939333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d32757570627034393162656368653367397134716a66346366223b7d7d, 1681401121),
('m4oe3lnavla4690bc0kr7ubsg6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632382e3731373536383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d346f65336c6e61766c61343639306263306b72377562736736223b7d7d, 1681400628),
('m6a5h2ong4oqindfrkdpv06sh2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330372e3133333633363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d36613568326f6e67346f71696e6466726b6470763036736832223b7d7d, 1681385307),
('m9a1hn1ri7mp3fn11a87ar9ohm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030352e3334383930393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d396131686e317269376d7033666e31316138376172396f686d223b7d7d, 1681401005),
('mb2qjbtavqnihg25n6sgp9p6mm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937362e3531393831393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6232716a62746176716e69686732356e367367703970366d6d223b7d7d, 1681400976),
('mdg1s9adpla063ig7b0t9ksnmc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939302e3539323238363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d64673173396164706c61303633696737623074396b736e6d63223b7d7d, 1681400990),
('mdsvelfkanq9hnpmq5mnpk26um', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135322e3238363036363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d647376656c666b616e7139686e706d71356d6e706b3236756d223b7d7d, 1681401152),
('mhdb4ga5jerdcqektp74keh974', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936382e30343337373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d686462346761356a6572646371656b747037346b6568393734223b7d7d, 1681400968),
('mjhlav1mflpdlrmv59um1v0vpe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630332e3734373831393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6a686c6176316d666c70646c726d763539756d317630767065223b7d7d, 1681401603),
('mjotmh3k9gs2u6pntcd2cn28ds', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633332e3731363630393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6a6f746d68336b396773327536706e74636432636e32386473223b7d7d, 1681400633),
('mkbufjadfk5r4d66df1ou48uip', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031322e363338373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6b6275666a6164666b3572346436366466316f753438756970223b7d7d, 1681401012),
('ml6nqubsjfnua2kfqt6f370enn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538302e3939363332313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6c366e717562736a666e7561326b6671743666333730656e6e223b7d7d, 1681400581),
('mm1n0017rdb9c1a3gd09rgpibm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232382e3133313233393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6d316e3030313772646239633161336764303972677069626d223b7d7d, 1681290228),
('mm41an7tckt14uiiktq12p4rch', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539342e3433353839343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6d3431616e3774636b7431347569696b747131327034726368223b7d7d, 1681400594),
('mmnb4rmq8t568t20hd7sfdunm9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434392e3939363434323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6d6e6234726d713874353638743230686437736664756e6d39223b7d7d, 1681399450),
('mnrc3e1u7bjt9u9b9a7jc4fsss', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937342e3334303134333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6e72633365317537626a74397539623961376a633466737373223b7d7d, 1681399974),
('moh6v4c8s20b7uma3lmlqq8sd5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837322e3231363734383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6f6836763463387332306237756d61336c6d6c717138736435223b7d7d, 1681399872),
('mqp24962gqri2tneqr7tigbiaf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632342e3931363236333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d717032343936326771726932746e6571723774696762696166223b7d7d, 1681401624),
('mrtbu2bufu9oojv0i0qr69ukv0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936352e3338303036333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d727462753262756675396f6f6a7630693071723639756b7630223b7d7d, 1681400965),
('ms1526e16h5rt5n3palt8nsk46', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338352e3738353836343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d733135323665313668357274356e3370616c74386e736b3436223b7d7d, 1681397385),
('ms3mfjqnpoqqj9q1bdl14ibjhh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935342e36383135353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d73336d666a716e706f71716a39713162646c313469626a6868223b7d7d, 1681399954),
('mt2q9jdrsuen297mtaeb24m5ab', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434372e3131343636353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d743271396a64727375656e3239376d7461656232346d356162223b7d7d, 1681399447),
('n2h1kdmae541g9la1lhm4dceu2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833312e3935353232313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e3268316b646d616535343167396c61316c686d346463657532223b7d7d, 1681397831),
('n3o54he5od7r5prllqj5a20oiu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393933312e3533333633393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e336f35346865356f6437723570726c6c716a356132306f6975223b7d7d, 1681399931),
('n92iu3gjbrq75oq9lfra6jrl24', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363730392e3636313130343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e3932697533676a62727137356f71396c667261366a726c3234223b7d7d, 1681396709),
('nbo9eakk8oh6bl0heh4m3k2if2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630372e34313634333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e626f3965616b6b386f6836626c30686568346d336b32696632223b7d7d, 1681401607),
('nc7vmum11jva06s9s5smbspqc2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536362e3439343239363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6337766d756d31316a7661303673397335736d627370716332223b7d7d, 1681209566),
('ndih2n0mcn3b1octc1htikmso0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938342e3533363035383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e646968326e306d636e3362316f637463316874696b6d736f30223b7d7d, 1681400984),
('ndn4tgobq5c0kf76ig9emnp82c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935322e3836353830373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e646e3474676f62713563306b663736696739656d6e70383263223b7d7d, 1681399952),
('neq52k1u01hnmij20v4rks7h0p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937322e3832303034333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e657135326b31753031686e6d696a32307634726b7337683070223b7d7d, 1681400972),
('nf0qjmh376jg9njnnhj6il8rk2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630342e3332353236323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6630716a6d683337366a67396e6a6e6e686a36696c38726b32223b7d7d, 1681401604),
('ngho5tiujflr8ndmnl4v661stg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331302e34303039343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e67686f357469756a666c72386e646d6e6c3476363631737467223b7d7d, 1681385310),
('nh4rk9okvlebk5eevnfpkaase2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232392e3130343334383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6834726b396f6b766c65626b356565766e66706b6161736532223b7d7d, 1681290229),
('nhioerle6rrnosrkfq00si0k5f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630382e3738323632323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e68696f65726c653672726e6f73726b667130307369306b3566223b7d7d, 1681400608),
('nk5d445mkrv9hd142nffdat1sh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030312e3834333533363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6b35643434356d6b72763968643134326e6666646174317368223b7d7d, 1681401001),
('nk7tsmjilep2f7ettnedfl7819', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530342e3632303836393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6b3774736d6a696c65703266376574746e6564666c37383139223b7d7d, 1681399504),
('nl00g1372kta18fgec29e2hrlu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137312e3739303035353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6c303067313337326b74613138666765633239653268726c75223b7d7d, 1681401171),
('nm65sgcqf2qh3170v4dg1ghokp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539312e3337353831313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6d3635736763716632716833313730763464673167686f6b70223b7d7d, 1681400591),
('nmbq10avuj6hqrljclfj19gdb2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238322e3833313034333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6d627131306176756a366871726c6a636c666a313967646232223b7d7d, 1681393282),
('noktg2401q15244889ppa7vk13', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837332e3432373932323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6f6b74673234303171313532343438383970706137766b3133223b7d7d, 1681399873),
('nptu9e30055l55ju593mlk5ass', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539382e3035383632363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e707475396533303035356c35356a753539336d6c6b35617373223b7d7d, 1681400598),
('nq84hmpgov5ar4q1b74341i2dr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232382e3834343934383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e713834686d70676f7635617234713162373433343169326472223b7d7d, 1681290228),
('nrfr9ebjjg7708g8v0pb1tve0m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313139322e3339383832313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e7266723965626a6a673737303867387630706231747665306d223b7d7d, 1681401192),
('nrkvisu1lebn8s5sgfasljmp95', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134362e3835373330323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e726b76697375316c65626e38733573676661736c6a6d703935223b7d7d, 1681401146),
('nt23fcgblkf8u6k41ko4mfjhai', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830322e31343239313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e743233666367626c6b663875366b34316b6f346d666a686169223b7d7d, 1681399802),
('nte6vko735toh87ls6ke42b3gf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334342e3434303630363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e746536766b6f373335746f6838376c73366b65343262336766223b7d7d, 1681385344),
('nu402ort333q7qksjh99ld1o4o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633312e3033363636383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e753430326f72743333337137716b736a6839396c64316f346f223b7d7d, 1681401631),
('nv284ul4jdfaub1lc86bm0r6dp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530332e3331383830363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e76323834756c346a6466617562316c633836626d3072366470223b7d7d, 1681399503),
('nv3th29n1ojja8e9i7iakg36po', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632372e3335333736383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e7633746832396e316f6a6a61386539693769616b673336706f223b7d7d, 1681401627),
('nvo2pc1qs2o6masnfajiqp4i2s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731322e3931353531313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e766f327063317173326f366d61736e66616a69717034693273223b7d7d, 1681396712),
('o0lem4osj02chqs4j0sp4qh6tu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631372e3833333035343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f306c656d346f736a303263687173346a307370347168367475223b7d7d, 1681401617),
('o0m8mipaulltgmt1rdgvtps9os', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939342e34303839353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f306d386d697061756c6c74676d743172646776747073396f73223b7d7d, 1681400994),
('o6o8o3duq1p19jmoj3lt8k5tt1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138352e3231363836373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f366f386f33647571317031396a6d6f6a336c74386b35747431223b7d7d, 1681401185),
('o71uvr95gg3repkta2jjdhn5va', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632362e3733373738353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f373175767239356767337265706b7461326a6a64686e357661223b7d7d, 1681401626),
('o8aurna8jvh0kfoe05kp0j8dhu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631392e3934303338353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f386175726e61386a7668306b666f6530356b70306a38646875223b7d7d, 1681400619),
('o8bgmps9j82hljdfo67j7v4hkj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538382e36333634323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f3862676d7073396a3832686c6a64666f36376a377634686b6a223b7d7d, 1681401588),
('o9c2f3n909mn0jqq3vkjthhbcr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331352e3536373437373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f39633266336e3930396d6e306a717133766b6a746868626372223b7d7d, 1681385315),
('o9q1bcnel2c59b0b6sk1l9l01h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134342e3337353830313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f39713162636e656c3263353962306236736b316c396c303168223b7d7d, 1681401144),
('oa3s13oonhqonak6sv9nto7sd1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639352e38393631393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f61337331336f6f6e68716f6e616b367376396e746f37736431223b7d7d, 1681396695),
('oa5at8lfludva7q6ujikecp4qg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837372e3034373338353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f61356174386c666c75647661377136756a696b656370347167223b7d7d, 1681397877),
('oaa7tpfk5l7tke8etp617vrk1j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435322e3732313832323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6161377470666b356c37746b653865747036313776726b316a223b7d7d, 1681399452),
('ob7vnqdj8f88tlocbiu3mvhb9f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539312e39373536383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6237766e71646a38663838746c6f63626975336d7668623966223b7d7d, 1681400591),
('obrrhdngv33adlhg8bl2goo4ou', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437322e3233373234373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f62727268646e6776333361646c686738626c32676f6f346f75223b7d7d, 1681290472),
('oc7nlougsksmepe44cn9pf9bmp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538352e3434303530363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f63376e6c6f7567736b736d6570653434636e39706639626d70223b7d7d, 1681401585),
('ocoj9sldv8b8fbgv1h5trmlr0o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135302e35303437383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f636f6a39736c64763862386662677631683574726d6c72306f223b7d7d, 1681401150),
('oe9slu62gqoqum74b7tbq6sdmo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133332e3236383839393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6539736c75363267716f71756d373462377462713673646d6f223b7d7d, 1681401133),
('oebpcbhe7ppkeq8giaduiu3mo6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393934382e3437343730393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f656270636268653770706b65713867696164756975336d6f36223b7d7d, 1681399948),
('oeeaou5ld08mm52g6hlji7pd4m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136342e3934393832353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6565616f75356c6430386d6d35326736686c6a69377064346d223b7d7d, 1681401164),
('off3j40i7d9g66pmpp11ng22ol', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936332e3835313034383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6666336a343069376439673636706d707031316e6732326f6c223b7d7d, 1681400963),
('ohbihon6fcra3dq4eqn8lom9ou', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031332e3235343232313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f686269686f6e36666372613364713465716e386c6f6d396f75223b7d7d, 1681401013),
('olqspmfbb4ue9hlvpbo145v3ae', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136362e32363138313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6c7173706d66626234756539686c7670626f31343576336165223b7d7d, 1681401166),
('omblkgp5hp37psic8s3ob04iek', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936332e3737343332363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6d626c6b67703568703337707369633873336f62303469656b223b7d7d, 1681399963),
('omfab7gct485c656t2rb3228qp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539302e3437343537393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6d666162376763743438356336353674327262333232387170223b7d7d, 1681401590),
('omi8pats20bmk0444duvuso8pi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136392e3933333337343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6d6938706174733230626d6b3034343464757675736f387069223b7d7d, 1681401169),
('omm4e3uc9egbb6cq7b6jsupnm3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331312e3739333236383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6d6d346533756339656762623663713762366a7375706e6d33223b7d7d, 1681385311),
('oo8lmrgkii2db6gtl3fl6j1qe0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633332e3430373139323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6f386c6d72676b69693264623667746c33666c366a31716530223b7d7d, 1681401633),
('opgjbdi25giivdbrq4vte6dtr4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031372e3839323039353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f70676a62646932356769697664627271347674653664747234223b7d7d, 1681400017),
('oqoiikqlt2iamf30jpa64f3kcd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537392e3735363931383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f716f69696b716c743269616d6633306a7061363466336b6364223b7d7d, 1681401579),
('orpks5kjps158f8ock3m4uv5ij', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937372e3736363236343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f72706b73356b6a707331353866386f636b336d34757635696a223b7d7d, 1681400977),
('ou1al89a25k53gj82ip0gof17s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539352e3032323434363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f7531616c38396132356b3533676a3832697030676f66313773223b7d7d, 1681400595),
('oui185egrv7a6kbhg891oqttba', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538392e3234313633323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f7569313835656772763761366b6268673839316f7174746261223b7d7d, 1681401589),
('ouvlhimbas8f4rnftr5no1ttp5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830312e3833313839373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f75766c68696d626173386634726e667472356e6f3174747035223b7d7d, 1681399801),
('p1b3jaukmrct2lsmdvhh6oo998', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331332e3139393035353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22703162336a61756b6d726374326c736d64766868366f6f393938223b7d7d, 1681385313),
('p25s19h6f17jtbgg75lv5u5113', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837372e33333536393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270323573313968366631376a7462676737356c76357535313133223b7d7d, 1681397877),
('p2hshku3hhtspl1vh609dgjmjb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538372e3939393137383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270326873686b753368687473706c31766836303964676a6d6a62223b7d7d, 1681401588),
('p2thg27q5f0tsfkdt8itavfjr6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133332e3838383137393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270327468673237713566307473666b64743869746176666a7236223b7d7d, 1681401133),
('p5it822mibi0libhqsh0lk3aii', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133352e3131333930363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22703569743832326d696269306c696268717368306c6b33616969223b7d7d, 1681401135),
('p7bdh7actj1cum6lh1pu9c7la4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537392e3734303134363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227037626468376163746a3163756d366c683170753963376c6134223b7d7d, 1681400579),
('p7mmq17r0bt3jr2u33d6noavs6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138312e3536353135313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270376d6d71313772306274336a723275333364366e6f61767336223b7d7d, 1681401181),
('p9ko5rb4gsai14dkdp9vq3i6hd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032382e3638363235353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270396b6f35726234677361693134646b64703976713369366864223b7d7d, 1681401028),
('pb0u32t2uep0u1rtslh0p2a6ko', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539362e3233353538373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270623075333274327565703075317274736c6830703261366b6f223b7d7d, 1681400596),
('pc88khqig30t8rlgnhr2e6jqh0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639342e3939313937353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706338386b6871696733307438726c676e68723265366a716830223b7d7d, 1681396695),
('pcsm2ooqckbi11irr8qqq00uvj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393830322e37353734323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227063736d326f6f71636b6269313169727238717171303075766a223b7d7d, 1681399802),
('pd1l2opk61gofj0h3p0dt1pvmi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032352e37333533313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227064316c326f706b3631676f666a306833703064743170766d69223b7d7d, 1681401025),
('pd8ff740i50cp0769ria9bb39s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138382e3230363436343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227064386666373430693530637030373639726961396262333973223b7d7d, 1681401188),
('pf5lmb50653lc44relro04i3hl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e3834363137343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227066356c6d6235303635336c63343472656c726f30346933686c223b7d7d, 1681207047),
('pfgvfs5ji4ot1ootpggad2ngtn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333342e3833373037363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706667766673356a69346f74316f6f747067676164326e67746e223b7d7d, 1681385334),
('pgl2p5qrdjsh7d6f1od01qa2va', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137302e3537333039313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270676c3270357172646a736837643666316f6430317161327661223b7d7d, 1681401170),
('pgt9f5ar9qvv621ftucd7idcmk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639342e3337373537353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227067743966356172397176763632316674756364376964636d6b223b7d7d, 1681396694),
('pgtji4clv28i9tooq20fhj7nqd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639322e3234383235333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227067746a6934636c7632386939746f6f71323066686a376e7164223b7d7d, 1681396692),
('ph5v2sd0aapbqcsompi0u8l7aq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537332e3133373731343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227068357632736430616170627163736f6d70693075386c376171223b7d7d, 1681400573),
('phbb10cbf982c5j4niiopt5f5u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837312e3132303339353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270686262313063626639383263356a346e69696f707435663575223b7d7d, 1681399871),
('phtqkqo8sck7m3s077dpcc0icl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030342e3437343239313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706874716b716f3873636b376d3373303737647063633069636c223b7d7d, 1681401004),
('pl2u8ia0ksa89qeg4763j7qkmp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530362e3730383630343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706c3275386961306b73613839716567343736336a37716b6d70223b7d7d, 1681399506),
('plj476rg8fl22f75hoc4f9k54e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393934362e3535343636363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706c6a343736726738666c3232663735686f633466396b353465223b7d7d, 1681399946),
('plma13sgpvgd5rofnf5sai5mbb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030322e3731363035343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706c6d61313373677076676435726f666e6635736169356d6262223b7d7d, 1681401002),
('pm3fafeks7e70cphej9o08lgp4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537362e3434383432333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706d33666166656b7337653730637068656a396f30386c677034223b7d7d, 1681401576);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('pme6mj8miqd9ufqv1iqufirprh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631382e3132373436333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706d65366d6a386d697164397566717631697175666972707268223b7d7d, 1681401618),
('pmtg6pgbpgr1iptl32o0q73o0c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732352e3139303134383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706d746736706762706772316970746c33326f307137336f3063223b7d7d, 1681287725),
('pn0jqbud56cvh3o0uss7enp9k4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136322e39373930343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706e306a716275643536637668336f3075737337656e70396b34223b7d7d, 1681401162),
('pnn7j3sik2381t214592cvu0om', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936362e3230373439353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706e6e376a3373696b3233383174323134353932637675306f6d223b7d7d, 1681399966),
('pnq6m2uqgcejfvp1gj621iah2s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536382e3337383933373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706e71366d3275716763656a66767031676a3632316961683273223b7d7d, 1681209568),
('pq7c6pssgupbm3ar2he6837rod', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538392e3833393838373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227071376336707373677570626d33617232686536383337726f64223b7d7d, 1681401589),
('pqinjfcri1encg9oqmr7ddhgsn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333362e3535303030333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227071696e6a6663726931656e6367396f716d723764646867736e223b7d7d, 1681385336),
('pv1hr727od1js3sf00rmas6nui', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634362e36383838363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270763168723732376f64316a733373663030726d6173366e7569223b7d7d, 1681401646),
('pv2lbh808mms0gjnkf87s1pioe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137352e3337393736393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227076326c62683830386d6d7330676a6e6b663837733170696f65223b7d7d, 1681401175),
('pvi2292k531dof7d5ged7rooq7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137352e3937353731393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22707669323239326b353331646f6637643567656437726f6f7137223b7d7d, 1681401175),
('q0mis51i1oocq5ij2sh77pq8g8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630352e3533313235323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271306d6973353169316f6f637135696a32736837377071386738223b7d7d, 1681401605),
('q409lnqeb54s91cr04oro1p2ek', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530352e3832323537393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22713430396c6e7165623534733931637230346f726f317032656b223b7d7d, 1681399505),
('q6knbqmplq4003f4sq0tclqso2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539352e3931313235353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271366b6e62716d706c7134303033663473713074636c71736f32223b7d7d, 1681401595),
('q7fmjemcjicfp2d3qbt0bl6h10', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133312e33393136383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227137666d6a656d636a6963667032643371627430626c36683130223b7d7d, 1681401131),
('q84fdavf5qokr4n4loa9ilm4th', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437352e3637373232343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22713834666461766635716f6b72346e346c6f6139696c6d347468223b7d7d, 1681290475),
('qbnhq5pc237lbfe25mhqk17j9c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134392e32393632313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271626e68713570633233376c62666532356d68716b31376a3963223b7d7d, 1681401149),
('qdl8h3u5h47eehv3ghbs4ebuvk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383032302e3938343732363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271646c386833753568343765656876336768627334656275766b223b7d7d, 1681398020),
('qeojimrnlk1l3590i9ed080m57', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134362e3236333832383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271656f6a696d726e6c6b316c33353930693965643038306d3537223b7d7d, 1681401146),
('qg2jvqrpu5p086knt6qjdavrqr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383231332e34323034333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227167326a767172707535703038366b6e7436716a646176727172223b7d7d, 1681398213),
('qg4p2vq6p56ot6ofi4hnvmulso', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333382e3836393037343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271673470327671367035366f74366f666934686e766d756c736f223b7d7d, 1681385338),
('qi6g60bc18ja23nm5i6ibgu2i6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e3435303134353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716936673630626331386a6132336e6d35693669626775326936223b7d7d, 1681207047),
('qj5vjal8s63k36crpp070h6445', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731302e3535303336343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716a35766a616c387336336b3336637270703037306836343435223b7d7d, 1681396710),
('qj951fmkft0m9d2l347acujjdo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331352e3836353438333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716a393531666d6b6674306d3964326c3334376163756a6a646f223b7d7d, 1681385315),
('qjvf4dvh6khgim2i76kqapboje', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303939352e3030323230373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716a766634647668366b6867696d326937366b716170626f6a65223b7d7d, 1681400995),
('qk5krjqekobqnqn3q978per3ro', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334322e3638303834373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716b356b726a71656b6f62716e716e337139373870657233726f223b7d7d, 1681385342),
('qlbuel6dr847jiisc406h07o7p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032312e3931343639393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716c6275656c3664723834376a696973633430366830376f3770223b7d7d, 1681401021),
('qmsliiurc88pa47s8dp1in9h3d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331342e3634343435353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716d736c69697572633838706134377338647031696e39683364223b7d7d, 1681385314),
('qnlrlm5ep1m1cni8lo89sl28m1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335392e3139383534383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716e6c726c6d356570316d31636e69386c6f3839736c32386d31223b7d7d, 1681397359),
('qo29meks2dkgq2ho9puhg0u5i8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393933332e3436343335393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716f32396d656b7332646b677132686f39707568673075356938223b7d7d, 1681399933),
('qqnudaes6lj88c63t4ufbhjmrk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537372e3335383234343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271716e7564616573366c6a38386336337434756662686a6d726b223b7d7d, 1681401577),
('qri4oke2f1jdtn9ls1rvsel4cf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736372e3539313736363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22717269346f6b653266316a64746e396c7331727673656c346366223b7d7d, 1681399767),
('qrmfcdfngo7dqubbef3qkjhstc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732342e3931373338383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271726d666364666e676f376471756262656633716b6a68737463223b7d7d, 1681287724),
('qu2v176n0dhdl39tjpoushrj7m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537342e3634333238363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22717532763137366e306468646c3339746a706f757368726a376d223b7d7d, 1681400574),
('qu6io80m2mvv30f7m7rag6p8sc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837372e3633333139333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22717536696f38306d326d7676333066376d377261673670387363223b7d7d, 1681397877),
('qubooepu64h8ktkfj67kees14n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303634312e3031303930333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227175626f6f657075363468386b746b666a36376b65657331346e223b7d7d, 1681400641),
('r179091njed3u4fkap643g2v9b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435332e3837323233313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22723137393039316e6a6564337534666b61703634336732763962223b7d7d, 1681399453),
('r22ms73el1m8bna24tjbl4pfp9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393934392e3733343631353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227232326d733733656c316d38626e613234746a626c3470667039223b7d7d, 1681399949),
('r2gtg3lvhluh4dm0lure4tqaul', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837362e3437353439343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227232677467336c76686c756834646d306c75726534747161756c223b7d7d, 1681397876),
('r2uslm7dop9e03ai5pl4k69i1c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034362e3838323332363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22723275736c6d37646f7039653033616935706c346b3639693163223b7d7d, 1681207046),
('r3sq6fqtq6ghudhglcl1aejoqu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437332e3736323632393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22723373713666717471366768756468676c636c3161656a6f7175223b7d7d, 1681290473),
('r5u84k0uldmucbqvtqmod412lg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334322e3338383334313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272357538346b30756c646d756362717674716d6f643431326c67223b7d7d, 1681385342),
('r7l403anomsin6teun7hkglnih', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135382e3338363838393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272376c343033616e6f6d73696e367465756e37686b676c6e6968223b7d7d, 1681401158),
('r7la27imhv141q3jr4fi99uu4n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133362e3839343534373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272376c613237696d687631343171336a7234666939397575346e223b7d7d, 1681401136),
('rageufj2hnl3inhlh0nt65ushu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313537382e3536343737333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227261676575666a32686e6c33696e686c68306e74363575736875223b7d7d, 1681401578),
('rajvarv06aar20hujpmapvor35', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437332e3532303930363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272616a766172763036616172323068756a706d6170766f723335223b7d7d, 1681290473),
('rc1mq21tijrq8ncbn9bmakqup6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030332e3539313435333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227263316d71323174696a7271386e63626e39626d616b71757036223b7d7d, 1681401003),
('rc8294bo6scsic6lif1ibgpl28', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132322e3637313432313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726338323934626f367363736963366c696631696267706c3238223b7d7d, 1681401122),
('rdd2f00ugtfkk4ul5pfp2nnuhm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034352e3339323738373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272646432663030756774666b6b34756c35706670326e6e75686d223b7d7d, 1681207045),
('ree7lh60t74cg2i6c44t77q3pl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373338382e3732353437373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726565376c68363074373463673269366334347437377133706c223b7d7d, 1681397388),
('reicd0i7isg21e129dat9vv2uh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633372e3736333238363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227265696364306937697367323165313239646174397676327568223b7d7d, 1681401637),
('reln4vl65dareungb2ficf5avr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134332e3736363038353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272656c6e34766c363564617265756e6762326669636635617672223b7d7d, 1681401143),
('rf26fqgg4mn9rct0fov0fol0l3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435312e3834333339343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227266323666716767346d6e3972637430666f7630666f6c306c33223b7d7d, 1681399451),
('rg8kjtrrc684co7ag7dajbue2f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837342e3637333432343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227267386b6a74727263363834636f3761673764616a6275653266223b7d7d, 1681397874),
('rg9sko7ij0o9hbe6gv4rpqshlj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331342e3335353133353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726739736b6f37696a306f396862653667763472707173686c6a223b7d7d, 1681385314),
('rgs24lhb99a650fobjtq2s1qf7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335382e3239373239333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272677332346c6862393961363530666f626a7471327331716637223b7d7d, 1681397358),
('rgumnnm2dic5eetpln6mkkrcng', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031392e3130303535353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227267756d6e6e6d3264696335656574706c6e366d6b6b72636e67223b7d7d, 1681400019),
('rh2t2s3o0ci9d7o0ssij6efi57', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633372e3435303834343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726832743273336f3063693964376f307373696a366566693537223b7d7d, 1681400637),
('risikhbvo2f63mc1fgfjcei239', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632352e3531333133373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726973696b6862766f326636336d63316667666a636569323339223b7d7d, 1681401625),
('rjk1i2mpql07vgcoe9rh9atj67', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538322e3739303435383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726a6b3169326d70716c30377667636f653972683961746a3637223b7d7d, 1681401582),
('rjkd27f98ivsa0oi7k5m8u1gqd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437342e3734323132313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726a6b64323766393869767361306f69376b356d387531677164223b7d7d, 1681290474),
('rk9h8bfnasmo16t5hor4voa0fr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434372e3434373532323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726b39683862666e61736d6f31367435686f7234766f61306672223b7d7d, 1681399447),
('rkdggi8r3baarr3j8e7qro7di9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539312e30383039313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726b646767693872336261617272336a38653771726f37646939223b7d7d, 1681401591),
('rkkblglo2cv881mf945tqe17ru', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137332e35393238353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726b6b626c676c6f3263763838316d6639343574716531377275223b7d7d, 1681401173),
('rl52u8l2rovst181tfuka0rmsc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837352e3835313431373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726c353275386c32726f7673743138317466756b6130726d7363223b7d7d, 1681397875),
('rlgqkrqq356sghksa05gc6ou7k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133382e32383534333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726c67716b7271713335367367686b736130356763366f75376b223b7d7d, 1681401138),
('rlu9q95kr5eabm0j1tfl0hsfir', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631382e3431343933363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726c75397139356b72356561626d306a3174666c306873666972223b7d7d, 1681401618),
('rm64bgv6gdunroc0saqhfpipqf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238342e3932383033323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726d3634626776366764756e726f633073617168667069707166223b7d7d, 1681393284),
('rn3s6eh4iina4179g33d9scrjv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031322e3339393835393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726e33733665683469696e613431373967333364397363726a76223b7d7d, 1681400012),
('rn4itd3tasaksq3439s2pd4crk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363730392e3336363230343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726e3469746433746173616b737133343339733270643463726b223b7d7d, 1681396709),
('roavtdr3n3h46ep279bvcocoss', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936372e3134333230313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726f6176746472336e3368343665703237396276636f636f7373223b7d7d, 1681400967),
('roesutil116rdiupft9mndufad', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393836382e3732343030383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726f65737574696c31313672646975706674396d6e6475666164223b7d7d, 1681399868),
('rp1to446r2mvnij6u5etm0g4hr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837332e313438383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22727031746f34343672326d766e696a36753565746d3067346872223b7d7d, 1681399873),
('rplldpj9l9beo1h852rh81fegk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631352e3233373730343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272706c6c64706a396c3962656f3168383532726838316665676b223b7d7d, 1681401615),
('rqsbg39a283ia7apj0onv9i9eo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313132302e3839323637323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22727173626733396132383369613761706a306f6e76396939656f223b7d7d, 1681401120),
('rshp30om0vlf3fn3gqtfvesmpl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393935362e3436383136333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227273687033306f6d30766c6633666e33677174667665736d706c223b7d7d, 1681399956),
('rso8upajb1cp2pets5is87dui7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639362e3530323936363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272736f387570616a623163703270657473356973383764756937223b7d7d, 1681396696),
('rt01vpps78moictt704ibcpu8u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537302e3233323733393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22727430317670707337386d6f6963747437303469626370753875223b7d7d, 1681400570),
('rt6mn1s754dfpsh2sr7ovu617l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631342e3833323235373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227274366d6e31733735346466707368327372376f76753631376c223b7d7d, 1681400614),
('rtb9v9ue1hpkpvj042gk9g008p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539362e3834343637383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272746239763975653168706b70766a303432676b396730303870223b7d7d, 1681400596),
('rugg3vro792ns0livchtj93qqj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393837302e35333332323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22727567673376726f3739326e73306c69766368746a393371716a223b7d7d, 1681399870),
('rv8gcraj4uqhdfuieh0u2h57ae', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313031382e3235313234343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22727638676372616a347571686466756965683075326835376165223b7d7d, 1681401018),
('rvildf12i59djo8ucc3o80hrh6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032392e3239373234333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227276696c64663132693539646a6f38756363336f383068726836223b7d7d, 1681401029),
('s0hch20f202dl9u8p76i95jj7v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630342e3033363531373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227330686368323066323032646c3975387037366939356a6a3776223b7d7d, 1681400604),
('s0nafrb6a4kg57lud1o1d8mtpn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238312e3935363238323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273306e616672623661346b6735376c7564316f3164386d74706e223b7d7d, 1681393281),
('s0qbn16ej1lbvroo50l56tv73k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031332e3634323034363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22733071626e3136656a316c6276726f6f35306c3536747637336b223b7d7d, 1681400013),
('s199pfnuv9du1hcrk5t4jqb3pb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135352e3333313737313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227331393970666e7576396475316863726b3574346a7162337062223b7d7d, 1681401155),
('s1cgf4qn0h6rk3rcl1bldo9qv9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030372e3733343937343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22733163676634716e306836726b3372636c31626c646f39717639223b7d7d, 1681400007),
('s1h7loh4oop3vklah19ql9q5eh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632342e3232343630363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22733168376c6f68346f6f7033766b6c61683139716c3971356568223b7d7d, 1681400624),
('s2ienkd0a7q23unjigrgvu86dv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937382e3939303235383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22733269656e6b64306137713233756e6a69677267767538366476223b7d7d, 1681400979),
('s3v07gik2ct5n3pf8pci1jj7ha', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632372e3234313333343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22733376303767696b326374356e33706638706369316a6a376861223b7d7d, 1681400627),
('s4tj6jrei0thqmkd26fv19ub35', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333352e3131383334363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227334746a366a726569307468716d6b6432366676313975623335223b7d7d, 1681385335),
('s563h8ffa15hi9mpmh86leqiqg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335372e39393135393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273353633683866666131356869396d706d6838366c6571697167223b7d7d, 1681397358),
('s5gm6eea9f27e96bssa1i4b6sk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437312e3934363536313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227335676d3665656139663237653936627373613169346236736b223b7d7d, 1681290471),
('s5n4ek13rp8hq3t5hoe4dh31fb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435352e3635363637353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273356e34656b31337270386871337435686f6534646833316662223b7d7d, 1681399455),
('s6n48udnu3apl9iqlqcf8r3djf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032332e3836383234323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273366e343875646e753361706c3969716c716366387233646a66223b7d7d, 1681401023),
('s6u06hrh4qj6kjg8cuff2k805l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137312e3139313939393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22733675303668726834716a366b6a673863756666326b3830356c223b7d7d, 1681401171),
('s7am13vulqve6ip8d4a5pcvq16', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313634322e3133363138323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227337616d313376756c7176653669703864346135706376713136223b7d7d, 1681401642),
('s86ut1cb83m1ipd300mpblpqem', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134312e3335303033343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22733836757431636238336d316970643330306d70626c7071656d223b7d7d, 1681401141),
('s9asd2cqlalqpl6lci9mf8guac', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303031372e3238303232333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273396173643263716c616c71706c366c6369396d663867756163223b7d7d, 1681400017),
('s9r06j725c18uslss2vd58kij1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538372e3337373434313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273397230366a37323563313875736c737332766435386b696a31223b7d7d, 1681401587),
('sa37o7d62rlt76eg484a0eeefu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632392e3138343839333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736133376f37643632726c743736656734383461306565656675223b7d7d, 1681401629),
('sap72r4nkbi02iulj17qeal3be', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232382e3336313838343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736170373272346e6b6269303269756c6a31377165616c336265223b7d7d, 1681290228),
('sb7o5066if3plv7ou3k617uf9d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135332e3439363931393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227362376f35303636696633706c76376f75336b36313775663964223b7d7d, 1681401153),
('sbgol4kfpad22h8uren60gjmqi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393938372e36363736363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227362676f6c346b66706164323268387572656e3630676a6d7169223b7d7d, 1681399987),
('sblovn848mq05fnk85h3tub2sv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732362e31373639373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273626c6f766e3834386d713035666e6b38356833747562327376223b7d7d, 1681287726),
('sbov750ft9von5toc7pde64lch', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133302e3132323638323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273626f76373530667439766f6e35746f633770646536346c6368223b7d7d, 1681401130),
('se9tkisfjhom4hhm56jcv27sjr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393836392e30323237393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736539746b6973666a686f6d3468686d35366a63763237736a72223b7d7d, 1681399869),
('sg9ojo61fukldrtm9o5534dsrv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137322e3938393232383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227367396f6a6f363166756b6c6472746d396f3535333464737276223b7d7d, 1681401173),
('sjqffdpp06b55i706216vj3so5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134372e3437353835313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736a716666647070303662353569373036323136766a33736f35223b7d7d, 1681401147),
('sjrr3rs1gakejicj664djv403q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936382e3539323934373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736a72723372733167616b656a69636a363634646a7634303371223b7d7d, 1681399968),
('skpc9gnrthi83rv5lu4f6f7a4d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632312e3933303737333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736b706339676e7274686938337276356c753466366637613464223b7d7d, 1681401621),
('sl3q2o2p9gnkd6e1pv45qnmb65', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936352e3038343433333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736c3371326f327039676e6b6436653170763435716e6d623635223b7d7d, 1681400965),
('sl8d1eakgcof7md4cpnh22o895', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383130342e3639373533393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736c38643165616b67636f66376d643463706e6832326f383935223b7d7d, 1681398104),
('sll7tgaq6op42pjkcokrecr0t0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936342e3339363339373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736c6c3774676171366f703432706a6b636f6b72656372307430223b7d7d, 1681399964),
('sn65i6v963s2i54tlh3dhkr7pn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303539332e3832343833373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736e36356936763936337332693534746c683364686b7237706e223b7d7d, 1681400593),
('snsm19pgp77hf907141ahum69p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033322e3336323439373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736e736d3139706770373768663930373134316168756d363970223b7d7d, 1681401032),
('sok7oousn35chq1ptuqlouuj63', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631322e3932343137333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736f6b376f6f75736e333563687131707475716c6f75756a3633223b7d7d, 1681400612),
('soqlu828p5vu1s89semjtchelh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536362e3733373236323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736f716c75383238703576753173383973656d6a746368656c68223b7d7d, 1681209566),
('sp4kns5g4g68tcr9k684o789sv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536322e3739313831323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227370346b6e73356734673638746372396b3638346f3738397376223b7d7d, 1681206562),
('spbpl40jims3hvb50f6bra4u88', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537322e3536353336373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22737062706c34306a696d73336876623530663662726134753838223b7d7d, 1681400572),
('ss4r462if2bgum9vmumq13pdro', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937352e3834333531333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22737334723436326966326267756d39766d756d7131337064726f223b7d7d, 1681399975),
('ssfpv636dq2lh1v1v5mpi2s2v3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e3534373030393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273736670763633366471326c6831763176356d70693273327633223b7d7d, 1681207047),
('st3lqu00dk2il027h04m661ae5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333362e3834383238353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227374336c71753030646b32696c3032376830346d363631616535223b7d7d, 1681385336),
('stulqn9kf1fkpv2llcb20fqcmu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339383230382e3338383930353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227374756c716e396b6631666b7076326c6c636232306671636d75223b7d7d, 1681398208),
('suf5u0vlplt0nv8sa1r345530k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313135342e3130343632373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22737566357530766c706c74306e7638736131723334353533306b223b7d7d, 1681401154),
('svemhids44obmqtvc1l7iif0e4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313539332e3530363036353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227376656d6869647334346f626d71747663316c37696966306534223b7d7d, 1681401593),
('svogvrr87u2coqibcq8m9js0he', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530332e3031373835383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273766f6776727238377532636f7169626371386d396a73306865223b7d7d, 1681399503),
('t0fep5kusmr00c7d6oq16nhh4e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303437332e3033373535393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227430666570356b75736d723030633764366f7131366e68683465223b7d7d, 1681290473),
('t1nlii6oedfk98gmvtpvf2j6nm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313133322e3634333731383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274316e6c6969366f6564666b3938676d7674707666326a366e6d223b7d7d, 1681401132),
('t1ufsmpll9vlellmffn69j1agt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530312e3632303434383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274317566736d706c6c39766c656c6c6d66666e36396a31616774223b7d7d, 1681399501),
('t2r7be63t8et837vdhmndurl8h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936312e3936323934373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227432723762653633743865743833377664686d6e6475726c3868223b7d7d, 1681399961),
('t3ld1rjer2j7bgfk3c4sn2fucd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538382e3335343830313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274336c6431726a6572326a376267666b336334736e3266756364223b7d7d, 1681400588),
('t4tilgfm5d1otskds2tcgagk4n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030302e3632343538383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22743474696c67666d3564316f74736b64733274636761676b346e223b7d7d, 1681401000),
('t6ju134k4uu9b82jbeuvkgj4br', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837352e3237343830353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274366a753133346b347575396238326a626575766b676a346272223b7d7d, 1681397875),
('t8qq86et94po24qjg88qkq2n0n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363730382e3135343030353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274387171383665743934706f3234716a673838716b71326e306e223b7d7d, 1681396708),
('t9cdsgl512duknha29n0kn4psq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330382e3931323532333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227439636473676c35313264756b6e686132396e306b6e34707371223b7d7d, 1681385308),
('taqhn285ti3df29b0okj4kpeav', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030332e3031343330343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746171686e3238357469336466323962306f6b6a346b70656176223b7d7d, 1681401003),
('tbf16dr931utpu82nd8cjtkhal', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731312e3732353639363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746266313664723933317574707538326e6438636a746b68616c223b7d7d, 1681396711),
('tc2dmi7kc5kq2l6jg4fntqkceg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833342e3632323730333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746332646d69376b63356b71326c366a6734666e74716b636567223b7d7d, 1681397834),
('terf6eq2krqg6t5v5r7pc62nn5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313239303232372e34363535383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274657266366571326b72716736743576357237706336326e6e35223b7d7d, 1681290227),
('tgq1sg9qkk4bj58ig92ktg63v0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631362e3636313034373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274677131736739716b6b34626a3538696739326b746736337630223b7d7d, 1681401616);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ti19kho8gb3trrur1bjoj6f6bo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937372e3031313335343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746931396b686f38676233747272757231626a6f6a366636626f223b7d7d, 1681399977),
('tibdoa4omslio2pcfvuch7868k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630362e3438373736323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746962646f61346f6d736c696f3270636676756368373836386b223b7d7d, 1681400606),
('tk6cllmfkuorsd0d6f93d4f479', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138302e3332333637393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746b36636c6c6d666b756f727364306436663933643466343739223b7d7d, 1681401180),
('tko45su7k9dchsacj9tucgnn3p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230363536352e3635333932363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746b6f34357375376b396463687361636a39747563676e6e3370223b7d7d, 1681206565),
('tp14da5gpf7vkgdg54vn5lq620', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363730392e3935393837323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227470313464613567706637766b6764673534766e356c71363230223b7d7d, 1681396709),
('tpo39h11r369q3v8v1dlbegb0j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536372e3138383338333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274706f333968313172333639713376387631646c62656762306a223b7d7d, 1681209567),
('tqn1taj49pphvadujd1oqna2j5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303938392e39383833323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274716e3174616a3439707068766164756a64316f716e61326a35223b7d7d, 1681400990),
('tqu9db2dke2r05d91ret4o0lek', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134332e3136373034373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274717539646232646b6532723035643931726574346f306c656b223b7d7d, 1681401143),
('tr6mmv185dss8kudl4onsa014l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393836392e3932353138383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227472366d6d76313835647373386b75646c346f6e73613031346c223b7d7d, 1681399869),
('tt0t333dq3rntjkmii6ndbtkdn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393937322e3931373036363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274743074333333647133726e746a6b6d6969366e6462746b646e223b7d7d, 1681399972),
('ttpu0pq915dga4kqp16cidbfo8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936342e39393039353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274747075307071393135646761346b7170313663696462666f38223b7d7d, 1681399965),
('tugns5igfq8jjuct13e9vqq89j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631332e3533323538383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227475676e733569676671386a6a7563743133653976717138396a223b7d7d, 1681400613),
('u01qtj5s5b9folo6amqe0ssfj9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335302e3837323238333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275303171746a3573356239666f6c6f36616d7165307373666a39223b7d7d, 1681397350),
('u0546thdpm83u1k4iisl79mp5a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334312e3138333933353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227530353436746864706d383375316b346969736c37396d703561223b7d7d, 1681385341),
('u0abul3s3j7v2d0k3p3gs96v4j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e373434363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275306162756c3373336a37763264306b3370336773393676346a223b7d7d, 1681207047),
('u3vl59tdp8pdf2ad2n16g81s3m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538322e3234333238343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227533766c353974647038706466326164326e313667383173336d223b7d7d, 1681400582),
('u5ehd8s33q8gthfhlv9nmk2hhp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138362e3430383431343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22753565686438733333713867746866686c76396e6d6b32686870223b7d7d, 1681401186),
('u6dq8k4fsto58ndgaig2f04vja', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439382e3334303938343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275366471386b346673746f35386e646761696732663034766a61223b7d7d, 1681399498),
('u792kfp61a0ifv9se7p1t9f38g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530312e3332323534323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22753739326b667036316130696676397365377031743966333867223b7d7d, 1681399501),
('u7r7g2es4k3ahcku9q9a3cble0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238342e3030383234353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227537723767326573346b336168636b75397139613363626c6530223b7d7d, 1681393284),
('u82m1queqopq250a2s80f1t6lf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538392e3535303733383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227538326d31717565716f70713235306132733830663174366c66223b7d7d, 1681400589),
('u8pesn8m0k9trbuqoe56nsf4k4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393737302e32333738323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275387065736e386d306b3974726275716f6535366e7366346b34223b7d7d, 1681399770),
('uaant68ma1vlnaus4023m2aot5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033352e3338353232323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227561616e7436386d6131766c6e617573343032336d32616f7435223b7d7d, 1681401035),
('uabl9n14hbccbm6ej3sml8b6ph', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736382e3434363231343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227561626c396e313468626363626d36656a33736d6c3862367068223b7d7d, 1681399768),
('ub1va8hbbsk338a1uqlthcrads', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353333382e32373534333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756231766138686262736b333338613175716c74686372616473223b7d7d, 1681385338),
('uc4o0nc4u48ebeqtgrpo0qpnl0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630312e3033383230343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227563346f306e633475343865626571746772706f3071706e6c30223b7d7d, 1681400601),
('uc8h2r9gg8ptsi496squrju70r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313538302e3035313832373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227563386832723967673870747369343936737175726a75373072223b7d7d, 1681401580),
('ucp2nes6tpthpjqq9756q8k13m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030332e3838353734343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756370326e65733674707468706a71713937353671386b31336d223b7d7d, 1681401003),
('udnk3nb6s0cvin15g2nqhchf7r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633382e3034333438333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275646e6b336e623673306376696e313567326e71686368663772223b7d7d, 1681400638),
('udnnr8edgddbtqccogm2ialjhl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303633352e3537333436393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275646e6e7238656467646462747163636f676d3269616c6a686c223b7d7d, 1681400635),
('ue2eft9d2kbim86olb2g0jrcnv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393530342e3333363337313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227565326566743964326b62696d38366f6c623267306a72636e76223b7d7d, 1681399504),
('ueij2t8lqul08k1aloopnqse8a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313139312e3830323233333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227565696a3274386c71756c30386b31616c6f6f706e7173653861223b7d7d, 1681401191),
('uf9nb31a7dg812ogfiihu4h5g1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137322e3339343038363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227566396e623331613764673831326f6766696968753468356731223b7d7d, 1681401172),
('ufjsdtpn1r92sgb67gutuostei', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631362e3830383934373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275666a736474706e317239327367623637677574756f73746569223b7d7d, 1681400616),
('uit5j0e73nbh2ghani8uj4v5vv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373334372e3631343639373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756974356a306537336e6268326768616e6938756a3476357676223b7d7d, 1681397347),
('uit73b62r47bu9c24nhplabiio', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373833322e3534373930363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275697437336236327234376275396332346e68706c616269696f223b7d7d, 1681397832),
('uls9odvms2r71com52tv0u22dd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331322e3633373739393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756c73396f64766d7332723731636f6d35327476307532326464223b7d7d, 1681385312),
('umim0t23k0iaqb2du858bopn32', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630302e3435303036323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756d696d307432336b3069617162326475383538626f706e3332223b7d7d, 1681400600),
('umm4840gil00cp9i9fv0udffqt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630392e3638343834363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756d6d3438343067696c30306370396939667630756466667174223b7d7d, 1681400609),
('un2hvvih5dpgfsaii0nn0pg47b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393439372e3132393036383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756e326876766968356470676673616969306e6e307067343762223b7d7d, 1681399497),
('un8glkg6hjeobrcs840f8g0dvc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030352e3931353330323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756e38676c6b6736686a656f6272637338343066386730647663223b7d7d, 1681400005),
('unpuedacd7fq7sb9q14sm6r4fq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393737302e3832313134343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756e7075656461636437667137736239713134736d3672346671223b7d7d, 1681399770),
('uongvu7756qqehaa8hml8dkmq7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303631312e3432313836343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756f6e6776753737353671716568616138686d6c38646b6d7137223b7d7d, 1681400611),
('up7jvi42bk5hb20rohfh1um1r0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030382e39343931323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227570376a76693432626b3568623230726f68666831756d317230223b7d7d, 1681400008),
('upaatk0oqddb6ooibahc9tiu2o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137342e3830353931353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275706161746b306f71646462366f6f696261686339746975326f223b7d7d, 1681401174),
('upq21sijjiliq1tvis0954v087', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303030372e3132333332313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22757071323173696a6a696c697131747669733039353476303837223b7d7d, 1681400007),
('uq5lon18no17l1njre0evnglqm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363639342e3638363530363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227571356c6f6e31386e6f31376c316e6a72653065766e676c716d223b7d7d, 1681396694),
('us2pkhquqrhcf2d8osreq28jpq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732352e3433363136343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22757332706b68717571726863663264386f7372657132386a7071223b7d7d, 1681287725),
('usg4ss2ntneeucudlcmv38gs1h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339333238352e35313834393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22757367347373326e746e6565756375646c636d76333867733168223b7d7d, 1681393285),
('ushg15m966t4h94mvfbcvaibhi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303634322e3738393639333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227573686731356d39363674346839346d76666263766169626869223b7d7d, 1681400642),
('usiajb1nel490u6r05ojb21ik5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633362e3534353039323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22757369616a62316e656c34393075367230356f6a623231696b35223b7d7d, 1681401636),
('usilstfdj9rf7igfs1n3khr83s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393435322e3432303731323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227573696c737466646a3972663769676673316e336b6872383373223b7d7d, 1681399452),
('utrjkv5dm8175dvea79daq3kmf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736352e3334333735343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227574726a6b7635646d38313735647665613739646171336b6d66223b7d7d, 1681399765),
('uufaq8jee5e17nljh3lbngu0ma', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373336312e3239353138363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227575666171386a6565356531376e6c6a68336c626e6775306d61223b7d7d, 1681397361),
('uupkgnu8r2oin4h2c9iup63cs8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373335322e39343031343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227575706b676e753872326f696e34683263396975703633637338223b7d7d, 1681397352),
('uvom077hcddj8drhm57k38jhvk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313630342e3931343835363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275766f6d303737686364646a386472686d35376b33386a68766b223b7d7d, 1681401604),
('v0381mctaihd05r9q5bgtdbq2n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303937352e3930323135353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276303338316d637461696864303572397135626774646271326e223b7d7d, 1681400975),
('v0feln2or1u2fin3um2jd8du9k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393736362e3731383937313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22763066656c6e326f7231753266696e33756d326a64386475396b223b7d7d, 1681399766),
('v37rf7ffb9007mrevmk8fterh7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353331322e3931343232343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22763337726637666662393030376d7265766d6b38667465726837223b7d7d, 1681385312),
('v3h8ut7evrisvijubt102l8uc2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353330392e3532383132343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276336838757437657672697376696a7562743130326c38756332223b7d7d, 1681385309),
('v419aoievb8jj8c3kbvqjaus2m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313030382e3832363731373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276343139616f69657662386a6a3863336b6276716a617573326d223b7d7d, 1681401008),
('v52sombs2tv8ihm38orji5v2db', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230373034372e33343535333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22763532736f6d62733274763869686d33386f726a693576326462223b7d7d, 1681207047),
('va0bjan9m850bqsctq9iccdq81', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393936302e3732343035323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766130626a616e396d3835306271736374713969636364713831223b7d7d, 1681399960),
('vbe1630dar9i1phc7ifp0aqqnc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313139312e3139343730313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227662653136333064617239693170686337696670306171716e63223b7d7d, 1681401191),
('vc4q9tvkf7t9dpgr3k5r2i544s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313238373732362e3838393131313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766334713974766b6637743964706772336b3572326935343473223b7d7d, 1681287726),
('vc7rvsmcve9tgn0hbqbn4okr8j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313631322e3333303637343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227663377276736d6376653974676e30686271626e346f6b72386a223b7d7d, 1681401612),
('vddg4oq0g96e93vhj5r7vhr9f6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313033342e3737323631343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276646467346f713067393665393376686a357237766872396636223b7d7d, 1681401034),
('vdi1lall70p4tt6n08le4ih140', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334332e3833343733343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766469316c616c6c373070347474366e30386c65346968313430223b7d7d, 1681385343),
('veju0v2ejsu4ljmkg07ts77mvq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313635302e3936353337363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276656a75307632656a7375346c6a6d6b673037747337376d7671223b7d7d, 1681401650),
('vgljub54kukpdfqteptv71dp18', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536352e3531303232323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276676c6a756235346b756b706466717465707476373164703138223b7d7d, 1681209565),
('vig1vmb69gda60er2lt00fugsp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313632372e3936313731383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276696731766d62363967646136306572326c7430306675677370223b7d7d, 1681401627),
('vj5p9r7oep4r9o2ne54btv8qcb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313338353334302e3839363733313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766a35703972376f65703472396f326e65353462747638716362223b7d7d, 1681385340),
('vjlv5dlfgd1rebt9hirip7ma3d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303630392e39373530383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766a6c7635646c6667643172656274396869726970376d613364223b7d7d, 1681400609),
('vksdh92rliu4nb4dm3j3e0a6ms', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137392e3031333231363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766b7364683932726c6975346e6234646d336a33653061366d73223b7d7d, 1681401179),
('vlb0sc0rvr89v5irbq9pbheohc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303538342e3730333831323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766c6230736330727672383976356972627139706268656f6863223b7d7d, 1681400584),
('vlineo071svdn6dcgs0roe77kk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313137382e33343737373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766c696e656f3037317376646e366463677330726f6537376b6b223b7d7d, 1681401178),
('vlkktfv5fp2m4jt85mst0tvlpn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313136322e3336333333313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766c6b6b746676356670326d346a7438356d73743074766c706e223b7d7d, 1681401162),
('vm7utu85hop18cjtv5sh2lvfmc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313230393536362e3936333834313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766d377574753835686f703138636a7476357368326c76666d63223b7d7d, 1681209566),
('vmcjfdve0uls1626ol393n8ko2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936362e3535323033343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766d636a6664766530756c73313632366f6c3339336e386b6f32223b7d7d, 1681400966),
('vml0cubht92oh458o0ne7aq8ho', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339373837362e3736323636373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766d6c30637562687439326f683435386f306e6537617138686f223b7d7d, 1681397876),
('vnm143rm7uidcas5kcg6pk9onb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303632302e35343231333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766e6d313433726d37756964636173356b636736706b396f6e62223b7d7d, 1681400620),
('vo4d0rp77ts2q6u85hjmvllc48', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393739382e3631373231383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766f346430727037377473327136753835686a6d766c6c633438223b7d7d, 1681399798),
('voefrf31sab4okg2b5givkqefs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303936372e34333931323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766f656672663331736162346f6b673262356769766b71656673223b7d7d, 1681400967),
('vpctjl67rl4k6e7htp3me86293', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313032382e3037363937343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22767063746a6c3637726c346b366537687470336d653836323933223b7d7d, 1681401028),
('vphk5mj69jm1ni0aiciq2otv6t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339363731322e3331393836323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227670686b356d6a36396a6d316e69306169636971326f74763674223b7d7d, 1681396712),
('vrbcfsq0ag2pqdub8t024m4n7p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430303537362e3431313038383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227672626366737130616732707164756238743032346d346e3770223b7d7d, 1681400576),
('vs7bh9rupmmun31mt0mmqlugo7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313138332e33393630333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227673376268397275706d6d756e33316d74306d6d716c75676f37223b7d7d, 1681401183),
('vtpac5fn3t8d445adf3mkrqv2s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313134392e3930333936383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22767470616335666e33743864343435616466336d6b7271763273223b7d7d, 1681401149),
('vtqm59gd7u4qk6ig9iti9uepvv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393434382e3132343037373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227674716d35396764377534716b36696739697469397565707676223b7d7d, 1681399448),
('vui1m2avfhclosuo3n8avue2c6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313430313633322e3232313235373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22767569316d3261766668636c6f73756f336e3861767565326336223b7d7d, 1681401632),
('vuukk9heokt6kvcs0hn69h48a2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313638313339393739382e33323032333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227675756b6b3968656f6b74366b76637330686e36396834386132223b7d7d, 1681399798);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"omeka@coret.org\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"OmekaDev\"'),
('locale', '\"nl_NL\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Amsterdam\"'),
('version', '\"4.0.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'admin@example.com', 'admin', '2023-04-06 08:40:22', '2023-04-06 08:40:22', '$2y$10$AIfSe9lJyjgyhVUFhtj5pOCMhRwplSI07ww1xrdAQEuMmmgs4bTZ6', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(1, 1, 1, NULL, NULL, 'literal', '', 'Organisaties A-Z', NULL, 1),
(2, 2, 1, NULL, NULL, 'literal', '', 'Personen 0-9', NULL, 1),
(72, 21, 2902, NULL, NULL, 'literal', '', 'personen.ttl', NULL, 1),
(73, 21, 2189, NULL, NULL, 'literal', '', 'test', NULL, 1),
(74, 21, 2775, NULL, NULL, 'customvocab:7', NULL, 'text/turtle', NULL, 1),
(75, 22, 2902, NULL, NULL, 'literal', '', 'Personen', NULL, 1),
(76, 22, 2978, 3, NULL, 'resource:item', NULL, NULL, NULL, 1),
(77, 22, 3025, NULL, NULL, 'customvocab:6', NULL, 'CC0 1.0 Universal (CC0 1.0) Public Domain Dedication', 'http://creativecommons.org/publicdomain/zero/1.0/', 1),
(78, 22, 1734, 21, NULL, 'resource:item', NULL, NULL, NULL, 1),
(79, 22, 2837, 2, NULL, 'resource', NULL, NULL, NULL, 1),
(80, 23, 2902, NULL, NULL, 'literal', '', 'Test', NULL, 1),
(81, 23, 3051, 22, NULL, 'resource:item', NULL, NULL, NULL, 1),
(82, 23, 2978, 4, NULL, 'resource:item', NULL, NULL, NULL, 1),
(83, 21, 2288, NULL, NULL, 'uri', '', '', 'TODO', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(6, 1, 'https://schema.org/', 'sdo', 'Schema.org for LinkedDataSets', 'A small portion of the large Schema.org vocabulary with the base properties and classes to describe Linked Datasets.');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Indexen voor tabel `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Indexen voor tabel `custom_vocab`
--
ALTER TABLE `custom_vocab`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8533D2A5EA750E8` (`label`),
  ADD KEY `IDX_8533D2A5960278D7` (`item_set_id`),
  ADD KEY `IDX_8533D2A57E3C61F9` (`owner_id`);

--
-- Indexen voor tabel `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Indexen voor tabel `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Indexen voor tabel `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Indexen voor tabel `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Indexen voor tabel `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Indexen voor tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Indexen voor tabel `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `numeric_data_types_duration`
--
ALTER TABLE `numeric_data_types_duration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E1B5FC6089329D25` (`resource_id`),
  ADD KEY `IDX_E1B5FC60549213EC` (`property_id`),
  ADD KEY `property_value` (`property_id`,`value`),
  ADD KEY `value` (`value`);

--
-- Indexen voor tabel `numeric_data_types_integer`
--
ALTER TABLE `numeric_data_types_integer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6D39C79089329D25` (`resource_id`),
  ADD KEY `IDX_6D39C790549213EC` (`property_id`),
  ADD KEY `property_value` (`property_id`,`value`),
  ADD KEY `value` (`value`);

--
-- Indexen voor tabel `numeric_data_types_interval`
--
ALTER TABLE `numeric_data_types_interval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7E2C936B89329D25` (`resource_id`),
  ADD KEY `IDX_7E2C936B549213EC` (`property_id`),
  ADD KEY `property_value` (`property_id`,`value`),
  ADD KEY `value` (`value`);

--
-- Indexen voor tabel `numeric_data_types_timestamp`
--
ALTER TABLE `numeric_data_types_timestamp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7367AFAA89329D25` (`resource_id`),
  ADD KEY `IDX_7367AFAA549213EC` (`property_id`),
  ADD KEY `property_value` (`property_id`,`value`),
  ADD KEY `value` (`value`);

--
-- Indexen voor tabel `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Indexen voor tabel `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Indexen voor tabel `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`);

--
-- Indexen voor tabel `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Indexen voor tabel `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Indexen voor tabel `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Indexen voor tabel `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Indexen voor tabel `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Indexen voor tabel `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Indexen voor tabel `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Indexen voor tabel `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Indexen voor tabel `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Indexen voor tabel `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indexen voor tabel `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Indexen voor tabel `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190));

--
-- Indexen voor tabel `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `custom_vocab`
--
ALTER TABLE `custom_vocab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `numeric_data_types_duration`
--
ALTER TABLE `numeric_data_types_duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `numeric_data_types_integer`
--
ALTER TABLE `numeric_data_types_integer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `numeric_data_types_interval`
--
ALTER TABLE `numeric_data_types_interval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `numeric_data_types_timestamp`
--
ALTER TABLE `numeric_data_types_timestamp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3089;

--
-- AUTO_INCREMENT voor een tabel `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT voor een tabel `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1892;

--
-- AUTO_INCREMENT voor een tabel `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT voor een tabel `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT voor een tabel `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Beperkingen voor tabel `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `custom_vocab`
--
ALTER TABLE `custom_vocab`
  ADD CONSTRAINT `FK_8533D2A57E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8533D2A5960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `numeric_data_types_duration`
--
ALTER TABLE `numeric_data_types_duration`
  ADD CONSTRAINT `FK_E1B5FC60549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E1B5FC6089329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `numeric_data_types_integer`
--
ALTER TABLE `numeric_data_types_integer`
  ADD CONSTRAINT `FK_6D39C790549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D39C79089329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `numeric_data_types_interval`
--
ALTER TABLE `numeric_data_types_interval`
  ADD CONSTRAINT `FK_7E2C936B549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7E2C936B89329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `numeric_data_types_timestamp`
--
ALTER TABLE `numeric_data_types_timestamp`
  ADD CONSTRAINT `FK_7367AFAA549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7367AFAA89329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Beperkingen voor tabel `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Beperkingen voor tabel `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Beperkingen voor tabel `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Beperkingen voor tabel `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
