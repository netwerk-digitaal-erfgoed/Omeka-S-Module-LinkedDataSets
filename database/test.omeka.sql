-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Gegenereerd op: 13 apr 2023 om 07:03
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
(1, NULL, 1, 'LDS Media Types', NULL, '[\"application\\/1d-interleaved-parityfec\",\"application\\/3gpdash-qoe-report+xml\",\"application\\/3gpp-ims+xml\",\"application\\/A2L\",\"application\\/activemessage\",\"application\\/activity+json\",\"application\\/alto-costmap+json\",\"application\\/alto-costmapfilter+json\",\"application\\/alto-directory+json\",\"application\\/alto-endpointcost+json\",\"application\\/alto-endpointcostparams+json\",\"application\\/alto-endpointprop+json\",\"application\\/alto-endpointpropparams+json\",\"application\\/alto-error+json\",\"application\\/alto-networkmap+json\",\"application\\/alto-networkmapfilter+json\",\"application\\/AML\",\"application\\/andrew-inset\",\"application\\/applefile\",\"application\\/ATF\",\"application\\/ATFX\",\"application\\/atom+xml\",\"application\\/atomcat+xml\",\"application\\/atomdeleted+xml\",\"application\\/atomicmail\",\"application\\/atomsvc+xml\",\"application\\/ATXML\",\"application\\/auth-policy+xml\",\"application\\/bacnet-xdd+zip\",\"application\\/batch-SMTP\",\"application\\/beep+xml\",\"application\\/calendar+json\",\"application\\/calendar+xml\",\"application\\/call-completion\",\"application\\/CALS-1840\",\"application\\/cbor\",\"application\\/cccex\",\"application\\/ccmp+xml\",\"application\\/ccxml+xml\",\"application\\/CDFX+XML\",\"application\\/cdmi-capability\",\"application\\/cdmi-container\",\"application\\/cdmi-domain\",\"application\\/cdmi-object\",\"application\\/cdmi-queue\",\"application\\/cdni\",\"application\\/CEA\",\"application\\/cea-2018+xml\",\"application\\/cellml+xml\",\"application\\/cfw\",\"application\\/clue_info+xml\",\"application\\/cms\",\"application\\/cnrp+xml\",\"application\\/coap-group+json\",\"application\\/coap-payload\",\"application\\/commonground\",\"application\\/conference-info+xml\",\"application\\/cose\",\"application\\/cose-key\",\"application\\/cose-key-set\",\"application\\/cpl+xml\",\"application\\/csrattrs\",\"application\\/csta+xml\",\"application\\/CSTAdata+xml\",\"application\\/csvm+json\",\"application\\/cwt\",\"application\\/cybercash\",\"application\\/dash+xml\",\"application\\/dashdelta\",\"application\\/davmount+xml\",\"application\\/dca-rft\",\"application\\/DCD\",\"application\\/dec-dx\",\"application\\/dialog-info+xml\",\"application\\/dicom\",\"application\\/dicom+json\",\"application\\/dicom+xml\",\"application\\/DII\",\"application\\/DIT\",\"application\\/dns\",\"application\\/dskpp+xml\",\"application\\/dssc+der\",\"application\\/dssc+xml\",\"application\\/dvcs\",\"application\\/ecmascript\",\"application\\/EDI-consent\",\"application\\/EDI-X12\",\"application\\/EDIFACT\",\"application\\/efi\",\"application\\/EmergencyCallData.Comment+xml\",\"application\\/EmergencyCallData.Control+xml\",\"application\\/EmergencyCallData.DeviceInfo+xml\",\"application\\/EmergencyCallData.eCall.MSD\",\"application\\/EmergencyCallData.ProviderInfo+xml\",\"application\\/EmergencyCallData.ServiceInfo+xml\",\"application\\/EmergencyCallData.SubscriberInfo+xml\",\"application\\/EmergencyCallData.VEDS+xml\",\"application\\/emotionml+xml\",\"application\\/encaprtp\",\"application\\/epp+xml\",\"application\\/epub+zip\",\"application\\/eshop\",\"application\\/example\",\"application\\/fastinfoset\",\"application\\/fastsoap\",\"application\\/fdt+xml\",\"application\\/fhir+json\",\"application\\/fhir+xml\",\"application\\/fits\",\"application\\/font-sfnt\",\"application\\/font-tdpfr\",\"application\\/font-woff\",\"application\\/framework-attributes+xml\",\"application\\/geo+json\",\"application\\/geo+json-seq\",\"application\\/geoxacml+xml\",\"application\\/gml+xml\",\"application\\/gzip\",\"application\\/H224\",\"application\\/held+xml\",\"application\\/http\",\"application\\/hyperstudio\",\"application\\/ibe-key-request+xml\",\"application\\/ibe-pkg-reply+xml\",\"application\\/ibe-pp-data\",\"application\\/iges\",\"application\\/im-iscomposing+xml\",\"application\\/index\",\"application\\/index-obj\",\"application\\/index.cmd\",\"application\\/index.response\",\"application\\/index.vnd\",\"application\\/inkml+xml\",\"application\\/IOTP\",\"application\\/ipfix\",\"application\\/ipp\",\"application\\/ISUP\",\"application\\/its+xml\",\"application\\/javascript\",\"application\\/jf2feed+json\",\"application\\/jose\",\"application\\/jose+json\",\"application\\/jrd+json\",\"application\\/json\",\"application\\/json-patch+json\",\"application\\/json-seq\",\"application\\/jwk+json\",\"application\\/jwk-set+json\",\"application\\/jwt\",\"application\\/kpml-request+xml\",\"application\\/kpml-response+xml\",\"application\\/ld+json\",\"application\\/ld+json+gzip\",\"application\\/lgr+xml\",\"application\\/link-format\",\"application\\/load-control+xml\",\"application\\/lost+xml\",\"application\\/lostsync+xml\",\"application\\/LXF\",\"application\\/mac-binhex40\",\"application\\/macwriteii\",\"application\\/mads+xml\",\"application\\/marc\",\"application\\/marcxml+xml\",\"application\\/mathematica\",\"application\\/mbms-associated-procedure-description+xml\",\"application\\/mbms-deregister+xml\",\"application\\/mbms-envelope+xml\",\"application\\/mbms-msk+xml\",\"application\\/mbms-msk-response+xml\",\"application\\/mbms-protection-description+xml\",\"application\\/mbms-reception-report+xml\",\"application\\/mbms-register+xml\",\"application\\/mbms-register-response+xml\",\"application\\/mbms-schedule+xml\",\"application\\/mbms-user-service-description+xml\",\"application\\/mbox\",\"application\\/media-policy-dataset+xml\",\"application\\/media_control+xml\",\"application\\/mediaservercontrol+xml\",\"application\\/merge-patch+json\",\"application\\/metalink4+xml\",\"application\\/mets+xml\",\"application\\/MF4\",\"application\\/mikey\",\"application\\/mmt-usd+xml\",\"application\\/mods+xml\",\"application\\/moss-keys\",\"application\\/moss-signature\",\"application\\/mosskey-data\",\"application\\/mosskey-request\",\"application\\/mp21\",\"application\\/mp4\",\"application\\/mpeg4-generic\",\"application\\/mpeg4-iod\",\"application\\/mpeg4-iod-xmt\",\"application\\/mrb-consumer+xml\",\"application\\/mrb-publish+xml\",\"application\\/msc-ivr+xml\",\"application\\/msc-mixer+xml\",\"application\\/msword\",\"application\\/mud+json\",\"application\\/mxf\",\"application\\/n-quads\",\"application\\/n-quads+gzip\",\"application\\/n-triples\",\"application\\/n-triples+gzip\",\"application\\/nasdata\",\"application\\/news-checkgroups\",\"application\\/news-groupinfo\",\"application\\/news-transmission\",\"application\\/nlsml+xml\",\"application\\/node\",\"application\\/nss\",\"application\\/ocsp-request\",\"application\\/ocsp-response\",\"application\\/octet-stream\",\"application\\/ODA\",\"application\\/ODX\",\"application\\/oebps-package+xml\",\"application\\/ogg\",\"application\\/oxps\",\"application\\/p2p-overlay+xml\",\"application\\/passport\",\"application\\/patch-ops-error+xml\",\"application\\/pdf\",\"application\\/PDX\",\"application\\/pgp-encrypted\",\"application\\/pgp-signature\",\"application\\/pidf+xml\",\"application\\/pidf-diff+xml\",\"application\\/pkcs10\",\"application\\/pkcs12\",\"application\\/pkcs7-mime\",\"application\\/pkcs7-signature\",\"application\\/pkcs8\",\"application\\/pkcs8-encrypted\",\"application\\/pkix-attr-cert\",\"application\\/pkix-cert\",\"application\\/pkix-crl\",\"application\\/pkix-pkipath\",\"application\\/pkixcmp\",\"application\\/pls+xml\",\"application\\/poc-settings+xml\",\"application\\/postscript\",\"application\\/ppsp-tracker+json\",\"application\\/problem+json\",\"application\\/problem+xml\",\"application\\/provenance+xml\",\"application\\/prs.alvestrand.titrax-sheet\",\"application\\/prs.cww\",\"application\\/prs.hpub+zip\",\"application\\/prs.nprend\",\"application\\/prs.plucker\",\"application\\/prs.rdf-xml-crypt\",\"application\\/prs.xsf+xml\",\"application\\/pskc+xml\",\"application\\/QSIG\",\"application\\/raptorfec\",\"application\\/rdap+json\",\"application\\/rdf+xml\",\"application\\/rdf+xml+gzip\",\"application\\/reginfo+xml\",\"application\\/relax-ng-compact-syntax\",\"application\\/remote-printing\",\"application\\/reputon+json\",\"application\\/resource-lists+xml\",\"application\\/resource-lists-diff+xml\",\"application\\/rfc+xml\",\"application\\/riscos\",\"application\\/rlmi+xml\",\"application\\/rls-services+xml\",\"application\\/route-apd+xml\",\"application\\/route-s-tsid+xml\",\"application\\/route-usd+xml\",\"application\\/rpki-ghostbusters\",\"application\\/rpki-manifest\",\"application\\/rpki-publication\",\"application\\/rpki-roa\",\"application\\/rpki-updown\",\"application\\/rtf\",\"application\\/rtploopback\",\"application\\/rtx\",\"application\\/samlassertion+xml\",\"application\\/samlmetadata+xml\",\"application\\/sbml+xml\",\"application\\/scaip+xml\",\"application\\/scim+json\",\"application\\/scvp-cv-request\",\"application\\/scvp-cv-response\",\"application\\/scvp-vp-request\",\"application\\/scvp-vp-response\",\"application\\/sdp\",\"application\\/sep+xml\",\"application\\/sep-exi\",\"application\\/session-info\",\"application\\/set-payment\",\"application\\/set-payment-initiation\",\"application\\/set-registration\",\"application\\/set-registration-initiation\",\"application\\/SGML\",\"application\\/sgml-open-catalog\",\"application\\/shf+xml\",\"application\\/sieve\",\"application\\/simple-filter+xml\",\"application\\/simple-message-summary\",\"application\\/simpleSymbolContainer\",\"application\\/slate\",\"application\\/smil\",\"application\\/smil+xml\",\"application\\/smpte336m\",\"application\\/soap+fastinfoset\",\"application\\/soap+xml\",\"application\\/sparql-query\",\"application\\/spirits-event+xml\",\"application\\/sql\",\"application\\/srgs\",\"application\\/srgs+xml\",\"application\\/sru+xml\",\"application\\/ssml+xml\",\"application\\/tamp-apex-update\",\"application\\/tamp-apex-update-confirm\",\"application\\/tamp-community-update\",\"application\\/tamp-community-update-confirm\",\"application\\/tamp-error\",\"application\\/tamp-sequence-adjust\",\"application\\/tamp-sequence-adjust-confirm\",\"application\\/tamp-status-query\",\"application\\/tamp-status-response\",\"application\\/tamp-update\",\"application\\/tamp-update-confirm\",\"application\\/tei+xml\",\"application\\/thraud+xml\",\"application\\/timestamp-query\",\"application\\/timestamp-reply\",\"application\\/timestamped-data\",\"application\\/tnauthlist\",\"application\\/trig\",\"application\\/ttml+xml\",\"application\\/tve-trigger\",\"application\\/ulpfec\",\"application\\/urc-grpsheet+xml\",\"application\\/urc-ressheet+xml\",\"application\\/urc-targetdesc+xml\",\"application\\/urc-uisocketdesc+xml\",\"application\\/vcard+json\",\"application\\/vcard+xml\",\"application\\/vemmi\",\"application\\/vnd-acucobol\",\"application\\/vnd-curl\",\"application\\/vnd-dart\",\"application\\/vnd-dxr\",\"application\\/vnd-fdf\",\"application\\/vnd-mif\",\"application\\/vnd-sema\",\"application\\/vnd-wap-wmlc\",\"application\\/vnd.1000minds.decision-model+xml\",\"application\\/vnd.3gpp-prose+xml\",\"application\\/vnd.3gpp-prose-pc3ch+xml\",\"application\\/vnd.3gpp-v2x-local-service-information\",\"application\\/vnd.3gpp.access-transfer-events+xml\",\"application\\/vnd.3gpp.bsf+xml\",\"application\\/vnd.3gpp.GMOP+xml\",\"application\\/vnd.3gpp.mcptt-affiliation-command+xml\",\"application\\/vnd.3gpp.mcptt-floor-request+xml\",\"application\\/vnd.3gpp.mcptt-info+xml\",\"application\\/vnd.3gpp.mcptt-location-info+xml\",\"application\\/vnd.3gpp.mcptt-mbms-usage-info+xml\",\"application\\/vnd.3gpp.mcptt-signed+xml\",\"application\\/vnd.3gpp.mid-call+xml\",\"application\\/vnd.3gpp.pic-bw-large\",\"application\\/vnd.3gpp.pic-bw-small\",\"application\\/vnd.3gpp.pic-bw-var\",\"application\\/vnd.3gpp.sms\",\"application\\/vnd.3gpp.sms+xml\",\"application\\/vnd.3gpp.srvcc-ext+xml\",\"application\\/vnd.3gpp.SRVCC-info+xml\",\"application\\/vnd.3gpp.state-and-event-info+xml\",\"application\\/vnd.3gpp.ussd+xml\",\"application\\/vnd.3gpp2.bcmcsinfo+xml\",\"application\\/vnd.3gpp2.sms\",\"application\\/vnd.3gpp2.tcap\",\"application\\/vnd.3lightssoftware.imagescal\",\"application\\/vnd.3M.Post-it-Notes\",\"application\\/vnd.accpac.simply.aso\",\"application\\/vnd.accpac.simply.imp\",\"application\\/vnd.acucorp\",\"application\\/vnd.adobe.flash-movie\",\"application\\/vnd.adobe.formscentral.fcdt\",\"application\\/vnd.adobe.fxp\",\"application\\/vnd.adobe.partial-upload\",\"application\\/vnd.adobe.xdp+xml\",\"application\\/vnd.adobe.xfdf\",\"application\\/vnd.aether.imp\",\"application\\/vnd.afpc.afplinedata\",\"application\\/vnd.ah-barcode\",\"application\\/vnd.ahead.space\",\"application\\/vnd.airzip.filesecure.azf\",\"application\\/vnd.airzip.filesecure.azs\",\"application\\/vnd.amadeus+json\",\"application\\/vnd.amazon.mobi8-ebook\",\"application\\/vnd.americandynamics.acc\",\"application\\/vnd.amiga.ami\",\"application\\/vnd.amundsen.maze+xml\",\"application\\/vnd.anki\",\"application\\/vnd.anser-web-certificate-issue-initiation\",\"application\\/vnd.antix.game-component\",\"application\\/vnd.apache.thrift.binary\",\"application\\/vnd.apache.thrift.compact\",\"application\\/vnd.apache.thrift.json\",\"application\\/vnd.api+json\",\"application\\/vnd.apothekende.reservation+json\",\"application\\/vnd.apple.installer+xml\",\"application\\/vnd.apple.mpegurl\",\"application\\/vnd.arastra.swi\",\"application\\/vnd.aristanetworks.swi\",\"application\\/vnd.artsquare\",\"application\\/vnd.astraea-software.iota\",\"application\\/vnd.audiograph\",\"application\\/vnd.autopackage\",\"application\\/vnd.avalon+json\",\"application\\/vnd.avistar+xml\",\"application\\/vnd.balsamiq.bmml+xml\",\"application\\/vnd.balsamiq.bmpr\",\"application\\/vnd.bbf.usp.msg\",\"application\\/vnd.bbf.usp.msg+json\",\"application\\/vnd.bekitzur-stech+json\",\"application\\/vnd.bint.med-content\",\"application\\/vnd.biopax.rdf+xml\",\"application\\/vnd.blink-idb-value-wrapper\",\"application\\/vnd.blueice.multipass\",\"application\\/vnd.bluetooth.ep.oob\",\"application\\/vnd.bluetooth.le.oob\",\"application\\/vnd.bmi\",\"application\\/vnd.businessobjects\",\"application\\/vnd.cab-jscript\",\"application\\/vnd.canon-cpdl\",\"application\\/vnd.canon-lips\",\"application\\/vnd.capasystems-pg+json\",\"application\\/vnd.cendio.thinlinc.clientconf\",\"application\\/vnd.century-systems.tcp_stream\",\"application\\/vnd.chemdraw+xml\",\"application\\/vnd.chess-pgn\",\"application\\/vnd.chipnuts.karaoke-mmd\",\"application\\/vnd.cinderella\",\"application\\/vnd.cirpack.isdn-ext\",\"application\\/vnd.citationstyles.style+xml\",\"application\\/vnd.claymore\",\"application\\/vnd.cloanto.rp9\",\"application\\/vnd.clonk.c4group\",\"application\\/vnd.cluetrust.cartomobile-config\",\"application\\/vnd.cluetrust.cartomobile-config-pkg\",\"application\\/vnd.coffeescript\",\"application\\/vnd.collabio.xodocuments.document\",\"application\\/vnd.collabio.xodocuments.document-template\",\"application\\/vnd.collabio.xodocuments.presentation\",\"application\\/vnd.collabio.xodocuments.presentation-template\",\"application\\/vnd.collabio.xodocuments.spreadsheet\",\"application\\/vnd.collabio.xodocuments.spreadsheet-template\",\"application\\/vnd.collection+json\",\"application\\/vnd.collection.doc+json\",\"application\\/vnd.collection.next+json\",\"application\\/vnd.comicbook+zip\",\"application\\/vnd.comicbook-rar\",\"application\\/vnd.commerce-battelle\",\"application\\/vnd.commonspace\",\"application\\/vnd.contact.cmsg\",\"application\\/vnd.coreos.ignition+json\",\"application\\/vnd.cosmocaller\",\"application\\/vnd.crick.clicker\",\"application\\/vnd.crick.clicker.keyboard\",\"application\\/vnd.crick.clicker.palette\",\"application\\/vnd.crick.clicker.template\",\"application\\/vnd.crick.clicker.wordbank\",\"application\\/vnd.criticaltools.wbs+xml\",\"application\\/vnd.ctc-posml\",\"application\\/vnd.ctct.ws+xml\",\"application\\/vnd.cups-pdf\",\"application\\/vnd.cups-postscript\",\"application\\/vnd.cups-ppd\",\"application\\/vnd.cups-raster\",\"application\\/vnd.cups-raw\",\"application\\/vnd.cyan.dean.root+xml\",\"application\\/vnd.cybank\",\"application\\/vnd.d2l.coursepackage1p0+zip\",\"application\\/vnd.data-vision.rdz\",\"application\\/vnd.datapackage+json\",\"application\\/vnd.dataresource+json\",\"application\\/vnd.debian.binary-package\",\"application\\/vnd.dece-zip\",\"application\\/vnd.dece.data\",\"application\\/vnd.dece.ttml+xml\",\"application\\/vnd.dece.unspecified\",\"application\\/vnd.denovo.fcselayout-link\",\"application\\/vnd.desmume-movie\",\"application\\/vnd.dir-bi.plate-dl-nosuffix\",\"application\\/vnd.dm.delegation+xml\",\"application\\/vnd.dna\",\"application\\/vnd.document+json\",\"application\\/vnd.dolby.mobile.1\",\"application\\/vnd.dolby.mobile.2\",\"application\\/vnd.doremir.scorecloud-binary-document\",\"application\\/vnd.dpgraph\",\"application\\/vnd.dreamfactory\",\"application\\/vnd.drive+json\",\"application\\/vnd.dtg.local\",\"application\\/vnd.dtg.local-html\",\"application\\/vnd.dtg.local.flash\",\"application\\/vnd.dvb.ait\",\"application\\/vnd.dvb.dvbj\",\"application\\/vnd.dvb.esgcontainer\",\"application\\/vnd.dvb.ipdcdftnotifaccess\",\"application\\/vnd.dvb.ipdcesgaccess\",\"application\\/vnd.dvb.ipdcesgaccess2\",\"application\\/vnd.dvb.ipdcesgpdd\",\"application\\/vnd.dvb.ipdcroaming\",\"application\\/vnd.dvb.iptv.alfec-base\",\"application\\/vnd.dvb.iptv.alfec-enhancement\",\"application\\/vnd.dvb.notif-aggregate-root+xml\",\"application\\/vnd.dvb.notif-container+xml\",\"application\\/vnd.dvb.notif-generic+xml\",\"application\\/vnd.dvb.notif-ia-msglist+xml\",\"application\\/vnd.dvb.notif-ia-registration-request+xml\",\"application\\/vnd.dvb.notif-ia-registration-response+xml\",\"application\\/vnd.dvb.notif-init+xml\",\"application\\/vnd.dvb.pfr\",\"application\\/vnd.dvb_service\",\"application\\/vnd.dynageo\",\"application\\/vnd.dzr\",\"application\\/vnd.easykaraoke.cdgdownload\",\"application\\/vnd.ecdis-update\",\"application\\/vnd.ecip.rlp\",\"application\\/vnd.ecowin.chart\",\"application\\/vnd.ecowin.filerequest\",\"application\\/vnd.ecowin.fileupdate\",\"application\\/vnd.ecowin.series\",\"application\\/vnd.ecowin.seriesrequest\",\"application\\/vnd.ecowin.seriesupdate\",\"application\\/vnd.efi-img\",\"application\\/vnd.efi-iso\",\"application\\/vnd.emclient.accessrequest+xml\",\"application\\/vnd.enliven\",\"application\\/vnd.enphase.envoy\",\"application\\/vnd.eprints.data+xml\",\"application\\/vnd.epson.esf\",\"application\\/vnd.epson.msf\",\"application\\/vnd.epson.quickanime\",\"application\\/vnd.epson.salt\",\"application\\/vnd.epson.ssf\",\"application\\/vnd.ericsson.quickcall\",\"application\\/vnd.espass-espass+zip\",\"application\\/vnd.eszigno3+xml\",\"application\\/vnd.etsi.aoc+xml\",\"application\\/vnd.etsi.asic-e+zip\",\"application\\/vnd.etsi.asic-s+zip\",\"application\\/vnd.etsi.cug+xml\",\"application\\/vnd.etsi.iptvcommand+xml\",\"application\\/vnd.etsi.iptvdiscovery+xml\",\"application\\/vnd.etsi.iptvprofile+xml\",\"application\\/vnd.etsi.iptvsad-bc+xml\",\"application\\/vnd.etsi.iptvsad-cod+xml\",\"application\\/vnd.etsi.iptvsad-npvr+xml\",\"application\\/vnd.etsi.iptvservice+xml\",\"application\\/vnd.etsi.iptvsync+xml\",\"application\\/vnd.etsi.iptvueprofile+xml\",\"application\\/vnd.etsi.mcid+xml\",\"application\\/vnd.etsi.mheg5\",\"application\\/vnd.etsi.overload-control-policy-dataset+xml\",\"application\\/vnd.etsi.pstn+xml\",\"application\\/vnd.etsi.sci+xml\",\"application\\/vnd.etsi.simservs+xml\",\"application\\/vnd.etsi.timestamp-token\",\"application\\/vnd.etsi.tsl+xml\",\"application\\/vnd.etsi.tsl.der\",\"application\\/vnd.eudora.data\",\"application\\/vnd.evolv.ecig.profile\",\"application\\/vnd.evolv.ecig.settings\",\"application\\/vnd.evolv.ecig.theme\",\"application\\/vnd.ezpix-album\",\"application\\/vnd.ezpix-package\",\"application\\/vnd.f-secure.mobile\",\"application\\/vnd.fastcopy-disk-image\",\"application\\/vnd.fdsn.mseed\",\"application\\/vnd.fdsn.seed\",\"application\\/vnd.ffsns\",\"application\\/vnd.filmit.zfc\",\"application\\/vnd.fints\",\"application\\/vnd.firemonkeys.cloudcell\",\"application\\/vnd.FloGraphIt\",\"application\\/vnd.fluxtime.clip\",\"application\\/vnd.font-fontforge-sfd\",\"application\\/vnd.framemaker\",\"application\\/vnd.frogans.fnc\",\"application\\/vnd.frogans.ltf\",\"application\\/vnd.fsc.weblaunch\",\"application\\/vnd.fujitsu.oasys\",\"application\\/vnd.fujitsu.oasys2\",\"application\\/vnd.fujitsu.oasys3\",\"application\\/vnd.fujitsu.oasysgp\",\"application\\/vnd.fujitsu.oasysprs\",\"application\\/vnd.fujixerox.ART-EX\",\"application\\/vnd.fujixerox.ART4\",\"application\\/vnd.fujixerox.ddd\",\"application\\/vnd.fujixerox.docuworks\",\"application\\/vnd.fujixerox.docuworks.binder\",\"application\\/vnd.fujixerox.docuworks.container\",\"application\\/vnd.fujixerox.HBPL\",\"application\\/vnd.fut-misnet\",\"application\\/vnd.fuzzysheet\",\"application\\/vnd.genomatix.tuxedo\",\"application\\/vnd.geo+json\",\"application\\/vnd.geocube+xml\",\"application\\/vnd.geogebra.file\",\"application\\/vnd.geogebra.tool\",\"application\\/vnd.geometry-explorer\",\"application\\/vnd.geonext\",\"application\\/vnd.geoplan\",\"application\\/vnd.geospace\",\"application\\/vnd.gerber\",\"application\\/vnd.globalplatform.card-content-mgt\",\"application\\/vnd.globalplatform.card-content-mgt-response\",\"application\\/vnd.gmx\",\"application\\/vnd.google-earth.kml+xml\",\"application\\/vnd.google-earth.kmz\",\"application\\/vnd.gov.sk.e-form+xml\",\"application\\/vnd.gov.sk.e-form+zip\",\"application\\/vnd.gov.sk.xmldatacontainer+xml\",\"application\\/vnd.grafeq\",\"application\\/vnd.gridmp\",\"application\\/vnd.groove-account\",\"application\\/vnd.groove-help\",\"application\\/vnd.groove-identity-message\",\"application\\/vnd.groove-injector\",\"application\\/vnd.groove-tool-message\",\"application\\/vnd.groove-tool-template\",\"application\\/vnd.groove-vcard\",\"application\\/vnd.hal+json\",\"application\\/vnd.hal+xml\",\"application\\/vnd.HandHeld-Entertainment+xml\",\"application\\/vnd.hbci\",\"application\\/vnd.hc+json\",\"application\\/vnd.hcl-bireports\",\"application\\/vnd.hdt\",\"application\\/vnd.heroku+json\",\"application\\/vnd.hhe.lesson-player\",\"application\\/vnd.hp-HPGL\",\"application\\/vnd.hp-hpid\",\"application\\/vnd.hp-hps\",\"application\\/vnd.hp-jlyt\",\"application\\/vnd.hp-PCL\",\"application\\/vnd.hp-PCLXL\",\"application\\/vnd.httphone\",\"application\\/vnd.hydrostatix.sof-data\",\"application\\/vnd.hyper+json\",\"application\\/vnd.hyper-item+json\",\"application\\/vnd.hyperdrive+json\",\"application\\/vnd.hzn-3d-crossword\",\"application\\/vnd.ibm.afplinedata\",\"application\\/vnd.ibm.electronic-media\",\"application\\/vnd.ibm.MiniPay\",\"application\\/vnd.ibm.modcap\",\"application\\/vnd.ibm.rights-management\",\"application\\/vnd.ibm.secure-container\",\"application\\/vnd.iccprofile\",\"application\\/vnd.ieee.1905\",\"application\\/vnd.igloader\",\"application\\/vnd.imagemeter.folder+zip\",\"application\\/vnd.imagemeter.image+zip\",\"application\\/vnd.immervision-ivp\",\"application\\/vnd.immervision-ivu\",\"application\\/vnd.ims.imsccv1p1\",\"application\\/vnd.ims.imsccv1p2\",\"application\\/vnd.ims.imsccv1p3\",\"application\\/vnd.ims.lis.v2.result+json\",\"application\\/vnd.ims.lti.v2.toolconsumerprofile+json\",\"application\\/vnd.ims.lti.v2.toolproxy+json\",\"application\\/vnd.ims.lti.v2.toolproxy.id+json\",\"application\\/vnd.ims.lti.v2.toolsettings+json\",\"application\\/vnd.ims.lti.v2.toolsettings.simple+json\",\"application\\/vnd.informedcontrol.rms+xml\",\"application\\/vnd.informix-visionary\",\"application\\/vnd.infotech.project\",\"application\\/vnd.infotech.project+xml\",\"application\\/vnd.innopath.wamp.notification\",\"application\\/vnd.insors.igm\",\"application\\/vnd.intercon.formnet\",\"application\\/vnd.intergeo\",\"application\\/vnd.intertrust.digibox\",\"application\\/vnd.intertrust.nncp\",\"application\\/vnd.intu.qbo\",\"application\\/vnd.intu.qfx\",\"application\\/vnd.iptc.g2.catalogitem+xml\",\"application\\/vnd.iptc.g2.conceptitem+xml\",\"application\\/vnd.iptc.g2.knowledgeitem+xml\",\"application\\/vnd.iptc.g2.newsitem+xml\",\"application\\/vnd.iptc.g2.newsmessage+xml\",\"application\\/vnd.iptc.g2.packageitem+xml\",\"application\\/vnd.iptc.g2.planningitem+xml\",\"application\\/vnd.ipunplugged.rcprofile\",\"application\\/vnd.irepository.package+xml\",\"application\\/vnd.is-xpr\",\"application\\/vnd.isac.fcs\",\"application\\/vnd.jam\",\"application\\/vnd.japannet-directory-service\",\"application\\/vnd.japannet-jpnstore-wakeup\",\"application\\/vnd.japannet-payment-wakeup\",\"application\\/vnd.japannet-registration\",\"application\\/vnd.japannet-registration-wakeup\",\"application\\/vnd.japannet-setstore-wakeup\",\"application\\/vnd.japannet-verification\",\"application\\/vnd.japannet-verification-wakeup\",\"application\\/vnd.jcp.javame.midlet-rms\",\"application\\/vnd.jisp\",\"application\\/vnd.joost.joda-archive\",\"application\\/vnd.jsk.isdn-ngn\",\"application\\/vnd.kahootz\",\"application\\/vnd.kde.karbon\",\"application\\/vnd.kde.kchart\",\"application\\/vnd.kde.kformula\",\"application\\/vnd.kde.kivio\",\"application\\/vnd.kde.kontour\",\"application\\/vnd.kde.kpresenter\",\"application\\/vnd.kde.kspread\",\"application\\/vnd.kde.kword\",\"application\\/vnd.kenameaapp\",\"application\\/vnd.kidspiration\",\"application\\/vnd.Kinar\",\"application\\/vnd.koan\",\"application\\/vnd.kodak-descriptor\",\"application\\/vnd.las.las+json\",\"application\\/vnd.las.las+xml\",\"application\\/vnd.liberty-request+xml\",\"application\\/vnd.llamagraphics.life-balance.desktop\",\"application\\/vnd.llamagraphics.life-balance.exchange+xml\",\"application\\/vnd.lotus-1-2-3\",\"application\\/vnd.lotus-approach\",\"application\\/vnd.lotus-freelance\",\"application\\/vnd.lotus-notes\",\"application\\/vnd.lotus-organizer\",\"application\\/vnd.lotus-screencam\",\"application\\/vnd.lotus-wordpro\",\"application\\/vnd.macports.portpkg\",\"application\\/vnd.mapbox-vector-tile\",\"application\\/vnd.marlin.drm.actiontoken+xml\",\"application\\/vnd.marlin.drm.conftoken+xml\",\"application\\/vnd.marlin.drm.license+xml\",\"application\\/vnd.marlin.drm.mdcf\",\"application\\/vnd.mason+json\",\"application\\/vnd.maxmind.maxmind-db\",\"application\\/vnd.mcd\",\"application\\/vnd.medcalcdata\",\"application\\/vnd.mediastation.cdkey\",\"application\\/vnd.meridian-slingshot\",\"application\\/vnd.MFER\",\"application\\/vnd.mfmp\",\"application\\/vnd.micro+json\",\"application\\/vnd.micrografx-igx\",\"application\\/vnd.micrografx.flo\",\"application\\/vnd.microsoft.portable-executable\",\"application\\/vnd.microsoft.windows.thumbnail-cache\",\"application\\/vnd.miele+json\",\"application\\/vnd.minisoft-hp3000-save\",\"application\\/vnd.mitsubishi.misty-guard.trustweb\",\"application\\/vnd.Mobius.DAF\",\"application\\/vnd.Mobius.DIS\",\"application\\/vnd.Mobius.MBK\",\"application\\/vnd.Mobius.MQY\",\"application\\/vnd.Mobius.MSL\",\"application\\/vnd.Mobius.PLC\",\"application\\/vnd.Mobius.TXF\",\"application\\/vnd.mophun.application\",\"application\\/vnd.mophun.certificate\",\"application\\/vnd.motorola.flexsuite\",\"application\\/vnd.motorola.flexsuite.adsi\",\"application\\/vnd.motorola.flexsuite.fis\",\"application\\/vnd.motorola.flexsuite.gotap\",\"application\\/vnd.motorola.flexsuite.kmr\",\"application\\/vnd.motorola.flexsuite.ttc\",\"application\\/vnd.motorola.flexsuite.wem\",\"application\\/vnd.motorola.iprm\",\"application\\/vnd.mozilla.xul+xml\",\"application\\/vnd.ms-3mfdocument\",\"application\\/vnd.ms-artgalry\",\"application\\/vnd.ms-asf\",\"application\\/vnd.ms-cab-compressed\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-excel.addin.macroEnabled.12\",\"application\\/vnd.ms-excel.sheet.binary.macroEnabled.12\",\"application\\/vnd.ms-excel.sheet.macroEnabled.12\",\"application\\/vnd.ms-excel.template.macroEnabled.12\",\"application\\/vnd.ms-fontobject\",\"application\\/vnd.ms-htmlhelp\",\"application\\/vnd.ms-ims\",\"application\\/vnd.ms-lrm\",\"application\\/vnd.ms-office.activeX+xml\",\"application\\/vnd.ms-officetheme\",\"application\\/vnd.ms-playready.initiator+xml\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-powerpoint.addin.macroEnabled.12\",\"application\\/vnd.ms-powerpoint.presentation.macroEnabled.12\",\"application\\/vnd.ms-powerpoint.slide.macroEnabled.12\",\"application\\/vnd.ms-powerpoint.slideshow.macroEnabled.12\",\"application\\/vnd.ms-powerpoint.template.macroEnabled.12\",\"application\\/vnd.ms-PrintDeviceCapabilities+xml\",\"application\\/vnd.ms-PrintSchemaTicket+xml\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-tnef\",\"application\\/vnd.ms-windows.devicepairing\",\"application\\/vnd.ms-windows.nwprinting.oob\",\"application\\/vnd.ms-windows.printerpairing\",\"application\\/vnd.ms-windows.wsd.oob\",\"application\\/vnd.ms-wmdrm.lic-chlg-req\",\"application\\/vnd.ms-wmdrm.lic-resp\",\"application\\/vnd.ms-wmdrm.meter-chlg-req\",\"application\\/vnd.ms-wmdrm.meter-resp\",\"application\\/vnd.ms-word.document.macroEnabled.12\",\"application\\/vnd.ms-word.template.macroEnabled.12\",\"application\\/vnd.ms-works\",\"application\\/vnd.ms-wpl\",\"application\\/vnd.ms-xpsdocument\",\"application\\/vnd.msa-disk-image\",\"application\\/vnd.mseq\",\"application\\/vnd.msign\",\"application\\/vnd.multiad.creator\",\"application\\/vnd.multiad.creator.cif\",\"application\\/vnd.music-niff\",\"application\\/vnd.musician\",\"application\\/vnd.muvee.style\",\"application\\/vnd.mynfc\",\"application\\/vnd.ncd.control\",\"application\\/vnd.ncd.reference\",\"application\\/vnd.nearst.inv+json\",\"application\\/vnd.nervana\",\"application\\/vnd.netfpx\",\"application\\/vnd.neurolanguage.nlu\",\"application\\/vnd.nintendo.nitro.rom\",\"application\\/vnd.nintendo.snes.rom\",\"application\\/vnd.nitf\",\"application\\/vnd.noblenet-directory\",\"application\\/vnd.noblenet-sealer\",\"application\\/vnd.noblenet-web\",\"application\\/vnd.nokia.catalogs\",\"application\\/vnd.nokia.conml+wbxml\",\"application\\/vnd.nokia.conml+xml\",\"application\\/vnd.nokia.iptv.config+xml\",\"application\\/vnd.nokia.iSDS-radio-presets\",\"application\\/vnd.nokia.landmark+wbxml\",\"application\\/vnd.nokia.landmark+xml\",\"application\\/vnd.nokia.landmarkcollection+xml\",\"application\\/vnd.nokia.n-gage.ac+xml\",\"application\\/vnd.nokia.n-gage.data\",\"application\\/vnd.nokia.n-gage.symbian.install\",\"application\\/vnd.nokia.ncd\",\"application\\/vnd.nokia.pcd+wbxml\",\"application\\/vnd.nokia.pcd+xml\",\"application\\/vnd.nokia.radio-preset\",\"application\\/vnd.nokia.radio-presets\",\"application\\/vnd.novadigm.EDM\",\"application\\/vnd.novadigm.EDX\",\"application\\/vnd.novadigm.EXT\",\"application\\/vnd.ntt-local.content-share\",\"application\\/vnd.ntt-local.file-transfer\",\"application\\/vnd.ntt-local.ogw_remote-access\",\"application\\/vnd.ntt-local.sip-ta_remote\",\"application\\/vnd.ntt-local.sip-ta_tcp_stream\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.chart-template\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.formula-template\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.graphics-template\",\"application\\/vnd.oasis.opendocument.image\",\"application\\/vnd.oasis.opendocument.image-template\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.presentation-template\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.spreadsheet-template\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.oasis.opendocument.text-master\",\"application\\/vnd.oasis.opendocument.text-template\",\"application\\/vnd.oasis.opendocument.text-web\",\"application\\/vnd.obn\",\"application\\/vnd.ocf+cbor\",\"application\\/vnd.oftn.l10n+json\",\"application\\/vnd.oipf.contentaccessdownload+xml\",\"application\\/vnd.oipf.contentaccessstreaming+xml\",\"application\\/vnd.oipf.cspg-hexbinary\",\"application\\/vnd.oipf.dae.svg+xml\",\"application\\/vnd.oipf.dae.xhtml+xml\",\"application\\/vnd.oipf.mippvcontrolmessage+xml\",\"application\\/vnd.oipf.pae.gem\",\"application\\/vnd.oipf.spdiscovery+xml\",\"application\\/vnd.oipf.spdlist+xml\",\"application\\/vnd.oipf.ueprofile+xml\",\"application\\/vnd.oipf.userprofile+xml\",\"application\\/vnd.olpc-sugar\",\"application\\/vnd.oma-scws-config\",\"application\\/vnd.oma-scws-http-request\",\"application\\/vnd.oma-scws-http-response\",\"application\\/vnd.oma.bcast.associated-procedure-parameter+xml\",\"application\\/vnd.oma.bcast.drm-trigger+xml\",\"application\\/vnd.oma.bcast.imd+xml\",\"application\\/vnd.oma.bcast.ltkm\",\"application\\/vnd.oma.bcast.notification+xml\",\"application\\/vnd.oma.bcast.provisioningtrigger\",\"application\\/vnd.oma.bcast.sgboot\",\"application\\/vnd.oma.bcast.sgdd+xml\",\"application\\/vnd.oma.bcast.sgdu\",\"application\\/vnd.oma.bcast.simple-symbol-container\",\"application\\/vnd.oma.bcast.smartcard-trigger+xml\",\"application\\/vnd.oma.bcast.sprov+xml\",\"application\\/vnd.oma.bcast.stkm\",\"application\\/vnd.oma.cab-address-book+xml\",\"application\\/vnd.oma.cab-feature-handler+xml\",\"application\\/vnd.oma.cab-pcc+xml\",\"application\\/vnd.oma.cab-subs-invite+xml\",\"application\\/vnd.oma.cab-user-prefs+xml\",\"application\\/vnd.oma.dcd\",\"application\\/vnd.oma.dcdc\",\"application\\/vnd.oma.dd2+xml\",\"application\\/vnd.oma.drm.risd+xml\",\"application\\/vnd.oma.group-usage-list+xml\",\"application\\/vnd.oma.lwm2m+json\",\"application\\/vnd.oma.lwm2m+tlv\",\"application\\/vnd.oma.pal+xml\",\"application\\/vnd.oma.poc.detailed-progress-report+xml\",\"application\\/vnd.oma.poc.final-report+xml\",\"application\\/vnd.oma.poc.groups+xml\",\"application\\/vnd.oma.poc.invocation-descriptor+xml\",\"application\\/vnd.oma.poc.optimized-progress-report+xml\",\"application\\/vnd.oma.push\",\"application\\/vnd.oma.scidm.messages+xml\",\"application\\/vnd.oma.xcap-directory+xml\",\"application\\/vnd.omads-email+xml\",\"application\\/vnd.omads-file+xml\",\"application\\/vnd.omads-folder+xml\",\"application\\/vnd.omaloc-supl-init\",\"application\\/vnd.onepager\",\"application\\/vnd.onepagertamp\",\"application\\/vnd.onepagertamx\",\"application\\/vnd.onepagertat\",\"application\\/vnd.onepagertatp\",\"application\\/vnd.onepagertatx\",\"application\\/vnd.openblox.game+xml\",\"application\\/vnd.openblox.game-binary\",\"application\\/vnd.openeye.oeb\",\"application\\/vnd.openstreetmap.data+xml\",\"application\\/vnd.openxmlformats-officedocument.custom-properties+xml\",\"application\\/vnd.openxmlformats-officedocument.customXmlProperties+xml\",\"application\\/vnd.openxmlformats-officedocument.drawing+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.chart+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.chartshapes+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.diagramColors+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.diagramData+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.diagramLayout+xml\",\"application\\/vnd.openxmlformats-officedocument.drawingml.diagramStyle+xml\",\"application\\/vnd.openxmlformats-officedocument.extended-properties+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml-template\",\"application\\/vnd.openxmlformats-officedocument.presentationml.commentAuthors+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.comments+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.handoutMaster+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.notesMaster+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.notesSlide+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presProps+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slide\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slide+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideshow\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideshow.main+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.slideUpdateInfo+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.tableStyles+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.tags+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.template.main+xml\",\"application\\/vnd.openxmlformats-officedocument.presentationml.viewProps+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml-template\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.calcChain+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.chartsheet+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.comments+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.connections+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.dialogsheet+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.externalLink+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.pivotCacheDefinition+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.pivotCacheRecords+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.pivotTable+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.queryTable+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.revisionHeaders+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.revisionLog+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sharedStrings+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheetMetadata+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.table+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.tableSingleCells+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.template.main+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.userNames+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.volatileDependencies+xml\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml\",\"application\\/vnd.openxmlformats-officedocument.theme+xml\",\"application\\/vnd.openxmlformats-officedocument.themeOverride+xml\",\"application\\/vnd.openxmlformats-officedocument.vmlDrawing\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml-template\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.comments+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document.glossary+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.endnotes+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.footnotes+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.template.main+xml\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.webSettings+xml\",\"application\\/vnd.openxmlformats-package.core-properties+xml\",\"application\\/vnd.openxmlformats-package.digital-signature-xmlsignature+xml\",\"application\\/vnd.openxmlformats-package.relationships+xml\",\"application\\/vnd.oracle.resource+json\",\"application\\/vnd.orange.indata\",\"application\\/vnd.osa.netdeploy\",\"application\\/vnd.osgeo.mapguide.package\",\"application\\/vnd.osgi.bundle\",\"application\\/vnd.osgi.dp\",\"application\\/vnd.osgi.subsystem\",\"application\\/vnd.otps.ct-kip+xml\",\"application\\/vnd.oxli.countgraph\",\"application\\/vnd.pagerduty+json\",\"application\\/vnd.palm\",\"application\\/vnd.panoply\",\"application\\/vnd.paos+xml\",\"application\\/vnd.patentdive\",\"application\\/vnd.pawaafile\",\"application\\/vnd.pcos\",\"application\\/vnd.pg.format\",\"application\\/vnd.pg.osasli\",\"application\\/vnd.piaccess.application-licence\",\"application\\/vnd.picsel\",\"application\\/vnd.pmi.widget\",\"application\\/vnd.poc.group-advertisement+xml\",\"application\\/vnd.pocketlearn\",\"application\\/vnd.powerbuilder6\",\"application\\/vnd.powerbuilder6-s\",\"application\\/vnd.powerbuilder7\",\"application\\/vnd.powerbuilder7-s\",\"application\\/vnd.powerbuilder75\",\"application\\/vnd.powerbuilder75-s\",\"application\\/vnd.preminet\",\"application\\/vnd.previewsystems.box\",\"application\\/vnd.proteus.magazine\",\"application\\/vnd.publishare-delta-tree\",\"application\\/vnd.pvi.ptid1\",\"application\\/vnd.pwg-multiplexed\",\"application\\/vnd.pwg-xhtml-print+xml\",\"application\\/vnd.qualcomm.brew-app-res\",\"application\\/vnd.quarantainenet\",\"application\\/vnd.Quark.QuarkXPress\",\"application\\/vnd.quobject-quoxdocument\",\"application\\/vnd.radisys.moml+xml\",\"application\\/vnd.radisys.msml+xml\",\"application\\/vnd.radisys.msml-audit+xml\",\"application\\/vnd.radisys.msml-audit-conf+xml\",\"application\\/vnd.radisys.msml-audit-conn+xml\",\"application\\/vnd.radisys.msml-audit-dialog+xml\",\"application\\/vnd.radisys.msml-audit-stream+xml\",\"application\\/vnd.radisys.msml-conf+xml\",\"application\\/vnd.radisys.msml-dialog+xml\",\"application\\/vnd.radisys.msml-dialog-base+xml\",\"application\\/vnd.radisys.msml-dialog-fax-detect+xml\",\"application\\/vnd.radisys.msml-dialog-fax-sendrecv+xml\",\"application\\/vnd.radisys.msml-dialog-group+xml\",\"application\\/vnd.radisys.msml-dialog-speech+xml\",\"application\\/vnd.radisys.msml-dialog-transform+xml\",\"application\\/vnd.rainstor.data\",\"application\\/vnd.rapid\",\"application\\/vnd.rar\",\"application\\/vnd.realvnc.bed\",\"application\\/vnd.recordare.musicxml\",\"application\\/vnd.recordare.musicxml+xml\",\"application\\/vnd.renlearn.rlprint\",\"application\\/vnd.restful+json\",\"application\\/vnd.rig.cryptonote\",\"application\\/vnd.route66.link66+xml\",\"application\\/vnd.rs-274x\",\"application\\/vnd.ruckus.download\",\"application\\/vnd.s3sms\",\"application\\/vnd.sailingtracker.track\",\"application\\/vnd.sbm.cid\",\"application\\/vnd.sbm.mid2\",\"application\\/vnd.scribus\",\"application\\/vnd.sealed-doc\",\"application\\/vnd.sealed-eml\",\"application\\/vnd.sealed-mht\",\"application\\/vnd.sealed-ppt\",\"application\\/vnd.sealed-tiff\",\"application\\/vnd.sealed-xls\",\"application\\/vnd.sealed.3df\",\"application\\/vnd.sealed.csf\",\"application\\/vnd.sealed.net\",\"application\\/vnd.sealedmedia.softseal-html\",\"application\\/vnd.sealedmedia.softseal-pdf\",\"application\\/vnd.seemail\",\"application\\/vnd.semd\",\"application\\/vnd.semf\",\"application\\/vnd.shana.informed.formdata\",\"application\\/vnd.shana.informed.formtemplate\",\"application\\/vnd.shana.informed.interchange\",\"application\\/vnd.shana.informed.package\",\"application\\/vnd.shootproof+json\",\"application\\/vnd.sigrok.session\",\"application\\/vnd.SimTech-MindMapper\",\"application\\/vnd.siren+json\",\"application\\/vnd.smaf\",\"application\\/vnd.smart.notebook\",\"application\\/vnd.smart.teacher\",\"application\\/vnd.software602.filler.form+xml\",\"application\\/vnd.software602.filler.form-xml-zip\",\"application\\/vnd.solent.sdkm+xml\",\"application\\/vnd.spotfire.dxp\",\"application\\/vnd.spotfire.sfs\",\"application\\/vnd.sqlite3\",\"application\\/vnd.sss-cod\",\"application\\/vnd.sss-dtf\",\"application\\/vnd.sss-ntf\",\"application\\/vnd.stepmania.package\",\"application\\/vnd.stepmania.stepchart\",\"application\\/vnd.street-stream\",\"application\\/vnd.sun.wadl+xml\",\"application\\/vnd.sus-calendar\",\"application\\/vnd.svd\",\"application\\/vnd.swiftview-ics\",\"application\\/vnd.syncml+xml\",\"application\\/vnd.syncml.dm+wbxml\",\"application\\/vnd.syncml.dm+xml\",\"application\\/vnd.syncml.dm.notification\",\"application\\/vnd.syncml.dmddf+wbxml\",\"application\\/vnd.syncml.dmddf+xml\",\"application\\/vnd.syncml.dmtnds+wbxml\",\"application\\/vnd.syncml.dmtnds+xml\",\"application\\/vnd.syncml.ds.notification\",\"application\\/vnd.tableschema+json\",\"application\\/vnd.tao.intent-module-archive\",\"application\\/vnd.tcpdump.pcap\",\"application\\/vnd.tmd.mediaflex.api+xml\",\"application\\/vnd.tml\",\"application\\/vnd.tmobile-livetv\",\"application\\/vnd.tri.onesource\",\"application\\/vnd.trid.tpt\",\"application\\/vnd.triscape.mxs\",\"application\\/vnd.trueapp\",\"application\\/vnd.truedoc\",\"application\\/vnd.ubisoft.webplayer\",\"application\\/vnd.ufdl\",\"application\\/vnd.uiq.theme\",\"application\\/vnd.umajin\",\"application\\/vnd.unity\",\"application\\/vnd.uoml+xml\",\"application\\/vnd.uplanet.alert\",\"application\\/vnd.uplanet.alert-wbxml\",\"application\\/vnd.uplanet.bearer-choice\",\"application\\/vnd.uplanet.bearer-choice-wbxml\",\"application\\/vnd.uplanet.cacheop\",\"application\\/vnd.uplanet.cacheop-wbxml\",\"application\\/vnd.uplanet.channel\",\"application\\/vnd.uplanet.channel-wbxml\",\"application\\/vnd.uplanet.list\",\"application\\/vnd.uplanet.list-wbxml\",\"application\\/vnd.uplanet.listcmd\",\"application\\/vnd.uplanet.listcmd-wbxml\",\"application\\/vnd.uplanet.signal\",\"application\\/vnd.uri-map\",\"application\\/vnd.valve.source.material\",\"application\\/vnd.vcx\",\"application\\/vnd.vd-study\",\"application\\/vnd.vectorworks\",\"application\\/vnd.vel+json\",\"application\\/vnd.verimatrix.vcas\",\"application\\/vnd.vidsoft.vidconference\",\"application\\/vnd.visio\",\"application\\/vnd.visionary\",\"application\\/vnd.vividence.scriptfile\",\"application\\/vnd.vsf\",\"application\\/vnd.wap-slc\",\"application\\/vnd.wap-wbxml\",\"application\\/vnd.wap.sic\",\"application\\/vnd.wap.wmlscriptc\",\"application\\/vnd.webturbo\",\"application\\/vnd.wfa.p2p\",\"application\\/vnd.wfa.wsc\",\"application\\/vnd.windows.devicepairing\",\"application\\/vnd.wmc\",\"application\\/vnd.wmf.bootstrap\",\"application\\/vnd.wolfram.mathematica\",\"application\\/vnd.wolfram.mathematica.package\",\"application\\/vnd.wolfram.player\",\"application\\/vnd.wordperfect\",\"application\\/vnd.wqd\",\"application\\/vnd.wrq-hp3000-labelled\",\"application\\/vnd.wt.stf\",\"application\\/vnd.wv.csp+wbxml\",\"application\\/vnd.wv.csp+xml\",\"application\\/vnd.wv.ssp+xml\",\"application\\/vnd.xacml+json\",\"application\\/vnd.xara\",\"application\\/vnd.xfdl\",\"application\\/vnd.xfdl.webform\",\"application\\/vnd.xmi+xml\",\"application\\/vnd.xmpie.cpkg\",\"application\\/vnd.xmpie.dpkg\",\"application\\/vnd.xmpie.plan\",\"application\\/vnd.xmpie.ppkg\",\"application\\/vnd.xmpie.xlim\",\"application\\/vnd.yamaha.hv-dic\",\"application\\/vnd.yamaha.hv-script\",\"application\\/vnd.yamaha.hv-voice\",\"application\\/vnd.yamaha.openscoreformat\",\"application\\/vnd.yamaha.openscoreformat.osfpvg+xml\",\"application\\/vnd.yamaha.remote-setup\",\"application\\/vnd.yamaha.smaf-audio\",\"application\\/vnd.yamaha.smaf-phrase\",\"application\\/vnd.yamaha.through-ngn\",\"application\\/vnd.yamaha.tunnel-udpencap\",\"application\\/vnd.yaoweme\",\"application\\/vnd.yellowriver-custom-menu\",\"application\\/vnd.youtube.yt\",\"application\\/vnd.zul\",\"application\\/vnd.zzazz.deck+xml\",\"application\\/voicexml+xml\",\"application\\/voucher-cms+json\",\"application\\/vq-rtcpxr\",\"application\\/watcherinfo+xml\",\"application\\/webpush-options+json\",\"application\\/whoispp-query\",\"application\\/whoispp-response\",\"application\\/widget\",\"application\\/wita\",\"application\\/wordperfect5.1\",\"application\\/wsdl+xml\",\"application\\/wspolicy+xml\",\"application\\/x-www-form-urlencoded\",\"application\\/x400-bp\",\"application\\/xacml+xml\",\"application\\/xcap-att+xml\",\"application\\/xcap-caps+xml\",\"application\\/xcap-diff+xml\",\"application\\/xcap-el+xml\",\"application\\/xcap-error+xml\",\"application\\/xcap-ns+xml\",\"application\\/xcon-conference-info+xml\",\"application\\/xcon-conference-info-diff+xml\",\"application\\/xenc+xml\",\"application\\/xhtml+xml\",\"application\\/xliff+xml\",\"application\\/xml\",\"application\\/xml-dtd\",\"application\\/xml-external-parsed-entity\",\"application\\/xml-patch+xml\",\"application\\/xmpp+xml\",\"application\\/xop+xml\",\"application\\/xv+xml\",\"application\\/yang\",\"application\\/yang-data+json\",\"application\\/yang-data+xml\",\"application\\/yang-patch+json\",\"application\\/yang-patch+xml\",\"application\\/yin+xml\",\"application\\/zip\",\"application\\/zlib\",\"image\\/aces\",\"image\\/bmp\",\"image\\/cgm\",\"image\\/dicom-rle\",\"image\\/emf\",\"image\\/example\",\"image\\/fits\",\"image\\/g3fax\",\"image\\/jls\",\"image\\/jp2\",\"image\\/jpm\",\"image\\/jpx\",\"image\\/naplps\",\"image\\/png\",\"image\\/prs.btif\",\"image\\/prs.pti\",\"image\\/pwg-raster\",\"image\\/t38\",\"image\\/tiff\",\"image\\/tiff-fx\",\"image\\/vnd-djvu\",\"image\\/vnd-svf\",\"image\\/vnd-wap-wbmp\",\"image\\/vnd.adobe.photoshop\",\"image\\/vnd.airzip.accelerator.azv\",\"image\\/vnd.cns.inf2\",\"image\\/vnd.dece.graphic\",\"image\\/vnd.dvb.subtitle\",\"image\\/vnd.dwg\",\"image\\/vnd.dxf\",\"image\\/vnd.fastbidsheet\",\"image\\/vnd.fpx\",\"image\\/vnd.fst\",\"image\\/vnd.fujixerox.edmics-mmr\",\"image\\/vnd.fujixerox.edmics-rlc\",\"image\\/vnd.globalgraphics.pgb\",\"image\\/vnd.microsoft.icon\",\"image\\/vnd.mix\",\"image\\/vnd.mozilla.apng\",\"image\\/vnd.ms-modi\",\"image\\/vnd.net-fpx\",\"image\\/vnd.radiance\",\"image\\/vnd.sealed-png\",\"image\\/vnd.sealedmedia.softseal-gif\",\"image\\/vnd.sealedmedia.softseal-jpg\",\"image\\/vnd.tencent.tap\",\"image\\/vnd.valve.source.texture\",\"image\\/vnd.xiff\",\"image\\/vnd.zbrush.pcx\",\"image\\/wmf\",\"message\\/CPIM\",\"message\\/delivery-status\",\"message\\/disposition-notification\",\"message\\/example\",\"message\\/feedback-report\",\"message\\/global\",\"message\\/global-delivery-status\",\"message\\/global-disposition-notification\",\"message\\/global-headers\",\"message\\/http\",\"message\\/imdn+xml\",\"message\\/news\",\"message\\/s-http\",\"message\\/sip\",\"message\\/sipfrag\",\"message\\/tracking-status\",\"message\\/vnd.si.simp\",\"message\\/vnd.wfa.wsc\",\"model\\/3mf\",\"model\\/example\",\"model\\/gltf+json\",\"model\\/gltf-binary\",\"model\\/iges\",\"model\\/stl\",\"model\\/vnd-dwf\",\"model\\/vnd.collada+xml\",\"model\\/vnd.flatland.3dml\",\"model\\/vnd.gdl\",\"model\\/vnd.gs-gdl\",\"model\\/vnd.gtw\",\"model\\/vnd.moml+xml\",\"model\\/vnd.mts\",\"model\\/vnd.opengex\",\"model\\/vnd.parasolid.transmit-binary\",\"model\\/vnd.parasolid.transmit-text\",\"model\\/vnd.rosette.annotated-data-model\",\"model\\/vnd.valve.source.compiled-map\",\"model\\/vnd.vtu\",\"model\\/x3d+fastinfoset\",\"model\\/x3d+xml\",\"model\\/x3d-vrml\",\"text\\/1d-interleaved-parityfec\",\"text\\/cache-manifest\",\"text\\/calendar\",\"text\\/css\",\"text\\/csv\",\"text\\/csv+gzip\",\"text\\/csv-schema\",\"text\\/directory\",\"text\\/dns\",\"text\\/ecmascript\",\"text\\/encaprtp\",\"text\\/example\",\"text\\/fwdred\",\"text\\/grammar-ref-list\",\"text\\/html\",\"text\\/javascript\",\"text\\/jcr-cnd\",\"text\\/markdown\",\"text\\/mizar\",\"text\\/n3\",\"text\\/parameters\",\"text\\/provenance-notation\",\"text\\/prs.fallenstein.rst\",\"text\\/prs.lines.tag\",\"text\\/prs.prop.logic\",\"text\\/raptorfec\",\"text\\/RED\",\"text\\/rfc822-headers\",\"text\\/rtf\",\"text\\/rtp-enc-aescm128\",\"text\\/rtploopback\",\"text\\/rtx\",\"text\\/SGML\",\"text\\/strings\",\"text\\/t140\",\"text\\/tab-separated-values\",\"text\\/troff\",\"text\\/turtle\",\"text\\/turtle+gzip\",\"text\\/ulpfec\",\"text\\/uri-list\",\"text\\/vcard\",\"text\\/vnd-a\",\"text\\/vnd-curl\",\"text\\/vnd.abc\",\"text\\/vnd.ascii-art\",\"text\\/vnd.debian.copyright\",\"text\\/vnd.DMClientScript\",\"text\\/vnd.dvb.subtitle\",\"text\\/vnd.esmertec.theme-descriptor\",\"text\\/vnd.fly\",\"text\\/vnd.fmi.flexstor\",\"text\\/vnd.graphviz\",\"text\\/vnd.in3d.3dml\",\"text\\/vnd.in3d.spot\",\"text\\/vnd.IPTC.NewsML\",\"text\\/vnd.IPTC.NITF\",\"text\\/vnd.latex-z\",\"text\\/vnd.motorola.reflex\",\"text\\/vnd.ms-mediapackage\",\"text\\/vnd.net2phone.commcenter.command\",\"text\\/vnd.radisys.msml-basic-layout\",\"text\\/vnd.si.uricatalogue\",\"text\\/vnd.sun.j2me.app-descriptor\",\"text\\/vnd.trolltech.linguist\",\"text\\/vnd.wap-wml\",\"text\\/vnd.wap.si\",\"text\\/vnd.wap.sl\",\"text\\/vnd.wap.wmlscript\",\"text\\/xml\",\"text\\/xml-external-parsed-entity\"]', NULL);
INSERT INTO `custom_vocab` (`id`, `item_set_id`, `owner_id`, `label`, `lang`, `terms`, `uris`) VALUES
(2, NULL, 1, 'LDS IETF Language Tags', NULL, '[\"af\",\"af-NA\",\"af-ZA\",\"agq\",\"agq-CM\",\"ak\",\"ak-GH\",\"am\",\"am-ET\",\"ar\",\"ar-001\",\"ar-AE\",\"ar-BH\",\"ar-DJ\",\"ar-DZ\",\"ar-EG\",\"ar-ER\",\"ar-EH\",\"ar-IL\",\"ar-IQ\",\"ar-JO\",\"ar-KM\",\"ar-KW\",\"ar-LB\",\"ar-LY\",\"ar-MA\",\"ar-MR\",\"ar-OM\",\"ar-PS\",\"ar-QA\",\"ar-SA\",\"ar-SD\",\"ar-SO\",\"ar-SS\",\"ar-SY\",\"ar-TD\",\"ar-TN\",\"ar-YE\",\"as\",\"as-IN\",\"asa\",\"asa-TZ\",\"ast\",\"ast-ES\",\"az\",\"az-Cyrl\",\"az-Cyrl-AZ\",\"az-Latn\",\"az-Latn-AZ\",\"bas\",\"bas-CM\",\"be\",\"be-BY\",\"bem\",\"bem-ZM\",\"bez\",\"bez-TZ\",\"bg\",\"bg-BG\",\"bm\",\"bm-ML\",\"bn\",\"bn-BD\",\"bn-IN\",\"bo\",\"bo-CN\",\"bo-IN\",\"br\",\"br-FR\",\"brx\",\"brx-IN\",\"bs\",\"bs-Cyrl\",\"bs-Cyrl-BA\",\"bs-Latn\",\"bs-Latn-BA\",\"ca\",\"ca-AD\",\"ca-ES\",\"ca-ES-VALENCIA\",\"ca-FR\",\"ca-IT\",\"ccp\",\"ccp-BD\",\"ccp-IN\",\"ce\",\"ce-RU\",\"ceb\",\"ceb-PH\",\"cgg\",\"cgg-UG\",\"chr\",\"chr-US\",\"ckb\",\"ckb-IQ\",\"ckb-IR\",\"cs\",\"cs-CZ\",\"cu\",\"cu-RU\",\"cy\",\"cy-GB\",\"da\",\"da-DK\",\"da-GL\",\"dav\",\"dav-KE\",\"de\",\"de-AT\",\"de-BE\",\"de-CH\",\"de-DE\",\"de-IT\",\"de-LI\",\"de-LU\",\"dje\",\"dje-NE\",\"dsb\",\"dsb-DE\",\"dua\",\"dua-CM\",\"dyo\",\"dyo-SN\",\"dz\",\"dz-BT\",\"ebu\",\"ebu-KE\",\"ee\",\"ee-GH\",\"ee-TG\",\"el\",\"el-CY\",\"el-GR\",\"en\",\"en-001\",\"en-150\",\"en-AE\",\"en-AG\",\"en-AI\",\"en-AS\",\"en-AT\",\"en-AU\",\"en-BB\",\"en-BE\",\"en-BI\",\"en-BM\",\"en-BS\",\"en-BW\",\"en-BZ\",\"en-CA\",\"en-CC\",\"en-CH\",\"en-CK\",\"en-CM\",\"en-CX\",\"en-CY\",\"en-DE\",\"en-DG\",\"en-DK\",\"en-DM\",\"en-ER\",\"en-FI\",\"en-FJ\",\"en-FK\",\"en-FM\",\"en-GB\",\"en-GD\",\"en-GG\",\"en-GH\",\"en-GI\",\"en-GM\",\"en-GU\",\"en-GY\",\"en-HK\",\"en-IE\",\"en-IL\",\"en-IM\",\"en-IN\",\"en-IO\",\"en-JE\",\"en-JM\",\"en-KE\",\"en-KI\",\"en-KN\",\"en-KY\",\"en-LC\",\"en-LR\",\"en-LS\",\"en-MG\",\"en-MH\",\"en-MO\",\"en-MP\",\"en-MS\",\"en-MT\",\"en-MU\",\"en-MW\",\"en-MY\",\"en-NA\",\"en-NF\",\"en-NG\",\"en-NL\",\"en-NR\",\"en-NU\",\"en-NZ\",\"en-PG\",\"en-PH\",\"en-PK\",\"en-PN\",\"en-PR\",\"en-PW\",\"en-RW\",\"en-SB\",\"en-SC\",\"en-SD\",\"en-SE\",\"en-SG\",\"en-SH\",\"en-SI\",\"en-SL\",\"en-SS\",\"en-SX\",\"en-SZ\",\"en-TC\",\"en-TK\",\"en-TO\",\"en-TT\",\"en-TV\",\"en-TZ\",\"en-UG\",\"en-UM\",\"en-US\",\"en-US-POSIX\",\"en-VC\",\"en-VG\",\"en-VI\",\"en-VU\",\"en-WS\",\"en-ZA\",\"en-ZM\",\"en-ZW\",\"eo\",\"eo-001\",\"es\",\"es-419\",\"es-AR\",\"es-BO\",\"es-BR\",\"es-BZ\",\"es-CL\",\"es-CO\",\"es-CR\",\"es-CU\",\"es-DO\",\"es-EA\",\"es-EC\",\"es-ES\",\"es-GQ\",\"es-GT\",\"es-HN\",\"es-IC\",\"es-MX\",\"es-NI\",\"es-PA\",\"es-PE\",\"es-PH\",\"es-PR\",\"es-PY\",\"es-SV\",\"es-US\",\"es-UY\",\"es-VE\",\"et\",\"et-EE\",\"eu\",\"eu-ES\",\"ewo\",\"ewo-CM\",\"fa\",\"fa-AF\",\"fa-IR\",\"ff\",\"ff-Adlm\",\"ff-Adlm-BF\",\"ff-Adlm-CM\",\"ff-Adlm-GH\",\"ff-Adlm-GM\",\"ff-Adlm-GN\",\"ff-Adlm-GW\",\"ff-Adlm-LR\",\"ff-Adlm-MR\",\"ff-Adlm-NE\",\"ff-Adlm-NG\",\"ff-Adlm-SL\",\"ff-Adlm-SN\",\"ff-Latn\",\"ff-Latn-BF\",\"ff-Latn-CM\",\"ff-Latn-GH\",\"ff-Latn-GM\",\"ff-Latn-GN\",\"ff-Latn-GW\",\"ff-Latn-LR\",\"ff-Latn-MR\",\"ff-Latn-NE\",\"ff-Latn-NG\",\"ff-Latn-SL\",\"ff-Latn-SN\",\"fi\",\"fi-FI\",\"fil\",\"fil-PH\",\"fo\",\"fo-DK\",\"fo-FO\",\"fr\",\"fr-BE\",\"fr-BF\",\"fr-BI\",\"fr-BJ\",\"fr-BL\",\"fr-CA\",\"fr-CD\",\"fr-CF\",\"fr-CG\",\"fr-CH\",\"fr-CI\",\"fr-CM\",\"fr-DJ\",\"fr-DZ\",\"fr-FR\",\"fr-GA\",\"fr-GF\",\"fr-GN\",\"fr-GP\",\"fr-GQ\",\"fr-HT\",\"fr-KM\",\"fr-LU\",\"fr-MA\",\"fr-MC\",\"fr-MF\",\"fr-MG\",\"fr-ML\",\"fr-MQ\",\"fr-MR\",\"fr-MU\",\"fr-NC\",\"fr-NE\",\"fr-PF\",\"fr-PM\",\"fr-RE\",\"fr-RW\",\"fr-SC\",\"fr-SN\",\"fr-SY\",\"fr-TD\",\"fr-TG\",\"fr-TN\",\"fr-VU\",\"fr-WF\",\"fr-YT\",\"fur\",\"fur-IT\",\"fy\",\"fy-NL\",\"ga\",\"ga-GB\",\"ga-IE\",\"gd\",\"gd-GB\",\"gl\",\"gl-ES\",\"gsw\",\"gsw-CH\",\"gsw-FR\",\"gsw-LI\",\"gu\",\"gu-IN\",\"guz\",\"guz-KE\",\"gv\",\"gv-IM\",\"ha\",\"ha-GH\",\"ha-NE\",\"ha-NG\",\"haw\",\"haw-US\",\"he\",\"he-IL\",\"hi\",\"hi-IN\",\"hr\",\"hr-BA\",\"hr-HR\",\"hsb\",\"hsb-DE\",\"hu\",\"hu-HU\",\"hy\",\"hy-AM\",\"ia\",\"ia-001\",\"id\",\"id-ID\",\"ig\",\"ig-NG\",\"ii\",\"ii-CN\",\"is\",\"is-IS\",\"it\",\"it-CH\",\"it-IT\",\"it-SM\",\"it-VA\",\"ja\",\"ja-JP\",\"jgo\",\"jgo-CM\",\"jmc\",\"jmc-TZ\",\"jv\",\"jv-ID\",\"ka\",\"ka-GE\",\"kab\",\"kab-DZ\",\"kam\",\"kam-KE\",\"kde\",\"kde-TZ\",\"kea\",\"kea-CV\",\"khq\",\"khq-ML\",\"ki\",\"ki-KE\",\"kk\",\"kk-KZ\",\"kkj\",\"kkj-CM\",\"kl\",\"kl-GL\",\"kln\",\"kln-KE\",\"km\",\"km-KH\",\"kn\",\"kn-IN\",\"ko\",\"ko-KP\",\"ko-KR\",\"kok\",\"kok-IN\",\"ks\",\"ks-Arab\",\"ks-Arab-IN\",\"ksb\",\"ksb-TZ\",\"ksf\",\"ksf-CM\",\"ksh\",\"ksh-DE\",\"ku\",\"ku-TR\",\"kw\",\"kw-GB\",\"ky\",\"ky-KG\",\"lag\",\"lag-TZ\",\"lb\",\"lb-LU\",\"lg\",\"lg-UG\",\"lkt\",\"lkt-US\",\"ln\",\"ln-AO\",\"ln-CD\",\"ln-CF\",\"ln-CG\",\"lo\",\"lo-LA\",\"lrc\",\"lrc-IQ\",\"lrc-IR\",\"lt\",\"lt-LT\",\"lu\",\"lu-CD\",\"luo\",\"luo-KE\",\"luy\",\"luy-KE\",\"lv\",\"lv-LV\",\"mai\",\"mai-IN\",\"mas\",\"mas-KE\",\"mas-TZ\",\"mer\",\"mer-KE\",\"mfe\",\"mfe-MU\",\"mg\",\"mg-MG\",\"mgh\",\"mgh-MZ\",\"mgo\",\"mgo-CM\",\"mi\",\"mi-NZ\",\"mk\",\"mk-MK\",\"ml\",\"ml-IN\",\"mn\",\"mn-MN\",\"mni\",\"mni-Beng\",\"mni-Beng-IN\",\"mr\",\"mr-IN\",\"ms\",\"ms-BN\",\"ms-ID\",\"ms-MY\",\"ms-SG\",\"mt\",\"mt-MT\",\"mua\",\"mua-CM\",\"my\",\"my-MM\",\"mzn\",\"mzn-IR\",\"naq\",\"naq-NA\",\"nb\",\"nb-NO\",\"nb-SJ\",\"nd\",\"nd-ZW\",\"nds\",\"nds-DE\",\"nds-NL\",\"ne\",\"ne-IN\",\"ne-NP\",\"nl\",\"nl-AW\",\"nl-BE\",\"nl-BQ\",\"nl-CW\",\"nl-NL\",\"nl-SR\",\"nl-SX\",\"nmg\",\"nmg-CM\",\"nn\",\"nn-NO\",\"nnh\",\"nnh-CM\",\"nus\",\"nus-SS\",\"nyn\",\"nyn-UG\",\"om\",\"om-ET\",\"om-KE\",\"or\",\"or-IN\",\"os\",\"os-GE\",\"os-RU\",\"pa\",\"pa-Arab\",\"pa-Arab-PK\",\"pa-Guru\",\"pa-Guru-IN\",\"pcm\",\"pcm-NG\",\"pl\",\"pl-PL\",\"prg\",\"prg-001\",\"ps\",\"ps-AF\",\"ps-PK\",\"pt\",\"pt-AO\",\"pt-BR\",\"pt-CH\",\"pt-CV\",\"pt-GQ\",\"pt-GW\",\"pt-LU\",\"pt-MO\",\"pt-MZ\",\"pt-PT\",\"pt-ST\",\"pt-TL\",\"qu\",\"qu-BO\",\"qu-EC\",\"qu-PE\",\"rm\",\"rm-CH\",\"rn\",\"rn-BI\",\"ro\",\"ro-MD\",\"ro-RO\",\"rof\",\"rof-TZ\",\"root\",\"ru\",\"ru-BY\",\"ru-KG\",\"ru-KZ\",\"ru-MD\",\"ru-RU\",\"ru-UA\",\"rw\",\"rw-RW\",\"rwk\",\"rwk-TZ\",\"sah\",\"sah-RU\",\"saq\",\"saq-KE\",\"sat\",\"sat-Olck\",\"sat-Olck-IN\",\"sbp\",\"sbp-TZ\",\"sd\",\"sd-Arab\",\"sd-Arab-PK\",\"sd-Deva\",\"sd-Deva-IN\",\"se\",\"se-FI\",\"se-NO\",\"se-SE\",\"seh\",\"seh-MZ\",\"ses\",\"ses-ML\",\"sg\",\"sg-CF\",\"shi\",\"shi-Latn\",\"shi-Latn-MA\",\"shi-Tfng\",\"shi-Tfng-MA\",\"si\",\"si-LK\",\"sk\",\"sk-SK\",\"sl\",\"sl-SI\",\"smn\",\"smn-FI\",\"sn\",\"sn-ZW\",\"so\",\"so-DJ\",\"so-ET\",\"so-KE\",\"so-SO\",\"sq\",\"sq-AL\",\"sq-MK\",\"sq-XK\",\"sr\",\"sr-Cyrl\",\"sr-Cyrl-BA\",\"sr-Cyrl-ME\",\"sr-Cyrl-RS\",\"sr-Cyrl-XK\",\"sr-Latn\",\"sr-Latn-BA\",\"sr-Latn-ME\",\"sr-Latn-RS\",\"sr-Latn-XK\",\"su\",\"su-Latn\",\"su-Latn-ID\",\"sv\",\"sv-AX\",\"sv-FI\",\"sv-SE\",\"sw\",\"sw-CD\",\"sw-KE\",\"sw-TZ\",\"sw-UG\",\"ta\",\"ta-IN\",\"ta-LK\",\"ta-MY\",\"ta-SG\",\"te\",\"te-IN\",\"teo\",\"teo-KE\",\"teo-UG\",\"tg\",\"tg-TJ\",\"th\",\"th-TH\",\"ti\",\"ti-ER\",\"ti-ET\",\"tk\",\"tk-TM\",\"to\",\"to-TO\",\"tr\",\"tr-CY\",\"tr-TR\",\"tt\",\"tt-RU\",\"twq\",\"twq-NE\",\"tzm\",\"tzm-MA\",\"ug\",\"ug-CN\",\"uk\",\"uk-UA\",\"ur\",\"ur-IN\",\"ur-PK\",\"uz\",\"uz-Arab\",\"uz-Arab-AF\",\"uz-Cyrl\",\"uz-Cyrl-UZ\",\"uz-Latn\",\"uz-Latn-UZ\",\"vai\",\"vai-Latn\",\"vai-Latn-LR\",\"vai-Vaii\",\"vai-Vaii-LR\",\"vi\",\"vi-VN\",\"vo\",\"vo-001\",\"vun\",\"vun-TZ\",\"wae\",\"wae-CH\",\"wo\",\"wo-SN\",\"xh\",\"xh-ZA\",\"xog\",\"xog-UG\",\"yav\",\"yav-CM\",\"yi\",\"yi-001\",\"yo\",\"yo-BJ\",\"yo-NG\",\"yue\",\"yue-Hans\",\"yue-Hans-CN\",\"yue-Hant\",\"yue-Hant-HK\",\"zgh\",\"zgh-MA\",\"zh\",\"zh-Hans\",\"zh-Hans-CN\",\"zh-Hans-HK\",\"zh-Hans-MO\",\"zh-Hans-SG\",\"zh-Hant\",\"zh-Hant-HK\",\"zh-Hant-MO\",\"zh-Hant-TW\",\"zu\",\"zu-ZA\"]', NULL),
(3, NULL, 1, 'LDS licenses', NULL, NULL, '{\"http:\\/\\/opendatacommons.org\\/licenses\\/pddl\\/1-0\\/\":\"Open Data Commons Public Domain Dedication and License (PDDL) v1.0\",\"http:\\/\\/opendatacommons.org\\/licenses\\/by\\/1-0\\/\":\"Open Data Commons Attribution License (ODC-By) v1.0\",\"http:\\/\\/opendatacommons.org\\/licenses\\/odbl\\/1-0\\/\":\"Open Data Commons Open Database License (ODbL) v1.0\",\"https:\\/\\/opendatacommons.org\\/licenses\\/by\\/1-0\\/\":\"Open Data Commons Attribution License (ODC-By) v1.0\",\"http:\\/\\/creativecommons.org\\/licenses\\/by-sa\\/4.0\\/\":\"Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)\",\"http:\\/\\/creativecommons.org\\/licenses\\/by\\/4.0\\/\":\"Attribution 4.0 International (CC BY 4.0)\",\"https:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/4.0\\/\":\"Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)\",\"https:\\/\\/creativecommons.org\\/licenses\\/by-nc\\/4.0\\/\":\"Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)\",\"https:\\/\\/creativecommons.org\\/licenses\\/by-nc-sa\\/4.0\\/\":\"Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)\",\"https:\\/\\/creativecommons.org\\/licenses\\/by-nc-nd\\/4.0\\/\":\"Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)\",\"http:\\/\\/creativecommons.org\\/publicdomain\\/mark\\/1.0\\/\":\"Public Domain Mark 1.0\",\"http:\\/\\/creativecommons.org\\/publicdomain\\/zero\\/1.0\\/\":\"CC0 1.0 Universal (CC0 1.0) Public Domain Dedication\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC\\/1.0\\/\":\"In copyright\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC-OW-EU\\/1.0\\/\":\"In copyright (EU orphan work)\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC-EDU\\/1.0\\/\":\"In copyright (educational use permitted)\",\"http:\\/\\/rightsstatements.org\\/vocab\\/UND\\/1.0\\/\":\"Copyright undetermined\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NKC\\/1.0\\/\":\"No known copyright\",\"http:\\/\\/rightsstatements.org\\/vocab\\/CNE\\/1.0\\/\":\"Copyright  not evaluated\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NoC-US\\/1.0\\/\":\"No copyright - United States\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NoC-CR\\/1.0\\/\":\"No copyright - contractual restrictions\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NoC-NC\\/1.0\\/\":\"No copyright - non-commercial use only\",\"http:\\/\\/rightsstatements.org\\/vocab\\/NoC-OKLR\\/1.0\\/\":\"No copyright - other known legal restrictions\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC-NC\\/1.0\\/\":\"In copyright (non-commercial use permitted)\",\"http:\\/\\/rightsstatements.org\\/vocab\\/InC-RUU\\/1.0\\/\":\"In copyright (rights-holder(s) unlocatable or unidentifiable)\"}');

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
(11, 'items', 1, 1, 'Organisaties.nt.gz', 'Organisaties.nt.gz\napplication/n-triples+gzip\nTODO \n2023-04-06 6 april 2023'),
(12, 'items', 1, 1, 'Organisaties.ttl', 'Organisaties.ttl\ntext/turtle\nTODO \n2023-04-23 23 april 2023'),
(13, 'items', 1, 1, 'Organisaties', 'Organisaties\nAAA\nCC0 1.0 Universal (CC0 1.0) Public Domain Dedication\nOrganisaties.ttl\nOrganisaties.nt.gz\n2023-04-06 6 april 2023\nOrganisaties A-Z\ntest\nCatalogusEen'),
(14, 'items', 1, 1, 'Personen.ttl.gz', 'Personen.ttl.gz\ntext/turtle+gzip\nTODO \n2023-04-06 6 april 2023'),
(15, 'items', 1, 1, 'Personen', 'Personen\nAAA\nCC0 1.0 Universal (CC0 1.0) Public Domain Dedication\nPersonen.ttl.gz\nBBB\n2023-04-06 6 april 2023\nPersonen 0-9\ntest\nCatalogusEen'),
(16, 'items', 1, 1, 'CatalogusEen', 'CatalogusEen\nPersonen\nOrganisaties\nCCC'),
(17, 'items', 1, 1, 'PersonenOrganisaties.jsonld', 'PersonenOrganisaties.jsonld\napplication/ld+json\nTODO \n2023-04-06 6 april 2023\nCC0 1.0 Universal (CC0 1.0) Public Domain Dedication'),
(18, 'items', 1, 1, 'PersonenOrganisaties', 'PersonenOrganisaties\nDDD\nCC0 1.0 Universal (CC0 1.0) Public Domain Dedication\nPersonenOrganisaties.jsonld\n2023-04-06 6 april 2023\nnl\nPersonen 0-9\nOrganisaties A-Z\ntest\nCatalogusTwee'),
(19, 'items', 1, 1, 'CatalogusTwee', 'CatalogusTwee\nPersonenOrganisaties\nDDD');

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
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL),
(17, NULL),
(18, NULL),
(19, NULL);

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
('CustomVocab', 1, '1.7.1'),
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

--
-- Gegevens worden geëxporteerd voor tabel `numeric_data_types_timestamp`
--

INSERT INTO `numeric_data_types_timestamp` (`id`, `resource_id`, `property_id`, `value`) VALUES
(1, 11, 555, 1680739200),
(2, 12, 555, 1682208000),
(3, 13, 555, 1680739200),
(4, 14, 555, 1680739200),
(5, 15, 555, 1680739200),
(6, 17, 555, 1680739200),
(7, 18, 555, 1680739200);

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
(185, 1, 5, 'maximumAttendeeCapacity', 'maximumAttendeeCapacity', 'The total number of individuals that may attend an event or venue.'),
(186, 1, 5, 'printEdition', 'printEdition', 'The edition of the print product in which the NewsArticle appears.'),
(187, 1, 5, 'actors', 'actors', 'An actor, e.g. in TV, radio, movie, video games etc. Actors can be associated with individual items or with a series, episode, clip.'),
(188, 1, 5, 'actor', 'actor', 'An actor, e.g. in TV, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.'),
(189, 1, 5, 'latitude', 'latitude', 'The latitude of a location. For example ```37.42242``` ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)).'),
(190, 1, 5, 'geoCoveredBy', 'geoCoveredBy', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that covers it. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(191, 1, 5, 'requiredQuantity', 'requiredQuantity', 'The required quantity of the item(s).'),
(192, 1, 5, 'price', 'price', 'The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes.\\n\\nUsage guidelines:\\n\\n* Use the [[priceCurrency]] property (with standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\") instead of including [ambiguous symbols](http://en.wikipedia.org/wiki/Dollar_sign#Currencies_that_use_the_dollar_or_peso_sign) such as \'$\' in the value.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.\\n* Note that both [RDFa](http://www.w3.org/TR/xhtml-rdfa-primer/#using-the-content-attribute) and Microdata syntax allow the use of a \"content=\" attribute for publishing simple machine-readable values alongside more human-friendly formatting.\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\n      '),
(193, 1, 5, 'homeLocation', 'homeLocation', 'A contact location for a person\'s residence.'),
(194, 1, 5, 'location', 'location', 'The location of, for example, where an event is happening, where an organization is located, or where an action takes place.'),
(195, 1, 5, 'dayOfWeek', 'dayOfWeek', 'The day of the week for which these opening hours are valid.'),
(196, 1, 5, 'cvdNumC19OFMechVentPats', 'cvdNumC19OFMechVentPats', 'numc19ofmechventpats - ED/OVERFLOW and VENTILATED: Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed and on a mechanical ventilator.'),
(197, 1, 5, 'diversityStaffingReport', 'diversityStaffingReport', 'For an [[Organization]] (often but not necessarily a [[NewsMediaOrganization]]), a report on staffing diversity issues. In a news context this might be for example ASNE or RTDNA (US) reports, or self-reported.'),
(198, 1, 5, 'publishingPrinciples', 'publishingPrinciples', 'The publishingPrinciples property indicates (typically via [[URL]]) a document describing the editorial principles of an [[Organization]] (or individual, e.g. a [[Person]] writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a [[CreativeWork]] (e.g. [[NewsArticle]]) the principles are those of the party primarily responsible for the creation of the [[CreativeWork]].\n\nWhile such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a [[funder]]) can be expressed using schema.org terminology.\n'),
(199, 1, 5, 'billingDuration', 'billingDuration', 'Specifies for how long this price (or price component) will be billed. Can be used, for example, to model the contractual duration of a subscription or payment plan. Type can be either a Duration or a Number (in which case the unit of measurement, for example month, is specified by the unitCode property).'),
(200, 1, 5, 'prescriptionStatus', 'prescriptionStatus', 'Indicates the status of drug prescription, e.g. local catalogs classifications or whether the drug is available by prescription or over-the-counter, etc.'),
(201, 1, 5, 'monthlyMinimumRepaymentAmount', 'monthlyMinimumRepaymentAmount', 'The minimum payment is the lowest amount of money that one is required to pay on a credit card statement each month.'),
(202, 1, 5, 'associatedMediaReview', 'associatedMediaReview', 'An associated [[MediaReview]], related by specific common content, topic or claim. The expectation is that this property would be most typically used in cases where a single activity is conducting both claim reviews and media reviews, in which case [[relatedMediaReview]] would commonly be used on a [[ClaimReview]], while [[relatedClaimReview]] would be used on [[MediaReview]].'),
(203, 1, 5, 'associatedReview', 'associatedReview', 'An associated [[Review]].'),
(204, 1, 5, 'infectiousAgent', 'infectiousAgent', 'The actual infectious agent, such as a specific bacterium.'),
(205, 1, 5, 'occupancy', 'occupancy', 'The allowed total occupancy for the accommodation in persons (including infants etc). For individual accommodations, this is not necessarily the legal maximum but defines the permitted usage as per the contractual agreement (e.g. a double room used by a single person).\nTypical unit code(s): C62 for person'),
(206, 1, 5, 'merchantReturnLink', 'merchantReturnLink', 'Specifies a Web page or service by URL, for product returns.'),
(207, 1, 5, 'valueReference', 'valueReference', 'A secondary value that provides additional information on the original value, e.g. a reference temperature or a type of measurement.'),
(208, 1, 5, 'jobLocation', 'jobLocation', 'A (typically single) geographic location associated with the job position.'),
(209, 1, 5, 'geoRadius', 'geoRadius', 'Indicates the approximate radius of a GeoCircle (metres unless indicated otherwise via Distance notation).'),
(210, 1, 5, 'steps', 'steps', 'A single step item (as HowToStep, text, document, video, etc.) or a HowToSection (originally misnamed \'steps\'; \'step\' is preferred).'),
(211, 1, 5, 'step', 'step', 'A single step item (as HowToStep, text, document, video, etc.) or a HowToSection.'),
(212, 1, 5, 'followup', 'followup', 'Typical or recommended followup care after the procedure is performed.'),
(213, 1, 5, 'hasPOS', 'hasPOS', 'Points-of-Sales operated by the organization or person.'),
(214, 1, 5, 'floorLevel', 'floorLevel', 'The floor level for an [[Accommodation]] in a multi-storey building. Since counting\n  systems [vary internationally](https://en.wikipedia.org/wiki/Storey#Consecutive_number_floor_designations), the local system should be used where possible.'),
(215, 1, 5, 'variesBy', 'variesBy', 'Indicates the property or properties by which the variants in a [[ProductGroup]] vary, e.g. their size, color etc. Schema.org properties can be referenced by their short name e.g. \"color\"; terms defined elsewhere can be referenced with their URIs.'),
(216, 1, 5, 'estimatesRiskOf', 'estimatesRiskOf', 'The condition, complication, or symptom whose risk is being estimated.'),
(217, 1, 5, 'countryOfLastProcessing', 'countryOfLastProcessing', 'The place where the item (typically [[Product]]) was last processed and tested before importation.'),
(218, 1, 5, 'releaseDate', 'releaseDate', 'The release date of a product or product model. This can be used to distinguish the exact variant of a product.'),
(219, 1, 5, 'isSimilarTo', 'isSimilarTo', 'A pointer to another, functionally similar product (or multiple products).'),
(220, 1, 5, 'trailer', 'trailer', 'The trailer of a movie or TV/radio series, season, episode, etc.'),
(221, 1, 5, 'relatedCondition', 'relatedCondition', 'A medical condition associated with this anatomy.'),
(222, 1, 5, 'postalCodePrefix', 'postalCodePrefix', 'A defined range of postal codes indicated by a common textual prefix. Used for non-numeric systems such as UK.'),
(223, 1, 5, 'departureBusStop', 'departureBusStop', 'The stop or station from which the bus departs.'),
(224, 1, 5, 'datasetTimeInterval', 'datasetTimeInterval', 'The range of temporal applicability of a dataset, e.g. for a 2011 census dataset, the year 2011 (in ISO 8601 time interval format).'),
(225, 1, 5, 'temporalCoverage', 'temporalCoverage', 'The temporalCoverage of a CreativeWork indicates the period that the content applies to, i.e. that it describes, either as a DateTime or as a textual string indicating a time period in [ISO 8601 time interval format](https://en.wikipedia.org/wiki/ISO_8601#Time_intervals). In\n      the case of a Dataset it will typically indicate the relevant time period in a precise notation (e.g. for a 2011 census dataset, the year 2011 would be written \"2011/2012\"). Other forms of content, e.g. ScholarlyArticle, Book, TVSeries or TVEpisode, may indicate their temporalCoverage in broader terms - textually or via well-known URL.\n      Written works such as books may sometimes have precise temporal coverage too, e.g. a work set in 1939 - 1945 can be indicated in ISO 8601 interval format format via \"1939/1945\".\n\nOpen-ended date ranges can be written with \"..\" in place of the end date. For example, \"2015-11/..\" indicates a range beginning in November 2015 and with no specified final date. This is tentative and might be updated in future when ISO 8601 is officially updated.'),
(226, 1, 5, 'cvdNumBedsOcc', 'cvdNumBedsOcc', 'numbedsocc - HOSPITAL INPATIENT BED OCCUPANCY: Total number of staffed inpatient beds that are occupied.'),
(227, 1, 5, 'diseasePreventionInfo', 'diseasePreventionInfo', 'Information about disease prevention.'),
(228, 1, 5, 'flightDistance', 'flightDistance', 'The distance of the flight.'),
(229, 1, 5, 'exceptDate', 'exceptDate', 'Defines a [[Date]] or [[DateTime]] during which a scheduled [[Event]] will not take place. The property allows exceptions to\n      a [[Schedule]] to be specified. If an exception is specified as a [[DateTime]] then only the event that would have started at that specific date and time\n      should be excluded from the schedule. If an exception is specified as a [[Date]] then any event that is scheduled for that 24 hour period should be\n      excluded from the schedule. This allows a whole day to be excluded from the schedule without having to itemise every scheduled event.'),
(230, 1, 5, 'catalogNumber', 'catalogNumber', 'The catalog number for the release.'),
(231, 1, 5, 'costPerUnit', 'costPerUnit', 'The cost per unit of the drug.'),
(232, 1, 5, 'comprisedOf', 'comprisedOf', 'Specifying something physically contained by something else. Typically used here for the underlying anatomical structures, such as organs, that comprise the anatomical system.'),
(233, 1, 5, 'spokenByCharacter', 'spokenByCharacter', 'The (e.g. fictional) character, Person or Organization to whom the quotation is attributed within the containing CreativeWork.'),
(234, 1, 5, 'salaryCurrency', 'salaryCurrency', 'The currency (coded using [ISO 4217](http://en.wikipedia.org/wiki/ISO_4217)) used for the main salary information in this job posting or for this employee.'),
(235, 1, 5, 'acrissCode', 'acrissCode', 'The ACRISS Car Classification Code is a code used by many car rental companies, for classifying vehicles. ACRISS stands for Association of Car Rental Industry Systems and Standards.'),
(236, 1, 5, 'exercisePlan', 'exercisePlan', 'A sub property of instrument. The exercise plan used on this action.'),
(237, 1, 5, 'instrument', 'instrument', 'The object that helped the agent perform the action. E.g. John wrote a book with *a pen*.'),
(238, 1, 5, 'endorsers', 'endorsers', 'People or organizations that endorse the plan.'),
(239, 1, 5, 'transFatContent', 'transFatContent', 'The number of grams of trans fat.'),
(240, 1, 5, 'guidelineDate', 'guidelineDate', 'Date on which this guideline\'s recommendation was made.'),
(241, 1, 5, 'issueNumber', 'issueNumber', 'Identifies the issue of publication; for example, \"iii\" or \"2\".'),
(242, 1, 5, 'position', 'position', 'The position of an item in a series or sequence of items.'),
(243, 1, 5, 'workLocation', 'workLocation', 'A contact location for a person\'s place of work.'),
(244, 1, 5, 'hiringOrganization', 'hiringOrganization', 'Organization or Person offering the job position.'),
(245, 1, 5, 'broadcastChannelId', 'broadcastChannelId', 'The unique address by which the BroadcastService can be identified in a provider lineup. In US, this is typically a number.'),
(246, 1, 5, 'query', 'query', 'A sub property of instrument. The query used on this action.'),
(247, 1, 5, 'jobImmediateStart', 'jobImmediateStart', 'An indicator as to whether a position is available for an immediate start.'),
(248, 1, 5, 'applicationSuite', 'applicationSuite', 'The name of the application suite to which the application belongs (e.g. Excel belongs to Office).'),
(249, 1, 5, 'aircraft', 'aircraft', 'The kind of aircraft (e.g., \"Boeing 747\").'),
(250, 1, 5, 'grantee', 'grantee', 'The person, organization, contact point, or audience that has been granted this permission.'),
(251, 1, 5, 'medicineSystem', 'medicineSystem', 'The system of medicine that includes this MedicalEntity, for example \'evidence-based\', \'homeopathic\', \'chiropractic\', etc.'),
(252, 1, 5, 'correctionsPolicy', 'correctionsPolicy', 'For an [[Organization]] (e.g. [[NewsMediaOrganization]]), a statement describing (in news media, the newsroom’s) disclosure and correction policy for errors.'),
(253, 1, 5, 'sizeSystem', 'sizeSystem', 'The size system used to identify a product\'s size. Typically either a standard (for example, \"GS1\" or \"ISO-EN13402\"), country code (for example \"US\" or \"JP\"), or a measuring system (for example \"Metric\" or \"Imperial\").'),
(254, 1, 5, 'playersOnline', 'playersOnline', 'Number of players on the server.'),
(255, 1, 5, 'industry', 'industry', 'The industry associated with the job position.'),
(256, 1, 5, 'menuAddOn', 'menuAddOn', 'Additional menu item(s) such as a side dish of salad or side order of fries that can be added to this menu item. Additionally it can be a menu section containing allowed add-on menu items for this menu item.'),
(257, 1, 5, 'directApply', 'directApply', 'Indicates whether an [[url]] that is associated with a [[JobPosting]] enables direct application for the job, via the posting website. A job posting is considered to have directApply of [[True]] if an application process for the specified job can be directly initiated via the url(s) given (noting that e.g. multiple internet domains might nevertheless be involved at an implementation level). A value of [[False]] is appropriate if there is no clear path to applying directly online for the specified job, navigating directly from the JobPosting url(s) supplied.'),
(258, 1, 5, 'evidenceOrigin', 'evidenceOrigin', 'Source of the data used to formulate the guidance, e.g. RCT, consensus opinion, etc.'),
(259, 1, 5, 'actionableFeedbackPolicy', 'actionableFeedbackPolicy', 'For a [[NewsMediaOrganization]] or other news-related [[Organization]], a statement about public engagement activities (for news media, the newsroom’s), including involving the public - digitally or otherwise -- in coverage decisions, reporting and activities after publication.'),
(260, 1, 5, 'utterances', 'utterances', 'Text of an utterances (spoken words, lyrics etc.) that occurs at a certain section of a media object, represented as a [[HyperTocEntry]].'),
(261, 1, 5, 'studyLocation', 'studyLocation', 'The location in which the study is taking/took place.'),
(262, 1, 5, 'accessibilityControl', 'accessibilityControl', 'Identifies input methods that are sufficient to fully control the described resource. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessibilityControl-vocabulary).'),
(263, 1, 5, 'maximumEnrollment', 'maximumEnrollment', 'The maximum number of students who may be enrolled in the program.'),
(264, 1, 5, 'checkoutPageURLTemplate', 'checkoutPageURLTemplate', 'A URL template (RFC 6570) for a checkout page for an offer. This approach allows merchants to specify a URL for online checkout of the offered product, by interpolating parameters such as the logged in user ID, product ID, quantity, discount code etc. Parameter naming and standardization are not specified here.'),
(265, 1, 5, 'musicBy', 'musicBy', 'The composer of the soundtrack.'),
(266, 1, 5, 'lastReviewed', 'lastReviewed', 'Date on which the content on this web page was last reviewed for accuracy and/or completeness.'),
(267, 1, 5, 'courseMode', 'courseMode', 'The medium or means of delivery of the course instance or the mode of study, either as a text label (e.g. \"online\", \"onsite\" or \"blended\"; \"synchronous\" or \"asynchronous\"; \"full-time\" or \"part-time\") or as a URL reference to a term from a controlled vocabulary (e.g. https://ceds.ed.gov/element/001311#Asynchronous).'),
(268, 1, 5, 'competencyRequired', 'competencyRequired', 'Knowledge, skill, ability or personal attribute that must be demonstrated by a person or other entity in order to do something such as earn an Educational Occupational Credential or understand a LearningResource.'),
(269, 1, 5, 'paymentMethod', 'paymentMethod', 'The name of the credit card or other method of payment for the order.'),
(270, 1, 5, 'honorificPrefix', 'honorificPrefix', 'An honorific prefix preceding a Person\'s name such as Dr/Mrs/Mr.'),
(271, 1, 5, 'bed', 'bed', 'The type of bed or beds included in the accommodation. For the single case of just one bed of a certain type, you use bed directly with a text.\n      If you want to indicate the quantity of a certain kind of bed, use an instance of BedDetails. For more detailed information, use the amenityFeature property.'),
(272, 1, 5, 'tracks', 'tracks', 'A music recording (track)&#x2014;usually a single song.'),
(273, 1, 5, 'track', 'track', 'A music recording (track)&#x2014;usually a single song. If an ItemList is given, the list should contain items of type MusicRecording.'),
(274, 1, 5, 'mathExpression', 'mathExpression', 'A mathematical expression (e.g. \'x^2-3x=0\') that may be solved for a specific variable, simplified, or transformed. This can take many formats, e.g. LaTeX, Ascii-Math, or math as you would write with a keyboard.'),
(275, 1, 5, 'isbn', 'isbn', 'The ISBN of the book.'),
(276, 1, 5, 'identifier', 'identifier', 'The identifier property represents any kind of identifier for any kind of [[Thing]], such as ISBNs, GTIN codes, UUIDs etc. Schema.org provides dedicated properties for representing many of these, either as textual strings or as URL (URI) links. See [background notes](/docs/datamodel.html#identifierBg) for more details.\n        '),
(277, 1, 5, 'countriesSupported', 'countriesSupported', 'Countries for which the application is supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.'),
(278, 1, 5, 'checkinTime', 'checkinTime', 'The earliest someone may check into a lodging establishment.'),
(279, 1, 5, 'deliveryMethod', 'deliveryMethod', 'A sub property of instrument. The method of delivery.'),
(280, 1, 5, 'hasBioPolymerSequence', 'hasBioPolymerSequence', 'A symbolic representation of a BioChemEntity. For example, a nucleotide sequence of a Gene or an amino acid sequence of a Protein.'),
(281, 1, 5, 'hasRepresentation', 'hasRepresentation', 'A common representation such as a protein sequence or chemical structure for this entity. For images use schema.org/image.'),
(282, 1, 5, 'distribution', 'distribution', 'A downloadable form of this dataset, at a specific location, in a specific format. This property can be repeated if different variations are available. There is no expectation that different downloadable distributions must contain exactly equivalent information (see also [DCAT](https://www.w3.org/TR/vocab-dcat-3/#Class:Distribution) on this point). Different distributions might include or exclude different subsets of the entire dataset, for example.'),
(283, 1, 5, 'bankAccountType', 'bankAccountType', 'The type of a bank account.'),
(284, 1, 5, 'mediaItemAppearance', 'mediaItemAppearance', 'In the context of a [[MediaReview]], indicates specific media item(s) that are grouped using a [[MediaReviewItem]].'),
(285, 1, 5, 'audio', 'audio', 'An embedded audio object.'),
(286, 1, 5, 'playMode', 'playMode', 'Indicates whether this game is multi-player, co-op or single-player.  The game can be marked as multi-player, co-op and single-player at the same time.'),
(287, 1, 5, 'foodWarning', 'foodWarning', 'Any precaution, guidance, contraindication, etc. related to consumption of specific foods while taking this drug.'),
(288, 1, 5, 'vehicleInteriorType', 'vehicleInteriorType', 'The type or material of the interior of the vehicle (e.g. synthetic fabric, leather, wood, etc.). While most interior types are characterized by the material used, an interior type can also be based on vehicle usage or target audience.'),
(289, 1, 5, 'assesses', 'assesses', 'The item being described is intended to assess the competency or learning outcome defined by the referenced term.'),
(290, 1, 5, 'currentExchangeRate', 'currentExchangeRate', 'The current price of a currency.'),
(291, 1, 5, 'numberOfBathroomsTotal', 'numberOfBathroomsTotal', 'The total integer number of bathrooms in some [[Accommodation]], following real estate conventions as [documented in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsTotalInteger+Field): \"The simple sum of the number of bathrooms. For example for a property with two Full Bathrooms and one Half Bathroom, the Bathrooms Total Integer will be 3.\". See also [[numberOfRooms]].'),
(292, 1, 5, 'experienceInPlaceOfEducation', 'experienceInPlaceOfEducation', 'Indicates whether a [[JobPosting]] will accept experience (as indicated by [[OccupationalExperienceRequirements]]) in place of its formal educational qualifications (as indicated by [[educationRequirements]]). If true, indicates that satisfying one of these requirements is sufficient.'),
(293, 1, 5, 'legislationTransposes', 'legislationTransposes', 'Indicates that this legislation (or part of legislation) fulfills the objectives set by another legislation, by passing appropriate implementation measures. Typically, some legislations of European Union\'s member states or regions transpose European Directives. This indicates a legally binding link between the 2 legislations.'),
(294, 1, 5, 'legislationApplies', 'legislationApplies', 'Indicates that this legislation (or part of a legislation) somehow transfers another legislation in a different legislative context. This is an informative link, and it has no legal value. For legally-binding links of transposition, use the <a href=\"/legislationTransposes\">legislationTransposes</a> property. For example an informative consolidated law of a European Union\'s member state \"applies\" the consolidated version of the European Directive implemented in it.'),
(295, 1, 5, 'distinguishingSign', 'distinguishingSign', 'One of a set of signs and symptoms that can be used to distinguish this diagnosis from others in the differential diagnosis.'),
(296, 1, 5, 'legislationJurisdiction', 'legislationJurisdiction', 'The jurisdiction from which the legislation originates.'),
(297, 1, 5, 'jurisdiction', 'jurisdiction', 'Indicates a legal jurisdiction, e.g. of some legislation, or where some government service is based.'),
(298, 1, 5, 'spatialCoverage', 'spatialCoverage', 'The spatialCoverage of a CreativeWork indicates the place(s) which are the focus of the content. It is a subproperty of\n      contentLocation intended primarily for more technical and detailed materials. For example with a Dataset, it indicates\n      areas that the dataset describes: a dataset of New York weather would have spatialCoverage which was the place: the state of New York.'),
(299, 1, 5, 'arrivalAirport', 'arrivalAirport', 'The airport where the flight terminates.'),
(300, 1, 5, 'interactingDrug', 'interactingDrug', 'Another drug that is known to interact with this drug in a way that impacts the effect of this drug or causes a risk to the patient. Note: disease interactions are typically captured as contraindications.'),
(301, 1, 5, 'availabilityStarts', 'availabilityStarts', 'The beginning of the availability of the product or service included in the offer.'),
(302, 1, 5, 'vehicleSeatingCapacity', 'vehicleSeatingCapacity', 'The number of passengers that can be seated in the vehicle, both in terms of the physical space available, and in terms of limitations set by law.\\n\\nTypical unit code(s): C62 for persons.'),
(303, 1, 5, 'relevantOccupation', 'relevantOccupation', 'The Occupation for the JobPosting.'),
(304, 1, 5, 'phoneticText', 'phoneticText', 'Representation of a text [[textValue]] using the specified [[speechToTextMarkup]]. For example the city name of Houston in IPA: /ˈhjuːstən/.'),
(305, 1, 5, 'vehicleInteriorColor', 'vehicleInteriorColor', 'The color or color combination of the interior of the vehicle.'),
(306, 1, 5, 'broadcastSubChannel', 'broadcastSubChannel', 'The subchannel used for the broadcast.'),
(307, 1, 5, 'targetPlatform', 'targetPlatform', 'Type of app development: phone, Metro style, desktop, XBox, etc.'),
(308, 1, 5, 'naics', 'naics', 'The North American Industry Classification System (NAICS) code for a particular organization or business person.'),
(309, 1, 5, 'color', 'color', 'The color of the product.'),
(310, 1, 5, 'risks', 'risks', 'Specific physiologic risks associated to the diet plan.'),
(311, 1, 5, 'dateIssued', 'dateIssued', 'The date the ticket was issued.'),
(312, 1, 5, 'propertyID', 'propertyID', 'A commonly used identifier for the characteristic represented by the property, e.g. a manufacturer or a standard code for a property. propertyID can be\n(1) a prefixed string, mainly meant to be used with standards for product properties; (2) a site-specific, non-prefixed string (e.g. the primary key of the property or the vendor-specific ID of the property), or (3)\na URL indicating the type of the property, either pointing to an external vocabulary, or a Web resource that describes the property (e.g. a glossary entry).\nStandards bodies should promote a standard prefix for the identifiers of properties from their standards.'),
(313, 1, 5, 'directors', 'directors', 'A director of e.g. TV, radio, movie, video games etc. content. Directors can be associated with individual items or with a series, episode, clip.'),
(314, 1, 5, 'director', 'director', 'A director of e.g. TV, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.'),
(315, 1, 5, 'map', 'map', 'A URL to a map of the place.'),
(316, 1, 5, 'hasMap', 'hasMap', 'A URL to a map of the place.'),
(317, 1, 5, 'stageAsNumber', 'stageAsNumber', 'The stage represented as a number, e.g. 3.'),
(318, 1, 5, 'awards', 'awards', 'Awards won by or for this item.'),
(319, 1, 5, 'award', 'award', 'An award won by or for this item.'),
(320, 1, 5, 'associatedDisease', 'associatedDisease', 'Disease associated to this BioChemEntity. Such disease can be a MedicalCondition or a URL. If you want to add an evidence supporting the association, please use PropertyValue.'),
(321, 1, 5, 'amenityFeature', 'amenityFeature', 'An amenity feature (e.g. a characteristic or service) of the Accommodation. This generic property does not make a statement about whether the feature is included in an offer for the main accommodation or available at extra costs.'),
(322, 1, 5, 'birthDate', 'birthDate', 'Date of birth.'),
(323, 1, 5, 'valueMaxLength', 'valueMaxLength', 'Specifies the allowed range for number of characters in a literal value.'),
(324, 1, 5, 'programName', 'programName', 'The program providing the membership.'),
(325, 1, 5, 'isRelatedTo', 'isRelatedTo', 'A pointer to another, somehow related product (or multiple products).'),
(326, 1, 5, 'vehicleModelDate', 'vehicleModelDate', 'The release date of a vehicle model (often used to differentiate versions of the same make and model).'),
(327, 1, 5, 'typicalCreditsPerTerm', 'typicalCreditsPerTerm', 'The number of credits or units a full-time student would be expected to take in 1 term however \'term\' is defined by the institution.'),
(328, 1, 5, 'titleEIDR', 'titleEIDR', 'An [EIDR](https://eidr.org/) (Entertainment Identifier Registry) [[identifier]] representing at the most general/abstract level, a work of film or television.\n\nFor example, the motion picture known as \"Ghostbusters\" has a titleEIDR of  \"10.5240/7EC7-228A-510A-053E-CBB8-J\". This title (or work) may have several variants, which EIDR calls \"edits\". See [[editEIDR]].\n\nSince schema.org types like [[Movie]] and [[TVEpisode]] can be used for both works and their multiple expressions, it is possible to use [[titleEIDR]] alone (for a general description), or alongside [[editEIDR]] for a more edit-specific description.\n'),
(329, 1, 5, 'editEIDR', 'editEIDR', 'An [EIDR](https://eidr.org/) (Entertainment Identifier Registry) [[identifier]] representing a specific edit / edition for a work of film or television.\n\nFor example, the motion picture known as \"Ghostbusters\" whose [[titleEIDR]] is \"10.5240/7EC7-228A-510A-053E-CBB8-J\" has several edits, e.g. \"10.5240/1F2A-E1C5-680A-14C6-E76B-I\" and \"10.5240/8A35-3BEE-6497-5D12-9E4F-3\".\n\nSince schema.org types like [[Movie]] and [[TVEpisode]] can be used for both works and their multiple expressions, it is possible to use [[titleEIDR]] alone (for a general description), or alongside [[editEIDR]] for a more edit-specific description.\n'),
(330, 1, 5, 'embeddedTextCaption', 'embeddedTextCaption', 'Represents textual captioning from a [[MediaObject]], e.g. text of a \'meme\'.'),
(331, 1, 5, 'caption', 'caption', 'The caption for this object. For downloadable machine formats (closed caption, subtitles etc.) use MediaObject and indicate the [[encodingFormat]].'),
(332, 1, 5, 'recommendedIntake', 'recommendedIntake', 'Recommended intake of this supplement for a given population as defined by a specific recommending authority.'),
(333, 1, 5, 'instructor', 'instructor', 'A person assigned to instruct or provide instructional assistance for the [[CourseInstance]].'),
(334, 1, 5, 'administrationRoute', 'administrationRoute', 'A route by which this drug may be administered, e.g. \'oral\'.'),
(335, 1, 5, 'postOp', 'postOp', 'A description of the postoperative procedures, care, and/or followups for this device.'),
(336, 1, 5, 'subStructure', 'subStructure', 'Component (sub-)structure(s) that comprise this anatomical structure.'),
(337, 1, 5, 'isResizable', 'isResizable', 'Whether the 3DModel allows resizing. For example, room layout applications often do not allow 3DModel elements to be resized to reflect reality.'),
(338, 1, 5, 'affectedBy', 'affectedBy', 'Drugs that affect the test\'s results.'),
(339, 1, 5, 'healthPlanPharmacyCategory', 'healthPlanPharmacyCategory', 'The category or type of pharmacy associated with this cost sharing.'),
(340, 1, 5, 'authenticator', 'authenticator', 'The Organization responsible for authenticating the user\'s subscription. For example, many media apps require a cable/satellite provider to authenticate your subscription before playing media.'),
(341, 1, 5, 'vehicleIdentificationNumber', 'vehicleIdentificationNumber', 'The Vehicle Identification Number (VIN) is a unique serial number used by the automotive industry to identify individual motor vehicles.'),
(342, 1, 5, 'serialNumber', 'serialNumber', 'The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.'),
(343, 1, 5, 'coverageStartTime', 'coverageStartTime', 'The time when the live blog will begin covering the Event. Note that coverage may begin before the Event\'s start time. The LiveBlogPosting may also be created before coverage begins.'),
(344, 1, 5, 'contentReferenceTime', 'contentReferenceTime', 'The specific time described by a creative work, for works (e.g. articles, video objects etc.) that emphasise a particular moment within an Event.'),
(345, 1, 5, 'epidemiology', 'epidemiology', 'The characteristics of associated patients, such as age, gender, race etc.'),
(346, 1, 5, 'schoolClosuresInfo', 'schoolClosuresInfo', 'Information about school closures.'),
(347, 1, 5, 'callSign', 'callSign', 'A [callsign](https://en.wikipedia.org/wiki/Call_sign), as used in broadcasting and radio communications to identify people, radio and TV stations, or vehicles.'),
(348, 1, 5, 'acquiredFrom', 'acquiredFrom', 'The organization or person from which the product was acquired.'),
(349, 1, 5, 'branchCode', 'branchCode', 'A short textual code (also called \"store code\") that uniquely identifies a place of business. The code is typically assigned by the parentOrganization and used in structured URLs.\\n\\nFor example, in the URL http://www.starbucks.co.uk/store-locator/etc/detail/3047 the code \"3047\" is a branchCode for a particular branch.\n      '),
(350, 1, 5, 'drug', 'drug', 'Specifying a drug or medicine used in a medication procedure.'),
(351, 1, 5, 'code', 'code', 'A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.'),
(352, 1, 5, 'codingSystem', 'codingSystem', 'The coding system, e.g. \'ICD-10\'.'),
(353, 1, 5, 'gtin12', 'gtin12', 'The GTIN-12 code of the product, or the product to which the offer refers. The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.'),
(354, 1, 5, 'gtin', 'gtin', 'A Global Trade Item Number ([GTIN](https://www.gs1.org/standards/id-keys/gtin)). GTINs identify trade items, including products and services, using numeric identification codes.\n\nThe GS1 [digital link specifications](https://www.gs1.org/standards/Digital-Link/) express GTINs as URLs (URIs, IRIs, etc.). Details including regular expression examples can be found in, Section 6 of the GS1 URI Syntax specification; see also [schema.org tracking issue](https://github.com/schemaorg/schemaorg/issues/3156#issuecomment-1209522809) for schema.org-specific discussion. A correct [[gtin]] value should be a valid GTIN, which means that it should be an all-numeric string of either 8, 12, 13 or 14 digits, or a \"GS1 Digital Link\" URL based on such a string. The numeric component should also have a [valid GS1 check digit](https://www.gs1.org/services/check-digit-calculator) and meet the other rules for valid GTINs. See also [GS1\'s GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) and [Wikipedia](https://en.wikipedia.org/wiki/Global_Trade_Item_Number) for more details. Left-padding of the gtin values is not required or encouraged. The [[gtin]] property generalizes the earlier [[gtin8]], [[gtin12]], [[gtin13]], and [[gtin14]] properties.\n\nNote also that this is a definition for how to include GTINs in Schema.org data, and not a definition of GTINs in general - see the GS1 documentation for authoritative details.'),
(355, 1, 5, 'applicationStartDate', 'applicationStartDate', 'The date at which the program begins collecting applications for the next enrollment cycle.'),
(356, 1, 5, 'includesObject', 'includesObject', 'This links to a node or nodes indicating the exact quantity of the products included in  an [[Offer]] or [[ProductCollection]].'),
(357, 1, 5, 'volumeNumber', 'volumeNumber', 'Identifies the volume of publication or multi-part work; for example, \"iii\" or \"2\".'),
(358, 1, 5, 'acceptedOffer', 'acceptedOffer', 'The offer(s) -- e.g., product, quantity and price combinations -- included in the order.'),
(359, 1, 5, 'cvdNumC19HospPats', 'cvdNumC19HospPats', 'numc19hosppats - HOSPITALIZED: Patients currently hospitalized in an inpatient care location who have suspected or confirmed COVID-19.'),
(360, 1, 5, 'entertainmentBusiness', 'entertainmentBusiness', 'A sub property of location. The entertainment business where the action occurred.'),
(361, 1, 5, 'educationalLevel', 'educationalLevel', 'The level in terms of progression through an educational or training context. Examples of educational levels include \'beginner\', \'intermediate\' or \'advanced\', and formal sets of level indicators.'),
(362, 1, 5, 'uploadDate', 'uploadDate', 'Date when this media object was uploaded to this site.'),
(363, 1, 5, 'programType', 'programType', 'The type of educational or occupational program. For example, classroom, internship, alternance, etc.'),
(364, 1, 5, 'highPrice', 'highPrice', 'The highest price of all offers available.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(365, 1, 5, 'byDay', 'byDay', 'Defines the day(s) of the week on which a recurring [[Event]] takes place. May be specified using either [[DayOfWeek]], or alternatively [[Text]] conforming to iCal\'s syntax for byDay recurrence rules.'),
(366, 1, 5, 'additionalProperty', 'additionalProperty', 'A property-value pair representing an additional characteristic of the entity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.\\n\\nNote: Publishers should be aware that applications designed to use specific schema.org properties (e.g. https://schema.org/width, https://schema.org/color, https://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.\n'),
(367, 1, 5, 'catalog', 'catalog', 'A data catalog which contains this dataset.'),
(368, 1, 5, 'includedInDataCatalog', 'includedInDataCatalog', 'A data catalog which contains this dataset.'),
(369, 1, 5, 'seriousAdverseOutcome', 'seriousAdverseOutcome', 'A possible serious complication and/or serious side effect of this therapy. Serious adverse outcomes include those that are life-threatening; result in death, disability, or permanent damage; require hospitalization or prolong existing hospitalization; cause congenital anomalies or birth defects; or jeopardize the patient and may require medical or surgical intervention to prevent one of the outcomes in this definition.'),
(370, 1, 5, 'brand', 'brand', 'The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.'),
(371, 1, 5, 'isLiveBroadcast', 'isLiveBroadcast', 'True if the broadcast is of a live event.'),
(372, 1, 5, 'sensoryRequirement', 'sensoryRequirement', 'A description of any sensory requirements and levels necessary to function on the job, including hearing and vision. Defined terms such as those in O*net may be used, but note that there is no way to specify the level of ability as well as its nature when using a defined term.'),
(373, 1, 5, 'linkRelationship', 'linkRelationship', 'Indicates the relationship type of a Web link. '),
(374, 1, 5, 'productSupported', 'productSupported', 'The product or service this support contact point is related to (such as product support for a particular product line). This can be a specific product or product line (e.g. \"iPhone\") or a general category of products or services (e.g. \"smartphones\").'),
(375, 1, 5, 'ccRecipient', 'ccRecipient', 'A sub property of recipient. The recipient copied on a message.'),
(376, 1, 5, 'recipient', 'recipient', 'A sub property of participant. The participant who is at the receiving end of the action.'),
(377, 1, 5, 'occupationalCategory', 'occupationalCategory', 'A category describing the job, preferably using a term from a taxonomy such as [BLS O*NET-SOC](http://www.onetcenter.org/taxonomy.html), [ISCO-08](https://www.ilo.org/public/english/bureau/stat/isco/isco08/) or similar, with the property repeated for each applicable value. Ideally the taxonomy should be identified, and both the textual label and formal code for the category should be provided.\\n\nNote: for historical reasons, any textual label and formal code provided as a literal may be assumed to be from O*NET-SOC.'),
(378, 1, 5, 'responsibilities', 'responsibilities', 'Responsibilities associated with this role or Occupation.'),
(379, 1, 5, 'nonEqual', 'nonEqual', 'This ordering relation for qualitative values indicates that the subject is not equal to the object.'),
(380, 1, 5, 'qualifications', 'qualifications', 'Specific qualifications required for this role or Occupation.'),
(381, 1, 5, 'contactlessPayment', 'contactlessPayment', 'A secure method for consumers to purchase products or services via debit, credit or smartcards by using RFID or NFC technology.'),
(382, 1, 5, 'causeOf', 'causeOf', 'The condition, complication, symptom, sign, etc. caused.'),
(383, 1, 5, 'passengerPriorityStatus', 'passengerPriorityStatus', 'The priority status assigned to a passenger for security or boarding (e.g. FastTrack or Priority).'),
(384, 1, 5, 'freeShippingThreshold', 'freeShippingThreshold', 'A monetary value above (or at) which the shipping rate becomes free. Intended to be used via an [[OfferShippingDetails]] with [[shippingSettingsLink]] matching this [[ShippingRateSettings]].'),
(385, 1, 5, 'marginOfError', 'marginOfError', 'A marginOfError for an [[Observation]].'),
(386, 1, 5, 'pageStart', 'pageStart', 'The page on which the work starts; for example \"135\" or \"xiii\".'),
(387, 1, 5, 'dateRead', 'dateRead', 'The date/time at which the message has been read by the recipient if a single recipient exists.'),
(388, 1, 5, 'tool', 'tool', 'A sub property of instrument. An object used (but not consumed) when performing instructions or a direction.'),
(389, 1, 5, 'priceCurrency', 'priceCurrency', 'The currency of the price, or a price component when attached to [[PriceSpecification]] and its subtypes.\\n\\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\".'),
(390, 1, 5, 'merchantReturnDays', 'merchantReturnDays', 'Specifies either a fixed return date or the number of days (from the delivery date) that a product can be returned. Used when the [[returnPolicyCategory]] property is specified as [[MerchantReturnFiniteReturnWindow]].'),
(391, 1, 5, 'sugarContent', 'sugarContent', 'The number of grams of sugar.'),
(392, 1, 5, 'thumbnail', 'thumbnail', 'Thumbnail image for an image or video.'),
(393, 1, 5, 'hasMenuSection', 'hasMenuSection', 'A subgrouping of the menu (by dishes, course, serving time period, etc.).'),
(394, 1, 5, 'loanRepaymentForm', 'loanRepaymentForm', 'A form of paying back money previously borrowed from a lender. Repayment usually takes the form of periodic payments that normally include part principal plus interest in each payment.'),
(395, 1, 5, 'publisherImprint', 'publisherImprint', 'The publishing division which published the comic.'),
(396, 1, 5, 'productionCompany', 'productionCompany', 'The production company or studio responsible for the item, e.g. series, video game, episode etc.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(397, 1, 5, 'startTime', 'startTime', 'The startTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start. For actions that span a period of time, when the action was performed. E.g. John wrote a book from *January* to December. For media, including audio and video, it\'s the time offset of the start of a clip within a larger file.\\n\\nNote that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.'),
(398, 1, 5, 'contactPoints', 'contactPoints', 'A contact point for a person or organization.'),
(399, 1, 5, 'contactPoint', 'contactPoint', 'A contact point for a person or organization.'),
(400, 1, 5, 'candidate', 'candidate', 'A sub property of object. The candidate subject of this action.'),
(401, 1, 5, 'object', 'object', 'The object upon which the action is carried out, whose state is kept intact or changed. Also known as the semantic roles patient, affected or undergoer (which change their state) or theme (which doesn\'t). E.g. John read *a book*.'),
(402, 1, 5, 'netWorth', 'netWorth', 'The total financial value of the person as calculated by subtracting assets from liabilities.'),
(403, 1, 5, 'recordLabel', 'recordLabel', 'The label that issued the release.'),
(404, 1, 5, 'offerCount', 'offerCount', 'The number of offers for the product.'),
(405, 1, 5, 'seasons', 'seasons', 'A season in a media series.'),
(406, 1, 5, 'season', 'season', 'A season in a media series.'),
(407, 1, 5, 'status', 'status', 'The status of the study (enumerated).'),
(408, 1, 5, 'includedComposition', 'includedComposition', 'Smaller compositions included in this work (e.g. a movement in a symphony).'),
(409, 1, 5, 'inventoryLevel', 'inventoryLevel', 'The current approximate inventory level for the item or items.'),
(410, 1, 5, 'isPlanForApartment', 'isPlanForApartment', 'Indicates some accommodation that this floor plan describes.'),
(411, 1, 5, 'teaches', 'teaches', 'The item being described is intended to help a person learn the competency or learning outcome defined by the referenced term.'),
(412, 1, 5, 'numberedPosition', 'numberedPosition', 'A number associated with a role in an organization, for example, the number on an athlete\'s jersey.'),
(413, 1, 5, 'governmentBenefitsInfo', 'governmentBenefitsInfo', 'governmentBenefitsInfo provides information about government benefits associated with a SpecialAnnouncement.'),
(414, 1, 5, 'cvdNumC19OverflowPats', 'cvdNumC19OverflowPats', 'numc19overflowpats - ED/OVERFLOW: Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed.'),
(415, 1, 5, 'procedure', 'procedure', 'A description of the procedure involved in setting up, using, and/or installing the device.'),
(416, 1, 5, 'paymentUrl', 'paymentUrl', 'The URL for sending a payment.'),
(417, 1, 5, 'endTime', 'endTime', 'The endTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end. For actions that span a period of time, when the action was performed. E.g. John wrote a book from January to *December*. For media, including audio and video, it\'s the time offset of the end of a clip within a larger file.\\n\\nNote that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.'),
(418, 1, 5, 'itemListElement', 'itemListElement', 'For itemListElement values, you can use simple strings (e.g. \"Peter\", \"Paul\", \"Mary\"), existing entities, or use ListItem.\\n\\nText values are best if the elements in the list are plain strings. Existing entities are best for a simple, unordered list of existing things in your data. ListItem is used with ordered lists when you want to provide additional context about the element in that list or when the same item might be in different places in different lists.\\n\\nNote: The order of elements in your mark-up is not sufficient for indicating the order or elements.  Use ListItem with a \'position\' property in such cases.'),
(419, 1, 5, 'successorOf', 'successorOf', 'A pointer from a newer variant of a product  to its previous, often discontinued predecessor.'),
(420, 1, 5, 'cvdNumVent', 'cvdNumVent', 'numvent - MECHANICAL VENTILATORS: Total number of ventilators available.'),
(421, 1, 5, 'numberOfRooms', 'numberOfRooms', 'The number of rooms (excluding bathrooms and closets) of the accommodation or lodging business.\nTypical unit code(s): ROM for room or C62 for no unit. The type of room can be put in the unitText property of the QuantitativeValue.'),
(422, 1, 5, 'potentialUse', 'potentialUse', 'Intended use of the BioChemEntity by humans.'),
(423, 1, 5, 'characterAttribute', 'characterAttribute', 'A piece of data that represents a particular aspect of a fictional character (skill, power, character points, advantage, disadvantage).'),
(424, 1, 5, 'chemicalComposition', 'chemicalComposition', 'The chemical composition describes the identity and relative ratio of the chemical elements that make up the substance.'),
(425, 1, 5, 'numberOfSeasons', 'numberOfSeasons', 'The number of seasons in this series.'),
(426, 1, 5, 'offersPrescriptionByMail', 'offersPrescriptionByMail', 'Whether prescriptions can be delivered by mail.'),
(427, 1, 5, 'lyricist', 'lyricist', 'The person who wrote the words.'),
(428, 1, 5, 'sdPublisher', 'sdPublisher', 'Indicates the party responsible for generating and publishing the current structured data markup, typically in cases where the structured data is derived automatically from existing published content but published on a different site. For example, student projects and open data initiatives often re-publish existing content with more explicitly structured metadata. The\n[[sdPublisher]] property helps make such practices more explicit.'),
(429, 1, 5, 'isAvailableGenerically', 'isAvailableGenerically', 'True if the drug is available in a generic form (regardless of name).'),
(430, 1, 5, 'algorithm', 'algorithm', 'The algorithm or rules to follow to compute the score.'),
(431, 1, 5, 'includedRiskFactor', 'includedRiskFactor', 'A modifiable or non-modifiable risk factor included in the calculation, e.g. age, coexisting condition.'),
(432, 1, 5, 'colorist', 'colorist', 'The individual who adds color to inked drawings.'),
(433, 1, 5, 'recipeInstructions', 'recipeInstructions', 'A step in making the recipe, in the form of a single item (document, video, etc.) or an ordered list with HowToStep and/or HowToSection items.'),
(434, 1, 5, 'repeatFrequency', 'repeatFrequency', 'Defines the frequency at which [[Event]]s will occur according to a schedule [[Schedule]]. The intervals between\n      events should be defined as a [[Duration]] of time.'),
(435, 1, 5, 'frequency', 'frequency', 'How often the dose is taken, e.g. \'daily\'.'),
(436, 1, 5, 'beneficiaryBank', 'beneficiaryBank', 'A bank or bank’s branch, financial institution or international financial institution operating the beneficiary’s bank account or releasing funds for the beneficiary.'),
(437, 1, 5, 'arrivalGate', 'arrivalGate', 'Identifier of the flight\'s arrival gate.'),
(438, 1, 5, 'contentType', 'contentType', 'The supported content type(s) for an EntryPoint response.'),
(439, 1, 5, 'arrivalBoatTerminal', 'arrivalBoatTerminal', 'The terminal or port from which the boat arrives.'),
(440, 1, 5, 'address', 'address', 'Physical address of the item.'),
(441, 1, 5, 'checkoutTime', 'checkoutTime', 'The latest someone may check out of a lodging establishment.'),
(442, 1, 5, 'billingAddress', 'billingAddress', 'The billing address for the order.'),
(443, 1, 5, 'eventSchedule', 'eventSchedule', 'Associates an [[Event]] with a [[Schedule]]. There are circumstances where it is preferable to share a schedule for a series of\n      repeating events rather than data on the individual events themselves. For example, a website or application might prefer to publish a schedule for a weekly\n      gym class rather than provide data on every event. A schedule could be processed by applications to add forthcoming events to a calendar. An [[Event]] that\n      is associated with a [[Schedule]] using this property should not have [[startDate]] or [[endDate]] properties. These are instead defined within the associated\n      [[Schedule]], this avoids any ambiguity for clients using the data. The property might have repeated values to specify different schedules, e.g. for different months\n      or seasons.'),
(444, 1, 5, 'validThrough', 'validThrough', 'The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.'),
(445, 1, 5, 'warrantyPromise', 'warrantyPromise', 'The warranty promise(s) included in the offer.'),
(446, 1, 5, 'warranty', 'warranty', 'The warranty promise(s) included in the offer.'),
(447, 1, 5, 'relatedTherapy', 'relatedTherapy', 'A medical therapy related to this anatomy.'),
(448, 1, 5, 'slogan', 'slogan', 'A slogan or motto associated with the item.'),
(449, 1, 5, 'employmentUnit', 'employmentUnit', 'Indicates the department, unit and/or facility where the employee reports and/or in which the job is to be performed.'),
(450, 1, 5, 'geographicArea', 'geographicArea', 'The geographic area associated with the audience.'),
(451, 1, 5, 'inverseOf', 'inverseOf', 'Relates a property to a property that is its inverse. Inverse properties relate the same pairs of items to each other, but in reversed direction. For example, the \'alumni\' and \'alumniOf\' properties are inverseOf each other. Some properties don\'t have explicit inverses; in these situations RDFa and JSON-LD syntax for reverse properties can be used.'),
(452, 1, 5, 'broadcastTimezone', 'broadcastTimezone', 'The timezone in [ISO 8601 format](http://en.wikipedia.org/wiki/ISO_8601) for which the service bases its broadcasts.'),
(453, 1, 5, 'timeOfDay', 'timeOfDay', 'The time of day the program normally runs. For example, \"evenings\".'),
(454, 1, 5, 'bestRating', 'bestRating', 'The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.'),
(455, 1, 5, 'processingTime', 'processingTime', 'Estimated processing time for the service using this channel.'),
(456, 1, 5, 'membershipPointsEarned', 'membershipPointsEarned', 'The number of membership points earned by the member. If necessary, the unitText can be used to express the units the points are issued in. (E.g. stars, miles, etc.)'),
(457, 1, 5, 'elevation', 'elevation', 'The elevation of a location ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)). Values may be of the form \'NUMBER UNIT\\_OF\\_MEASUREMENT\' (e.g., \'1,000 m\', \'3,200 ft\') while numbers alone should be assumed to be a value in meters.'),
(458, 1, 5, 'creditedTo', 'creditedTo', 'The group the release is credited to if different than the byArtist. For example, Red and Blue is credited to \"Stefani Germanotta Band\", but by Lady Gaga.'),
(459, 1, 5, 'sport', 'sport', 'A type of sport (e.g. Baseball).'),
(460, 1, 5, 'seeks', 'seeks', 'A pointer to products or services sought by the organization or person (demand).'),
(461, 1, 5, 'additionalName', 'additionalName', 'An additional name for a Person, can be used for a middle name.'),
(462, 1, 5, 'alternateName', 'alternateName', 'An alias for the item.'),
(463, 1, 5, 'downPayment', 'downPayment', 'a type of payment made in cash during the onset of the purchase of an expensive good/service. The payment typically represents only a percentage of the full purchase price.'),
(464, 1, 5, 'postOfficeBoxNumber', 'postOfficeBoxNumber', 'The post office box number for PO box addresses.'),
(465, 1, 5, 'energyEfficiencyScaleMax', 'energyEfficiencyScaleMax', 'Specifies the most energy efficient class on the regulated EU energy consumption scale for the product category a product belongs to. For example, energy consumption for televisions placed on the market after January 1, 2020 is scaled from D to A+++.'),
(466, 1, 5, 'userInteractionCount', 'userInteractionCount', 'The number of interactions for the CreativeWork using the WebSite or SoftwareApplication.'),
(467, 1, 5, 'sizeGroup', 'sizeGroup', 'The size group (also known as \"size type\") for a product\'s size. Size groups are common in the fashion industry to define size segments and suggested audiences for wearable products. Multiple values can be combined, for example \"men\'s big and tall\", \"petite maternity\" or \"regular\"'),
(468, 1, 5, 'productionDate', 'productionDate', 'The date of production of the item, e.g. vehicle.'),
(469, 1, 5, 'hostingOrganization', 'hostingOrganization', 'The organization (airline, travelers\' club, etc.) the membership is made with.'),
(470, 1, 5, 'addOn', 'addOn', 'An additional offer that can only be obtained in combination with the first base offer (e.g. supplements and extensions that are available for a surcharge).'),
(471, 1, 5, 'hasOfferCatalog', 'hasOfferCatalog', 'Indicates an OfferCatalog listing for this Organization, Person, or Service.'),
(472, 1, 5, 'shippingDetails', 'shippingDetails', 'Indicates information about the shipping policies and options associated with an [[Offer]].'),
(473, 1, 5, 'seasonNumber', 'seasonNumber', 'Position of the season within an ordered group of seasons.'),
(474, 1, 5, 'loanType', 'loanType', 'The type of a loan or credit.'),
(475, 1, 5, 'documentation', 'documentation', 'Further documentation describing the Web API in more detail.'),
(476, 1, 5, 'domiciledMortgage', 'domiciledMortgage', 'Whether borrower is a resident of the jurisdiction where the property is located.'),
(477, 1, 5, 'drugUnit', 'drugUnit', 'The unit in which the drug is measured, e.g. \'5 mg tablet\'.'),
(478, 1, 5, 'physicalRequirement', 'physicalRequirement', 'A description of the types of physical activity associated with the job. Defined terms such as those in O*net may be used, but note that there is no way to specify the level of ability as well as its nature when using a defined term.'),
(479, 1, 5, 'numberOfCredits', 'numberOfCredits', 'The number of credits or units awarded by a Course or required to complete an EducationalOccupationalProgram.'),
(480, 1, 5, 'funder', 'funder', 'A person or organization that supports (sponsors) something through some kind of financial contribution.'),
(481, 1, 5, 'sponsor', 'sponsor', 'A person or organization that supports a thing through a pledge, promise, or financial contribution. E.g. a sponsor of a Medical Study or a corporate sponsor of an event.'),
(482, 1, 5, 'nonProprietaryName', 'nonProprietaryName', 'The generic name of this drug or supplement.'),
(483, 1, 5, 'returnPolicyCountry', 'returnPolicyCountry', 'The country where the product has to be sent to for returns, for example \"Ireland\" using the [[name]] property of [[Country]]. You can also provide the two-letter [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1). Note that this can be different from the country where the product was originally shipped from or sent to.'),
(484, 1, 5, 'screenCount', 'screenCount', 'The number of screens in the movie theater.'),
(485, 1, 5, 'cashBack', 'cashBack', 'A cardholder benefit that pays the cardholder a small percentage of their net expenditures.'),
(486, 1, 5, 'underName', 'underName', 'The person or organization the reservation or ticket is for.'),
(487, 1, 5, 'logo', 'logo', 'An associated logo.'),
(488, 1, 5, 'image', 'image', 'An image of the item. This can be a [[URL]] or a fully described [[ImageObject]].'),
(489, 1, 5, 'domainIncludes', 'domainIncludes', 'Relates a property to a class that is (one of) the type(s) the property is expected to be used on.'),
(490, 1, 5, 'inChI', 'inChI', 'Non-proprietary identifier for molecular entity that can be used in printed and electronic data sources thus enabling easier linking of diverse data compilations.'),
(491, 1, 5, 'quarantineGuidelines', 'quarantineGuidelines', 'Guidelines about quarantine rules, e.g. in the context of a pandemic.'),
(492, 1, 5, 'discountCode', 'discountCode', 'Code used to redeem a discount.'),
(493, 1, 5, 'musicalKey', 'musicalKey', 'The key, mode, or scale this composition uses.'),
(494, 1, 5, 'productID', 'productID', 'The product identifier, such as ISBN. For example: ``` meta itemprop=\"productID\" content=\"isbn:123-456-789\" ```.'),
(495, 1, 5, 'breastfeedingWarning', 'breastfeedingWarning', 'Any precaution, guidance, contraindication, etc. related to this drug\'s use by breastfeeding mothers.'),
(496, 1, 5, 'relatedStructure', 'relatedStructure', 'Related anatomical structure(s) that are not part of the system but relate or connect to it, such as vascular bundles associated with an organ system.'),
(497, 1, 5, 'currency', 'currency', 'The currency in which the monetary amount is expressed.\\n\\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\".'),
(498, 1, 5, 'cvdNumC19MechVentPats', 'cvdNumC19MechVentPats', 'numc19mechventpats - HOSPITALIZED and VENTILATED: Patients hospitalized in an NHSN inpatient care location who have suspected or confirmed COVID-19 and are on a mechanical ventilator.'),
(499, 1, 5, 'ethicsPolicy', 'ethicsPolicy', 'Statement about ethics policy, e.g. of a [[NewsMediaOrganization]] regarding journalistic and publishing practices, or of a [[Restaurant]], a page describing food source policies. In the case of a [[NewsMediaOrganization]], an ethicsPolicy is typically a statement describing the personal, organizational, and corporate standards of behavior expected by the organization.'),
(500, 1, 5, 'refundType', 'refundType', 'A refund type, from an enumerated list.'),
(501, 1, 5, 'postalCodeRange', 'postalCodeRange', 'A defined range of postal codes.'),
(502, 1, 5, 'recognizedBy', 'recognizedBy', 'An organization that acknowledges the validity, value or utility of a credential. Note: recognition may include a process of quality assurance or accreditation.'),
(503, 1, 5, 'workPerformed', 'workPerformed', 'A work performed in some event, for example a play performed in a TheaterEvent.'),
(504, 1, 5, 'workFeatured', 'workFeatured', 'A work featured in some event, e.g. exhibited in an ExhibitionEvent.\n       Specific subproperties are available for workPerformed (e.g. a play), or a workPresented (a Movie at a ScreeningEvent).'),
(505, 1, 5, 'mentions', 'mentions', 'Indicates that the CreativeWork contains a reference to, but is not necessarily about a concept.'),
(506, 1, 5, 'customerRemorseReturnLabelSource', 'customerRemorseReturnLabelSource', 'The method (from an enumeration) by which the customer obtains a return shipping label for a product returned due to customer remorse.'),
(507, 1, 5, 'legislationConsolidates', 'legislationConsolidates', 'Indicates another legislation taken into account in this consolidated legislation (which is usually the product of an editorial process that revises the legislation). This property should be used multiple times to refer to both the original version or the previous consolidated version, and to the legislations making the change.'),
(508, 1, 5, 'aggregateRating', 'aggregateRating', 'The overall rating, based on a collection of reviews or ratings, of the item.'),
(509, 1, 5, 'itinerary', 'itinerary', 'Destination(s) ( [[Place]] ) that make up a trip. For a trip where destination order is important use [[ItemList]] to specify that order (see examples).'),
(510, 1, 5, 'globalLocationNumber', 'globalLocationNumber', 'The [Global Location Number](http://www.gs1.org/gln) (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.'),
(511, 1, 5, 'applicantLocationRequirements', 'applicantLocationRequirements', 'The location(s) applicants can apply from. This is usually used for telecommuting jobs where the applicant does not need to be in a physical office. Note: This should not be used for citizenship or work visa requirements.'),
(512, 1, 5, 'unitCode', 'unitCode', 'The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.'),
(513, 1, 5, 'parents', 'parents', 'A parents of the person.'),
(514, 1, 5, 'parent', 'parent', 'A parent of this person.'),
(515, 1, 5, 'renegotiableLoan', 'renegotiableLoan', 'Whether the terms for payment of interest can be renegotiated during the life of the loan.'),
(516, 1, 5, 'priceComponent', 'priceComponent', 'This property links to all [[UnitPriceSpecification]] nodes that apply in parallel for the [[CompoundPriceSpecification]] node.'),
(517, 1, 5, 'eligibleDuration', 'eligibleDuration', 'The duration for which the given offer is valid.'),
(518, 1, 5, 'copyrightYear', 'copyrightYear', 'The year during which the claimed copyright for the CreativeWork was first asserted.'),
(519, 1, 5, 'trialDesign', 'trialDesign', 'Specifics about the trial design (enumerated).'),
(520, 1, 5, 'serviceAudience', 'serviceAudience', 'The audience eligible for this service.'),
(521, 1, 5, 'audience', 'audience', 'An intended audience, i.e. a group for whom something was created.'),
(522, 1, 5, 'vehicleSpecialUsage', 'vehicleSpecialUsage', 'Indicates whether the vehicle has been used for special purposes, like commercial rental, driving school, or as a taxi. The legislation in many countries requires this information to be revealed when offering a car for sale.'),
(523, 1, 5, 'comment', 'comment', 'Comments, typically from users.'),
(524, 1, 5, 'publicationType', 'publicationType', 'The type of the medical article, taken from the US NLM MeSH publication type catalog. See also [MeSH documentation](http://www.nlm.nih.gov/mesh/pubtypes.html).'),
(525, 1, 5, 'availableIn', 'availableIn', 'The location in which the strength is available.'),
(526, 1, 5, 'legislationIdentifier', 'legislationIdentifier', 'An identifier for the legislation. This can be either a string-based identifier, like the CELEX at EU level or the NOR in France, or a web-based, URL/URI identifier, like an ELI (European Legislation Identifier) or an URN-Lex.'),
(527, 1, 5, 'discount', 'discount', 'Any discount applied (to an Order).'),
(528, 1, 5, 'model', 'model', 'The model of the product. Use with the URL of a ProductModel or a textual representation of the model identifier. The URL of the ProductModel can be from an external source. It is recommended to additionally provide strong product identifiers via the gtin8/gtin13/gtin14 and mpn properties.'),
(529, 1, 5, 'numberOfEpisodes', 'numberOfEpisodes', 'The number of episodes in this season or series.'),
(530, 1, 5, 'deathDate', 'deathDate', 'Date of death.'),
(531, 1, 5, 'servingSize', 'servingSize', 'The serving size, in terms of the number of volume or mass.'),
(532, 1, 5, 'ownershipFundingInfo', 'ownershipFundingInfo', 'For an [[Organization]] (often but not necessarily a [[NewsMediaOrganization]]), a description of organizational ownership structure; funding and grants. In a news/media setting, this is with particular reference to editorial independence.   Note that the [[funder]] is also available and can be used to make basic funder information machine-readable.'),
(533, 1, 5, 'playerType', 'playerType', 'Player type required&#x2014;for example, Flash or Silverlight.'),
(534, 1, 5, 'priceComponentType', 'priceComponentType', 'Identifies a price component (for example, a line item on an invoice), part of the total price for an offer.'),
(535, 1, 5, 'abridged', 'abridged', 'Indicates whether the book is an abridged edition.'),
(536, 1, 5, 'reviewAspect', 'reviewAspect', 'This Review or Rating is relevant to this part or facet of the itemReviewed.'),
(537, 1, 5, 'advanceBookingRequirement', 'advanceBookingRequirement', 'The amount of time that is required between accepting the offer and the actual usage of the resource or service.'),
(538, 1, 5, 'sender', 'sender', 'A sub property of participant. The participant who is at the sending end of the action.'),
(539, 1, 5, 'participant', 'participant', 'Other co-agents that participated in the action indirectly. E.g. John wrote a book with *Steve*.'),
(540, 1, 5, 'ingredients', 'ingredients', 'A single ingredient used in the recipe, e.g. sugar, flour or garlic.'),
(541, 1, 5, 'recipeIngredient', 'recipeIngredient', 'A single ingredient used in the recipe, e.g. sugar, flour or garlic.'),
(542, 1, 5, 'supply', 'supply', 'A sub-property of instrument. A supply consumed when performing instructions or a direction.'),
(543, 1, 5, 'area', 'area', 'The area within which users can expect to reach the broadcast service.'),
(544, 1, 5, 'serviceArea', 'serviceArea', 'The geographic area where the service is provided.'),
(545, 1, 5, 'downvoteCount', 'downvoteCount', 'The number of downvotes this question, answer or comment has received from the community.'),
(546, 1, 5, 'children', 'children', 'A child of the person.'),
(547, 1, 5, 'arrivalPlatform', 'arrivalPlatform', 'The platform where the train arrives.'),
(548, 1, 5, 'firstPerformance', 'firstPerformance', 'The date and place the work was first performed.'),
(549, 1, 5, 'ratingValue', 'ratingValue', 'The rating for the content.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(550, 1, 5, 'collectionSize', 'collectionSize', 'The number of items in the [[Collection]].'),
(551, 1, 5, 'resultReview', 'resultReview', 'A sub property of result. The review that resulted in the performing of the action.'),
(552, 1, 5, 'result', 'result', 'The result produced in the action. E.g. John wrote *a book*.'),
(553, 1, 5, 'albums', 'albums', 'A collection of music albums.'),
(554, 1, 5, 'album', 'album', 'A music album.'),
(555, 1, 5, 'datePublished', 'datePublished', 'Date of first broadcast/publication.'),
(556, 1, 5, 'includesAttraction', 'includesAttraction', 'Attraction located at destination.'),
(557, 1, 5, 'publishedOn', 'publishedOn', 'A broadcast service associated with the publication event.'),
(558, 1, 5, 'actionStatus', 'actionStatus', 'Indicates the current disposition of the Action.'),
(559, 1, 5, 'orderDate', 'orderDate', 'Date order was placed.'),
(560, 1, 5, 'prescribingInfo', 'prescribingInfo', 'Link to prescribing information for the drug.'),
(561, 1, 5, 'contributor', 'contributor', 'A secondary contributor to the CreativeWork or Event.'),
(562, 1, 5, 'yearBuilt', 'yearBuilt', 'The year an [[Accommodation]] was constructed. This corresponds to the [YearBuilt field in RESO](https://ddwiki.reso.org/display/DDW17/YearBuilt+Field). '),
(563, 1, 5, 'trainingSalary', 'trainingSalary', 'The estimated salary earned while in the program.'),
(564, 1, 5, 'orderQuantity', 'orderQuantity', 'The number of the item ordered. If the property is not set, assume the quantity is one.'),
(565, 1, 5, 'bioChemInteraction', 'bioChemInteraction', 'A BioChemEntity that is known to interact with this item.'),
(566, 1, 5, 'healthPlanId', 'healthPlanId', 'The 14-character, HIOS-generated Plan ID number. (Plan IDs must be unique, even across different markets.)'),
(567, 1, 5, 'valuePattern', 'valuePattern', 'Specifies a regular expression for testing literal values according to the HTML spec.'),
(568, 1, 5, 'orderItemNumber', 'orderItemNumber', 'The identifier of the order item.'),
(569, 1, 5, 'accommodationCategory', 'accommodationCategory', 'Category of an [[Accommodation]], following real estate conventions, e.g. RESO (see [PropertySubType](https://ddwiki.reso.org/display/DDW17/PropertySubType+Field), and [PropertyType](https://ddwiki.reso.org/display/DDW17/PropertyType+Field) fields  for suggested values).'),
(570, 1, 5, 'category', 'category', 'A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.'),
(571, 1, 5, 'sdLicense', 'sdLicense', 'A license document that applies to this structured data, typically indicated by URL.'),
(572, 1, 5, 'broadcastFrequency', 'broadcastFrequency', 'The frequency used for over-the-air broadcasts. Numeric values or simple ranges, e.g. 87-99. In addition a shortcut idiom is supported for frequences of AM and FM radio channels, e.g. \"87 FM\".'),
(573, 1, 5, 'abstract', 'abstract', 'An abstract is a short description that summarizes a [[CreativeWork]].'),
(574, 1, 5, 'floorSize', 'floorSize', 'The size of the accommodation, e.g. in square meter or squarefoot.\nTypical unit code(s): MTK for square meter, FTK for square foot, or YDK for square yard '),
(575, 1, 5, 'measurementTechnique', 'measurementTechnique', 'A technique or technology used in a [[Dataset]] (or [[DataDownload]], [[DataCatalog]]),\ncorresponding to the method used for measuring the corresponding variable(s) (described using [[variableMeasured]]). This is oriented towards scientific and scholarly dataset publication but may have broader applicability; it is not intended as a full representation of measurement, but rather as a high level summary for dataset discovery.\n\nFor example, if [[variableMeasured]] is: molecule concentration, [[measurementTechnique]] could be: \"mass spectrometry\" or \"nmr spectroscopy\" or \"colorimetry\" or \"immunofluorescence\".\n\nIf the [[variableMeasured]] is \"depression rating\", the [[measurementTechnique]] could be \"Zung Scale\" or \"HAM-D\" or \"Beck Depression Inventory\".\n\nIf there are several [[variableMeasured]] properties recorded for some given data object, use a [[PropertyValue]] for each [[variableMeasured]] and attach the corresponding [[measurementTechnique]].\n      '),
(576, 1, 5, 'seatRow', 'seatRow', 'The row location of the reserved seat (e.g., B).'),
(577, 1, 5, 'programPrerequisites', 'programPrerequisites', 'Prerequisites for enrolling in the program.'),
(578, 1, 5, 'endOffset', 'endOffset', 'The end time of the clip expressed as the number of seconds from the beginning of the work.'),
(579, 1, 5, 'associatedClaimReview', 'associatedClaimReview', 'An associated [[ClaimReview]], related by specific common content, topic or claim. The expectation is that this property would be most typically used in cases where a single activity is conducting both claim reviews and media reviews, in which case [[relatedMediaReview]] would commonly be used on a [[ClaimReview]], while [[relatedClaimReview]] would be used on [[MediaReview]].'),
(580, 1, 5, 'application', 'application', 'An application that can complete the request.'),
(581, 1, 5, 'actionApplication', 'actionApplication', 'An application that can complete the request.'),
(582, 1, 5, 'cookTime', 'cookTime', 'The time it takes to actually cook the dish, in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).'),
(583, 1, 5, 'performTime', 'performTime', 'The length of time it takes to perform instructions or a direction (not including time to prepare the supplies), in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).'),
(584, 1, 5, 'availableChannel', 'availableChannel', 'A means of accessing the service (e.g. a phone bank, a web site, a location, etc.).'),
(585, 1, 5, 'seatNumber', 'seatNumber', 'The location of the reserved seat (e.g., 27).'),
(586, 1, 5, 'costCategory', 'costCategory', 'The category of cost, such as wholesale, retail, reimbursement cap, etc.'),
(587, 1, 5, 'associatedAnatomy', 'associatedAnatomy', 'The anatomy of the underlying organ system or structures associated with this entity.'),
(588, 1, 5, 'homeTeam', 'homeTeam', 'The home team in a sports event.'),
(589, 1, 5, 'competitor', 'competitor', 'A competitor in a sports event.'),
(590, 1, 5, 'iswcCode', 'iswcCode', 'The International Standard Musical Work Code for the composition.'),
(591, 1, 5, 'inChIKey', 'inChIKey', 'InChIKey is a hashed version of the full InChI (using the SHA-256 algorithm).'),
(592, 1, 5, 'gameAvailabilityType', 'gameAvailabilityType', 'Indicates the availability type of the game content associated with this action, such as whether it is a full version or a demo.'),
(593, 1, 5, 'publishedBy', 'publishedBy', 'An agent associated with the publication event.'),
(594, 1, 5, 'shippingOrigin', 'shippingOrigin', 'Indicates the origin of a shipment, i.e. where it should be coming from.'),
(595, 1, 5, 'requirements', 'requirements', 'Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (examples: DirectX, Java or .NET runtime).'),
(596, 1, 5, 'softwareRequirements', 'softwareRequirements', 'Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (examples: DirectX, Java or .NET runtime).'),
(597, 1, 5, 'thumbnailUrl', 'thumbnailUrl', 'A thumbnail image relevant to the Thing.'),
(598, 1, 5, 'newsUpdatesAndGuidelines', 'newsUpdatesAndGuidelines', 'Indicates a page with news updates and guidelines. This could often be (but is not required to be) the main page containing [[SpecialAnnouncement]] markup on a site.'),
(599, 1, 5, 'priceSpecification', 'priceSpecification', 'One or more detailed price specifications, indicating the unit price and delivery or payment charges.'),
(600, 1, 5, 'availableStrength', 'availableStrength', 'An available dosage strength for the drug.'),
(601, 1, 5, 'musicArrangement', 'musicArrangement', 'An arrangement derived from the composition.'),
(602, 1, 5, 'healthPlanCoinsuranceOption', 'healthPlanCoinsuranceOption', 'Whether the coinsurance applies before or after deductible, etc. TODO: Is this a closed set?'),
(603, 1, 5, 'datePosted', 'datePosted', 'Publication date of an online listing.'),
(604, 1, 5, 'reviews', 'reviews', 'Review of the item.'),
(605, 1, 5, 'review', 'review', 'A review of the item.'),
(606, 1, 5, 'validUntil', 'validUntil', 'The date when the item is no longer valid.'),
(607, 1, 5, 'requiresSubscription', 'requiresSubscription', 'Indicates if use of the media require a subscription  (either paid or free). Allowed values are ```true``` or ```false``` (note that an earlier version had \'yes\', \'no\').'),
(608, 1, 5, 'ratingCount', 'ratingCount', 'The count of total number of ratings.'),
(609, 1, 5, 'expectedArrivalFrom', 'expectedArrivalFrom', 'The earliest date the package may arrive.'),
(610, 1, 5, 'version', 'version', 'The version of the CreativeWork embodied by a specified resource.'),
(611, 1, 5, 'dropoffTime', 'dropoffTime', 'When a rental car can be dropped off.'),
(612, 1, 5, 'infectiousAgentClass', 'infectiousAgentClass', 'The class of infectious agent (bacteria, prion, etc.) that causes the disease.'),
(613, 1, 5, 'doseValue', 'doseValue', 'The value of the dose, e.g. 500.'),
(614, 1, 5, 'cvdNumC19Died', 'cvdNumC19Died', 'numc19died - DEATHS: Patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any overflow location.'),
(615, 1, 5, 'alternativeHeadline', 'alternativeHeadline', 'A secondary title of the CreativeWork.'),
(616, 1, 5, 'longitude', 'longitude', 'The longitude of a location. For example ```-122.08585``` ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)).'),
(617, 1, 5, 'energyEfficiencyScaleMin', 'energyEfficiencyScaleMin', 'Specifies the least energy efficient class on the regulated EU energy consumption scale for the product category a product belongs to. For example, energy consumption for televisions placed on the market after January 1, 2020 is scaled from D to A+++.'),
(618, 1, 5, 'appliesToPaymentMethod', 'appliesToPaymentMethod', 'The payment method(s) to which the payment charge specification applies.'),
(619, 1, 5, 'credentialCategory', 'credentialCategory', 'The category or type of credential being described, for example \"degree”, “certificate”, “badge”, or more specific term.'),
(620, 1, 5, 'appliesToDeliveryMethod', 'appliesToDeliveryMethod', 'The delivery method(s) to which the delivery charge or payment charge specification applies.'),
(621, 1, 5, 'targetName', 'targetName', 'The name of a node in an established educational framework.'),
(622, 1, 5, 'repetitions', 'repetitions', 'Number of times one should repeat the activity.'),
(623, 1, 5, 'originatesFrom', 'originatesFrom', 'The vasculature the lymphatic structure originates, or afferents, from.'),
(624, 1, 5, 'positiveNotes', 'positiveNotes', 'Provides positive considerations regarding something, for example product highlights or (alongside [[negativeNotes]]) pro/con lists for reviews.\n\nIn the case of a [[Review]], the property describes the [[itemReviewed]] from the perspective of the review; in the case of a [[Product]], the product itself is being described.\n\nThe property values can be expressed either as unstructured text (repeated as necessary), or if ordered, as a list (in which case the most positive is at the beginning of the list).'),
(625, 1, 5, 'passengerSequenceNumber', 'passengerSequenceNumber', 'The passenger\'s sequence number as assigned by the airline.'),
(626, 1, 5, 'clipNumber', 'clipNumber', 'Position of the clip within an ordered group of clips.'),
(627, 1, 5, 'gtin13', 'gtin13', 'The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceding zero. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.'),
(628, 1, 5, 'hasAdultConsideration', 'hasAdultConsideration', 'Used to tag an item to be intended or suitable for consumption or use by adults only.'),
(629, 1, 5, 'asin', 'asin', 'An Amazon Standard Identification Number (ASIN) is a 10-character alphanumeric unique identifier assigned by Amazon.com and its partners for product identification within the Amazon organization (summary from [Wikipedia](https://en.wikipedia.org/wiki/Amazon_Standard_Identification_Number)\'s article).\n\nNote also that this is a definition for how to include ASINs in Schema.org data, and not a definition of ASINs in general - see documentation from Amazon for authoritative details.\nASINs are most commonly encoded as text strings, but the [asin] property supports URL/URI as potential values too.'),
(630, 1, 5, 'reservedTicket', 'reservedTicket', 'A ticket associated with the reservation.'),
(631, 1, 5, 'commentCount', 'commentCount', 'The number of comments this CreativeWork (e.g. Article, Question or Answer) has received. This is most applicable to works published in Web sites with commenting system; additional comments may exist elsewhere.'),
(632, 1, 5, 'programMembershipUsed', 'programMembershipUsed', 'Any membership in a frequent flyer, hotel loyalty program, etc. being applied to the reservation.'),
(633, 1, 5, 'alcoholWarning', 'alcoholWarning', 'Any precaution, guidance, contraindication, etc. related to consumption of alcohol while taking this drug.'),
(634, 1, 5, 'typicalTest', 'typicalTest', 'A medical test typically performed given this condition.'),
(635, 1, 5, 'duringMedia', 'duringMedia', 'A media object representing the circumstances while performing this direction.'),
(636, 1, 5, 'valueMinLength', 'valueMinLength', 'Specifies the minimum allowed range for number of characters in a literal value.'),
(637, 1, 5, 'cvdNumC19HOPats', 'cvdNumC19HOPats', 'numc19hopats - HOSPITAL ONSET: Patients hospitalized in an NHSN inpatient care location with onset of suspected or confirmed COVID-19 14 or more days after hospitalization.'),
(638, 1, 5, 'citation', 'citation', 'A citation or reference to another creative work, such as another publication, web page, scholarly article, etc.'),
(639, 1, 5, 'musicGroupMember', 'musicGroupMember', 'A member of a music group&#x2014;for example, John, Paul, George, or Ringo.'),
(640, 1, 5, 'member', 'member', 'A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.'),
(641, 1, 5, 'cvdNumICUBedsOcc', 'cvdNumICUBedsOcc', 'numicubedsocc - ICU BED OCCUPANCY: Total number of staffed inpatient ICU beds that are occupied.'),
(642, 1, 5, 'numberOfEmployees', 'numberOfEmployees', 'The number of employees in an organization, e.g. business.'),
(643, 1, 5, 'subStageSuffix', 'subStageSuffix', 'The substage, e.g. \'a\' for Stage IIIa.'),
(644, 1, 5, 'coursePrerequisites', 'coursePrerequisites', 'Requirements for taking the Course. May be completion of another [[Course]] or a textual description like \"permission of instructor\". Requirements may be a pre-requisite competency, referenced using [[AlignmentObject]].'),
(645, 1, 5, 'sharedContent', 'sharedContent', 'A CreativeWork such as an image, video, or audio clip shared as part of this posting.'),
(646, 1, 5, 'urlTemplate', 'urlTemplate', 'An url template (RFC6570) that will be used to construct the target of the execution of the action.'),
(647, 1, 5, 'gtin8', 'gtin8', 'The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.'),
(648, 1, 5, 'vehicleEngine', 'vehicleEngine', 'Information about the engine or engines of the vehicle.'),
(649, 1, 5, 'priceRange', 'priceRange', 'The price range of the business, for example ```$$$```.'),
(650, 1, 5, 'numberOfAvailableAccommodationUnits', 'numberOfAvailableAccommodationUnits', 'Indicates the number of available accommodation units in an [[ApartmentComplex]], or the number of accommodation units for a specific [[FloorPlan]] (within its specific [[ApartmentComplex]]). See also [[numberOfAccommodationUnits]].'),
(651, 1, 5, 'priceType', 'priceType', 'Defines the type of a price specified for an offered product, for example a list price, a (temporary) sale price or a manufacturer suggested retail price. If multiple prices are specified for an offer the [[priceType]] property can be used to identify the type of each such specified price. The value of priceType can be specified as a value from enumeration PriceTypeEnumeration or as a free form text string for price types that are not already predefined in PriceTypeEnumeration.'),
(652, 1, 5, 'verificationFactCheckingPolicy', 'verificationFactCheckingPolicy', 'Disclosure about verification and fact-checking processes for a [[NewsMediaOrganization]] or other fact-checking [[Organization]].'),
(653, 1, 5, 'negativeNotes', 'negativeNotes', 'Provides negative considerations regarding something, most typically in pro/con lists for reviews (alongside [[positiveNotes]]). For symmetry \n\nIn the case of a [[Review]], the property describes the [[itemReviewed]] from the perspective of the review; in the case of a [[Product]], the product itself is being described. Since product descriptions \ntend to emphasise positive claims, it may be relatively unusual to find [[negativeNotes]] used in this way. Nevertheless for the sake of symmetry, [[negativeNotes]] can be used on [[Product]].\n\nThe property values can be expressed either as unstructured text (repeated as necessary), or if ordered, as a list (in which case the most negative is at the beginning of the list).'),
(654, 1, 5, 'startOffset', 'startOffset', 'The start time of the clip expressed as the number of seconds from the beginning of the work.'),
(655, 1, 5, 'codeRepository', 'codeRepository', 'Link to the repository where the un-compiled, human readable code and related code is located (SVN, GitHub, CodePlex).'),
(656, 1, 5, 'differentialDiagnosis', 'differentialDiagnosis', 'One of a set of differential diagnoses for the condition. Specifically, a closely-related or competing diagnosis typically considered later in the cognitive process whereby this medical condition is distinguished from others most likely responsible for a similar collection of signs and symptoms to reach the most parsimonious diagnosis or diagnoses in a patient.'),
(657, 1, 5, 'free', 'free', 'A flag to signal that the item, event, or place is accessible for free.'),
(658, 1, 5, 'isAccessibleForFree', 'isAccessibleForFree', 'A flag to signal that the item, event, or place is accessible for free.'),
(659, 1, 5, 'subEvents', 'subEvents', 'Events that are a part of this event. For example, a conference event includes many presentations, each subEvents of the conference.'),
(660, 1, 5, 'subEvent', 'subEvent', 'An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference.'),
(661, 1, 5, 'amountOfThisGood', 'amountOfThisGood', 'The quantity of the goods included in the offer.'),
(662, 1, 5, 'geoEquals', 'geoEquals', 'Represents spatial relations in which two geometries (or the places they represent) are topologically equal, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM). \"Two geometries are topologically equal if their interiors intersect and no part of the interior or boundary of one geometry intersects the exterior of the other\" (a symmetric relationship).'),
(663, 1, 5, 'geoMidpoint', 'geoMidpoint', 'Indicates the GeoCoordinates at the centre of a GeoShape, e.g. GeoCircle.'),
(664, 1, 5, 'backstory', 'backstory', 'For an [[Article]], typically a [[NewsArticle]], the backstory property provides a textual summary giving a brief explanation of why and how an article was created. In a journalistic setting this could include information about reporting process, methods, interviews, data sources, etc.'),
(665, 1, 5, 'acceptedAnswer', 'acceptedAnswer', 'The answer(s) that has been accepted as best, typically on a Question/Answer site. Sites vary in their selection mechanisms, e.g. drawing on community opinion and/or the view of the Question author.'),
(666, 1, 5, 'suggestedAnswer', 'suggestedAnswer', 'An answer (possibly one of several, possibly incorrect) to a Question, e.g. on a Question/Answer site.'),
(667, 1, 5, 'cvdNumTotBeds', 'cvdNumTotBeds', 'numtotbeds - ALL HOSPITAL BEDS: Total number of all inpatient and outpatient beds, including all staffed, ICU, licensed, and overflow (surge) beds used for inpatients or outpatients.'),
(668, 1, 5, 'educationRequirements', 'educationRequirements', 'Educational background needed for the position or Occupation.'),
(669, 1, 5, 'programmingModel', 'programmingModel', 'Indicates whether API is managed or unmanaged.'),
(670, 1, 5, 'blogPosts', 'blogPosts', 'Indicates a post that is part of a [[Blog]]. Note that historically, what we term a \"Blog\" was once known as a \"weblog\", and that what we term a \"BlogPosting\" is now often colloquially referred to as a \"blog\".'),
(671, 1, 5, 'blogPost', 'blogPost', 'A posting that is part of this blog.'),
(672, 1, 5, 'validFor', 'validFor', 'The duration of validity of a permit or similar thing.'),
(673, 1, 5, 'biomechnicalClass', 'biomechnicalClass', 'The biomechanical properties of the bone.'),
(674, 1, 5, 'codeValue', 'codeValue', 'A short textual code that uniquely identifies the value.'),
(675, 1, 5, 'termCode', 'termCode', 'A code that identifies this [[DefinedTerm]] within a [[DefinedTermSet]]'),
(676, 1, 5, 'biologicalRole', 'biologicalRole', 'A role played by the BioChemEntity within a biological context.'),
(677, 1, 5, 'occupationalCredentialAwarded', 'occupationalCredentialAwarded', 'A description of the qualification, award, certificate, diploma or other occupational credential awarded as a consequence of successful completion of this course or program.'),
(678, 1, 5, 'greater', 'greater', 'This ordering relation for qualitative values indicates that the subject is greater than the object.'),
(679, 1, 5, 'unnamedSourcesPolicy', 'unnamedSourcesPolicy', 'For an [[Organization]] (typically a [[NewsMediaOrganization]]), a statement about policy on use of unnamed sources and the decision process required.'),
(680, 1, 5, 'naturalProgression', 'naturalProgression', 'The expected progression of the condition if it is not treated and allowed to progress naturally.'),
(681, 1, 5, 'geoContains', 'geoContains', 'Represents a relationship between two geometries (or the places they represent), relating a containing geometry to a contained geometry. \"a contains b iff no points of b lie in the exterior of a, and at least one point of the interior of b lies in the interior of a\". As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(682, 1, 5, 'announcementLocation', 'announcementLocation', 'Indicates a specific [[CivicStructure]] or [[LocalBusiness]] associated with the SpecialAnnouncement. For example, a specific testing facility or business with special opening hours. For a larger geographic region like a quarantine of an entire region, use [[spatialCoverage]].'),
(683, 1, 5, 'runtime', 'runtime', 'Runtime platform or script interpreter dependencies (example: Java v1, Python 2.3, .NET Framework 3.0).'),
(684, 1, 5, 'runtimePlatform', 'runtimePlatform', 'Runtime platform or script interpreter dependencies (example: Java v1, Python 2.3, .NET Framework 3.0).'),
(685, 1, 5, 'currenciesAccepted', 'currenciesAccepted', 'The currency accepted.\\n\\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\".'),
(686, 1, 5, 'touristType', 'touristType', 'Attraction suitable for type(s) of tourist. E.g. children, visitors from a particular country, etc. ');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(687, 1, 5, 'printPage', 'printPage', 'If this NewsArticle appears in print, this field indicates the name of the page on which the article is found. Please note that this field is intended for the exact page name (e.g. A5, B18).'),
(688, 1, 5, 'typicalAgeRange', 'typicalAgeRange', 'The typical expected age range, e.g. \'7-9\', \'11-\'.'),
(689, 1, 5, 'suitableForDiet', 'suitableForDiet', 'Indicates a dietary restriction or guideline for which this recipe or menu item is suitable, e.g. diabetic, halal etc.'),
(690, 1, 5, 'shippingRate', 'shippingRate', 'The shipping rate is the cost of shipping to the specified destination. Typically, the maxValue and currency values (of the [[MonetaryAmount]]) are most appropriate.'),
(691, 1, 5, 'assemblyVersion', 'assemblyVersion', 'Associated product/technology version. E.g., .NET Framework 4.5.'),
(692, 1, 5, 'publicAccess', 'publicAccess', 'A flag to signal that the [[Place]] is open to public visitors.  If this property is omitted there is no assumed default boolean value'),
(693, 1, 5, 'occupationLocation', 'occupationLocation', ' The region/country for which this occupational description is appropriate. Note that educational requirements and qualifications can vary between jurisdictions.'),
(694, 1, 5, 'benefitsSummaryUrl', 'benefitsSummaryUrl', 'The URL that goes directly to the summary of benefits and coverage for the specific standard plan or plan variation.'),
(695, 1, 5, 'targetProduct', 'targetProduct', 'Target Operating System / Product to which the code applies.  If applies to several versions, just the product name can be used.'),
(696, 1, 5, 'workPresented', 'workPresented', 'The movie presented during this event.'),
(697, 1, 5, 'carrierRequirements', 'carrierRequirements', 'Specifies specific carrier(s) requirements for the application (e.g. an application may only work on a specific carrier network).'),
(698, 1, 5, 'dateReceived', 'dateReceived', 'The date/time the message was received if a single recipient exists.'),
(699, 1, 5, 'handlingTime', 'handlingTime', 'The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup. Typical properties: minValue, maxValue, unitCode (d for DAY).  This is by common convention assumed to mean business days (if a unitCode is used, coded as \"d\"), i.e. only counting days when the business normally operates.'),
(700, 1, 5, 'educationalAlignment', 'educationalAlignment', 'An alignment to an established educational framework.\n\nThis property should not be used where the nature of the alignment can be described using a simple property, for example to express that a resource [[teaches]] or [[assesses]] a competency.'),
(701, 1, 5, 'deliveryTime', 'deliveryTime', 'The total delay between the receipt of the order and the goods reaching the final customer.'),
(702, 1, 5, 'iupacName', 'iupacName', 'Systematic method of naming chemical compounds as recommended by the International Union of Pure and Applied Chemistry (IUPAC).'),
(703, 1, 5, 'trailerWeight', 'trailerWeight', 'The permitted weight of a trailer attached to the vehicle.\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n* Note 1: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 2: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]].\\n* Note 3: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(704, 1, 5, 'shippingLabel', 'shippingLabel', 'Label to match an [[OfferShippingDetails]] with a [[ShippingRateSettings]] (within the context of a [[shippingSettingsLink]] cross-reference).'),
(705, 1, 5, 'partySize', 'partySize', 'Number of people the reservation should accommodate.'),
(706, 1, 5, 'publication', 'publication', 'A publication event associated with the item.'),
(707, 1, 5, 'payload', 'payload', 'The permitted weight of passengers and cargo, EXCLUDING the weight of the empty vehicle.\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n\\n* Note 1: Many databases specify the permitted TOTAL weight instead, which is the sum of [[weight]] and [[payload]]\\n* Note 2: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 3: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]].\\n* Note 4: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(708, 1, 5, 'termDuration', 'termDuration', 'The amount of time in a term as defined by the institution. A term is a length of time where students take one or more classes. Semesters and quarters are common units for term.'),
(709, 1, 5, 'itemReviewed', 'itemReviewed', 'The item that is being reviewed/rated.'),
(710, 1, 5, 'recipe', 'recipe', 'A sub property of instrument. The recipe/instructions used to perform the action.'),
(711, 1, 5, 'telephone', 'telephone', 'The telephone number.'),
(712, 1, 5, 'exchangeRateSpread', 'exchangeRateSpread', 'The difference between the price at which a broker or other intermediary buys and sells foreign currency.'),
(713, 1, 5, 'itemDefectReturnShippingFeesAmount', 'itemDefectReturnShippingFeesAmount', 'Amount of shipping costs for defect product returns. Applicable when property [[itemDefectReturnFees]] equals [[ReturnShippingFees]].'),
(714, 1, 5, 'addressRegion', 'addressRegion', 'The region in which the locality is, and which is in the country. For example, California or another appropriate first-level [Administrative division](https://en.wikipedia.org/wiki/List_of_administrative_divisions_by_country).'),
(715, 1, 5, 'spatial', 'spatial', 'The \"spatial\" property can be used in cases when more specific properties\n(e.g. [[locationCreated]], [[spatialCoverage]], [[contentLocation]]) are not known to be appropriate.'),
(716, 1, 5, 'estimatedCost', 'estimatedCost', 'The estimated cost of the supply or supplies consumed when performing instructions.'),
(717, 1, 5, 'financialAidEligible', 'financialAidEligible', 'A financial aid type or program which students may use to pay for tuition or fees associated with the program.'),
(718, 1, 5, 'sensoryUnit', 'sensoryUnit', 'The neurological pathway extension that inputs and sends information to the brain or spinal cord.'),
(719, 1, 5, 'awayTeam', 'awayTeam', 'The away team in a sports event.'),
(720, 1, 5, 'antagonist', 'antagonist', 'The muscle whose action counteracts the specified muscle.'),
(721, 1, 5, 'orderDelivery', 'orderDelivery', 'The delivery of the parcel related to this order or order item.'),
(722, 1, 5, 'supplyTo', 'supplyTo', 'The area to which the artery supplies blood.'),
(723, 1, 5, 'bookingTime', 'bookingTime', 'The date and time the reservation was booked.'),
(724, 1, 5, 'circle', 'circle', 'A circle is the circular region of a specified radius centered at a specified latitude and longitude. A circle is expressed as a pair followed by a radius in meters.'),
(725, 1, 5, 'beforeMedia', 'beforeMedia', 'A media object representing the circumstances before performing this direction.'),
(726, 1, 5, 'episodeNumber', 'episodeNumber', 'Position of the episode within an ordered group of episodes.'),
(727, 1, 5, 'gracePeriod', 'gracePeriod', 'The period of time after any due date that the borrower has to fulfil its obligations before a default (failure to pay) is deemed to have occurred.'),
(728, 1, 5, 'addressLocality', 'addressLocality', 'The locality in which the street address is, and which is in the region. For example, Mountain View.'),
(729, 1, 5, 'learningResourceType', 'learningResourceType', 'The predominant type or kind characterizing the learning resource. For example, \'presentation\', \'handout\'.'),
(730, 1, 5, 'fuelType', 'fuelType', 'The type of fuel suitable for the engine or engines of the vehicle. If the vehicle has only one engine, this property can be attached directly to the vehicle.'),
(731, 1, 5, 'accessibilityAPI', 'accessibilityAPI', 'Indicates that the resource is compatible with the referenced accessibility API. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessibilityAPI-vocabulary).'),
(732, 1, 5, 'masthead', 'masthead', 'For a [[NewsMediaOrganization]], a link to the masthead page or a page listing top editorial management.'),
(733, 1, 5, 'ticketToken', 'ticketToken', 'Reference to an asset (e.g., Barcode, QR code image or PDF) usable for entrance.'),
(734, 1, 5, 'eligibleRegion', 'eligibleRegion', 'The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.\\n\\nSee also [[ineligibleRegion]].\n    '),
(735, 1, 5, 'areaServed', 'areaServed', 'The geographic area where a service or offered item is provided.'),
(736, 1, 5, 'disambiguatingDescription', 'disambiguatingDescription', 'A sub property of description. A short description of the item used to disambiguate from other, similar items. Information from other properties (in particular, name) may be necessary for the description to be useful for disambiguation.'),
(737, 1, 5, 'description', 'description', 'A description of the item.'),
(738, 1, 5, 'suggestedMaxAge', 'suggestedMaxAge', 'Maximum recommended age in years for the audience or user.'),
(739, 1, 5, 'quest', 'quest', 'The task that a player-controlled character, or group of characters may complete in order to gain a reward.'),
(740, 1, 5, 'containedIn', 'containedIn', 'The basic containment relation between a place and one that contains it.'),
(741, 1, 5, 'containedInPlace', 'containedInPlace', 'The basic containment relation between a place and one that contains it.'),
(742, 1, 5, 'contraindication', 'contraindication', 'A contraindication for this therapy.'),
(743, 1, 5, 'recipeYield', 'recipeYield', 'The quantity produced by the recipe (for example, number of people served, number of servings, etc).'),
(744, 1, 5, 'yield', 'yield', 'The quantity that results by performing instructions. For example, a paper airplane, 10 personalized candles.'),
(745, 1, 5, 'cvdCollectionDate', 'cvdCollectionDate', 'collectiondate - Date for which patient counts are reported.'),
(746, 1, 5, 'requiredMinAge', 'requiredMinAge', 'Audiences defined by a person\'s minimum age.'),
(747, 1, 5, 'referencesOrder', 'referencesOrder', 'The Order(s) related to this Invoice. One or more Orders may be combined into a single Invoice.'),
(748, 1, 5, 'identifyingTest', 'identifyingTest', 'A diagnostic test that can identify this sign.'),
(749, 1, 5, 'inker', 'inker', 'The individual who traces over the pencil drawings in ink after pencils are complete.'),
(750, 1, 5, 'operatingSystem', 'operatingSystem', 'Operating systems supported (Windows 7, OS X 10.6, Android 1.6).'),
(751, 1, 5, 'byMonth', 'byMonth', 'Defines the month(s) of the year on which a recurring [[Event]] takes place. Specified as an [[Integer]] between 1-12. January is 1.'),
(752, 1, 5, 'steeringPosition', 'steeringPosition', 'The position of the steering wheel or similar device (mostly for cars).'),
(753, 1, 5, 'branch', 'branch', 'The branches that delineate from the nerve bundle. Not to be confused with [[branchOf]].'),
(754, 1, 5, 'arterialBranch', 'arterialBranch', 'The branches that comprise the arterial structure.'),
(755, 1, 5, 'taxID', 'taxID', 'The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.'),
(756, 1, 5, 'stage', 'stage', 'The stage of the condition, if applicable.'),
(757, 1, 5, 'engineType', 'engineType', 'The type of engine or engines powering the vehicle.'),
(758, 1, 5, 'acceptedPaymentMethod', 'acceptedPaymentMethod', 'The payment method(s) accepted by seller for this offer.'),
(759, 1, 5, 'representativeOfPage', 'representativeOfPage', 'Indicates whether this image is representative of the content of the page.'),
(760, 1, 5, 'partOfOrder', 'partOfOrder', 'The overall order the items in this delivery were included in.'),
(761, 1, 5, 'purchaseDate', 'purchaseDate', 'The date the item, e.g. vehicle, was purchased by the current owner.'),
(762, 1, 5, 'loser', 'loser', 'A sub property of participant. The loser of the action.'),
(763, 1, 5, 'issn', 'issn', 'The International Standard Serial Number (ISSN) that identifies this serial publication. You can repeat this property to identify different formats of, or the linking ISSN (ISSN-L) for, this serial publication.'),
(764, 1, 5, 'landlord', 'landlord', 'A sub property of participant. The owner of the real estate property.'),
(765, 1, 5, 'language', 'language', 'A sub property of instrument. The language used on this action.'),
(766, 1, 5, 'inLanguage', 'inLanguage', 'The language of the content or performance or used in an action. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[availableLanguage]].'),
(767, 1, 5, 'legislationDateVersion', 'legislationDateVersion', 'The point-in-time at which the provided description of the legislation is valid (e.g.: when looking at the law on the 2016-04-07 (= dateVersion), I get the consolidation of 2015-04-12 of the \"National Insurance Contributions Act 2015\")'),
(768, 1, 5, 'originAddress', 'originAddress', 'Shipper\'s address.'),
(769, 1, 5, 'healthPlanDrugTier', 'healthPlanDrugTier', 'The tier(s) of drugs offered by this formulary or insurance plan.'),
(770, 1, 5, 'eduQuestionType', 'eduQuestionType', 'For questions that are part of learning resources (e.g. Quiz), eduQuestionType indicates the format of question being given. Example: \"Multiple choice\", \"Open ended\", \"Flashcard\".'),
(771, 1, 5, 'keywords', 'keywords', 'Keywords or tags used to describe some item. Multiple textual entries in a keywords list are typically delimited by commas, or by repeating the property.'),
(772, 1, 5, 'recognizingAuthority', 'recognizingAuthority', 'If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.'),
(773, 1, 5, 'transitTime', 'transitTime', 'The typical delay the order has been sent for delivery and the goods reach the final customer. Typical properties: minValue, maxValue, unitCode (d for DAY).'),
(774, 1, 5, 'availableTest', 'availableTest', 'A diagnostic test or procedure offered by this lab.'),
(775, 1, 5, 'isFamilyFriendly', 'isFamilyFriendly', 'Indicates whether this content is family friendly.'),
(776, 1, 5, 'knowsLanguage', 'knowsLanguage', 'Of a [[Person]], and less typically of an [[Organization]], to indicate a known language. We do not distinguish skill levels or reading/writing/speaking/signing here. Use language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47).'),
(777, 1, 5, 'constrainingProperty', 'constrainingProperty', 'Indicates a property used as a constraint to define a [[StatisticalPopulation]] with respect to the set of entities\n  corresponding to an indicated type (via [[populationType]]).'),
(778, 1, 5, 'geoCovers', 'geoCovers', 'Represents a relationship between two geometries (or the places they represent), relating a covering geometry to a covered geometry. \"Every point of b is a point of (the interior or boundary of) a\". As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(779, 1, 5, 'penciler', 'penciler', 'The individual who draws the primary narrative artwork.'),
(780, 1, 5, 'availableAtOrFrom', 'availableAtOrFrom', 'The place(s) from which the offer can be obtained (e.g. store locations).'),
(781, 1, 5, 'requiredGender', 'requiredGender', 'Audiences defined by a person\'s gender.'),
(782, 1, 5, 'educationalCredentialAwarded', 'educationalCredentialAwarded', 'A description of the qualification, award, certificate, diploma or other educational credential awarded as a consequence of successful completion of this course or program.'),
(783, 1, 5, 'medicalSpecialty', 'medicalSpecialty', 'A medical specialty of the provider.'),
(784, 1, 5, 'startDate', 'startDate', 'The start date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).'),
(785, 1, 5, 'pregnancyCategory', 'pregnancyCategory', 'Pregnancy category of this drug.'),
(786, 1, 5, 'line', 'line', 'A line is a point-to-point path consisting of two or more points. A line is expressed as a series of two or more point objects separated by space.'),
(787, 1, 5, 'numTracks', 'numTracks', 'The number of tracks in this album or playlist.'),
(788, 1, 5, 'numberOfForwardGears', 'numberOfForwardGears', 'The total number of forward gears available for the transmission system of the vehicle.\\n\\nTypical unit code(s): C62'),
(789, 1, 5, 'recourseLoan', 'recourseLoan', 'The only way you get the money back in the event of default is the security. Recourse is where you still have the opportunity to go back to the borrower for the rest of the money.'),
(790, 1, 5, 'manufacturer', 'manufacturer', 'The manufacturer of the product.'),
(791, 1, 5, 'minValue', 'minValue', 'The lower value of some characteristic or property.'),
(792, 1, 5, 'dropoffLocation', 'dropoffLocation', 'Where a rental car can be dropped off.'),
(793, 1, 5, 'isAcceptingNewPatients', 'isAcceptingNewPatients', 'Whether the provider is accepting new patients.'),
(794, 1, 5, 'permissionType', 'permissionType', 'The type of permission granted the person, organization, or audience.'),
(795, 1, 5, 'realEstateAgent', 'realEstateAgent', 'A sub property of participant. The real estate agent involved in the action.'),
(796, 1, 5, 'bookFormat', 'bookFormat', 'The format of the book.'),
(797, 1, 5, 'numAdults', 'numAdults', 'The number of adults staying in the unit.'),
(798, 1, 5, 'partOfSeason', 'partOfSeason', 'The season to which this episode belongs.'),
(799, 1, 5, 'isPartOf', 'isPartOf', 'Indicates an item or CreativeWork that this item, or CreativeWork (in some sense), is part of.'),
(800, 1, 5, 'produces', 'produces', 'The tangible thing generated by the service, e.g. a passport, permit, etc.'),
(801, 1, 5, 'serviceOutput', 'serviceOutput', 'The tangible thing generated by the service, e.g. a passport, permit, etc.'),
(802, 1, 5, 'functionalClass', 'functionalClass', 'The degree of mobility the joint allows.'),
(803, 1, 5, 'populationType', 'populationType', 'Indicates the populationType common to all members of a [[StatisticalPopulation]].'),
(804, 1, 5, 'inCodeSet', 'inCodeSet', 'A [[CategoryCodeSet]] that contains this category code.'),
(805, 1, 5, 'inDefinedTermSet', 'inDefinedTermSet', 'A [[DefinedTermSet]] that contains this term.'),
(806, 1, 5, 'additionalVariable', 'additionalVariable', 'Any additional component of the exercise prescription that may need to be articulated to the patient. This may include the order of exercises, the number of repetitions of movement, quantitative distance, progressions over time, etc.'),
(807, 1, 5, 'servicePhone', 'servicePhone', 'The phone number to use to access the service.'),
(808, 1, 5, 'readonlyValue', 'readonlyValue', 'Whether or not a property is mutable.  Default is false. Specifying this for a property that also has a value makes it act similar to a \"hidden\" input in an HTML form.'),
(809, 1, 5, 'addressCountry', 'addressCountry', 'The country. For example, USA. You can also provide the two-letter [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1).'),
(810, 1, 5, 'calories', 'calories', 'The number of calories.'),
(811, 1, 5, 'lesser', 'lesser', 'This ordering relation for qualitative values indicates that the subject is lesser than the object.'),
(812, 1, 5, 'remainingAttendeeCapacity', 'remainingAttendeeCapacity', 'The number of attendee places for an event that remain unallocated.'),
(813, 1, 5, 'recipeCuisine', 'recipeCuisine', 'The cuisine of the recipe (for example, French or Ethiopian).'),
(814, 1, 5, 'accelerationTime', 'accelerationTime', 'The time needed to accelerate the vehicle from a given start velocity to a given target velocity.\\n\\nTypical unit code(s): SEC for seconds\\n\\n* Note: There are unfortunately no standard unit codes for seconds/0..100 km/h or seconds/0..60 mph. Simply use \"SEC\" for seconds and indicate the velocities in the [[name]] of the [[QuantitativeValue]], or use [[valueReference]] with a [[QuantitativeValue]] of 0..60 mph or 0..100 km/h to specify the reference speeds.'),
(815, 1, 5, 'lesserOrEqual', 'lesserOrEqual', 'This ordering relation for qualitative values indicates that the subject is lesser than or equal to the object.'),
(816, 1, 5, 'course', 'course', 'A sub property of location. The course where this action was taken.'),
(817, 1, 5, 'exerciseCourse', 'exerciseCourse', 'A sub property of location. The course where this action was taken.'),
(818, 1, 5, 'study', 'study', 'A medical study or trial related to this entity.'),
(819, 1, 5, 'numConstraints', 'numConstraints', 'Indicates the number of constraints (not counting [[populationType]]) defined for a particular [[StatisticalPopulation]]. This helps applications understand if they have access to a sufficiently complete description of a [[StatisticalPopulation]].'),
(820, 1, 5, 'icaoCode', 'icaoCode', 'ICAO identifier for an airport.'),
(821, 1, 5, 'videoFormat', 'videoFormat', 'The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).'),
(822, 1, 5, 'inStoreReturnsOffered', 'inStoreReturnsOffered', 'Are in-store returns offered? (For more advanced return methods use the [[returnMethod]] property.)'),
(823, 1, 5, 'diagnosis', 'diagnosis', 'One or more alternative conditions considered in the differential diagnosis process as output of a diagnosis process.'),
(824, 1, 5, 'drainsTo', 'drainsTo', 'The vasculature that the vein drains into.'),
(825, 1, 5, 'accountablePerson', 'accountablePerson', 'Specifies the Person that is legally accountable for the CreativeWork.'),
(826, 1, 5, 'associatedPathophysiology', 'associatedPathophysiology', 'If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.'),
(827, 1, 5, 'doesNotShip', 'doesNotShip', 'Indicates when shipping to a particular [[shippingDestination]] is not available.'),
(828, 1, 5, 'exerciseRelatedDiet', 'exerciseRelatedDiet', 'A sub property of instrument. The diet used in this action.'),
(829, 1, 5, 'recipeCategory', 'recipeCategory', 'The category of the recipe—for example, appetizer, entree, etc.'),
(830, 1, 5, 'cvdNumBeds', 'cvdNumBeds', 'numbeds - HOSPITAL INPATIENT BEDS: Inpatient beds, including all staffed, licensed, and overflow (surge) beds used for inpatients.'),
(831, 1, 5, 'isGift', 'isGift', 'Indicates whether the offer was accepted as a gift for someone other than the buyer.'),
(832, 1, 5, 'emissionsCO2', 'emissionsCO2', 'The CO2 emissions in g/km. When used in combination with a QuantitativeValue, put \"g/km\" into the unitText property of that value, since there is no UN/CEFACT Common Code for \"g/km\".'),
(833, 1, 5, 'musicCompositionForm', 'musicCompositionForm', 'The type of composition (e.g. overture, sonata, symphony, etc.).'),
(834, 1, 5, 'members', 'members', 'A member of this organization.'),
(835, 1, 5, 'pagination', 'pagination', 'Any description of pages that is not separated into pageStart and pageEnd; for example, \"1-6, 9, 55\" or \"10-12, 46-49\".'),
(836, 1, 5, 'contentUrl', 'contentUrl', 'Actual bytes of the media object, for example the image file or video file.'),
(837, 1, 5, 'additionalNumberOfGuests', 'additionalNumberOfGuests', 'If responding yes, the number of guests who will attend in addition to the invitee.'),
(838, 1, 5, 'nonprofitStatus', 'nonprofitStatus', 'nonprofitStatus indicates the legal status of a non-profit organization in its primary place of business.'),
(839, 1, 5, 'strengthValue', 'strengthValue', 'The value of an active ingredient\'s strength, e.g. 325.'),
(840, 1, 5, 'affiliation', 'affiliation', 'An organization that this person is affiliated with. For example, a school/university, a club, or a team.'),
(841, 1, 5, 'memberOf', 'memberOf', 'An Organization (or ProgramMembership) to which this Person or Organization belongs.'),
(842, 1, 5, 'audienceType', 'audienceType', 'The target group associated with a given audience (e.g. veterans, car owners, musicians, etc.).'),
(843, 1, 5, 'significantLinks', 'significantLinks', 'The most significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most.'),
(844, 1, 5, 'significantLink', 'significantLink', 'One of the more significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most.'),
(845, 1, 5, 'knows', 'knows', 'The most generic bi-directional social/work relation.'),
(846, 1, 5, 'experienceRequirements', 'experienceRequirements', 'Description of skills and experience needed for the position or Occupation.'),
(847, 1, 5, 'worksFor', 'worksFor', 'Organizations that the person works for.'),
(848, 1, 5, 'coach', 'coach', 'A person that acts in a coaching role for a sports team.'),
(849, 1, 5, 'givenName', 'givenName', 'Given name. In the U.S., the first name of a Person.'),
(850, 1, 5, 'cvdFacilityCounty', 'cvdFacilityCounty', 'Name of the County of the NHSN facility that this data record applies to. Use [[cvdFacilityId]] to identify the facility. To provide other details, [[healthcareReportingData]] can be used on a [[Hospital]] entry.'),
(851, 1, 5, 'returnPolicySeasonalOverride', 'returnPolicySeasonalOverride', 'Seasonal override of a return policy.'),
(852, 1, 5, 'typeOfGood', 'typeOfGood', 'The product that this structured value is referring to.'),
(853, 1, 5, 'isicV4', 'isicV4', 'The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.'),
(854, 1, 5, 'possibleTreatment', 'possibleTreatment', 'A possible treatment to address this condition, sign or symptom.'),
(855, 1, 5, 'measuredProperty', 'measuredProperty', 'The measuredProperty of an [[Observation]], either a schema.org property, a property from other RDF-compatible systems, e.g. W3C RDF Data Cube, or schema.org extensions such as [GS1\'s](https://www.gs1.org/voc/?show=properties).'),
(856, 1, 5, 'partOfTVSeries', 'partOfTVSeries', 'The TV series to which this episode or season belongs.'),
(857, 1, 5, 'partOfSeries', 'partOfSeries', 'The series to which this episode or season belongs.'),
(858, 1, 5, 'diversityPolicy', 'diversityPolicy', 'Statement on diversity policy by an [[Organization]] e.g. a [[NewsMediaOrganization]]. For a [[NewsMediaOrganization]], a statement describing the newsroom’s diversity policy on both staffing and sources, typically providing staffing data.'),
(859, 1, 5, 'numberOfPreviousOwners', 'numberOfPreviousOwners', 'The number of owners of the vehicle, including the current one.\\n\\nTypical unit code(s): C62'),
(860, 1, 5, 'mapType', 'mapType', 'Indicates the kind of Map, from the MapCategoryType Enumeration.'),
(861, 1, 5, 'departureTerminal', 'departureTerminal', 'Identifier of the flight\'s departure terminal.'),
(862, 1, 5, 'pickupTime', 'pickupTime', 'When a taxi will pick up a passenger or a rental car can be picked up.'),
(863, 1, 5, 'mealService', 'mealService', 'Description of the meals that will be provided or available for purchase.'),
(864, 1, 5, 'restPeriods', 'restPeriods', 'How often one should break from the activity.'),
(865, 1, 5, 'messageAttachment', 'messageAttachment', 'A CreativeWork attached to the message.'),
(866, 1, 5, 'rsvpResponse', 'rsvpResponse', 'The response (yes, no, maybe) to the RSVP.'),
(867, 1, 5, 'departureBoatTerminal', 'departureBoatTerminal', 'The terminal or port from which the boat departs.'),
(868, 1, 5, 'numberOfLoanPayments', 'numberOfLoanPayments', 'The number of payments contractually required at origination to repay the loan. For monthly paying loans this is the number of months from the contractual first payment date to the maturity date.'),
(869, 1, 5, 'pregnancyWarning', 'pregnancyWarning', 'Any precaution, guidance, contraindication, etc. related to this drug\'s use during pregnancy.'),
(870, 1, 5, 'guideline', 'guideline', 'A medical guideline related to this entity.'),
(871, 1, 5, 'eligibleCustomerType', 'eligibleCustomerType', 'The type(s) of customers for which the given offer is valid.'),
(872, 1, 5, 'lyrics', 'lyrics', 'The words in the song.'),
(873, 1, 5, 'returnPolicyCategory', 'returnPolicyCategory', 'Specifies an applicable return policy (from an enumeration).'),
(874, 1, 5, 'usesDevice', 'usesDevice', 'Device used to perform the test.'),
(875, 1, 5, 'increasesRiskOf', 'increasesRiskOf', 'The condition, complication, etc. influenced by this factor.'),
(876, 1, 5, 'healthCondition', 'healthCondition', 'Specifying the health condition(s) of a patient, medical study, or other target audience.'),
(877, 1, 5, 'median', 'median', 'The median value.'),
(878, 1, 5, 'scheduleTimezone', 'scheduleTimezone', 'Indicates the timezone for which the time(s) indicated in the [[Schedule]] are given. The value provided should be among those listed in the IANA Time Zone Database.'),
(879, 1, 5, 'gamePlatform', 'gamePlatform', 'The electronic systems used to play <a href=\"http://en.wikipedia.org/wiki/Category:Video_game_platforms\">video games</a>.'),
(880, 1, 5, 'healthPlanMarketingUrl', 'healthPlanMarketingUrl', 'The URL that goes directly to the plan brochure for the specific standard plan or plan variation.'),
(881, 1, 5, 'hasDigitalDocumentPermission', 'hasDigitalDocumentPermission', 'A permission related to the access to this document (e.g. permission to read or write an electronic document). For a public document, specify a grantee with an Audience with audienceType equal to \"public\".'),
(882, 1, 5, 'sodiumContent', 'sodiumContent', 'The number of milligrams of sodium.'),
(883, 1, 5, 'letterer', 'letterer', 'The individual who adds lettering, including speech balloons and sound effects, to artwork.'),
(884, 1, 5, 'knowsAbout', 'knowsAbout', 'Of a [[Person]], and less typically of an [[Organization]], to indicate a topic that is known about - suggesting possible expertise but not implying it. We do not distinguish skill levels here, or relate this to educational content, events, objectives or [[JobPosting]] descriptions.'),
(885, 1, 5, 'opponent', 'opponent', 'A sub property of participant. The opponent on this action.'),
(886, 1, 5, 'guidelineSubject', 'guidelineSubject', 'The medical conditions, treatments, etc. that are the subject of the guideline.'),
(887, 1, 5, 'equal', 'equal', 'This ordering relation for qualitative values indicates that the subject is equal to the object.'),
(888, 1, 5, 'geoCrosses', 'geoCrosses', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that crosses it: \"a crosses b: they have some but not all interior points in common, and the dimension of the intersection is less than that of at least one of them\". As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(889, 1, 5, 'postalCodeEnd', 'postalCodeEnd', 'Last postal code in the range (included). Needs to be after [[postalCodeBegin]].'),
(890, 1, 5, 'department', 'department', 'A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.'),
(891, 1, 5, 'lodgingUnitType', 'lodgingUnitType', 'Textual description of the unit type (including suite vs. room, size of bed, etc.).'),
(892, 1, 5, 'applicationSubCategory', 'applicationSubCategory', 'Subcategory of the application, e.g. \'Arcade Game\'.'),
(893, 1, 5, 'applicationDeadline', 'applicationDeadline', 'The date at which the program stops collecting applications for the next enrollment cycle.'),
(894, 1, 5, 'activeIngredient', 'activeIngredient', 'An active ingredient, typically chemical compounds and/or biologic substances.'),
(895, 1, 5, 'feesAndCommissionsSpecification', 'feesAndCommissionsSpecification', 'Description of fees, commissions, and other terms applied either to a class of financial product, or by a financial service organization.'),
(896, 1, 5, 'molecularWeight', 'molecularWeight', 'This is the molecular weight of the entity being described, not of the parent. Units should be included in the form \'&lt;Number&gt; &lt;unit&gt;\', for example \'12 amu\' or as \'&lt;QuantitativeValue&gt;.'),
(897, 1, 5, 'carbohydrateContent', 'carbohydrateContent', 'The number of grams of carbohydrates.'),
(898, 1, 5, 'performers', 'performers', 'The main performer or performers of the event&#x2014;for example, a presenter, musician, or actor.'),
(899, 1, 5, 'performer', 'performer', 'A performer at the event&#x2014;for example, a presenter, musician, musical group or actor.'),
(900, 1, 5, 'healthcareReportingData', 'healthcareReportingData', 'Indicates data describing a hospital, e.g. a CDC [[CDCPMDRecord]] or as some kind of [[Dataset]].'),
(901, 1, 5, 'openingHoursSpecification', 'openingHoursSpecification', 'The opening hours of a certain place.'),
(902, 1, 5, 'author', 'author', 'The author of this content or rating. Please note that author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.'),
(903, 1, 5, 'unitText', 'unitText', 'A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for\n<a href=\'unitCode\'>unitCode</a>.'),
(904, 1, 5, 'speed', 'speed', 'The speed range of the vehicle. If the vehicle is powered by an engine, the upper limit of the speed range (indicated by [[maxValue]]) should be the maximum speed achievable under regular conditions.\\n\\nTypical unit code(s): KMH for km/h, HM for mile per hour (0.447 04 m/s), KNT for knot\\n\\n*Note 1: Use [[minValue]] and [[maxValue]] to indicate the range. Typically, the minimal value is zero.\\n* Note 2: There are many different ways of measuring the speed range. You can link to information about how the given value has been determined using the [[valueReference]] property.'),
(905, 1, 5, 'servicePostalAddress', 'servicePostalAddress', 'The address for accessing the service by mail.'),
(906, 1, 5, 'pathophysiology', 'pathophysiology', 'Changes in the normal mechanical, physical, and biochemical functions that are associated with this activity or condition.'),
(907, 1, 5, 'healthPlanDrugOption', 'healthPlanDrugOption', 'TODO.'),
(908, 1, 5, 'pickupLocation', 'pickupLocation', 'Where a taxi will pick up a passenger or a rental car can be picked up.'),
(909, 1, 5, 'weightTotal', 'weightTotal', 'The permitted total weight of the loaded vehicle, including passengers and cargo and the weight of the empty vehicle.\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n\\n* Note 1: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 2: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]].\\n* Note 3: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(910, 1, 5, 'athlete', 'athlete', 'A person that acts as performing member of a sports team; a player as opposed to a coach.'),
(911, 1, 5, 'hasDriveThroughService', 'hasDriveThroughService', 'Indicates whether some facility (e.g. [[FoodEstablishment]], [[CovidTestingFacility]]) offers a service that can be used by driving through in a car. In the case of [[CovidTestingFacility]] such facilities could potentially help with social distancing from other potentially-infected users.'),
(912, 1, 5, 'storageRequirements', 'storageRequirements', 'Storage requirements (free space required).'),
(913, 1, 5, 'dateline', 'dateline', 'A [dateline](https://en.wikipedia.org/wiki/Dateline) is a brief piece of text included in news articles that describes where and when the story was written or filed though the date is often omitted. Sometimes only a placename is provided.\n\nStructured representations of dateline-related information can also be expressed more explicitly using [[locationCreated]] (which represents where a work was created, e.g. where a news report was written).  For location depicted or described in the content, use [[contentLocation]].\n\nDateline summaries are oriented more towards human readers than towards automated processing, and can vary substantially. Some examples: \"BEIRUT, Lebanon, June 2.\", \"Paris, France\", \"December 19, 2017 11:43AM Reporting from Washington\", \"Beijing/Moscow\", \"QUEZON CITY, Philippines\".\n      '),
(914, 1, 5, 'encodings', 'encodings', 'A media object that encodes this CreativeWork.'),
(915, 1, 5, 'encoding', 'encoding', 'A media object that encodes this CreativeWork. This property is a synonym for associatedMedia.'),
(916, 1, 5, 'returnLabelSource', 'returnLabelSource', 'The method (from an enumeration) by which the customer obtains a return shipping label for a product returned for any reason.'),
(917, 1, 5, 'geoOverlaps', 'geoOverlaps', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that geospatially overlaps it, i.e. they have some but not all points in common. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(918, 1, 5, 'billingStart', 'billingStart', 'Specifies after how much time this price (or price component) becomes valid and billing starts. Can be used, for example, to model a price increase after the first year of a subscription. The unit of measurement is specified by the unitCode property.'),
(919, 1, 5, 'applicationCategory', 'applicationCategory', 'Type of software application, e.g. \'Game, Multimedia\'.'),
(920, 1, 5, 'legislationDate', 'legislationDate', 'The date of adoption or signature of the legislation. This is the date at which the text is officially aknowledged to be a legislation, even though it might not even be published or in force.'),
(921, 1, 5, 'dateCreated', 'dateCreated', 'The date on which the CreativeWork was created or the item was added to a DataFeed.'),
(922, 1, 5, 'itemListOrder', 'itemListOrder', 'Type of ordering (e.g. Ascending, Descending, Unordered).'),
(923, 1, 5, 'typeOfBed', 'typeOfBed', 'The type of bed to which the BedDetail refers, i.e. the type of bed available in the quantity indicated by quantity.'),
(924, 1, 5, 'proficiencyLevel', 'proficiencyLevel', 'Proficiency needed for this content; expected values: \'Beginner\', \'Expert\'.'),
(925, 1, 5, 'installUrl', 'installUrl', 'URL at which the app may be installed, if different from the URL of the item.'),
(926, 1, 5, 'character', 'character', 'Fictional person connected with a creative work.'),
(927, 1, 5, 'gameLocation', 'gameLocation', 'Real or fictional location of the game (or part of game).'),
(928, 1, 5, 'costCurrency', 'costCurrency', 'The currency (in 3-letter) of the drug cost. See: http://en.wikipedia.org/wiki/ISO_4217. '),
(929, 1, 5, 'departureTime', 'departureTime', 'The expected departure time.'),
(930, 1, 5, 'annualPercentageRate', 'annualPercentageRate', 'The annual rate that is charged for borrowing (or made by investing), expressed as a single percentage number that represents the actual yearly cost of funds over the term of a loan. This includes any fees or additional costs associated with the transaction.'),
(931, 1, 5, 'doorTime', 'doorTime', 'The time admission will commence.'),
(932, 1, 5, 'claimReviewed', 'claimReviewed', 'A short summary of the specific claims reviewed in a ClaimReview.'),
(933, 1, 5, 'bookEdition', 'bookEdition', 'The edition of the book.'),
(934, 1, 5, 'specialCommitments', 'specialCommitments', 'Any special commitments associated with this job posting. Valid entries include VeteranCommit, MilitarySpouseCommit, etc.'),
(935, 1, 5, 'molecularFormula', 'molecularFormula', 'The empirical formula is the simplest whole number ratio of all the atoms in a molecule.'),
(936, 1, 5, 'iataCode', 'iataCode', 'IATA identifier for an airline or airport.'),
(937, 1, 5, 'broadcastServiceTier', 'broadcastServiceTier', 'The type of service required to have access to the channel (e.g. Standard or Premium).'),
(938, 1, 5, 'firstAppearance', 'firstAppearance', 'Indicates the first known occurrence of a [[Claim]] in some [[CreativeWork]].'),
(939, 1, 5, 'workExample', 'workExample', 'Example/instance/realization/derivation of the concept of this creative work. E.g. the paperback edition, first edition, or e-book.'),
(940, 1, 5, 'numberOfBeds', 'numberOfBeds', 'The quantity of the given bed type available in the HotelRoom, Suite, House, or Apartment.'),
(941, 1, 5, 'postalCode', 'postalCode', 'The postal code. For example, 94043.'),
(942, 1, 5, 'eventAttendanceMode', 'eventAttendanceMode', 'The eventAttendanceMode of an event indicates whether it occurs online, offline, or a mix.'),
(943, 1, 5, 'taxonomicRange', 'taxonomicRange', 'The taxonomic grouping of the organism that expresses, encodes, or in some way related to the BioChemEntity.'),
(944, 1, 5, 'supersededBy', 'supersededBy', 'Relates a term (i.e. a property, class or enumeration) to one that supersedes it.'),
(945, 1, 5, 'resultComment', 'resultComment', 'A sub property of result. The Comment created or sent as a result of this action.'),
(946, 1, 5, 'characterName', 'characterName', 'The name of a character played in some acting or performing role, i.e. in a PerformanceRole.'),
(947, 1, 5, 'employmentType', 'employmentType', 'Type of employment (e.g. full-time, part-time, contract, temporary, seasonal, internship).'),
(948, 1, 5, 'albumReleaseType', 'albumReleaseType', 'The kind of release which this album is: single, EP or album.'),
(949, 1, 5, 'featureList', 'featureList', 'Features or modules provided by this application (and possibly required by other applications).'),
(950, 1, 5, 'title', 'title', 'The title of the job.'),
(951, 1, 5, 'dateModified', 'dateModified', 'The date on which the CreativeWork was most recently modified or when the item\'s entry was modified within a DataFeed.'),
(952, 1, 5, 'identifyingExam', 'identifyingExam', 'A physical examination that can identify this sign.'),
(953, 1, 5, 'expectedArrivalUntil', 'expectedArrivalUntil', 'The latest date the package may arrive.'),
(954, 1, 5, 'roofLoad', 'roofLoad', 'The permitted total weight of cargo and installations (e.g. a roof rack) on top of the vehicle.\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n\\n* Note 1: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 2: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]]\\n* Note 3: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(955, 1, 5, 'missionCoveragePrioritiesPolicy', 'missionCoveragePrioritiesPolicy', 'For a [[NewsMediaOrganization]], a statement on coverage priorities, including any public agenda or stance on issues.'),
(956, 1, 5, 'floorLimit', 'floorLimit', 'A floor limit is the amount of money above which credit card transactions must be authorized.'),
(957, 1, 5, 'foodEstablishment', 'foodEstablishment', 'A sub property of location. The specific food establishment where the action occurred.'),
(958, 1, 5, 'nationality', 'nationality', 'Nationality of the person.'),
(959, 1, 5, 'alternativeOf', 'alternativeOf', 'Another gene which is a variation of this one.'),
(960, 1, 5, 'temporal', 'temporal', 'The \"temporal\" property can be used in cases where more specific properties\n(e.g. [[temporalCoverage]], [[dateCreated]], [[dateModified]], [[datePublished]]) are not known to be appropriate.'),
(961, 1, 5, 'variantCover', 'variantCover', 'A description of the variant cover\n    	for the issue, if the issue is a variant printing. For example, \"Bryan Hitch\n    	Variant Cover\" or \"2nd Printing Variant\".'),
(962, 1, 5, 'broadcastSignalModulation', 'broadcastSignalModulation', 'The modulation (e.g. FM, AM, etc) used by a particular broadcast service.'),
(963, 1, 5, 'secondaryPrevention', 'secondaryPrevention', 'A preventative therapy used to prevent reoccurrence of the medical condition after an initial episode of the condition.'),
(964, 1, 5, 'hasCredential', 'hasCredential', 'A credential awarded to the Person or Organization.'),
(965, 1, 5, 'contactOption', 'contactOption', 'An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers).'),
(966, 1, 5, 'discountCurrency', 'discountCurrency', 'The currency of the discount.\\n\\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. \"USD\"; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. \"BTC\"; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. \"Ithaca HOUR\".'),
(967, 1, 5, 'reservationId', 'reservationId', 'A unique identifier for the reservation.'),
(968, 1, 5, 'dateDeleted', 'dateDeleted', 'The datetime the item was removed from the DataFeed.'),
(969, 1, 5, 'videoQuality', 'videoQuality', 'The quality of the video.'),
(970, 1, 5, 'dateVehicleFirstRegistered', 'dateVehicleFirstRegistered', 'The date of the first registration of the vehicle with the respective public authorities.'),
(971, 1, 5, 'partOfEpisode', 'partOfEpisode', 'The episode to which this clip belongs.'),
(972, 1, 5, 'specialOpeningHoursSpecification', 'specialOpeningHoursSpecification', 'The special opening hours of a certain place.\\n\\nUse this to explicitly override general opening hours brought in scope by [[openingHoursSpecification]] or [[openingHours]].\n      '),
(973, 1, 5, 'duns', 'duns', 'The Dun & Bradstreet DUNS number for identifying an organization or business person.'),
(974, 1, 5, 'customerRemorseReturnShippingFeesAmount', 'customerRemorseReturnShippingFeesAmount', 'The amount of shipping costs if a product is returned due to customer remorse. Applicable when property [[customerRemorseReturnFees]] equals [[ReturnShippingFees]].'),
(975, 1, 5, 'copyrightNotice', 'copyrightNotice', 'Text of a notice appropriate for describing the copyright aspects of this Creative Work, ideally indicating the owner of the copyright for the Work.'),
(976, 1, 5, 'numberOfFullBathrooms', 'numberOfFullBathrooms', 'Number of full bathrooms - The total number of full and ¾ bathrooms in an [[Accommodation]]. This corresponds to the [BathroomsFull field in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsFull+Field).'),
(977, 1, 5, 'tourBookingPage', 'tourBookingPage', 'A page providing information on how to book a tour of some [[Place]], such as an [[Accommodation]] or [[ApartmentComplex]] in a real estate setting, as well as other kinds of tours as appropriate.'),
(978, 1, 5, 'arrivalStation', 'arrivalStation', 'The station where the train trip ends.'),
(979, 1, 5, 'mediaAuthenticityCategory', 'mediaAuthenticityCategory', 'Indicates a MediaManipulationRatingEnumeration classification of a media object (in the context of how it was published or shared).'),
(980, 1, 5, 'healthPlanCoinsuranceRate', 'healthPlanCoinsuranceRate', 'The rate of coinsurance expressed as a number between 0.0 and 1.0.'),
(981, 1, 5, 'branchOf', 'branchOf', 'The larger organization that this local business is a branch of, if any. Not to be confused with (anatomical) [[branch]].'),
(982, 1, 5, 'parentOrganization', 'parentOrganization', 'The larger organization that this organization is a [[subOrganization]] of, if any.'),
(983, 1, 5, 'attendees', 'attendees', 'A person attending the event.'),
(984, 1, 5, 'attendee', 'attendee', 'A person or organization attending the event.'),
(985, 1, 5, 'maximumPhysicalAttendeeCapacity', 'maximumPhysicalAttendeeCapacity', 'The maximum physical attendee capacity of an [[Event]] whose [[eventAttendanceMode]] is [[OfflineEventAttendanceMode]] (or the offline aspects, in the case of a [[MixedEventAttendanceMode]]). '),
(986, 1, 5, 'applicableLocation', 'applicableLocation', 'The location in which the status applies.'),
(987, 1, 5, 'membershipNumber', 'membershipNumber', 'A unique identifier for the membership.'),
(988, 1, 5, 'courseCode', 'courseCode', 'The identifier for the [[Course]] used by the course [[provider]] (e.g. CS101 or 6.001).'),
(989, 1, 5, 'termsOfService', 'termsOfService', 'Human-readable terms of service documentation.'),
(990, 1, 5, 'originalMediaContextDescription', 'originalMediaContextDescription', 'Describes, in a [[MediaReview]] when dealing with [[DecontextualizedContent]], background information that can contribute to better interpretation of the [[MediaObject]].'),
(991, 1, 5, 'countryOfOrigin', 'countryOfOrigin', 'The country of origin of something, including products as well as creative  works such as movie and TV content.\n\nIn the case of TV and movie, this would be the country of the principle offices of the production company or individual responsible for the movie. For other kinds of [[CreativeWork]] it is difficult to provide fully general guidance, and properties such as [[contentLocation]] and [[locationCreated]] may be more applicable.\n\nIn the case of products, the country of origin of the product. The exact interpretation of this may vary by context and product type, and cannot be fully enumerated here.'),
(992, 1, 5, 'countryOfAssembly', 'countryOfAssembly', 'The place where the product was assembled.'),
(993, 1, 5, 'gettingTestedInfo', 'gettingTestedInfo', 'Information about getting tested (for a [[MedicalCondition]]), e.g. in the context of a pandemic.'),
(994, 1, 5, 'question', 'question', 'A sub property of object. A question.'),
(995, 1, 5, 'totalTime', 'totalTime', 'The total time required to perform instructions or a direction (including time to prepare the supplies), in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).'),
(996, 1, 5, 'serverStatus', 'serverStatus', 'Status of a game server.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(997, 1, 5, 'acceptsReservations', 'acceptsReservations', 'Indicates whether a FoodEstablishment accepts reservations. Values can be Boolean, an URL at which reservations can be made or (for backwards compatibility) the strings ```Yes``` or ```No```.'),
(998, 1, 5, 'starRating', 'starRating', 'An official rating for a lodging business or food establishment, e.g. from national associations or standards bodies. Use the author property to indicate the rating organization, e.g. as an Organization with name such as (e.g. HOTREC, DEHOGA, WHR, or Hotelstars).'),
(999, 1, 5, 'agent', 'agent', 'The direct performer or driver of the action (animate or inanimate). E.g. *John* wrote a book.'),
(1000, 1, 5, 'email', 'email', 'Email address.'),
(1001, 1, 5, 'numberOfItems', 'numberOfItems', 'The number of items in an ItemList. Note that some descriptions might not fully describe all items in a list (e.g., multi-page pagination); in such cases, the numberOfItems would be for the entire list.'),
(1002, 1, 5, 'chemicalRole', 'chemicalRole', 'A role played by the BioChemEntity within a chemical context.'),
(1003, 1, 5, 'item', 'item', 'An entity represented by an entry in a list or data feed (e.g. an \'artist\' in a list of \'artists\').'),
(1004, 1, 5, 'validFrom', 'validFrom', 'The date when the item becomes valid.'),
(1005, 1, 5, 'taxonRank', 'taxonRank', 'The taxonomic rank of this taxon given preferably as a URI from a controlled vocabulary – typically the ranks from TDWG TaxonRank ontology or equivalent Wikidata URIs.'),
(1006, 1, 5, 'hasCategoryCode', 'hasCategoryCode', 'A Category code contained in this code set.'),
(1007, 1, 5, 'hasDefinedTerm', 'hasDefinedTerm', 'A Defined Term contained in this term set.'),
(1008, 1, 5, 'healthPlanCostSharing', 'healthPlanCostSharing', 'The costs to the patient for services under this network or formulary.'),
(1009, 1, 5, 'actionPlatform', 'actionPlatform', 'The high level platform(s) where the Action can be performed for the given URL. To specify a specific application or operating system instance, use actionApplication.'),
(1010, 1, 5, 'observationDate', 'observationDate', 'The observationDate of an [[Observation]].'),
(1011, 1, 5, 'cssSelector', 'cssSelector', 'A CSS selector, e.g. of a [[SpeakableSpecification]] or [[WebPageElement]]. In the latter case, multiple matches within a page can constitute a single conceptual \"Web page element\".'),
(1012, 1, 5, 'bccRecipient', 'bccRecipient', 'A sub property of recipient. The recipient blind copied on a message.'),
(1013, 1, 5, 'gameEdition', 'gameEdition', 'The edition of a video game.'),
(1014, 1, 5, 'evidenceLevel', 'evidenceLevel', 'Strength of evidence of the data used to formulate the guideline (enumerated).'),
(1015, 1, 5, 'headline', 'headline', 'Headline of the article.'),
(1016, 1, 5, 'interactionType', 'interactionType', 'The Action representing the type of interaction. For up votes, +1s, etc. use [[LikeAction]]. For down votes use [[DislikeAction]]. Otherwise, use the most specific Action.'),
(1017, 1, 5, 'structuralClass', 'structuralClass', 'The name given to how bone physically connects to each other.'),
(1018, 1, 5, 'workload', 'workload', 'Quantitative measure of the physiologic output of the exercise; also referred to as energy expenditure.'),
(1019, 1, 5, 'repeatCount', 'repeatCount', 'Defines the number of times a recurring [[Event]] will take place.'),
(1020, 1, 5, 'adverseOutcome', 'adverseOutcome', 'A possible complication and/or side effect of this therapy. If it is known that an adverse outcome is serious (resulting in death, disability, or permanent damage; requiring hospitalization; or otherwise life-threatening or requiring immediate medical attention), tag it as a seriousAdverseOutcome instead.'),
(1021, 1, 5, 'departureStation', 'departureStation', 'The station from which the train departs.'),
(1022, 1, 5, 'proteinContent', 'proteinContent', 'The number of grams of protein.'),
(1023, 1, 5, 'accessibilityHazard', 'accessibilityHazard', 'A characteristic of the described resource that is physiologically dangerous to some users. Related to WCAG 2.0 guideline 2.3. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessibilityHazard-vocabulary).'),
(1024, 1, 5, 'regionDrained', 'regionDrained', 'The anatomical or organ system drained by this vessel; generally refers to a specific part of an organ.'),
(1025, 1, 5, 'commentTime', 'commentTime', 'The time at which the UserComment was made.'),
(1026, 1, 5, 'boardingPolicy', 'boardingPolicy', 'The type of boarding policy used by the airline (e.g. zone-based or group-based).'),
(1027, 1, 5, 'vehicleConfiguration', 'vehicleConfiguration', 'A short text indicating the configuration of the vehicle, e.g. \'5dr hatchback ST 2.5 MT 225 hp\' or \'limited edition\'.'),
(1028, 1, 5, 'billingIncrement', 'billingIncrement', 'This property specifies the minimal quantity and rounding increment that will be the basis for the billing. The unit of measurement is specified by the unitCode property.'),
(1029, 1, 5, 'securityClearanceRequirement', 'securityClearanceRequirement', 'A description of any security clearance requirements of the job.'),
(1030, 1, 5, 'drugClass', 'drugClass', 'The class of drug this belongs to (e.g., statins).'),
(1031, 1, 5, 'regionsAllowed', 'regionsAllowed', 'The regions where the media is allowed. If not specified, then it\'s assumed to be allowed everywhere. Specify the countries in [ISO 3166 format](http://en.wikipedia.org/wiki/ISO_3166).'),
(1032, 1, 5, 'screenshot', 'screenshot', 'A link to a screenshot image of the app.'),
(1033, 1, 5, 'appearance', 'appearance', 'Indicates an occurrence of a [[Claim]] in some [[CreativeWork]].'),
(1034, 1, 5, 'toRecipient', 'toRecipient', 'A sub property of recipient. The recipient who was directly sent the message.'),
(1035, 1, 5, 'numberOfPartialBathrooms', 'numberOfPartialBathrooms', 'Number of partial bathrooms - The total number of half and ¼ bathrooms in an [[Accommodation]]. This corresponds to the [BathroomsPartial field in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsPartial+Field). '),
(1036, 1, 5, 'arrivalTerminal', 'arrivalTerminal', 'Identifier of the flight\'s arrival terminal.'),
(1037, 1, 5, 'hasCourse', 'hasCourse', 'A course or class that is one of the learning opportunities that constitute an educational / occupational program. No information is implied about whether the course is mandatory or optional; no guarantee is implied about whether the course will be available to everyone on the program.'),
(1038, 1, 5, 'includedInHealthInsurancePlan', 'includedInHealthInsurancePlan', 'The insurance plans that cover this drug.'),
(1039, 1, 5, 'valueRequired', 'valueRequired', 'Whether the property must be filled in to complete the action.  Default is false.'),
(1040, 1, 5, 'processorRequirements', 'processorRequirements', 'Processor architecture required to run the application (e.g. IA64).'),
(1041, 1, 5, 'minPrice', 'minPrice', 'The lowest price if the price is a range.'),
(1042, 1, 5, 'diseaseSpreadStatistics', 'diseaseSpreadStatistics', 'Statistical information about the spread of a disease, either as [[WebContent]], or\n  described directly as a [[Dataset]], or the specific [[Observation]]s in the dataset. When a [[WebContent]] URL is\n  provided, the page indicated might also contain more such markup.'),
(1043, 1, 5, 'cutoffTime', 'cutoffTime', 'Order cutoff time allows merchants to describe the time after which they will no longer process orders received on that day. For orders processed after cutoff time, one day gets added to the delivery time estimate. This property is expected to be most typically used via the [[ShippingRateSettings]] publication pattern. The time is indicated using the ISO-8601 Time format, e.g. \"23:30:00-05:00\" would represent 6:30 pm Eastern Standard Time (EST) which is 5 hours behind Coordinated Universal Time (UTC).'),
(1044, 1, 5, 'legislationChanges', 'legislationChanges', 'Another legislation that this legislation changes. This encompasses the notions of amendment, replacement, correction, repeal, or other types of change. This may be a direct change (textual or non-textual amendment) or a consequential or indirect change. The property is to be used to express the existence of a change relationship between two acts rather than the existence of a consolidated version of the text that shows the result of the change. For consolidation relationships, use the <a href=\"/legislationConsolidates\">legislationConsolidates</a> property.'),
(1045, 1, 5, 'episodes', 'episodes', 'An episode of a TV/radio series or season.'),
(1046, 1, 5, 'episode', 'episode', 'An episode of a TV, radio or game media within a series or season.'),
(1047, 1, 5, 'permissions', 'permissions', 'Permission(s) required to run the app (for example, a mobile app may require full internet access or may run only on wifi).'),
(1048, 1, 5, 'strengthUnit', 'strengthUnit', 'The units of an active ingredient\'s strength, e.g. mg.'),
(1049, 1, 5, 'endDate', 'endDate', 'The end date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).'),
(1050, 1, 5, 'shippingDestination', 'shippingDestination', 'indicates (possibly multiple) shipping destinations. These can be defined in several ways, e.g. postalCode ranges.'),
(1051, 1, 5, 'accessCode', 'accessCode', 'Password, PIN, or access code needed for delivery (e.g. from a locker).'),
(1052, 1, 5, 'smiles', 'smiles', 'A specification in form of a line notation for describing the structure of chemical species using short ASCII strings.  Double bond stereochemistry \\ indicators may need to be escaped in the string in formats where the backslash is an escape character.'),
(1053, 1, 5, 'afterMedia', 'afterMedia', 'A media object representing the circumstances after performing this direction.'),
(1054, 1, 5, 'gameTip', 'gameTip', 'Links to tips, tactics, etc.'),
(1055, 1, 5, 'yearsInOperation', 'yearsInOperation', 'The age of the business.'),
(1056, 1, 5, 'speakable', 'speakable', 'Indicates sections of a Web page that are particularly \'speakable\' in the sense of being highlighted as being especially appropriate for text-to-speech conversion. Other sections of a page may also be usefully spoken in particular circumstances; the \'speakable\' property serves to indicate the parts most likely to be generally useful for speech.\n\nThe *speakable* property can be repeated an arbitrary number of times, with three kinds of possible \'content-locator\' values:\n\n1.) *id-value* URL references - uses *id-value* of an element in the page being annotated. The simplest use of *speakable* has (potentially relative) URL values, referencing identified sections of the document concerned.\n\n2.) CSS Selectors - addresses content in the annotated page, e.g. via class attribute. Use the [[cssSelector]] property.\n\n3.)  XPaths - addresses content via XPaths (assuming an XML view of the content). Use the [[xpath]] property.\n\n\nFor more sophisticated markup of speakable sections beyond simple ID references, either CSS selectors or XPath expressions to pick out document section(s) as speakable. For this\nwe define a supporting type, [[SpeakableSpecification]]  which is defined to be a possible value of the *speakable* property.\n         '),
(1057, 1, 5, 'accessMode', 'accessMode', 'The human sensory perceptual system or cognitive faculty through which a person may process or perceive information. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessMode-vocabulary).'),
(1058, 1, 5, 'orderNumber', 'orderNumber', 'The identifier of the transaction.'),
(1059, 1, 5, 'foundingDate', 'foundingDate', 'The date that this organization was founded.'),
(1060, 1, 5, 'fuelEfficiency', 'fuelEfficiency', 'The distance traveled per unit of fuel used; most commonly miles per gallon (mpg) or kilometers per liter (km/L).\\n\\n* Note 1: There are unfortunately no standard unit codes for miles per gallon or kilometers per liter. Use [[unitText]] to indicate the unit of measurement, e.g. mpg or km/L.\\n* Note 2: There are two ways of indicating the fuel consumption, [[fuelConsumption]] (e.g. 8 liters per 100 km) and [[fuelEfficiency]] (e.g. 30 miles per gallon). They are reciprocal.\\n* Note 3: Often, the absolute value is useful only when related to driving speed (\"at 80 km/h\") or usage pattern (\"city traffic\"). You can use [[valueReference]] to link the value for the fuel economy to another value.'),
(1061, 1, 5, 'hasOccupation', 'hasOccupation', 'The Person\'s occupation. For past professions, use Role for expressing dates.'),
(1062, 1, 5, 'inAlbum', 'inAlbum', 'The album to which this recording belongs.'),
(1063, 1, 5, 'knownVehicleDamages', 'knownVehicleDamages', 'A textual description of known damages, both repaired and unrepaired.'),
(1064, 1, 5, 'dataFeedElement', 'dataFeedElement', 'An item within a data feed. Data feeds may have many elements.'),
(1065, 1, 5, 'expressedIn', 'expressedIn', 'Tissue, organ, biological sample, etc in which activity of this gene has been observed experimentally. For example brain, digestive system.'),
(1066, 1, 5, 'size', 'size', 'A standardized size of a product or creative work, specified either through a simple textual string (for example \'XL\', \'32Wx34L\'), a  QuantitativeValue with a unitCode, or a comprehensive and structured [[SizeSpecification]]; in other cases, the [[width]], [[height]], [[depth]] and [[weight]] properties may be more applicable. '),
(1067, 1, 5, 'customer', 'customer', 'Party placing the order or paying the invoice.'),
(1068, 1, 5, 'employees', 'employees', 'People working for this organization.'),
(1069, 1, 5, 'employee', 'employee', 'Someone working for this organization.'),
(1070, 1, 5, 'providesService', 'providesService', 'The service provided by this channel.'),
(1071, 1, 5, 'printSection', 'printSection', 'If this NewsArticle appears in print, this field indicates the print section in which the article appeared.'),
(1072, 1, 5, 'text', 'text', 'The textual content of this CreativeWork.'),
(1073, 1, 5, 'legislationLegalValue', 'legislationLegalValue', 'The legal value of this legislation file. The same legislation can be written in multiple files with different legal values. Typically a digitally signed PDF have a \"stronger\" legal value than the HTML file of the same act.'),
(1074, 1, 5, 'earlyPrepaymentPenalty', 'earlyPrepaymentPenalty', 'The amount to be paid as a penalty in the event of early payment of the loan.'),
(1075, 1, 5, 'returnMethod', 'returnMethod', 'The type of return method offered, specified from an enumeration.'),
(1076, 1, 5, 'commentText', 'commentText', 'The text of the UserComment.'),
(1077, 1, 5, 'geoTouches', 'geoTouches', 'Represents spatial relations in which two geometries (or the places they represent) touch: \"they have at least one boundary point in common, but no interior points.\" (A symmetric relationship, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).)'),
(1078, 1, 5, 'labelDetails', 'labelDetails', 'Link to the drug\'s label details.'),
(1079, 1, 5, 'answerCount', 'answerCount', 'The number of answers this question has received.'),
(1080, 1, 5, 'archivedAt', 'archivedAt', 'Indicates a page or other link involved in archival of a [[CreativeWork]]. In the case of [[MediaReview]], the items in a [[MediaReviewItem]] may often become inaccessible, but be archived by archival, journalistic, activist, or law enforcement organizations. In such cases, the referenced page may not directly publish the content.'),
(1081, 1, 5, 'relatedAnatomy', 'relatedAnatomy', 'Anatomical systems or structures that relate to the superficial anatomy.'),
(1082, 1, 5, 'accountMinimumInflow', 'accountMinimumInflow', 'A minimum amount that has to be paid in every month.'),
(1083, 1, 5, 'photos', 'photos', 'Photographs of this place.'),
(1084, 1, 5, 'photo', 'photo', 'A photograph of this place.'),
(1085, 1, 5, 'interactionService', 'interactionService', 'The WebSite or SoftwareApplication where the interactions took place.'),
(1086, 1, 5, 'physiologicalBenefits', 'physiologicalBenefits', 'Specific physiologic benefits associated to the plan.'),
(1087, 1, 5, 'previousItem', 'previousItem', 'A link to the ListItem that precedes the current one.'),
(1088, 1, 5, 'duplicateTherapy', 'duplicateTherapy', 'A therapy that duplicates or overlaps this one.'),
(1089, 1, 5, 'busNumber', 'busNumber', 'The unique identifier for the bus.'),
(1090, 1, 5, 'artEdition', 'artEdition', 'The number of copies when multiple copies of a piece of artwork are produced - e.g. for a limited edition of 20 prints, \'artEdition\' refers to the total number of copies (in this example \"20\").'),
(1091, 1, 5, 'foodEvent', 'foodEvent', 'A sub property of location. The specific food event where the action occurred.'),
(1092, 1, 5, 'gender', 'gender', 'Gender of something, typically a [[Person]], but possibly also fictional characters, animals, etc. While https://schema.org/Male and https://schema.org/Female may be used, text strings are also acceptable for people who do not identify as a binary gender. The [[gender]] property can also be used in an extended sense to cover e.g. the gender of sports teams. As with the gender of individuals, we do not try to enumerate all possibilities. A mixed-gender [[SportsTeam]] can be indicated with a text value of \"Mixed\".'),
(1093, 1, 5, 'deliveryAddress', 'deliveryAddress', 'Destination address.'),
(1094, 1, 5, 'valueName', 'valueName', 'Indicates the name of the PropertyValueSpecification to be used in URL templates and form encoding in a manner analogous to HTML\'s input@name.'),
(1095, 1, 5, 'saturatedFatContent', 'saturatedFatContent', 'The number of grams of saturated fat.'),
(1096, 1, 5, 'articleSection', 'articleSection', 'Articles may belong to one or more \'sections\' in a magazine or newspaper, such as Sports, Lifestyle, etc.'),
(1097, 1, 5, 'byMonthWeek', 'byMonthWeek', 'Defines the week(s) of the month on which a recurring Event takes place. Specified as an Integer between 1-5. For clarity, byMonthWeek is best used in conjunction with byDay to indicate concepts like the first and third Mondays of a month.'),
(1098, 1, 5, 'assembly', 'assembly', 'Library file name, e.g., mscorlib.dll, system.web.dll.'),
(1099, 1, 5, 'executableLibraryName', 'executableLibraryName', 'Library file name, e.g., mscorlib.dll, system.web.dll.'),
(1100, 1, 5, 'closes', 'closes', 'The closing hour of the place or service on the given day(s) of the week.'),
(1101, 1, 5, 'activityDuration', 'activityDuration', 'Length of time to engage in the activity.'),
(1102, 1, 5, 'bitrate', 'bitrate', 'The bitrate of the media object.'),
(1103, 1, 5, 'amount', 'amount', 'The amount of money.'),
(1104, 1, 5, 'rxcui', 'rxcui', 'The RxCUI drug identifier from RXNORM.'),
(1105, 1, 5, 'percentile90', 'percentile90', 'The 90th percentile value.'),
(1106, 1, 5, 'diagram', 'diagram', 'An image containing a diagram that illustrates the structure and/or its component substructures and/or connections with other structures.'),
(1107, 1, 5, 'loanPaymentAmount', 'loanPaymentAmount', 'The amount of money to pay in a single payment.'),
(1108, 1, 5, 'paymentDue', 'paymentDue', 'The date that payment is due.'),
(1109, 1, 5, 'paymentDueDate', 'paymentDueDate', 'The date that payment is due.'),
(1110, 1, 5, 'maxValue', 'maxValue', 'The upper value of some characteristic or property.'),
(1111, 1, 5, 'numberOfAccommodationUnits', 'numberOfAccommodationUnits', 'Indicates the total (available plus unavailable) number of accommodation units in an [[ApartmentComplex]], or the number of accommodation units for a specific [[FloorPlan]] (within its specific [[ApartmentComplex]]). See also [[numberOfAvailableAccommodationUnits]].'),
(1112, 1, 5, 'restockingFee', 'restockingFee', 'Use [[MonetaryAmount]] to specify a fixed restocking fee for product returns, or use [[Number]] to specify a percentage of the product price paid by the customer.'),
(1113, 1, 5, 'colleagues', 'colleagues', 'A colleague of the person.'),
(1114, 1, 5, 'colleague', 'colleague', 'A colleague of the person.'),
(1115, 1, 5, 'mobileUrl', 'mobileUrl', 'The [[mobileUrl]] property is provided for specific situations in which data consumers need to determine whether one of several provided URLs is a dedicated \'mobile site\'.\n\nTo discourage over-use, and reflecting intial usecases, the property is expected only on [[Product]] and [[Offer]], rather than [[Thing]]. The general trend in web technology is towards [responsive design](https://en.wikipedia.org/wiki/Responsive_web_design) in which content can be flexibly adapted to a wide range of browsing environments. Pages and sites referenced with the long-established [[url]] property should ideally also be usable on a wide variety of devices, including mobile phones. In most cases, it would be pointless and counter productive to attempt to update all [[url]] markup to use [[mobileUrl]] for more mobile-oriented pages. The property is intended for the case when items (primarily [[Product]] and [[Offer]]) have extra URLs hosted on an additional \"mobile site\" alongside the main one. It should not be taken as an endorsement of this publication style.\n    '),
(1116, 1, 5, 'suggestedGender', 'suggestedGender', 'The suggested gender of the intended person or audience, for example \"male\", \"female\", or \"unisex\".'),
(1117, 1, 5, 'eventStatus', 'eventStatus', 'An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.'),
(1118, 1, 5, 'discusses', 'discusses', 'Specifies the CreativeWork associated with the UserComment.'),
(1119, 1, 5, 'borrower', 'borrower', 'A sub property of participant. The person that borrows the object being lent.'),
(1120, 1, 5, 'inBroadcastLineup', 'inBroadcastLineup', 'The CableOrSatelliteService offering the channel.'),
(1121, 1, 5, 'intensity', 'intensity', 'Quantitative measure gauging the degree of force involved in the exercise, for example, heartbeats per minute. May include the velocity of the movement.'),
(1122, 1, 5, 'textValue', 'textValue', 'Text value being annotated.'),
(1123, 1, 5, 'isAccessoryOrSparePartFor', 'isAccessoryOrSparePartFor', 'A pointer to another product (or multiple products) for which this product is an accessory or spare part.'),
(1124, 1, 5, 'previousStartDate', 'previousStartDate', 'Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events, the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.'),
(1125, 1, 5, 'maintainer', 'maintainer', 'A maintainer of a [[Dataset]], software package ([[SoftwareApplication]]), or other [[Project]]. A maintainer is a [[Person]] or [[Organization]] that manages contributions to, and/or publication of, some (typically complex) artifact. It is common for distributions of software and data to be based on \"upstream\" sources. When [[maintainer]] is applied to a specific version of something e.g. a particular version or packaging of a [[Dataset]], it is always  possible that the upstream source has a different maintainer. The [[isBasedOn]] property can be used to indicate such relationships between datasets to make the different maintenance roles clear. Similarly in the case of software, a package may have dedicated maintainers working on integration into software distributions such as Ubuntu, as well as upstream maintainers of the underlying work.\n      '),
(1126, 1, 5, 'primaryPrevention', 'primaryPrevention', 'A preventative therapy used to prevent an initial occurrence of the medical condition, such as vaccination.'),
(1127, 1, 5, 'buyer', 'buyer', 'A sub property of participant. The participant/person/organization that bought the object.'),
(1128, 1, 5, 'suggestedAge', 'suggestedAge', 'The age or age range for the intended audience or person, for example 3-12 months for infants, 1-5 years for toddlers.'),
(1129, 1, 5, 'httpMethod', 'httpMethod', 'An HTTP method that specifies the appropriate HTTP method for a request to an HTTP EntryPoint. Values are capitalized strings as used in HTTP.'),
(1130, 1, 5, 'originalMediaLink', 'originalMediaLink', 'Link to the page containing an original version of the content, or directly to an online copy of the original [[MediaObject]] content, e.g. video file.'),
(1131, 1, 5, 'sameAs', 'sameAs', 'URL of a reference Web page that unambiguously indicates the item\'s identity. E.g. the URL of the item\'s Wikipedia page, Wikidata entry, or official website.'),
(1132, 1, 5, 'broadcaster', 'broadcaster', 'The organization owning or operating the broadcast service.'),
(1133, 1, 5, 'jobLocationType', 'jobLocationType', 'A description of the job location (e.g. TELECOMMUTE for telecommute jobs).'),
(1134, 1, 5, 'arrivalBusStop', 'arrivalBusStop', 'The stop or station from which the bus arrives.'),
(1135, 1, 5, 'relevantSpecialty', 'relevantSpecialty', 'If applicable, a medical specialty in which this entity is relevant.'),
(1136, 1, 5, 'permitAudience', 'permitAudience', 'The target audience for this permit.'),
(1137, 1, 5, 'seatingCapacity', 'seatingCapacity', 'The number of persons that can be seated (e.g. in a vehicle), both in terms of the physical space available, and in terms of limitations set by law.\\n\\nTypical unit code(s): C62 for persons '),
(1138, 1, 5, 'reviewBody', 'reviewBody', 'The actual body of the review.'),
(1139, 1, 5, 'serviceType', 'serviceType', 'The type of service being offered, e.g. veterans\' benefits, emergency relief, etc.'),
(1140, 1, 5, 'jobTitle', 'jobTitle', 'The job title of the person (for example, Financial Manager).'),
(1141, 1, 5, 'riskFactor', 'riskFactor', 'A modifiable or non-modifiable factor that increases the risk of a patient contracting this condition, e.g. age,  coexisting condition.'),
(1142, 1, 5, 'reservationFor', 'reservationFor', 'The thing -- flight, event, restaurant, etc. being reserved.'),
(1143, 1, 5, 'itemShipped', 'itemShipped', 'Item(s) being shipped.'),
(1144, 1, 5, 'trackingNumber', 'trackingNumber', 'Shipper tracking number.'),
(1145, 1, 5, 'totalPrice', 'totalPrice', 'The total price for the reservation or ticket, including applicable taxes, shipping, etc.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(1146, 1, 5, 'inSupportOf', 'inSupportOf', 'Qualification, candidature, degree, application that Thesis supports.'),
(1147, 1, 5, 'educationalProgramMode', 'educationalProgramMode', 'Similar to courseMode, the medium or means of delivery of the program as a whole. The value may either be a text label (e.g. \"online\", \"onsite\" or \"blended\"; \"synchronous\" or \"asynchronous\"; \"full-time\" or \"part-time\") or a URL reference to a term from a controlled vocabulary (e.g. https://ceds.ed.gov/element/001311#Asynchronous ).'),
(1148, 1, 5, 'nsn', 'nsn', 'Indicates the [NATO stock number](https://en.wikipedia.org/wiki/NATO_Stock_Number) (nsn) of a [[Product]]. '),
(1149, 1, 5, 'maxPrice', 'maxPrice', 'The highest price if the price is a range.'),
(1150, 1, 5, 'accessibilityFeature', 'accessibilityFeature', 'Content features of the resource, such as accessible media, alternatives and supported enhancements for accessibility. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessibilityFeature-vocabulary).'),
(1151, 1, 5, 'measuredValue', 'measuredValue', 'The measuredValue of an [[Observation]].'),
(1152, 1, 5, 'broadcastOfEvent', 'broadcastOfEvent', 'The event being broadcast such as a sporting event or awards ceremony.'),
(1153, 1, 5, 'leiCode', 'leiCode', 'An organization identifier that uniquely identifies a legal entity as defined in ISO 17442.'),
(1154, 1, 5, 'includesHealthPlanNetwork', 'includesHealthPlanNetwork', 'Networks covered by this plan.'),
(1155, 1, 5, 'sha256', 'sha256', 'The [SHA-2](https://en.wikipedia.org/wiki/SHA-2) SHA256 hash of the content of the item. For example, a zero-length input has value \'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855\''),
(1156, 1, 5, 'creativeWorkStatus', 'creativeWorkStatus', 'The status of a creative work in terms of its stage in a lifecycle. Example terms include Incomplete, Draft, Published, Obsolete. Some organizations define a set of terms for the stages of their publication lifecycle.'),
(1157, 1, 5, 'availability', 'availability', 'The availability of this item&#x2014;for example In stock, Out of stock, Pre-order, etc.'),
(1158, 1, 5, 'suggestedMinAge', 'suggestedMinAge', 'Minimum recommended age in years for the audience or user.'),
(1159, 1, 5, 'reviewRating', 'reviewRating', 'The rating given in this review. Note that reviews can themselves be rated. The ```reviewRating``` applies to rating given by the review. The [[aggregateRating]] property applies to the review itself, as a creative work.'),
(1160, 1, 5, 'arrivalTime', 'arrivalTime', 'The expected arrival time.'),
(1161, 1, 5, 'doseUnit', 'doseUnit', 'The unit of the dose, e.g. \'mg\'.'),
(1162, 1, 5, 'legalName', 'legalName', 'The official name of the organization, e.g. the registered company name.'),
(1163, 1, 5, 'priceValidUntil', 'priceValidUntil', 'The date after which the price is no longer available.'),
(1164, 1, 5, 'founders', 'founders', 'A person who founded this organization.'),
(1165, 1, 5, 'founder', 'founder', 'A person who founded this organization.'),
(1166, 1, 5, 'partOfSystem', 'partOfSystem', 'The anatomical or organ system that this structure is part of.'),
(1167, 1, 5, 'businessDays', 'businessDays', 'Days of the week when the merchant typically operates, indicated via opening hours markup.'),
(1168, 1, 5, 'numberOfBedrooms', 'numberOfBedrooms', 'The total integer number of bedrooms in a some [[Accommodation]], [[ApartmentComplex]] or [[FloorPlan]].'),
(1169, 1, 5, 'fiberContent', 'fiberContent', 'The number of grams of fiber.'),
(1170, 1, 5, 'diet', 'diet', 'A sub property of instrument. The diet used in this action.'),
(1171, 1, 5, 'normalRange', 'normalRange', 'Range of acceptable values for a typical patient, when applicable.'),
(1172, 1, 5, 'boardingGroup', 'boardingGroup', 'The airline-specific indicator of boarding order / preference.'),
(1173, 1, 5, 'applicationContact', 'applicationContact', 'Contact details for further information relevant to this job posting.'),
(1174, 1, 5, 'numChildren', 'numChildren', 'The number of children staying in the unit.'),
(1175, 1, 5, 'sportsActivityLocation', 'sportsActivityLocation', 'A sub property of location. The sports activity location where this action occurred.'),
(1176, 1, 5, 'target', 'target', 'Indicates a target EntryPoint, or url, for an Action.'),
(1177, 1, 5, 'billingPeriod', 'billingPeriod', 'The time interval used to compute the invoice.'),
(1178, 1, 5, 'dissolutionDate', 'dissolutionDate', 'The date that this organization was dissolved.'),
(1179, 1, 5, 'interpretedAsClaim', 'interpretedAsClaim', 'Used to indicate a specific claim contained, implied, translated or refined from the content of a [[MediaObject]] or other [[CreativeWork]]. The interpreting party can be indicated using [[claimInterpreter]].'),
(1180, 1, 5, 'fileSize', 'fileSize', 'Size of the application / package (e.g. 18MB). In the absence of a unit (MB, KB etc.), KB will be assumed.'),
(1181, 1, 5, 'availableService', 'availableService', 'A medical service available from this provider.'),
(1182, 1, 5, 'subtitleLanguage', 'subtitleLanguage', 'Languages in which subtitles/captions are available, in [IETF BCP 47 standard format](http://tools.ietf.org/html/bcp47).'),
(1183, 1, 5, 'postalCodeBegin', 'postalCodeBegin', 'First postal code in a range (included).'),
(1184, 1, 5, 'loanMortgageMandateAmount', 'loanMortgageMandateAmount', 'Amount of mortgage mandate that can be converted into a proper mortgage at a later stage.'),
(1185, 1, 5, 'totalPaymentDue', 'totalPaymentDue', 'The total amount due.'),
(1186, 1, 5, 'trainNumber', 'trainNumber', 'The unique identifier for the train.'),
(1187, 1, 5, 'gameItem', 'gameItem', 'An item is an object within the game world that can be collected by a player or, occasionally, a non-player character.'),
(1188, 1, 5, 'targetDescription', 'targetDescription', 'The description of a node in an established educational framework.'),
(1189, 1, 5, 'availableLanguage', 'availableLanguage', 'A language someone may use with or at the item, service or place. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[inLanguage]].'),
(1190, 1, 5, 'exerciseType', 'exerciseType', 'Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.'),
(1191, 1, 5, 'mileageFromOdometer', 'mileageFromOdometer', 'The total distance travelled by the particular vehicle since its initial production, as read from its odometer.\\n\\nTypical unit code(s): KMT for kilometers, SMI for statute miles'),
(1192, 1, 5, 'wheelbase', 'wheelbase', 'The distance between the centers of the front and rear wheels.\\n\\nTypical unit code(s): CMT for centimeters, MTR for meters, INH for inches, FOT for foot/feet'),
(1193, 1, 5, 'estimatedFlightDuration', 'estimatedFlightDuration', 'The estimated time the flight will take.'),
(1194, 1, 5, 'activityFrequency', 'activityFrequency', 'How often one should engage in the activity.'),
(1195, 1, 5, 'prepTime', 'prepTime', 'The length of time it takes to prepare the items to be used in instructions or a direction, in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).'),
(1196, 1, 5, 'returnShippingFeesAmount', 'returnShippingFeesAmount', 'Amount of shipping costs for product returns (for any reason). Applicable when property [[returnFees]] equals [[ReturnShippingFees]].'),
(1197, 1, 5, 'educationalRole', 'educationalRole', 'An educationalRole of an EducationalAudience.'),
(1198, 1, 5, 'isUnlabelledFallback', 'isUnlabelledFallback', 'This can be marked \'true\' to indicate that some published [[DeliveryTimeSettings]] or [[ShippingRateSettings]] are intended to apply to all [[OfferShippingDetails]] published by the same merchant, when referenced by a [[shippingSettingsLink]] in those settings. It is not meaningful to use a \'true\' value for this property alongside a transitTimeLabel (for [[DeliveryTimeSettings]]) or shippingLabel (for [[ShippingRateSettings]]), since this property is for use with unlabelled settings.'),
(1199, 1, 5, 'supportingData', 'supportingData', 'Supporting data for a SoftwareApplication.'),
(1200, 1, 5, 'salaryUponCompletion', 'salaryUponCompletion', 'The expected salary upon completing the training.'),
(1201, 1, 5, 'orderedItem', 'orderedItem', 'The item ordered.'),
(1202, 1, 5, 'geoWithin', 'geoWithin', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to one that contains it, i.e. it is inside (i.e. within) its interior. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(1203, 1, 5, 'subReservation', 'subReservation', 'The individual reservations included in the package. Typically a repeated property.'),
(1204, 1, 5, 'doseSchedule', 'doseSchedule', 'A dosing schedule for the drug for a given population, either observed, recommended, or maximum dose based on the type used.'),
(1205, 1, 5, 'bloodSupply', 'bloodSupply', 'The blood vessel that carries blood from the heart to the muscle.'),
(1206, 1, 5, 'ownedFrom', 'ownedFrom', 'The date and time of obtaining the product.'),
(1207, 1, 5, 'healthPlanNetworkId', 'healthPlanNetworkId', 'Name or unique ID of network. (Networks are often reused across different insurance plans.)'),
(1208, 1, 5, 'reportNumber', 'reportNumber', 'The number or other unique designator assigned to a Report by the publishing organization.'),
(1209, 1, 5, 'sourceOrganization', 'sourceOrganization', 'The Organization on whose behalf the creator was working.'),
(1210, 1, 5, 'browserRequirements', 'browserRequirements', 'Specifies browser requirements in human-readable text. For example, \'requires HTML5 support\'.'),
(1211, 1, 5, 'legislationPassedBy', 'legislationPassedBy', 'The person or organization that originally passed or made the law: typically parliament (for primary legislation) or government (for secondary legislation). This indicates the \"legal author\" of the law, as opposed to its physical author.'),
(1212, 1, 5, 'creator', 'creator', 'The creator/author of this CreativeWork. This is the same as the Author property for CreativeWork.'),
(1213, 1, 5, 'dosageForm', 'dosageForm', 'A dosage form in which this drug/supplement is available, e.g. \'tablet\', \'suspension\', \'injection\'.'),
(1214, 1, 5, 'byMonthDay', 'byMonthDay', 'Defines the day(s) of the month on which a recurring [[Event]] takes place. Specified as an [[Integer]] between 1-31.'),
(1215, 1, 5, 'locationCreated', 'locationCreated', 'The location where the CreativeWork was created, which may not be the same as the location depicted in the CreativeWork.'),
(1216, 1, 5, 'timeToComplete', 'timeToComplete', 'The expected length of time to complete the program if attending full-time.'),
(1217, 1, 5, 'durationOfWarranty', 'durationOfWarranty', 'The duration of the warranty promise. Common unitCode values are ANN for year, MON for months, or DAY for days.'),
(1218, 1, 5, 'namedPosition', 'namedPosition', 'A position played, performed or filled by a person or organization, as part of an organization. For example, an athlete in a SportsTeam might play in the position named \'Quarterback\'.'),
(1219, 1, 5, 'roleName', 'roleName', 'A role played, performed or filled by a person or organization. For example, the team of creators for a comic book might fill the roles named \'inker\', \'penciller\', and \'letterer\'; or an athlete in a SportsTeam might play in the position named \'Quarterback\'.'),
(1220, 1, 5, 'observedNode', 'observedNode', 'The observedNode of an [[Observation]], often a [[StatisticalPopulation]].'),
(1221, 1, 5, 'applicableCountry', 'applicableCountry', 'A country where a particular merchant return policy applies to, for example the two-letter ISO 3166-1 alpha-2 country code.'),
(1222, 1, 5, 'softwareAddOn', 'softwareAddOn', 'Additional content for a software application.'),
(1223, 1, 5, 'noBylinesPolicy', 'noBylinesPolicy', 'For a [[NewsMediaOrganization]] or other news-related [[Organization]], a statement explaining when authors of articles are not named in bylines.'),
(1224, 1, 5, 'legislationLegalForce', 'legislationLegalForce', 'Whether the legislation is currently in force, not in force, or partially in force.'),
(1225, 1, 5, 'torque', 'torque', 'The torque (turning force) of the vehicle\'s engine.\\n\\nTypical unit code(s): NU for newton metre (N m), F17 for pound-force per foot, or F48 for pound-force per inch\\n\\n* Note 1: You can link to information about how the given value has been determined (e.g. reference RPM) using the [[valueReference]] property.\\n* Note 2: You can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(1226, 1, 5, 'toLocation', 'toLocation', 'A sub property of location. The final location of the object or the agent after the action.'),
(1227, 1, 5, 'readBy', 'readBy', 'A person who reads (performs) the audiobook.'),
(1228, 1, 5, 'sdDatePublished', 'sdDatePublished', 'Indicates the date on which the current structured data was generated / published. Typically used alongside [[sdPublisher]]'),
(1229, 1, 5, 'flightNumber', 'flightNumber', 'The unique identifier for a flight including the airline IATA code. For example, if describing United flight 110, where the IATA code for United is \'UA\', the flightNumber is \'UA110\'.'),
(1230, 1, 5, 'sku', 'sku', 'The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.'),
(1231, 1, 5, 'loanPaymentFrequency', 'loanPaymentFrequency', 'Frequency of payments due, i.e. number of months between payments. This is defined as a frequency, i.e. the reciprocal of a period of time.'),
(1232, 1, 5, 'isProprietary', 'isProprietary', 'True if this item\'s name is a proprietary/brand name (vs. generic name).'),
(1233, 1, 5, 'expertConsiderations', 'expertConsiderations', 'Medical expert advice related to the plan.'),
(1234, 1, 5, 'baseSalary', 'baseSalary', 'The base salary of the job or of an employee in an EmployeeRole.'),
(1235, 1, 5, 'hasCourseInstance', 'hasCourseInstance', 'An offering of the course at a specific time and place or through specific media or mode of study or to a specific section of students.'),
(1236, 1, 5, 'isConsumableFor', 'isConsumableFor', 'A pointer to another product (or multiple products) for which this product is a consumable.'),
(1237, 1, 5, 'menu', 'menu', 'Either the actual menu as a structured representation, as text, or a URL of the menu.'),
(1238, 1, 5, 'hasMenu', 'hasMenu', 'Either the actual menu as a structured representation, as text, or a URL of the menu.'),
(1239, 1, 5, 'deliveryLeadTime', 'deliveryLeadTime', 'The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup.'),
(1240, 1, 5, 'signDetected', 'signDetected', 'A sign detected by the test.'),
(1241, 1, 5, 'isLocatedInSubcellularLocation', 'isLocatedInSubcellularLocation', 'Subcellular location where this BioChemEntity is located; please use PropertyValue if you want to include any evidence.'),
(1242, 1, 5, 'stepValue', 'stepValue', 'The stepValue attribute indicates the granularity that is expected (and required) of the value in a PropertyValueSpecification.'),
(1243, 1, 5, 'tissueSample', 'tissueSample', 'The type of tissue sample required for the test.'),
(1244, 1, 5, 'producer', 'producer', 'The person or organization who produced the work (e.g. music album, movie, TV/radio series etc.).'),
(1245, 1, 5, 'publicTransportClosuresInfo', 'publicTransportClosuresInfo', 'Information about public transport closures.'),
(1246, 1, 5, 'performerIn', 'performerIn', 'Event that this person is a performer or participant in.'),
(1247, 1, 5, 'requiredCollateral', 'requiredCollateral', 'Assets required to secure loan or credit repayments. It may take form of third party pledge, goods, financial instruments (cash, securities, etc.)'),
(1248, 1, 5, 'enginePower', 'enginePower', 'The power of the vehicle\'s engine.\n    Typical unit code(s): KWT for kilowatt, BHP for brake horsepower, N12 for metric horsepower (PS, with 1 PS = 735,49875 W)\\n\\n* Note 1: There are many different ways of measuring an engine\'s power. For an overview, see  [http://en.wikipedia.org/wiki/Horsepower#Engine\\_power\\_test\\_codes](http://en.wikipedia.org/wiki/Horsepower#Engine_power_test_codes).\\n* Note 2: You can link to information about how the given value has been determined using the [[valueReference]] property.\\n* Note 3: You can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(1249, 1, 5, 'sportsEvent', 'sportsEvent', 'A sub property of location. The sports event where this action occurred.'),
(1250, 1, 5, 'validIn', 'validIn', 'The geographic area where a permit or similar thing is valid.'),
(1251, 1, 5, 'vatID', 'vatID', 'The Value-added Tax ID of the organization or person.'),
(1252, 1, 5, 'subTest', 'subTest', 'A component test of the panel.'),
(1253, 1, 5, 'runsTo', 'runsTo', 'The vasculature the lymphatic structure runs, or efferents, to.'),
(1254, 1, 5, 'hasMolecularFunction', 'hasMolecularFunction', 'Molecular function performed by this BioChemEntity; please use PropertyValue if you want to include any evidence.'),
(1255, 1, 5, 'parentItem', 'parentItem', 'The parent of a question, answer or item in general.'),
(1256, 1, 5, 'byArtist', 'byArtist', 'The artist that performed this album or recording.'),
(1257, 1, 5, 'box', 'box', 'A box is the area enclosed by the rectangle formed by two points. The first point is the lower corner, the second point is the upper corner. A box is expressed as two points separated by a space character.'),
(1258, 1, 5, 'replacer', 'replacer', 'A sub property of object. The object that replaces.'),
(1259, 1, 5, 'isrcCode', 'isrcCode', 'The International Standard Recording Code for the recording.'),
(1260, 1, 5, 'itemDefectReturnFees', 'itemDefectReturnFees', 'The type of return fees for returns of defect products.'),
(1261, 1, 5, 'includesHealthPlanFormulary', 'includesHealthPlanFormulary', 'Formularies covered by this plan.'),
(1262, 1, 5, 'meetsEmissionStandard', 'meetsEmissionStandard', 'Indicates that the vehicle meets the respective emission standard.'),
(1263, 1, 5, 'releasedEvent', 'releasedEvent', 'The place and time the release was issued, expressed as a PublicationEvent.'),
(1264, 1, 5, 'itemDefectReturnLabelSource', 'itemDefectReturnLabelSource', 'The method (from an enumeration) by which the customer obtains a return shipping label for a defect product.'),
(1265, 1, 5, 'preOp', 'preOp', 'A description of the workup, testing, and other preparations required before implanting this device.'),
(1266, 1, 5, 'composer', 'composer', 'The person or organization who wrote a composition, or who is the composer of a work performed at some event.'),
(1267, 1, 5, 'replyToUrl', 'replyToUrl', 'The URL at which a reply may be posted to the specified UserComment.'),
(1268, 1, 5, 'organizer', 'organizer', 'An organizer of an Event.'),
(1269, 1, 5, 'lodgingUnitDescription', 'lodgingUnitDescription', 'A full description of the lodging unit.'),
(1270, 1, 5, 'recommendationStrength', 'recommendationStrength', 'Strength of the guideline\'s recommendation (e.g. \'class I\').'),
(1271, 1, 5, 'legislationType', 'legislationType', 'The type of the legislation. Examples of values are \"law\", \"act\", \"directive\", \"decree\", \"regulation\", \"statutory instrument\", \"loi organique\", \"règlement grand-ducal\", etc., depending on the country.'),
(1272, 1, 5, 'genre', 'genre', 'Genre of the creative work, broadcast channel or group.'),
(1273, 1, 5, 'bioChemSimilarity', 'bioChemSimilarity', 'A similar BioChemEntity, e.g., obtained by fingerprint similarity algorithms.'),
(1274, 1, 5, 'partOfInvoice', 'partOfInvoice', 'The order is being paid as part of the referenced Invoice.'),
(1275, 1, 5, 'honorificSuffix', 'honorificSuffix', 'An honorific suffix following a Person\'s name such as M.D./PhD/MSCSW.'),
(1276, 1, 5, 'spouse', 'spouse', 'The person\'s spouse.'),
(1277, 1, 5, 'gtin14', 'gtin14', 'The GTIN-14 code of the product, or the product to which the offer refers. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.'),
(1278, 1, 5, 'countriesNotSupported', 'countriesNotSupported', 'Countries for which the application is not supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.'),
(1279, 1, 5, 'mpn', 'mpn', 'The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.'),
(1280, 1, 5, 'merchant', 'merchant', '\'merchant\' is an out-dated term for \'seller\'.'),
(1281, 1, 5, 'seller', 'seller', 'An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider.'),
(1282, 1, 5, 'productGroupID', 'productGroupID', 'Indicates a textual identifier for a ProductGroup.'),
(1283, 1, 5, 'faxNumber', 'faxNumber', 'The fax number.'),
(1284, 1, 5, 'estimatedSalary', 'estimatedSalary', 'An estimated salary for a job posting or occupation, based on a variety of variables including, but not limited to industry, job title, and location. Estimated salaries  are often computed by outside organizations rather than the hiring organization, who may not have committed to the estimated value.'),
(1285, 1, 5, 'serviceOperator', 'serviceOperator', 'The operating organization, if different from the provider.  This enables the representation of services that are provided by an organization, but operated by another organization like a subcontractor.'),
(1286, 1, 5, 'materialExtent', 'materialExtent', 'The quantity of the materials being described or an expression of the physical space they occupy.'),
(1287, 1, 5, 'orderStatus', 'orderStatus', 'The current status of the order.'),
(1288, 1, 5, 'benefits', 'benefits', 'Description of benefits associated with the job.'),
(1289, 1, 5, 'jobBenefits', 'jobBenefits', 'Description of benefits associated with the job.'),
(1290, 1, 5, 'numberOfAxles', 'numberOfAxles', 'The number of axles.\\n\\nTypical unit code(s): C62'),
(1291, 1, 5, 'hasHealthAspect', 'hasHealthAspect', 'Indicates the aspect or aspects specifically addressed in some [[HealthTopicContent]]. For example, that the content is an overview, or that it talks about treatment, self-care, treatments or their side-effects.'),
(1292, 1, 5, 'medicalAudience', 'medicalAudience', 'Medical audience for page.'),
(1293, 1, 5, 'height', 'height', 'The height of the item.'),
(1294, 1, 5, 'seatSection', 'seatSection', 'The section location of the reserved seat (e.g. Orchestra).'),
(1295, 1, 5, 'warrantyScope', 'warrantyScope', 'The scope of the warranty promise.'),
(1296, 1, 5, 'multipleValues', 'multipleValues', 'Whether multiple values are allowed for the property.  Default is false.'),
(1297, 1, 5, 'employerOverview', 'employerOverview', 'A description of the employer, career opportunities and work environment for this position.'),
(1298, 1, 5, 'healthPlanCopay', 'healthPlanCopay', 'The copay amount.'),
(1299, 1, 5, 'percentile25', 'percentile25', 'The 25th percentile value.'),
(1300, 1, 5, 'parentService', 'parentService', 'A broadcast service to which the broadcast service may belong to such as regional variations of a national channel.'),
(1301, 1, 5, 'ticketedSeat', 'ticketedSeat', 'The seat associated with the ticket.'),
(1302, 1, 5, 'error', 'error', 'For failed actions, more information on the cause of the failure.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1303, 1, 5, 'pageEnd', 'pageEnd', 'The page on which the work ends; for example \"138\" or \"xvi\".'),
(1304, 1, 5, 'engineDisplacement', 'engineDisplacement', 'The volume swept by all of the pistons inside the cylinders of an internal combustion engine in a single movement. \\n\\nTypical unit code(s): CMQ for cubic centimeter, LTR for liters, INQ for cubic inches\\n* Note 1: You can link to information about how the given value has been determined using the [[valueReference]] property.\\n* Note 2: You can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(1305, 1, 5, 'maximumIntake', 'maximumIntake', 'Recommended intake of this supplement for a given population as defined by a specific recommending authority.'),
(1306, 1, 5, 'possibleComplication', 'possibleComplication', 'A possible unexpected and unfavorable evolution of a medical condition. Complications may include worsening of the signs or symptoms of the disease, extension of the condition to other organ systems, etc.'),
(1307, 1, 5, 'serviceUrl', 'serviceUrl', 'The website to access the service.'),
(1308, 1, 5, 'serviceLocation', 'serviceLocation', 'The location (e.g. civic structure, local business, etc.) where a person can go to access the service.'),
(1309, 1, 5, 'pattern', 'pattern', 'A pattern that something has, for example \'polka dot\', \'striped\', \'Canadian flag\'. Values are typically expressed as text, although links to controlled value schemes are also supported.'),
(1310, 1, 5, 'broadcastDisplayName', 'broadcastDisplayName', 'The name displayed in the channel guide. For many US affiliates, it is the network name.'),
(1311, 1, 5, 'artMedium', 'artMedium', 'The material used. (E.g. Oil, Watercolour, Acrylic, Linoprint, Marble, Cyanotype, Digital, Lithograph, DryPoint, Intaglio, Pastel, Woodcut, Pencil, Mixed Media, etc.)'),
(1312, 1, 5, 'material', 'material', 'A material that something is made from, e.g. leather, wool, cotton, paper.'),
(1313, 1, 5, 'usesHealthPlanIdStandard', 'usesHealthPlanIdStandard', 'The standard for interpreting the Plan ID. The preferred is \"HIOS\". See the Centers for Medicare & Medicaid Services for more details.'),
(1314, 1, 5, 'relatedDrug', 'relatedDrug', 'Any other drug related to this one, for example commonly-prescribed alternatives.'),
(1315, 1, 5, 'usedToDiagnose', 'usedToDiagnose', 'A condition the test is used to diagnose.'),
(1316, 1, 5, 'memoryRequirements', 'memoryRequirements', 'Minimum memory requirements.'),
(1317, 1, 5, 'leaseLength', 'leaseLength', 'Length of the lease for some [[Accommodation]], either particular to some [[Offer]] or in some cases intrinsic to the property.'),
(1318, 1, 5, 'webFeed', 'webFeed', 'The URL for a feed, e.g. associated with a podcast series, blog, or series of date-stamped updates. This is usually RSS or Atom.'),
(1319, 1, 5, 'creditText', 'creditText', 'Text that can be used to credit person(s) and/or organization(s) associated with a published Creative Work.'),
(1320, 1, 5, 'reservationStatus', 'reservationStatus', 'The current status of the reservation.'),
(1321, 1, 5, 'insertion', 'insertion', 'The place of attachment of a muscle, or what the muscle moves.'),
(1322, 1, 5, 'fileFormat', 'fileFormat', 'Media type, typically MIME format (see [IANA site](http://www.iana.org/assignments/media-types/media-types.xhtml)) of the content, e.g. application/zip of a SoftwareApplication binary. In cases where a CreativeWork has several media type representations, \'encoding\' can be used to indicate each MediaObject alongside particular fileFormat information. Unregistered or niche file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia entry.'),
(1323, 1, 5, 'encodingFormat', 'encodingFormat', 'Media type typically expressed using a MIME format (see [IANA site](http://www.iana.org/assignments/media-types/media-types.xhtml) and [MDN reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types)), e.g. application/zip for a SoftwareApplication binary, audio/mpeg for .mp3 etc.\n\nIn cases where a [[CreativeWork]] has several media type representations, [[encoding]] can be used to indicate each [[MediaObject]] alongside particular [[encodingFormat]] information.\n\nUnregistered or niche encoding and file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia/Wikidata entry.'),
(1324, 1, 5, 'scheduledTime', 'scheduledTime', 'The time the object is scheduled to.'),
(1325, 1, 5, 'availabilityEnds', 'availabilityEnds', 'The end of the availability of the product or service included in the offer.'),
(1326, 1, 5, 'video', 'video', 'An embedded video object.'),
(1327, 1, 5, 'fuelConsumption', 'fuelConsumption', 'The amount of fuel consumed for traveling a particular distance or temporal duration with the given vehicle (e.g. liters per 100 km).\\n\\n* Note 1: There are unfortunately no standard unit codes for liters per 100 km.  Use [[unitText]] to indicate the unit of measurement, e.g. L/100 km.\\n* Note 2: There are two ways of indicating the fuel consumption, [[fuelConsumption]] (e.g. 8 liters per 100 km) and [[fuelEfficiency]] (e.g. 30 miles per gallon). They are reciprocal.\\n* Note 3: Often, the absolute value is useful only when related to driving speed (\"at 80 km/h\") or usage pattern (\"city traffic\"). You can use [[valueReference]] to link the value for the fuel consumption to another value.'),
(1328, 1, 5, 'greaterOrEqual', 'greaterOrEqual', 'This ordering relation for qualitative values indicates that the subject is greater than or equal to the object.'),
(1329, 1, 5, 'layoutImage', 'layoutImage', 'A schematic image showing the floorplan layout.'),
(1330, 1, 5, 'broadcastAffiliateOf', 'broadcastAffiliateOf', 'The media network(s) whose content is broadcast on this station.'),
(1331, 1, 5, 'siblings', 'siblings', 'A sibling of the person.'),
(1332, 1, 5, 'sibling', 'sibling', 'A sibling of the person.'),
(1333, 1, 5, 'returnFees', 'returnFees', 'The type of return fees for purchased products (for any return reason).'),
(1334, 1, 5, 'defaultValue', 'defaultValue', 'The default value of the input.  For properties that expect a literal, the default is a literal value, for properties that expect an object, it\'s an ID reference to one of the current values.'),
(1335, 1, 5, 'foundingLocation', 'foundingLocation', 'The place where the Organization was founded.'),
(1336, 1, 5, 'childMinAge', 'childMinAge', 'Minimal age of the child.'),
(1337, 1, 5, 'followee', 'followee', 'A sub property of object. The person or organization being followed.'),
(1338, 1, 5, 'claimInterpreter', 'claimInterpreter', 'For a [[Claim]] interpreted from [[MediaObject]] content\n    sed to indicate a claim contained, implied or refined from the content of a [[MediaObject]].'),
(1339, 1, 5, 'dietFeatures', 'dietFeatures', 'Nutritional information specific to the dietary plan. May include dietary recommendations on what foods to avoid, what foods to consume, and specific alterations/deviations from the USDA or other regulatory body\'s approved dietary guidelines.'),
(1340, 1, 5, 'bookingAgent', 'bookingAgent', '\'bookingAgent\' is an out-dated term indicating a \'broker\' that serves as a booking agent.'),
(1341, 1, 5, 'broker', 'broker', 'An entity that arranges for an exchange between a buyer and a seller.  In most cases a broker never acquires or releases ownership of a product or service involved in an exchange.  If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred.'),
(1342, 1, 5, 'bodyType', 'bodyType', 'Indicates the design and body style of the vehicle (e.g. station wagon, hatchback, etc.).'),
(1343, 1, 5, 'geo', 'geo', 'The geo coordinates of the place.'),
(1344, 1, 5, 'skills', 'skills', 'A statement of knowledge, skill, ability, task or any other assertion expressing a competency that is desired or required to fulfill this role or to work in this occupation.'),
(1345, 1, 5, 'hasMenuItem', 'hasMenuItem', 'A food or drink item contained in a menu or menu section.'),
(1346, 1, 5, 'cargoVolume', 'cargoVolume', 'The available volume for cargo or luggage. For automobiles, this is usually the trunk volume.\\n\\nTypical unit code(s): LTR for liters, FTQ for cubic foot/feet\\n\\nNote: You can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(1347, 1, 5, 'minimumPaymentDue', 'minimumPaymentDue', 'The minimum payment required at this time.'),
(1348, 1, 5, 'hospitalAffiliation', 'hospitalAffiliation', 'A hospital with which the physician or office is affiliated.'),
(1349, 1, 5, 'scheduledPaymentDate', 'scheduledPaymentDate', 'The date the invoice is scheduled to be paid.'),
(1350, 1, 5, 'targetUrl', 'targetUrl', 'The URL of a node in an established educational framework.'),
(1351, 1, 5, 'overdosage', 'overdosage', 'Any information related to overdose on a drug, including signs or symptoms, treatments, contact information for emergency response.'),
(1352, 1, 5, 'legislationResponsible', 'legislationResponsible', 'An individual or organization that has some kind of responsibility for the legislation. Typically the ministry who is/was in charge of elaborating the legislation, or the adressee for potential questions about the legislation once it is published.'),
(1353, 1, 5, 'safetyConsideration', 'safetyConsideration', 'Any potential safety concern associated with the supplement. May include interactions with other drugs and foods, pregnancy, breastfeeding, known adverse reactions, and documented efficacy of the supplement.'),
(1354, 1, 5, 'hasMeasurement', 'hasMeasurement', 'A product measurement, for example the inseam of pants, the wheel size of a bicycle, or the gauge of a screw. Usually an exact measurement, but can also be a range of measurements for adjustable products, for example belts and ski bindings.'),
(1355, 1, 5, 'smokingAllowed', 'smokingAllowed', 'Indicates whether it is allowed to smoke in the place, e.g. in the restaurant, hotel or hotel room.'),
(1356, 1, 5, 'correction', 'correction', 'Indicates a correction to a [[CreativeWork]], either via a [[CorrectionComment]], textually or in another document.'),
(1357, 1, 5, 'studyDesign', 'studyDesign', 'Specifics about the observational study design (enumerated).'),
(1358, 1, 5, 'artform', 'artform', 'e.g. Painting, Drawing, Sculpture, Print, Photograph, Assemblage, Collage, etc.'),
(1359, 1, 5, 'fatContent', 'fatContent', 'The number of grams of fat.'),
(1360, 1, 5, 'costOrigin', 'costOrigin', 'Additional details to capture the origin of the cost data. For example, \'Medicare Part B\'.'),
(1361, 1, 5, 'aspect', 'aspect', 'An aspect of medical practice that is considered on the page, such as \'diagnosis\', \'treatment\', \'causes\', \'prognosis\', \'etiology\', \'epidemiology\', etc.'),
(1362, 1, 5, 'mainContentOfPage', 'mainContentOfPage', 'Indicates if this web page element is the main subject of the page.'),
(1363, 1, 5, 'transitTimeLabel', 'transitTimeLabel', 'Label to match an [[OfferShippingDetails]] with a [[DeliveryTimeSettings]] (within the context of a [[shippingSettingsLink]] cross-reference).'),
(1364, 1, 5, 'nerveMotor', 'nerveMotor', 'The neurological pathway extension that involves muscle control.'),
(1365, 1, 5, 'alignmentType', 'alignmentType', 'A category of alignment between the learning resource and the framework node. Recommended values include: \'requires\', \'textComplexity\', \'readingLevel\', and \'educationalSubject\'.'),
(1366, 1, 5, 'tongueWeight', 'tongueWeight', 'The permitted vertical load (TWR) of a trailer attached to the vehicle. Also referred to as Tongue Load Rating (TLR) or Vertical Load Rating (VLR).\\n\\nTypical unit code(s): KGM for kilogram, LBR for pound\\n\\n* Note 1: You can indicate additional information in the [[name]] of the [[QuantitativeValue]] node.\\n* Note 2: You may also link to a [[QualitativeValue]] node that provides additional information using [[valueReference]].\\n* Note 3: Note that you can use [[minValue]] and [[maxValue]] to indicate ranges.'),
(1367, 1, 5, 'predecessorOf', 'predecessorOf', 'A pointer from a previous, often discontinued variant of the product to its newer variant.'),
(1368, 1, 5, 'paymentAccepted', 'paymentAccepted', 'Cash, Credit Card, Cryptocurrency, Local Exchange Tradings System, etc.'),
(1369, 1, 5, 'sportsTeam', 'sportsTeam', 'A sub property of participant. The sports team that participated on this action.'),
(1370, 1, 5, 'wordCount', 'wordCount', 'The number of words in the text of the Article.'),
(1371, 1, 5, 'vendor', 'vendor', '\'vendor\' is an earlier term for \'seller\'.'),
(1372, 1, 5, 'seatingType', 'seatingType', 'The type/class of the seat.'),
(1373, 1, 5, 'driveWheelConfiguration', 'driveWheelConfiguration', 'The drive wheel configuration, i.e. which roadwheels will receive torque from the vehicle\'s engine via the drivetrain.'),
(1374, 1, 5, 'expires', 'expires', 'Date the content expires and is no longer useful or available. For example a [[VideoObject]] or [[NewsArticle]] whose availability or relevance is time-limited, or a [[ClaimReview]] fact check whose publisher wants to indicate that it may no longer be relevant (or helpful to highlight) after some date.'),
(1375, 1, 5, 'yearlyRevenue', 'yearlyRevenue', 'The size of the business in annual revenue.'),
(1376, 1, 5, 'replacee', 'replacee', 'A sub property of object. The object that is being replaced.'),
(1377, 1, 5, 'departureAirport', 'departureAirport', 'The airport where the flight originates.'),
(1378, 1, 5, 'availableFrom', 'availableFrom', 'When the item is available for pickup from the store, locker, etc.'),
(1379, 1, 5, 'follows', 'follows', 'The most generic uni-directional social relation.'),
(1380, 1, 5, 'workHours', 'workHours', 'The typical working hours for this job (e.g. 1st shift, night shift, 8am-5pm).'),
(1381, 1, 5, 'sampleType', 'sampleType', 'What type of code sample: full (compile ready) solution, code snippet, inline code, scripts, template.'),
(1382, 1, 5, 'codeSampleType', 'codeSampleType', 'What type of code sample: full (compile ready) solution, code snippet, inline code, scripts, template.'),
(1383, 1, 5, 'confirmationNumber', 'confirmationNumber', 'A number that confirms the given order or payment has been received.'),
(1384, 1, 5, 'isBasedOnUrl', 'isBasedOnUrl', 'A resource that was used in the creation of this resource. This term can be repeated for multiple sources. For example, http://example.com/great-multiplication-intro.html.'),
(1385, 1, 5, 'isBasedOn', 'isBasedOn', 'A resource from which this work is derived or from which it is a modification or adaption.'),
(1386, 1, 5, 'travelBans', 'travelBans', 'Information about travel bans, e.g. in the context of a pandemic.'),
(1387, 1, 5, 'value', 'value', 'The value of the quantitative value or property value node.\\n\\n* For [[QuantitativeValue]] and [[MonetaryAmount]], the recommended type for values is \'Number\'.\\n* For [[PropertyValue]], it can be \'Text\', \'Number\', \'Boolean\', or \'StructuredValue\'.\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(1388, 1, 5, 'proprietaryName', 'proprietaryName', 'Proprietary name given to the diet plan, typically by its originator or creator.'),
(1389, 1, 5, 'hoursAvailable', 'hoursAvailable', 'The hours during which this service or contact is available.'),
(1390, 1, 5, 'vehicleTransmission', 'vehicleTransmission', 'The type of component used for transmitting the power from a rotating power source to the wheels or other relevant component(s) (\"gearbox\" for cars).'),
(1391, 1, 5, 'ratingExplanation', 'ratingExplanation', 'A short explanation (e.g. one to two sentences) providing background context and other information that led to the conclusion expressed in the rating. This is particularly applicable to ratings associated with \"fact check\" markup using [[ClaimReview]].'),
(1392, 1, 5, 'artist', 'artist', 'The primary artist for a work\n    	in a medium other than pencils or digital line art--for example, if the\n    	primary artwork is done in watercolors or digital paints.'),
(1393, 1, 5, 'itemLocation', 'itemLocation', 'Current location of the item.'),
(1394, 1, 5, 'cvdFacilityId', 'cvdFacilityId', 'Identifier of the NHSN facility that this data record applies to. Use [[cvdFacilityCounty]] to indicate the county. To provide other details, [[healthcareReportingData]] can be used on a [[Hospital]] entry.'),
(1395, 1, 5, 'translator', 'translator', 'Organization or person who adapts a creative work to different languages, regional differences and technical requirements of a target market, or that translates during some event.'),
(1396, 1, 5, 'eligibilityToWorkRequirement', 'eligibilityToWorkRequirement', 'The legal requirements such as citizenship, visa and other documentation required for an applicant to this job.'),
(1397, 1, 5, 'rangeIncludes', 'rangeIncludes', 'Relates a property to a class that constitutes (one of) the expected type(s) for values of the property.'),
(1398, 1, 5, 'lowPrice', 'lowPrice', 'The lowest price of all offers available.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(1399, 1, 5, 'loanTerm', 'loanTerm', 'The duration of the loan or credit agreement.'),
(1400, 1, 5, 'duration', 'duration', 'The duration of the item (movie, audio recording, event, etc.) in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601).'),
(1401, 1, 5, 'percentile75', 'percentile75', 'The 75th percentile value.'),
(1402, 1, 5, 'tocEntry', 'tocEntry', 'Indicates a [[HyperTocEntry]] in a [[HyperToc]].'),
(1403, 1, 5, 'hasPart', 'hasPart', 'Indicates an item or CreativeWork that is part of this item, or CreativeWork (in some sense).'),
(1404, 1, 5, 'busName', 'busName', 'The name of the bus (e.g. Bolt Express).'),
(1405, 1, 5, 'interestRate', 'interestRate', 'The interest rate, charged or paid, applicable to the financial product. Note: This is different from the calculated annualPercentageRate.'),
(1406, 1, 5, 'hasEnergyEfficiencyCategory', 'hasEnergyEfficiencyCategory', 'Defines the energy efficiency Category (which could be either a rating out of range of values or a yes/no certification) for a product according to an international energy efficiency standard.'),
(1407, 1, 5, 'illustrator', 'illustrator', 'The illustrator of the book.'),
(1408, 1, 5, 'eligibleTransactionVolume', 'eligibleTransactionVolume', 'The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.'),
(1409, 1, 5, 'additionalType', 'additionalType', 'An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax. This is a relationship between something and a class that the thing is in. In RDFa syntax, it is better to use the native RDFa syntax - the \'typeof\' attribute - for multiple types. Schema.org tools may have only weaker understanding of extra types, in particular those defined externally.'),
(1410, 1, 5, 'exifData', 'exifData', 'exif data for this object.'),
(1411, 1, 5, 'imagingTechnique', 'imagingTechnique', 'Imaging technique used.'),
(1412, 1, 5, 'ownedThrough', 'ownedThrough', 'The date and time of giving up ownership on the product.'),
(1413, 1, 5, 'targetPopulation', 'targetPopulation', 'Characteristics of the population for which this is intended, or which typically uses it, e.g. \'adults\'.'),
(1414, 1, 5, 'referenceQuantity', 'referenceQuantity', 'The reference quantity for which a certain price applies, e.g. 1 EUR per 4 kWh of electricity. This property is a replacement for unitOfMeasurement for the advanced cases where the price does not relate to a standard unit.'),
(1415, 1, 5, 'howPerformed', 'howPerformed', 'How the procedure is performed.'),
(1416, 1, 5, 'signOrSymptom', 'signOrSymptom', 'A sign or symptom of this condition. Signs are objective or physically observable manifestations of the medical condition while symptoms are the subjective experience of the medical condition.'),
(1417, 1, 5, 'isInvolvedInBiologicalProcess', 'isInvolvedInBiologicalProcess', 'Biological process this BioChemEntity is involved in; please use PropertyValue if you want to include any evidence.'),
(1418, 1, 5, 'preparation', 'preparation', 'Typical preparation that a patient must undergo before having the procedure performed.'),
(1419, 1, 5, 'winner', 'winner', 'A sub property of participant. The winner of the action.'),
(1420, 1, 5, 'muscleAction', 'muscleAction', 'The movement the muscle generates.'),
(1421, 1, 5, 'numberOfAirbags', 'numberOfAirbags', 'The number or type of airbags in the vehicle.'),
(1422, 1, 5, 'expectsAcceptanceOf', 'expectsAcceptanceOf', 'An Offer which must be accepted before the user can perform the Action. For example, the user may need to buy a movie before being able to watch it.'),
(1423, 1, 5, 'courseWorkload', 'courseWorkload', 'The amount of work expected of students taking the course, often provided as a figure per week or per month, and may be broken down by type. For example, \"2 hours of lectures, 1 hour of lab work and 3 hours of independent study per week\".'),
(1424, 1, 5, 'issuedThrough', 'issuedThrough', 'The service through which the permit was granted.'),
(1425, 1, 5, 'depth', 'depth', 'The depth of the item.'),
(1426, 1, 5, 'transmissionMethod', 'transmissionMethod', 'How the disease spreads, either as a route or vector, for example \'direct contact\', \'Aedes aegypti\', etc.'),
(1427, 1, 5, 'petsAllowed', 'petsAllowed', 'Indicates whether pets are allowed to enter the accommodation or lodging business. More detailed information can be put in a text value.'),
(1428, 1, 5, 'fromLocation', 'fromLocation', 'A sub property of location. The original location of the object or the agent before the action.'),
(1429, 1, 5, 'editor', 'editor', 'Specifies the Person who edited the CreativeWork.'),
(1430, 1, 5, 'ineligibleRegion', 'ineligibleRegion', 'The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is not valid, e.g. a region where the transaction is not allowed.\\n\\nSee also [[eligibleRegion]].\n      '),
(1431, 1, 5, 'events', 'events', 'Upcoming or past events associated with this place or organization.'),
(1432, 1, 5, 'event', 'event', 'Upcoming or past event associated with this place, organization, or action.'),
(1433, 1, 5, 'modifiedTime', 'modifiedTime', 'The date and time the reservation was modified.'),
(1434, 1, 5, 'nerve', 'nerve', 'The underlying innervation associated with the muscle.'),
(1435, 1, 5, 'customerRemorseReturnFees', 'customerRemorseReturnFees', 'The type of return fees if the product is returned due to customer remorse.'),
(1436, 1, 5, 'associatedMedia', 'associatedMedia', 'A media object that encodes this CreativeWork. This property is a synonym for encoding.'),
(1437, 1, 5, 'educationalUse', 'educationalUse', 'The purpose of a work in the context of education; for example, \'assignment\', \'group work\'.'),
(1438, 1, 5, 'numberOfPlayers', 'numberOfPlayers', 'Indicate how many people can play this game (minimum, maximum, or range).'),
(1439, 1, 5, 'width', 'width', 'The width of the item.'),
(1440, 1, 5, 'conditionsOfAccess', 'conditionsOfAccess', 'Conditions that affect the availability of, or method(s) of access to, an item. Typically used for real world items such as an [[ArchiveComponent]] held by an [[ArchiveOrganization]]. This property is not suitable for use as a general Web access control mechanism. It is expressed only in natural language.\\n\\nFor example \"Available by appointment from the Reading Room\" or \"Accessible only from logged-in accounts \". '),
(1441, 1, 5, 'bodyLocation', 'bodyLocation', 'Location in the body of the anatomical structure.'),
(1442, 1, 5, 'nutrition', 'nutrition', 'Nutrition information about the recipe or menu item.'),
(1443, 1, 5, 'eligibleQuantity', 'eligibleQuantity', 'The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.'),
(1444, 1, 5, 'owns', 'owns', 'Products owned by the organization or person.'),
(1445, 1, 5, 'breadcrumb', 'breadcrumb', 'A set of links that can help a user understand and navigate a website hierarchy.'),
(1446, 1, 5, 'percentile10', 'percentile10', 'The 10th percentile value.'),
(1447, 1, 5, 'dateSent', 'dateSent', 'The date/time at which the message was sent.'),
(1448, 1, 5, 'healthPlanCopayOption', 'healthPlanCopayOption', 'Whether the copay is before or after deductible, etc. TODO: Is this a closed set?'),
(1449, 1, 5, 'birthPlace', 'birthPlace', 'The place where the person was born.'),
(1450, 1, 5, 'name', 'name', 'The name of the item.'),
(1451, 1, 5, 'permittedUsage', 'permittedUsage', 'Indications regarding the permitted usage of the accommodation.'),
(1452, 1, 5, 'includedDataCatalog', 'includedDataCatalog', 'A data catalog which contains this dataset (this property was previously \'catalog\', preferred name is now \'includedInDataCatalog\').'),
(1453, 1, 5, 'dependencies', 'dependencies', 'Prerequisites needed to fulfill steps in article.'),
(1454, 1, 5, 'actionAccessibilityRequirement', 'actionAccessibilityRequirement', 'A set of requirements that must be fulfilled in order to perform an Action. If more than one value is specified, fulfilling one set of requirements will allow the Action to be performed.'),
(1455, 1, 5, 'inPlaylist', 'inPlaylist', 'The playlist to which this recording belongs.'),
(1456, 1, 5, 'geoIntersects', 'geoIntersects', 'Represents spatial relations in which two geometries (or the places they represent) have at least one point in common. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).'),
(1457, 1, 5, 'openingHours', 'openingHours', 'The general opening hours for a business. Opening hours can be specified as a weekly time range, starting with days, then times per day. Multiple days can be listed with commas \',\' separating each day. Day or time ranges are specified using a hyphen \'-\'.\\n\\n* Days are specified using the following two-letter combinations: ```Mo```, ```Tu```, ```We```, ```Th```, ```Fr```, ```Sa```, ```Su```.\\n* Times are specified using 24:00 format. For example, 3pm is specified as ```15:00```, 10am as ```10:00```. \\n* Here is an example: <code>&lt;time itemprop=\"openingHours\" datetime=&quot;Tu,Th 16:00-20:00&quot;&gt;Tuesdays and Thursdays 4-8pm&lt;/time&gt;</code>.\\n* If a business is open 7 days a week, then it can be specified as <code>&lt;time itemprop=&quot;openingHours&quot; datetime=&quot;Mo-Su&quot;&gt;Monday through Sunday, all day&lt;/time&gt;</code>.'),
(1458, 1, 5, 'familyName', 'familyName', 'Family name. In the U.S., the last name of a Person.'),
(1459, 1, 5, 'nextItem', 'nextItem', 'A link to the ListItem that follows the current one.'),
(1460, 1, 5, 'maps', 'maps', 'A URL to a map of the place.'),
(1461, 1, 5, 'fuelCapacity', 'fuelCapacity', 'The capacity of the fuel tank or in the case of electric cars, the battery. If there are multiple components for storage, this should indicate the total of all storage of the same type.\\n\\nTypical unit code(s): LTR for liters, GLL of US gallons, GLI for UK / imperial gallons, AMH for ampere-hours (for electrical vehicles).'),
(1462, 1, 5, 'maximumVirtualAttendeeCapacity', 'maximumVirtualAttendeeCapacity', 'The maximum physical attendee capacity of an [[Event]] whose [[eventAttendanceMode]] is [[OnlineEventAttendanceMode]] (or the online aspects, in the case of a [[MixedEventAttendanceMode]]). '),
(1463, 1, 5, 'itemCondition', 'itemCondition', 'A predefined value from OfferItemCondition specifying the condition of the product or service, or the products or services included in the offer. Also used for product return policies to specify the condition of products accepted for returns.'),
(1464, 1, 5, 'cvdNumVentUse', 'cvdNumVentUse', 'numventuse - MECHANICAL VENTILATORS IN USE: Total number of ventilators in use.'),
(1465, 1, 5, 'modelDate', 'modelDate', 'The release date of a vehicle model (often used to differentiate versions of the same make and model).'),
(1466, 1, 5, 'monoisotopicMolecularWeight', 'monoisotopicMolecularWeight', 'The monoisotopic mass is the sum of the masses of the atoms in a molecule using the unbound, ground-state, rest mass of the principal (most abundant) isotope for each element instead of the isotopic average mass. Please include the units in the form \'&lt;Number&gt; &lt;unit&gt;\', for example \'770.230488 g/mol\' or as \'&lt;QuantitativeValue&gt;.'),
(1467, 1, 5, 'polygon', 'polygon', 'A polygon is the area enclosed by a point-to-point path for which the starting and ending points are the same. A polygon is expressed as a series of four or more space delimited points where the first and final points are identical.'),
(1468, 1, 5, 'legalStatus', 'legalStatus', 'The drug or supplement\'s legal status, including any controlled substance schedules that apply.'),
(1469, 1, 5, 'servesCuisine', 'servesCuisine', 'The cuisine of the restaurant.'),
(1470, 1, 5, 'answerExplanation', 'answerExplanation', 'A step-by-step or full explanation about Answer. Can outline how this Answer was achieved or contain more broad clarification or statement about it. '),
(1471, 1, 5, 'childMaxAge', 'childMaxAge', 'Maximal age of the child.'),
(1472, 1, 5, 'lender', 'lender', 'A sub property of participant. The person that lends the object being borrowed.'),
(1473, 1, 5, 'significance', 'significance', 'The significance associated with the superficial anatomy; as an example, how characteristics of the superficial anatomy can suggest underlying medical conditions or courses of treatment.'),
(1474, 1, 5, 'relatedTo', 'relatedTo', 'The most generic familial relation.'),
(1475, 1, 5, 'shippingSettingsLink', 'shippingSettingsLink', 'Link to a page containing [[ShippingRateSettings]] and [[DeliveryTimeSettings]] details.'),
(1476, 1, 5, 'hasMerchantReturnPolicy', 'hasMerchantReturnPolicy', 'Specifies a MerchantReturnPolicy that may be applicable.'),
(1477, 1, 5, 'variableMeasured', 'variableMeasured', 'The variableMeasured property can indicate (repeated as necessary) the  variables that are measured in some dataset, either described as text or as pairs of identifier and description using PropertyValue.'),
(1478, 1, 5, 'acquireLicensePage', 'acquireLicensePage', 'Indicates a page documenting how licenses can be purchased or otherwise acquired, for the current item.'),
(1479, 1, 5, 'usageInfo', 'usageInfo', 'The schema.org [[usageInfo]] property indicates further information about a [[CreativeWork]]. This property is applicable both to works that are freely available and to those that require payment or other transactions. It can reference additional information, e.g. community expectations on preferred linking and citation conventions, as well as purchasing details. For something that can be commercially licensed, usageInfo can provide detailed, resource-specific information about licensing options.\n\nThis property can be used alongside the license property which indicates license(s) applicable to some piece of content. The usageInfo property can provide information about other licensing options, e.g. acquiring commercial usage rights for an image that is also available under non-commercial creative commons licenses.'),
(1480, 1, 5, 'reviewedBy', 'reviewedBy', 'People or organizations that have reviewed the content on this web page for accuracy and/or completeness.'),
(1481, 1, 5, 'availableDeliveryMethod', 'availableDeliveryMethod', 'The delivery method(s) available for this offer.'),
(1482, 1, 5, 'embedUrl', 'embedUrl', 'A URL pointing to a player for a specific video. In general, this is the information in the ```src``` element of an ```embed``` tag and should not be the same as the content of the ```loc``` tag.'),
(1483, 1, 5, 'option', 'option', 'A sub property of object. The options subject to this action.'),
(1484, 1, 5, 'actionOption', 'actionOption', 'A sub property of object. The options subject to this action.'),
(1485, 1, 5, 'collection', 'collection', 'A sub property of object. The collection target of the action.'),
(1486, 1, 5, 'targetCollection', 'targetCollection', 'A sub property of object. The collection target of the action.'),
(1487, 1, 5, 'encodingType', 'encodingType', 'The supported encoding type(s) for an EntryPoint request.'),
(1488, 1, 5, 'musicReleaseFormat', 'musicReleaseFormat', 'Format of this release (the type of recording media used, i.e. compact disc, digital media, LP, etc.).'),
(1489, 1, 5, 'interactionCount', 'interactionCount', 'This property is deprecated, alongside the UserInteraction types on which it depended.'),
(1490, 1, 5, 'interactionStatistic', 'interactionStatistic', 'The number of interactions for the CreativeWork using the WebSite or SoftwareApplication. The most specific child type of InteractionCounter should be used.'),
(1491, 1, 5, 'worstRating', 'worstRating', 'The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.'),
(1492, 1, 5, 'providerMobility', 'providerMobility', 'Indicates the mobility of a provided service (e.g. \'static\', \'dynamic\').'),
(1493, 1, 5, 'trackingUrl', 'trackingUrl', 'Tracking url for the parcel delivery.'),
(1494, 1, 5, 'departureGate', 'departureGate', 'Identifier of the flight\'s departure gate.'),
(1495, 1, 5, 'paymentStatus', 'paymentStatus', 'The status of payment; whether the invoice has been paid or not.'),
(1496, 1, 5, 'valueAddedTaxIncluded', 'valueAddedTaxIncluded', 'Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.'),
(1497, 1, 5, 'carrier', 'carrier', '\'carrier\' is an out-dated term indicating the \'provider\' for parcel delivery and flights.'),
(1498, 1, 5, 'provider', 'provider', 'The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.'),
(1499, 1, 5, 'geoDisjoint', 'geoDisjoint', 'Represents spatial relations in which two geometries (or the places they represent) are topologically disjoint: \"they have no point in common. They form a set of disconnected geometries.\" (A symmetric relationship, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).)'),
(1500, 1, 5, 'unsaturatedFatContent', 'unsaturatedFatContent', 'The number of grams of unsaturated fat.'),
(1501, 1, 5, 'schemaVersion', 'schemaVersion', 'Indicates (by URL or string) a particular version of a schema used in some CreativeWork. This property was created primarily to\n    indicate the use of a specific schema.org release, e.g. ```10.0``` as a simple string, or more explicitly via URL, ```https://schema.org/docs/releases.html#v10.0```. There may be situations in which other schemas might usefully be referenced this way, e.g. ```http://dublincore.org/specifications/dublin-core/dces/1999-07-02/``` but this has not been carefully explored in the community.'),
(1502, 1, 5, 'speechToTextMarkup', 'speechToTextMarkup', 'Form of markup used. eg. [SSML](https://www.w3.org/TR/speech-synthesis11) or [IPA](https://www.wikidata.org/wiki/Property:P898).'),
(1503, 1, 5, 'reviewCount', 'reviewCount', 'The count of total number of reviews.'),
(1504, 1, 5, 'sourcedFrom', 'sourcedFrom', 'The neurological pathway that originates the neurons.'),
(1505, 1, 5, 'videoFrameSize', 'videoFrameSize', 'The frame size of the video.'),
(1506, 1, 5, 'inProductGroupWithID', 'inProductGroupWithID', 'Indicates the [[productGroupID]] for a [[ProductGroup]] that this product [[isVariantOf]]. '),
(1507, 1, 5, 'numberOfDoors', 'numberOfDoors', 'The number of doors.\\n\\nTypical unit code(s): C62'),
(1508, 1, 5, 'issuedBy', 'issuedBy', 'The organization issuing the ticket or permit.'),
(1509, 1, 5, 'orderItemStatus', 'orderItemStatus', 'The current status of the order item.'),
(1510, 1, 5, 'healthPlanNetworkTier', 'healthPlanNetworkTier', 'The tier(s) for this network.'),
(1511, 1, 5, 'copyrightHolder', 'copyrightHolder', 'The party holding the legal copyright to the CreativeWork.'),
(1512, 1, 5, 'accessibilitySummary', 'accessibilitySummary', 'A human-readable summary of specific accessibility features or deficiencies, consistent with the other accessibility metadata but expressing subtleties such as \"short descriptions are present but long descriptions will be needed for non-visual users\" or \"short descriptions are present and no long descriptions are needed.\"'),
(1513, 1, 5, 'monthsOfExperience', 'monthsOfExperience', 'Indicates the minimal number of months of experience required for a position.'),
(1514, 1, 5, 'primaryImageOfPage', 'primaryImageOfPage', 'Indicates the main image on the page.'),
(1515, 1, 5, 'transcript', 'transcript', 'If this MediaObject is an AudioObject or VideoObject, the transcript of that object.'),
(1516, 1, 5, 'accountOverdraftLimit', 'accountOverdraftLimit', 'An overdraft is an extension of credit from a lending institution when an account reaches zero. An overdraft allows the individual to continue withdrawing money even if the account has no funds in it. Basically the bank allows people to borrow a set amount of money.'),
(1517, 1, 5, 'cvdNumICUBeds', 'cvdNumICUBeds', 'numicubeds - ICU BEDS: Total number of staffed inpatient intensive care unit (ICU) beds.'),
(1518, 1, 5, 'contactType', 'contactType', 'A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.'),
(1519, 1, 5, 'timeRequired', 'timeRequired', 'Approximate or typical time it takes to work with or through this learning resource for the typical intended target audience, e.g. \'PT30M\', \'PT1H25M\'.'),
(1520, 1, 5, 'endorsee', 'endorsee', 'A sub property of participant. The person/organization being supported.'),
(1521, 1, 5, 'relatedLink', 'relatedLink', 'A link related to this web page, for example to other related web pages.'),
(1522, 1, 5, 'tickerSymbol', 'tickerSymbol', 'The exchange traded instrument associated with a Corporation object. The tickerSymbol is expressed as an exchange and an instrument name separated by a space character. For the exchange component of the tickerSymbol attribute, we recommend using the controlled vocabulary of Market Identifier Codes (MIC) specified in ISO 15022.'),
(1523, 1, 5, 'url', 'url', 'URL of the item.'),
(1524, 1, 5, 'associatedArticle', 'associatedArticle', 'A NewsArticle associated with the Media Object.'),
(1525, 1, 5, 'coverageEndTime', 'coverageEndTime', 'The time when the live blog will stop covering the Event. Note that coverage may continue after the Event concludes.'),
(1526, 1, 5, 'publisher', 'publisher', 'The publisher of the creative work.'),
(1527, 1, 5, 'interactivityType', 'interactivityType', 'The predominant mode of learning supported by the learning resource. Acceptable values are \'active\', \'expositive\', or \'mixed\'.'),
(1528, 1, 5, 'studySubject', 'studySubject', 'A subject of the study, i.e. one of the medical conditions, therapies, devices, drugs, etc. investigated by the study.'),
(1529, 1, 5, 'mechanismOfAction', 'mechanismOfAction', 'The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.'),
(1530, 1, 5, 'educationalFramework', 'educationalFramework', 'The framework to which the resource being described is aligned.'),
(1531, 1, 5, 'accessModeSufficient', 'accessModeSufficient', 'A list of single or combined accessModes that are sufficient to understand all the intellectual content of a resource. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/#accessModeSufficient-vocabulary).'),
(1532, 1, 5, 'cookingMethod', 'cookingMethod', 'The method of cooking, such as Frying, Steaming, ...'),
(1533, 1, 5, 'xpath', 'xpath', 'An XPath, e.g. of a [[SpeakableSpecification]] or [[WebPageElement]]. In the latter case, multiple matches within a page can constitute a single conceptual \"Web page element\".'),
(1534, 1, 5, 'printColumn', 'printColumn', 'The number of the column in which the NewsArticle appears in the print edition.'),
(1535, 1, 5, 'surface', 'surface', 'A material used as a surface in some artwork, e.g. Canvas, Paper, Wood, Board, etc.'),
(1536, 1, 5, 'artworkSurface', 'artworkSurface', 'The supporting materials for the artwork, e.g. Canvas, Paper, Wood, Board, etc.'),
(1537, 1, 5, 'trainName', 'trainName', 'The name of the train (e.g. The Orient Express).'),
(1538, 1, 5, 'broadcastFrequencyValue', 'broadcastFrequencyValue', 'The frequency in MHz for a particular broadcast.'),
(1539, 1, 5, 'distance', 'distance', 'The distance travelled, e.g. exercising or travelling.'),
(1540, 1, 5, 'totalJobOpenings', 'totalJobOpenings', 'The number of positions open for this job posting. Use a positive integer. Do not use if the number of positions is unclear or not known.'),
(1541, 1, 5, 'opens', 'opens', 'The opening hour of the place or service on the given day(s) of the week.'),
(1542, 1, 5, 'availableThrough', 'availableThrough', 'After this date, the item will no longer be available for pickup.'),
(1543, 1, 5, 'cheatCode', 'cheatCode', 'Cheat codes to the game.'),
(1544, 1, 5, 'cholesterolContent', 'cholesterolContent', 'The number of milligrams of cholesterol.'),
(1545, 1, 5, 'departurePlatform', 'departurePlatform', 'The platform from which the train departs.'),
(1546, 1, 5, 'upvoteCount', 'upvoteCount', 'The number of upvotes this question, answer or comment has received from the community.'),
(1547, 1, 5, 'termsPerYear', 'termsPerYear', 'The number of times terms of study are offered per year. Semesters and quarters are common units for term. For example, if the student can only take 2 semesters for the program in one year, then termsPerYear should be 2.'),
(1548, 1, 5, 'deliveryStatus', 'deliveryStatus', 'New entry added as the package passes through each leg of its journey (from shipment to final delivery).'),
(1549, 1, 5, 'releaseNotes', 'releaseNotes', 'Description of what changed in this version.'),
(1550, 1, 5, 'warning', 'warning', 'Any FDA or other warnings about the drug (text or URL).'),
(1551, 1, 5, 'businessFunction', 'businessFunction', 'The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.'),
(1552, 1, 5, 'hasEnergyConsumptionDetails', 'hasEnergyConsumptionDetails', 'Defines the energy efficiency Category (also known as \"class\" or \"rating\") for a product according to an international energy efficiency standard.'),
(1553, 1, 5, 'device', 'device', 'Device required to run the application. Used in cases where a specific make/model is required to run the application.'),
(1554, 1, 5, 'availableOnDevice', 'availableOnDevice', 'Device required to run the application. Used in cases where a specific make/model is required to run the application.'),
(1555, 1, 5, 'numberOfPages', 'numberOfPages', 'The number of pages in the book.'),
(1556, 1, 5, 'requiredMaxAge', 'requiredMaxAge', 'Audiences defined by a person\'s maximum age.'),
(1557, 1, 5, 'ticketNumber', 'ticketNumber', 'The unique identifier for the ticket.'),
(1558, 1, 5, 'clincalPharmacology', 'clincalPharmacology', 'Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).'),
(1559, 1, 5, 'clinicalPharmacology', 'clinicalPharmacology', 'Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).'),
(1560, 1, 5, 'softwareHelp', 'softwareHelp', 'Software application help.'),
(1561, 1, 5, 'securityScreening', 'securityScreening', 'The type of security screening the passenger is subject to.'),
(1562, 1, 5, 'downloadUrl', 'downloadUrl', 'If the file can be downloaded, URL to download the binary.'),
(1563, 1, 5, 'incentives', 'incentives', 'Description of bonus and commission compensation aspects of the job.'),
(1564, 1, 5, 'incentiveCompensation', 'incentiveCompensation', 'Description of bonus and commission compensation aspects of the job.'),
(1565, 1, 5, 'deathPlace', 'deathPlace', 'The place where the person died.'),
(1566, 1, 5, 'connectedTo', 'connectedTo', 'Other anatomical structures to which this structure is connected.'),
(1567, 1, 5, 'specialty', 'specialty', 'One of the domain specialities to which this web page\'s content applies.'),
(1568, 1, 5, 'accommodationFloorPlan', 'accommodationFloorPlan', 'A floorplan of some [[Accommodation]].'),
(1569, 1, 5, 'jobStartDate', 'jobStartDate', 'The date on which a successful applicant for this job would be expected to start work. Choose a specific date in the future or use the jobImmediateStart property to indicate the position is to be filled as soon as possible.'),
(1570, 1, 5, 'hasDeliveryMethod', 'hasDeliveryMethod', 'Method used for delivery or shipping.'),
(1571, 1, 5, 'procedureType', 'procedureType', 'The type of procedure, for example Surgical, Noninvasive, or Percutaneous.'),
(1572, 1, 5, 'liveBlogUpdate', 'liveBlogUpdate', 'An update to the LiveBlog.'),
(1573, 1, 5, 'license', 'license', 'A license document that applies to this content, typically indicated by URL.'),
(1574, 1, 5, 'iso6523Code', 'iso6523Code', 'An organization identifier as defined in ISO 6523(-1). Note that many existing organization identifiers such as [leiCode](https://schema.org/leiCode), [duns](https://schema.org/duns) and [vatID](https://schema.org/vatID) can be expressed as an ISO 6523 identifier by setting the ICD part of the ISO 6523 identifier accordingly. '),
(1575, 1, 5, 'expectedPrognosis', 'expectedPrognosis', 'The likely outcome in either the short term or long term of the medical condition.'),
(1576, 1, 5, 'programmingLanguage', 'programmingLanguage', 'The computer programming language.'),
(1577, 1, 5, 'contentSize', 'contentSize', 'File size in (mega/kilo)bytes.'),
(1578, 1, 5, 'tocContinuation', 'tocContinuation', 'A [[HyperTocEntry]] can have a [[tocContinuation]] indicated, which is another [[HyperTocEntry]] that would be the default next item to play or render.'),
(1579, 1, 5, 'contentRating', 'contentRating', 'Official rating of a piece of content&#x2014;for example, \'MPAA PG-13\'.'),
(1580, 1, 5, 'albumProductionType', 'albumProductionType', 'Classification of the album by its type of content: soundtrack, live album, studio album, etc.'),
(1581, 1, 5, 'articleBody', 'articleBody', 'The actual body of the article.'),
(1582, 1, 5, 'accountId', 'accountId', 'The identifier for the account the payment will be applied to.'),
(1583, 1, 5, 'paymentMethodId', 'paymentMethodId', 'An identifier for the method of payment used (e.g. the last 4 digits of the credit card).'),
(1584, 1, 5, 'weight', 'weight', 'The weight of the product or person.'),
(1585, 1, 5, 'potentialAction', 'potentialAction', 'Indicates a potential Action, which describes an idealized action in which this thing would play an \'object\' role.'),
(1586, 1, 5, 'suggestedMeasurement', 'suggestedMeasurement', 'A suggested range of body measurements for the intended audience or person, for example inseam between 32 and 34 inches or height between 170 and 190 cm. Typically found on a size chart for wearable products.'),
(1587, 1, 5, 'softwareVersion', 'softwareVersion', 'Version of the software instance.'),
(1588, 1, 5, 'streetAddress', 'streetAddress', 'The street address. For example, 1600 Amphitheatre Pkwy.'),
(1589, 1, 5, 'serviceSmsNumber', 'serviceSmsNumber', 'The number to access the service by text message.'),
(1590, 1, 5, 'webCheckinTime', 'webCheckinTime', 'The time when a passenger can check into the flight online.'),
(1591, 1, 5, 'tributary', 'tributary', 'The anatomical or organ system that the vein flows into; a larger structure that the vein connects to.'),
(1592, 1, 5, 'discussionUrl', 'discussionUrl', 'A link to the page containing the comments of the CreativeWork.'),
(1593, 1, 5, 'parentTaxon', 'parentTaxon', 'Closest parent taxon of the taxon in question.'),
(1594, 1, 5, 'childTaxon', 'childTaxon', 'Closest child taxa of the taxon in question.'),
(1595, 1, 5, 'subjectOf', 'subjectOf', 'A CreativeWork or Event about this Thing.'),
(1596, 1, 5, 'about', 'about', 'The subject matter of the content.'),
(1597, 1, 5, 'holdingArchive', 'holdingArchive', '[[ArchiveOrganization]] that holds, keeps or maintains the [[ArchiveComponent]].'),
(1598, 1, 5, 'archiveHeld', 'archiveHeld', 'Collection, [fonds](https://en.wikipedia.org/wiki/Fonds), or item held, kept or maintained by an [[ArchiveOrganization]].'),
(1599, 1, 5, 'dataset', 'dataset', 'A dataset contained in this catalog.'),
(1600, 1, 5, 'offeredBy', 'offeredBy', 'A pointer to the organization or person making the offer.'),
(1601, 1, 5, 'makesOffer', 'makesOffer', 'A pointer to products or services offered by the organization or person.'),
(1602, 1, 5, 'offers', 'offers', 'An offer to provide this item&#x2014;for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use [[businessFunction]] to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a [[Demand]]. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.\n      ');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1603, 1, 5, 'itemOffered', 'itemOffered', 'An item being offered (or demanded). The transactional nature of the offer or demand is documented using [[businessFunction]], e.g. sell, lease etc. While several common expected types are listed explicitly in this definition, others can be used. Using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.'),
(1604, 1, 5, 'mainEntityOfPage', 'mainEntityOfPage', 'Indicates a page (or other CreativeWork) for which this thing is the main entity being described. See [background notes](/docs/datamodel.html#mainEntityBackground) for details.'),
(1605, 1, 5, 'mainEntity', 'mainEntity', 'Indicates the primary entity described in some page or other CreativeWork.'),
(1606, 1, 5, 'hasBioChemEntityPart', 'hasBioChemEntityPart', 'Indicates a BioChemEntity that (in some sense) has this BioChemEntity as a part. '),
(1607, 1, 5, 'isPartOfBioChemEntity', 'isPartOfBioChemEntity', 'Indicates a BioChemEntity that is (in some sense) a part of this BioChemEntity. '),
(1608, 1, 5, 'funding', 'funding', 'A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].'),
(1609, 1, 5, 'fundedItem', 'fundedItem', 'Indicates something directly or indirectly funded or sponsored through a [[Grant]]. See also [[ownershipFundingInfo]].'),
(1610, 1, 5, 'isEncodedByBioChemEntity', 'isEncodedByBioChemEntity', 'Another BioChemEntity encoding by this one.'),
(1611, 1, 5, 'encodesBioChemEntity', 'encodesBioChemEntity', 'Another BioChemEntity encoded by this one. '),
(1612, 1, 5, 'providesBroadcastService', 'providesBroadcastService', 'The BroadcastService offered on this channel.'),
(1613, 1, 5, 'hasBroadcastChannel', 'hasBroadcastChannel', 'A broadcast channel of a broadcast service.'),
(1614, 1, 5, 'recordedAs', 'recordedAs', 'An audio recording of the work.'),
(1615, 1, 5, 'recordingOf', 'recordingOf', 'The composition this track is a recording of.'),
(1616, 1, 5, 'releaseOf', 'releaseOf', 'The album this is a release of.'),
(1617, 1, 5, 'albumRelease', 'albumRelease', 'A release of this album.'),
(1618, 1, 5, 'partOfTrip', 'partOfTrip', 'Identifies that this [[Trip]] is a subTrip of another Trip.  For example Day 1, Day 2, etc. of a multi-day trip.'),
(1619, 1, 5, 'subTrip', 'subTrip', 'Identifies a [[Trip]] that is a subTrip of this Trip.  For example Day 1, Day 2, etc. of a multi-day trip.'),
(1620, 1, 5, 'encodesCreativeWork', 'encodesCreativeWork', 'The CreativeWork encoded by this media object.'),
(1621, 1, 5, 'subOrganization', 'subOrganization', 'A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific \'department\' property.'),
(1622, 1, 5, 'isVariantOf', 'isVariantOf', 'Indicates the kind of product that this is a variant of. In the case of [[ProductModel]], this is a pointer (from a ProductModel) to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive. In the case of a [[ProductGroup]], the group description also serves as a template, representing a set of Products that vary on explicitly defined, specific dimensions only (so it defines both a set of variants, as well as which values distinguish amongst those variants). When used with [[ProductGroup]], this property can apply to any [[Product]] included in the group.'),
(1623, 1, 5, 'hasVariant', 'hasVariant', 'Indicates a [[Product]] that is a member of this [[ProductGroup]] (or [[ProductModel]]).'),
(1624, 1, 5, 'gameServer', 'gameServer', 'The server on which  it is possible to play the game.'),
(1625, 1, 5, 'game', 'game', 'Video game which is played on this server.'),
(1626, 1, 5, 'containsSeason', 'containsSeason', 'A season that is part of the media series.'),
(1627, 1, 5, 'workTranslation', 'workTranslation', 'A work that is a translation of the content of this work. E.g. 西遊記 has an English workTranslation “Journey to the West”, a German workTranslation “Monkeys Pilgerfahrt” and a Vietnamese  translation Tây du ký bình khảo.'),
(1628, 1, 5, 'translationOfWork', 'translationOfWork', 'The work that this work has been translated from. E.g. 物种起源 is a translationOf “On the Origin of Species”.'),
(1629, 1, 5, 'alumniOf', 'alumniOf', 'An organization that the person is an alumni of.'),
(1630, 1, 5, 'alumni', 'alumni', 'Alumni of an organization.'),
(1631, 1, 5, 'recordedAt', 'recordedAt', 'The Event where the CreativeWork was recorded. The CreativeWork may capture all or part of the event.'),
(1632, 1, 5, 'recordedIn', 'recordedIn', 'The CreativeWork that captured all or part of this Event.'),
(1633, 1, 5, 'containsPlace', 'containsPlace', 'The basic containment relation between a place and another that it contains.'),
(1634, 1, 5, 'exampleOfWork', 'exampleOfWork', 'A creative work that this work is an example/instance/realization/derivation of.'),
(1635, 1, 5, 'contentLocation', 'contentLocation', 'The location depicted or described in the content. For example, the location in a photograph or painting.'),
(1636, 1, 5, 'superEvent', 'superEvent', 'An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent.');

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
(3, 1, 460, 3, NULL, 'AAA', 1, '2023-04-06 09:14:39', '2023-04-06 09:14:39', 'Omeka\\Entity\\Item'),
(4, 1, 460, 3, NULL, 'BBB', 1, '2023-04-06 09:14:51', '2023-04-06 09:14:51', 'Omeka\\Entity\\Item'),
(5, 1, 460, 3, NULL, 'CCC', 1, '2023-04-06 09:15:02', '2023-04-06 09:15:02', 'Omeka\\Entity\\Item'),
(6, 1, 460, 3, NULL, 'DDD', 1, '2023-04-06 09:15:12', '2023-04-06 09:15:12', 'Omeka\\Entity\\Item'),
(7, 1, 473, 2, NULL, '111', 1, '2023-04-06 09:16:10', '2023-04-06 09:16:10', 'Omeka\\Entity\\Item'),
(8, 1, 473, 2, NULL, '222', 1, '2023-04-06 09:16:26', '2023-04-06 09:16:26', 'Omeka\\Entity\\Item'),
(9, 1, 473, 2, NULL, '333', 1, '2023-04-06 09:16:35', '2023-04-06 09:16:35', 'Omeka\\Entity\\Item'),
(10, 1, 473, 2, NULL, '444', 1, '2023-04-06 09:16:52', '2023-04-06 09:16:52', 'Omeka\\Entity\\Item'),
(11, 1, 711, 4, NULL, 'Organisaties.nt.gz', 1, '2023-04-06 09:40:26', '2023-04-06 09:40:26', 'Omeka\\Entity\\Item'),
(12, 1, 711, 4, NULL, 'Organisaties.ttl', 1, '2023-04-06 09:41:04', '2023-04-06 09:41:04', 'Omeka\\Entity\\Item'),
(13, 1, 788, 5, NULL, 'Organisaties', 1, '2023-04-06 09:42:53', '2023-04-06 09:46:16', 'Omeka\\Entity\\Item'),
(14, 1, 711, 4, NULL, 'Personen.ttl.gz', 1, '2023-04-06 09:44:05', '2023-04-06 09:44:05', 'Omeka\\Entity\\Item'),
(15, 1, 788, 5, NULL, 'Personen', 1, '2023-04-06 09:45:07', '2023-04-06 09:46:02', 'Omeka\\Entity\\Item'),
(16, 1, 895, 6, NULL, 'CatalogusEen', 1, '2023-04-06 09:45:47', '2023-04-06 09:45:47', 'Omeka\\Entity\\Item'),
(17, 1, 711, 4, NULL, 'PersonenOrganisaties.jsonld', 1, '2023-04-06 09:47:22', '2023-04-06 09:47:22', 'Omeka\\Entity\\Item'),
(18, 1, 788, 5, NULL, 'PersonenOrganisaties', 1, '2023-04-06 09:48:33', '2023-04-06 09:49:08', 'Omeka\\Entity\\Item'),
(19, 1, 895, 6, NULL, 'CatalogusTwee', 1, '2023-04-06 09:48:54', '2023-04-06 09:48:54', 'Omeka\\Entity\\Item');

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
(106, 1, 5, 'HinduTemple', 'HinduTemple', 'A Hindu temple.'),
(107, 1, 5, 'FMRadioChannel', 'FMRadioChannel', 'A radio channel that uses FM.'),
(108, 1, 5, 'BikeStore', 'BikeStore', 'A bike store.'),
(109, 1, 5, 'HVACBusiness', 'HVACBusiness', 'A business that provides Heating, Ventilation and Air Conditioning services.'),
(110, 1, 5, 'ChildrensEvent', 'ChildrensEvent', 'Event type: Children\'s event.'),
(111, 1, 5, 'TireShop', 'TireShop', 'A tire shop.'),
(112, 1, 5, 'ComedyEvent', 'ComedyEvent', 'Event type: Comedy event.'),
(113, 1, 5, 'HardwareStore', 'HardwareStore', 'A hardware store.'),
(114, 1, 5, 'SpreadsheetDigitalDocument', 'SpreadsheetDigitalDocument', 'A spreadsheet file.'),
(115, 1, 5, 'PreventionIndication', 'PreventionIndication', 'An indication for preventing an underlying condition, symptom, etc.'),
(116, 1, 5, 'Hotel', 'Hotel', 'A hotel is an establishment that provides lodging paid on a short-term basis (source: Wikipedia, the free encyclopedia, see http://en.wikipedia.org/wiki/Hotel).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(117, 1, 5, 'ReviewNewsArticle', 'ReviewNewsArticle', 'A [[NewsArticle]] and [[CriticReview]] providing a professional critic\'s assessment of a service, product, performance, or artistic or literary work.'),
(118, 1, 5, 'ScheduleAction', 'ScheduleAction', 'Scheduling future actions, events, or tasks.\\n\\nRelated actions:\\n\\n* [[ReserveAction]]: Unlike ReserveAction, ScheduleAction allocates future actions (e.g. an event, a task, etc) towards a time slot / spatial allocation.'),
(119, 1, 5, 'AutoBodyShop', 'AutoBodyShop', 'Auto body shop.'),
(120, 1, 5, 'ToyStore', 'ToyStore', 'A toy store.'),
(121, 1, 5, 'ReportageNewsArticle', 'ReportageNewsArticle', 'The [[ReportageNewsArticle]] type is a subtype of [[NewsArticle]] representing\n news articles which are the result of journalistic news reporting conventions.\n\nIn practice many news publishers produce a wide variety of article types, many of which might be considered a [[NewsArticle]] but not a [[ReportageNewsArticle]]. For example, opinion pieces, reviews, analysis, sponsored or satirical articles, or articles that combine several of these elements.\n\nThe [[ReportageNewsArticle]] type is based on a stricter ideal for \"news\" as a work of journalism, with articles based on factual information either observed or verified by the author, or reported and verified from knowledgeable sources.  This often includes perspectives from multiple viewpoints on a particular issue (distinguishing news reports from public relations or propaganda).  News reports in the [[ReportageNewsArticle]] sense de-emphasize the opinion of the author, with commentary and value judgements typically expressed elsewhere.\n\nA [[ReportageNewsArticle]] which goes deeper into analysis can also be marked with an additional type of [[AnalysisNewsArticle]].\n'),
(122, 1, 5, 'AnalysisNewsArticle', 'AnalysisNewsArticle', 'An AnalysisNewsArticle is a [[NewsArticle]] that, while based on factual reporting, incorporates the expertise of the author/producer, offering interpretations and conclusions.'),
(123, 1, 5, 'Dentist', 'Dentist', 'A dentist.'),
(124, 1, 5, 'SubscribeAction', 'SubscribeAction', 'The act of forming a personal connection with someone/something (object) unidirectionally/asymmetrically to get updates pushed to.\\n\\nRelated actions:\\n\\n* [[FollowAction]]: Unlike FollowAction, SubscribeAction implies that the subscriber acts as a passive agent being constantly/actively pushed for updates.\\n* [[RegisterAction]]: Unlike RegisterAction, SubscribeAction implies that the agent is interested in continuing receiving updates from the object.\\n* [[JoinAction]]: Unlike JoinAction, SubscribeAction implies that the agent is interested in continuing receiving updates from the object.'),
(125, 1, 5, 'BowlingAlley', 'BowlingAlley', 'A bowling alley.'),
(126, 1, 5, 'InvestmentFund', 'InvestmentFund', 'A company or fund that gathers capital from a number of investors to create a pool of money that is then re-invested into stocks, bonds and other assets.'),
(127, 1, 5, 'RadioSeason', 'RadioSeason', 'Season dedicated to radio broadcast and associated online delivery.'),
(128, 1, 5, 'MovieClip', 'MovieClip', 'A short segment/part of a movie.'),
(129, 1, 5, 'OfferForPurchase', 'OfferForPurchase', 'An [[OfferForPurchase]] in Schema.org represents an [[Offer]] to sell something, i.e. an [[Offer]] whose\n  [[businessFunction]] is [sell](http://purl.org/goodrelations/v1#Sell.). See [Good Relations](https://en.wikipedia.org/wiki/GoodRelations) for\n  background on the underlying concepts.\n  '),
(130, 1, 5, 'ImageObjectSnapshot', 'ImageObjectSnapshot', 'A specific and exact (byte-for-byte) version of an [[ImageObject]]. Two byte-for-byte identical files, for the purposes of this type, considered identical. If they have different embedded metadata (e.g. XMP, EXIF) the files will differ. Different external facts about the files, e.g. creator or dateCreated that aren\'t represented in their actual content, do not affect this notion of identity.'),
(131, 1, 5, 'NailSalon', 'NailSalon', 'A nail salon.'),
(132, 1, 5, 'WPHeader', 'WPHeader', 'The header section of the page.'),
(133, 1, 5, 'DryCleaningOrLaundry', 'DryCleaningOrLaundry', 'A dry-cleaning business.'),
(134, 1, 5, 'RiverBodyOfWater', 'RiverBodyOfWater', 'A river (for example, the broad majestic Shannon).'),
(135, 1, 5, 'UnRegisterAction', 'UnRegisterAction', 'The act of un-registering from a service.\\n\\nRelated actions:\\n\\n* [[RegisterAction]]: antonym of UnRegisterAction.\\n* [[LeaveAction]]: Unlike LeaveAction, UnRegisterAction implies that you are unregistering from a service you were previously registered, rather than leaving a team/group of people.'),
(136, 1, 5, 'Drawing', 'Drawing', 'A picture or diagram made with a pencil, pen, or crayon rather than paint.'),
(137, 1, 5, 'MedicalRiskCalculator', 'MedicalRiskCalculator', 'A complex mathematical calculation requiring an online calculator, used to assess prognosis. Note: use the url property of Thing to record any URLs for online calculators.'),
(138, 1, 5, 'RadioStation', 'RadioStation', 'A radio station.'),
(139, 1, 5, 'BackgroundNewsArticle', 'BackgroundNewsArticle', 'A [[NewsArticle]] providing historical context, definition and detail on a specific topic (aka \"explainer\" or \"backgrounder\"). For example, an in-depth article or frequently-asked-questions ([FAQ](https://en.wikipedia.org/wiki/FAQ)) document on topics such as Climate Change or the European Union. Other kinds of background material from a non-news setting are often described using [[Book]] or [[Article]], in particular [[ScholarlyArticle]]. See also [[NewsArticle]] for related vocabulary from a learning/education perspective.'),
(140, 1, 5, 'DiscussionForumPosting', 'DiscussionForumPosting', 'A posting to a discussion forum.'),
(141, 1, 5, 'UserTweets', 'UserTweets', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(142, 1, 5, 'Festival', 'Festival', 'Event type: Festival.'),
(143, 1, 5, 'ResearchOrganization', 'ResearchOrganization', 'A Research Organization (e.g. scientific institute, research company).'),
(144, 1, 5, 'Mountain', 'Mountain', 'A mountain, like Mount Whitney or Mount Everest.'),
(145, 1, 5, 'Motorcycle', 'Motorcycle', 'A motorcycle or motorbike is a single-track, two-wheeled motor vehicle.'),
(146, 1, 5, 'VeterinaryCare', 'VeterinaryCare', 'A vet\'s office.'),
(147, 1, 5, 'FoodService', 'FoodService', 'A food service, like breakfast, lunch, or dinner.'),
(148, 1, 5, 'MobilePhoneStore', 'MobilePhoneStore', 'A store that sells mobile phones and related accessories.'),
(149, 1, 5, 'ApprovedIndication', 'ApprovedIndication', 'An indication for a medical therapy that has been formally specified or approved by a regulatory body that regulates use of the therapy; for example, the US FDA approves indications for most drugs in the US.'),
(150, 1, 5, 'TelevisionChannel', 'TelevisionChannel', 'A unique instance of a television BroadcastService on a CableOrSatelliteService lineup.'),
(151, 1, 5, 'DiagnosticProcedure', 'DiagnosticProcedure', 'A medical procedure intended primarily for diagnostic, as opposed to therapeutic, purposes.'),
(152, 1, 5, 'Statement', 'Statement', 'A statement about something, for example a fun or interesting fact. If known, the main entity this statement is about can be indicated using mainEntity. For more formal claims (e.g. in Fact Checking), consider using [[Claim]] instead. Use the [[text]] property to capture the text of the statement.'),
(153, 1, 5, 'Cemetery', 'Cemetery', 'A graveyard.'),
(154, 1, 5, 'TravelAgency', 'TravelAgency', 'A travel agency.'),
(155, 1, 5, 'BusinessEvent', 'BusinessEvent', 'Event type: Business event.'),
(156, 1, 5, 'CurrencyConversionService', 'CurrencyConversionService', 'A service to convert funds from one currency to another currency.'),
(157, 1, 5, 'UserPlusOnes', 'UserPlusOnes', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(158, 1, 5, 'Reservoir', 'Reservoir', 'A reservoir of water, typically an artificially created lake, like the Lake Kariba reservoir.'),
(159, 1, 5, 'SuspendAction', 'SuspendAction', 'The act of momentarily pausing a device or application (e.g. pause music playback or pause a timer).'),
(160, 1, 5, 'LiquorStore', 'LiquorStore', 'A shop that sells alcoholic drinks such as wine, beer, whisky and other spirits.'),
(161, 1, 5, 'IceCreamShop', 'IceCreamShop', 'An ice cream shop.'),
(162, 1, 5, 'DaySpa', 'DaySpa', 'A day spa.'),
(163, 1, 5, 'RegisterAction', 'RegisterAction', 'The act of registering to be a user of a service, product or web page.\\n\\nRelated actions:\\n\\n* [[JoinAction]]: Unlike JoinAction, RegisterAction implies you are registering to be a user of a service, *not* a group/team of people.\\n* [[FollowAction]]: Unlike FollowAction, RegisterAction doesn\'t imply that the agent is expecting to poll for updates from the object.\\n* [[SubscribeAction]]: Unlike SubscribeAction, RegisterAction doesn\'t imply that the agent is expecting updates from the object.'),
(164, 1, 5, 'PostOffice', 'PostOffice', 'A post office.'),
(165, 1, 5, 'CafeOrCoffeeShop', 'CafeOrCoffeeShop', 'A cafe or coffee shop.'),
(166, 1, 5, 'PsychologicalTreatment', 'PsychologicalTreatment', 'A process of care relying upon counseling, dialogue and communication  aimed at improving a mental health condition without use of drugs.'),
(167, 1, 5, 'BookSeries', 'BookSeries', 'A series of books. Included books can be indicated with the hasPart property.'),
(168, 1, 5, 'AgreeAction', 'AgreeAction', 'The act of expressing a consistency of opinion with the object. An agent agrees to/about an object (a proposition, topic or theme) with participants.'),
(169, 1, 5, 'GolfCourse', 'GolfCourse', 'A golf course.'),
(170, 1, 5, 'ArriveAction', 'ArriveAction', 'The act of arriving at a place. An agent arrives at a destination from a fromLocation, optionally with participants.'),
(171, 1, 5, 'TheaterEvent', 'TheaterEvent', 'Event type: Theater performance.'),
(172, 1, 5, 'CampingPitch', 'CampingPitch', 'A [[CampingPitch]] is an individual place for overnight stay in the outdoors, typically being part of a larger camping site, or [[Campground]].\\n\\n\nIn British English a campsite, or campground, is an area, usually divided into a number of pitches, where people can camp overnight using tents or camper vans or caravans; this British English use of the word is synonymous with the American English expression campground. In American English the term campsite generally means an area where an individual, family, group, or military unit can pitch a tent or park a camper; a campground may contain many campsites.\n(Source: Wikipedia, see [https://en.wikipedia.org/wiki/Campsite](https://en.wikipedia.org/wiki/Campsite).)\\n\\n\nSee also the dedicated [document on the use of schema.org for marking up hotels and other forms of accommodations](/docs/hotels.html).\n'),
(173, 1, 5, 'InternetCafe', 'InternetCafe', 'An internet cafe.'),
(174, 1, 5, 'ClothingStore', 'ClothingStore', 'A clothing store.'),
(175, 1, 5, 'MovingCompany', 'MovingCompany', 'A moving company.'),
(176, 1, 5, 'MotorcycleDealer', 'MotorcycleDealer', 'A motorcycle dealer.'),
(177, 1, 5, 'Researcher', 'Researcher', 'Researchers.'),
(178, 1, 5, 'DepositAccount', 'DepositAccount', 'A type of Bank Account with a main purpose of depositing funds to gain interest or other benefits.'),
(179, 1, 5, 'PodcastSeason', 'PodcastSeason', 'A single season of a podcast. Many podcasts do not break down into separate seasons. In that case, PodcastSeries should be used.'),
(180, 1, 5, 'OnlineStore', 'OnlineStore', 'An eCommerce site.'),
(181, 1, 5, 'LikeAction', 'LikeAction', 'The act of expressing a positive sentiment about the object. An agent likes an object (a proposition, topic or theme) with participants.'),
(182, 1, 5, 'WPFooter', 'WPFooter', 'The footer section of the page.'),
(183, 1, 5, 'ExhibitionEvent', 'ExhibitionEvent', 'Event type: Exhibition event, e.g. at a museum, library, archive, tradeshow, ...'),
(184, 1, 5, 'RecyclingCenter', 'RecyclingCenter', 'A recycling center.'),
(185, 1, 5, 'HealthClub', 'HealthClub', 'A health club.'),
(186, 1, 5, 'CovidTestingFacility', 'CovidTestingFacility', 'A CovidTestingFacility is a [[MedicalClinic]] where testing for the COVID-19 Coronavirus\n      disease is available. If the facility is being made available from an established [[Pharmacy]], [[Hotel]], or other\n      non-medical organization, multiple types can be listed. This makes it easier to re-use existing schema.org information\n      about that place, e.g. contact info, address, opening hours. Note that in an emergency, such information may not always be reliable.\n      '),
(187, 1, 5, 'NightClub', 'NightClub', 'A nightclub or discotheque.'),
(188, 1, 5, 'UserBlocks', 'UserBlocks', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(189, 1, 5, 'OnDemandEvent', 'OnDemandEvent', 'A publication event, e.g. catch-up TV or radio podcast, during which a program is available on-demand.'),
(190, 1, 5, 'ListenAction', 'ListenAction', 'The act of consuming audio content.'),
(191, 1, 5, 'ProfessionalService', 'ProfessionalService', 'Original definition: \"provider of professional services.\"\\n\\nThe general [[ProfessionalService]] type for local businesses was deprecated due to confusion with [[Service]]. For reference, the types that it included were: [[Dentist]],\n        [[AccountingService]], [[Attorney]], [[Notary]], as well as types for several kinds of [[HomeAndConstructionBusiness]]: [[Electrician]], [[GeneralContractor]],\n        [[HousePainter]], [[Locksmith]], [[Plumber]], [[RoofingContractor]]. [[LegalService]] was introduced as a more inclusive supertype of [[Attorney]].'),
(192, 1, 5, 'MovieRentalStore', 'MovieRentalStore', 'A movie rental store.'),
(193, 1, 5, 'BarOrPub', 'BarOrPub', 'A bar or pub.'),
(194, 1, 5, 'AutoPartsStore', 'AutoPartsStore', 'An auto parts store.'),
(195, 1, 5, 'CreditCard', 'CreditCard', 'A card payment method of a particular brand or name.  Used to mark up a particular payment method and/or the financial product/service that supplies the card account.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#AmericanExpress\\n* http://purl.org/goodrelations/v1#DinersClub\\n* http://purl.org/goodrelations/v1#Discover\\n* http://purl.org/goodrelations/v1#JCB\\n* http://purl.org/goodrelations/v1#MasterCard\\n* http://purl.org/goodrelations/v1#VISA\n       '),
(196, 1, 5, 'OceanBodyOfWater', 'OceanBodyOfWater', 'An ocean (for example, the Pacific).'),
(197, 1, 5, 'AutoDealer', 'AutoDealer', 'An car dealership.'),
(198, 1, 5, 'PhysicalTherapy', 'PhysicalTherapy', 'A process of progressive physical care and rehabilitation aimed at improving a health condition.'),
(199, 1, 5, 'PodcastEpisode', 'PodcastEpisode', 'A single episode of a podcast series.'),
(200, 1, 5, 'WorkersUnion', 'WorkersUnion', 'A Workers Union (also known as a Labor Union, Labour Union, or Trade Union) is an organization that promotes the interests of its worker members by collectively bargaining with management, organizing, and political lobbying.'),
(201, 1, 5, 'QuoteAction', 'QuoteAction', 'An agent quotes/estimates/appraises an object/product/service with a price at a location/store.'),
(202, 1, 5, 'Zoo', 'Zoo', 'A zoo.'),
(203, 1, 5, 'FundingScheme', 'FundingScheme', 'A FundingScheme combines organizational, project and policy aspects of grant-based funding\n    that sets guidelines, principles and mechanisms to support other kinds of projects and activities.\n    Funding is typically organized via [[Grant]] funding. Examples of funding schemes: Swiss Priority Programmes (SPPs); EU Framework 7 (FP7); Horizon 2020; the NIH-R01 Grant Program; Wellcome institutional strategic support fund. For large scale public sector funding, the management and administration of grant awards is often handled by other, dedicated, organizations - [[FundingAgency]]s such as ERC, REA, ...'),
(204, 1, 5, 'AutomatedTeller', 'AutomatedTeller', 'ATM/cash machine.'),
(205, 1, 5, 'CompleteDataFeed', 'CompleteDataFeed', 'A [[CompleteDataFeed]] is a [[DataFeed]] whose standard representation includes content for every item currently in the feed.\n\nThis is the equivalent of Atom\'s element as defined in Feed Paging and Archiving [RFC 5005](https://tools.ietf.org/html/rfc5005), for example (and as defined for Atom), when using data from a feed that represents a collection of items that varies over time (e.g. \"Top Twenty Records\") there is no need to have newer entries mixed in alongside older, obsolete entries. By marking this feed as a CompleteDataFeed, old entries can be safely discarded when the feed is refreshed, since we can assume the feed has provided descriptions for all current items.'),
(206, 1, 5, 'NoteDigitalDocument', 'NoteDigitalDocument', 'A file containing a note, primarily for the author.'),
(207, 1, 5, 'TelevisionStation', 'TelevisionStation', 'A television station.'),
(208, 1, 5, 'SportingGoodsStore', 'SportingGoodsStore', 'A sporting goods store.'),
(209, 1, 5, 'BloodTest', 'BloodTest', 'A medical test performed on a sample of a patient\'s blood.'),
(210, 1, 5, 'SaleEvent', 'SaleEvent', 'Event type: Sales event.'),
(211, 1, 5, 'AutoRental', 'AutoRental', 'A car rental business.'),
(212, 1, 5, 'MusicVenue', 'MusicVenue', 'A music venue.'),
(213, 1, 5, 'Pond', 'Pond', 'A pond.'),
(214, 1, 5, 'PrependAction', 'PrependAction', 'The act of inserting at the beginning if an ordered collection.'),
(215, 1, 5, 'AMRadioChannel', 'AMRadioChannel', 'A radio channel that uses AM.'),
(216, 1, 5, 'Casino', 'Casino', 'A casino.'),
(217, 1, 5, 'UserDownloads', 'UserDownloads', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(218, 1, 5, 'Volcano', 'Volcano', 'A volcano, like Fujisan.'),
(219, 1, 5, 'AmpStory', 'AmpStory', 'A creative work with a visual storytelling format intended to be viewed online, particularly on mobile devices.'),
(220, 1, 5, 'Notary', 'Notary', 'A notary.'),
(221, 1, 5, 'HowToTip', 'HowToTip', 'An explanation in the instructions for how to achieve a result. It provides supplementary information about a technique, supply, author\'s preference, etc. It can explain what could be done, or what should not be done, but doesn\'t specify what should be done (see HowToDirection).'),
(222, 1, 5, 'Campground', 'Campground', 'A camping site, campsite, or [[Campground]] is a place used for overnight stay in the outdoors, typically containing individual [[CampingPitch]] locations. \\n\\n\nIn British English a campsite is an area, usually divided into a number of pitches, where people can camp overnight using tents or camper vans or caravans; this British English use of the word is synonymous with the American English expression campground. In American English the term campsite generally means an area where an individual, family, group, or military unit can pitch a tent or park a camper; a campground may contain many campsites (source: Wikipedia, see [https://en.wikipedia.org/wiki/Campsite](https://en.wikipedia.org/wiki/Campsite)).\\n\\n\n\nSee also the dedicated [document on the use of schema.org for marking up hotels and other forms of accommodations](/docs/hotels.html).\n'),
(223, 1, 5, 'SchoolDistrict', 'SchoolDistrict', 'A School District is an administrative area for the administration of schools.'),
(224, 1, 5, 'WearAction', 'WearAction', 'The act of dressing oneself in clothing.'),
(225, 1, 5, 'WPSideBar', 'WPSideBar', 'A sidebar section of the page.'),
(226, 1, 5, 'PublicToilet', 'PublicToilet', 'A public toilet is a room or small building containing one or more toilets (and possibly also urinals) which is available for use by the general public, or by customers or employees of certain businesses.'),
(227, 1, 5, 'ReserveAction', 'ReserveAction', 'Reserving a concrete object.\\n\\nRelated actions:\\n\\n* [[ScheduleAction]]: Unlike ScheduleAction, ReserveAction reserves concrete objects (e.g. a table, a hotel) towards a time slot / spatial allocation.'),
(228, 1, 5, 'TrainReservation', 'TrainReservation', 'A reservation for train travel.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(229, 1, 5, 'DeleteAction', 'DeleteAction', 'The act of editing a recipient by removing one of its objects.'),
(230, 1, 5, 'AmusementPark', 'AmusementPark', 'An amusement park.'),
(231, 1, 5, 'Painting', 'Painting', 'A painting.'),
(232, 1, 5, 'UserCheckins', 'UserCheckins', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(233, 1, 5, 'BoatReservation', 'BoatReservation', 'A reservation for boat travel.\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(234, 1, 5, 'FAQPage', 'FAQPage', 'A [[FAQPage]] is a [[WebPage]] presenting one or more \"[Frequently asked questions](https://en.wikipedia.org/wiki/FAQ)\" (see also [[QAPage]]).'),
(235, 1, 5, 'TattooParlor', 'TattooParlor', 'A tattoo parlor.'),
(236, 1, 5, 'GovernmentPermit', 'GovernmentPermit', 'A permit issued by a government agency.'),
(237, 1, 5, 'Barcode', 'Barcode', 'An image of a visual machine-readable code such as a barcode or QR code.'),
(238, 1, 5, 'DiscoverAction', 'DiscoverAction', 'The act of discovering/finding an object.'),
(239, 1, 5, 'CatholicChurch', 'CatholicChurch', 'A Catholic church.'),
(240, 1, 5, 'DrinkAction', 'DrinkAction', 'The act of swallowing liquids.'),
(241, 1, 5, 'ResearchProject', 'ResearchProject', 'A Research project.'),
(242, 1, 5, 'DislikeAction', 'DislikeAction', 'The act of expressing a negative sentiment about the object. An agent dislikes an object (a proposition, topic or theme) with participants.'),
(243, 1, 5, 'LibrarySystem', 'LibrarySystem', 'A [[LibrarySystem]] is a collaborative system amongst several libraries.'),
(244, 1, 5, 'UserPlays', 'UserPlays', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(245, 1, 5, 'ConfirmAction', 'ConfirmAction', 'The act of notifying someone that a future event/action is going to happen as expected.\\n\\nRelated actions:\\n\\n* [[CancelAction]]: The antonym of ConfirmAction.'),
(246, 1, 5, 'LandmarksOrHistoricalBuildings', 'LandmarksOrHistoricalBuildings', 'An historical landmark or building.'),
(247, 1, 5, 'OpinionNewsArticle', 'OpinionNewsArticle', 'An [[OpinionNewsArticle]] is a [[NewsArticle]] that primarily expresses opinions rather than journalistic reporting of news and events. For example, a [[NewsArticle]] consisting of a column or [[Blog]]/[[BlogPosting]] entry in the Opinions section of a news publication. '),
(248, 1, 5, 'Restaurant', 'Restaurant', 'A restaurant.'),
(249, 1, 5, 'PreOrderAction', 'PreOrderAction', 'An agent orders a (not yet released) object/product/service to be delivered/sent.'),
(250, 1, 5, 'MotorcycleRepair', 'MotorcycleRepair', 'A motorcycle repair shop.'),
(251, 1, 5, 'ConvenienceStore', 'ConvenienceStore', 'A convenience store.'),
(252, 1, 5, 'HighSchool', 'HighSchool', 'A high school.'),
(253, 1, 5, 'Museum', 'Museum', 'A museum.'),
(254, 1, 5, 'PublicSwimmingPool', 'PublicSwimmingPool', 'A public swimming pool.'),
(255, 1, 5, 'Park', 'Park', 'A park.'),
(256, 1, 5, 'SatiricalArticle', 'SatiricalArticle', 'An [[Article]] whose content is primarily [[satirical]](https://en.wikipedia.org/wiki/Satire) in nature, i.e. unlikely to be literally true. A satirical article is sometimes but not necessarily also a [[NewsArticle]]. [[ScholarlyArticle]]s are also sometimes satirized.'),
(257, 1, 5, 'ComedyClub', 'ComedyClub', 'A comedy club.'),
(258, 1, 5, 'OfficeEquipmentStore', 'OfficeEquipmentStore', 'An office equipment store.'),
(259, 1, 5, 'RadiationTherapy', 'RadiationTherapy', 'A process of care using radiation aimed at improving a health condition.'),
(260, 1, 5, 'PresentationDigitalDocument', 'PresentationDigitalDocument', 'A file containing slides or used for a presentation.'),
(261, 1, 5, 'HousePainter', 'HousePainter', 'A house painting service.'),
(262, 1, 5, 'BookmarkAction', 'BookmarkAction', 'An agent bookmarks/flags/labels/tags/marks an object.'),
(263, 1, 5, 'DisagreeAction', 'DisagreeAction', 'The act of expressing a difference of opinion with the object. An agent disagrees to/about an object (a proposition, topic or theme) with participants.'),
(264, 1, 5, 'InstallAction', 'InstallAction', 'The act of installing an application.'),
(265, 1, 5, 'MarryAction', 'MarryAction', 'The act of marrying a person.'),
(266, 1, 5, 'PawnShop', 'PawnShop', 'A shop that will buy, or lend money against the security of, personal possessions.'),
(267, 1, 5, 'VisualArtsEvent', 'VisualArtsEvent', 'Event type: Visual arts event.'),
(268, 1, 5, 'Playground', 'Playground', 'A playground.'),
(269, 1, 5, 'CheckOutAction', 'CheckOutAction', 'The act of an agent communicating (service provider, social media, etc) their departure of a previously reserved service (e.g. flight check-in) or place (e.g. hotel).\\n\\nRelated actions:\\n\\n* [[CheckInAction]]: The antonym of CheckOutAction.\\n* [[DepartAction]]: Unlike DepartAction, CheckOutAction implies that the agent is informing/confirming the end of a previously reserved service.\\n* [[CancelAction]]: Unlike CancelAction, CheckOutAction implies that the agent is informing/confirming the end of a previously reserved service.'),
(270, 1, 5, 'FurnitureStore', 'FurnitureStore', 'A furniture store.'),
(271, 1, 5, 'JewelryStore', 'JewelryStore', 'A jewelry store.'),
(272, 1, 5, 'Waterfall', 'Waterfall', 'A waterfall, like Niagara.'),
(273, 1, 5, 'Synagogue', 'Synagogue', 'A synagogue.'),
(274, 1, 5, 'Quiz', 'Quiz', 'Quiz: A test of knowledge, skills and abilities.'),
(275, 1, 5, 'BefriendAction', 'BefriendAction', 'The act of forming a personal connection with someone (object) mutually/bidirectionally/symmetrically.\\n\\nRelated actions:\\n\\n* [[FollowAction]]: Unlike FollowAction, BefriendAction implies that the connection is reciprocal.'),
(276, 1, 5, 'Hackathon', 'Hackathon', 'A [hackathon](https://en.wikipedia.org/wiki/Hackathon) event.'),
(277, 1, 5, 'State', 'State', 'A state or province of a country.'),
(278, 1, 5, 'CityHall', 'CityHall', 'A city hall.'),
(279, 1, 5, 'BrokerageAccount', 'BrokerageAccount', 'An account that allows an investor to deposit funds and place investment orders with a licensed broker or brokerage firm.'),
(280, 1, 5, 'TennisComplex', 'TennisComplex', 'A tennis complex.'),
(281, 1, 5, 'CheckAction', 'CheckAction', 'An agent inspects, determines, investigates, inquires, or examines an object\'s accuracy, quality, condition, or state.'),
(282, 1, 5, 'WPAdBlock', 'WPAdBlock', 'An advertising section of the page.'),
(283, 1, 5, 'WantAction', 'WantAction', 'The act of expressing a desire about the object. An agent wants an object.'),
(284, 1, 5, 'ComicCoverArt', 'ComicCoverArt', 'The artwork on the cover of a comic.'),
(285, 1, 5, 'City', 'City', 'A city or town.'),
(286, 1, 5, 'Mosque', 'Mosque', 'A mosque.'),
(287, 1, 5, 'PaymentService', 'PaymentService', 'A Service to transfer funds from a person or organization to a beneficiary person or organization.'),
(288, 1, 5, 'VideoObjectSnapshot', 'VideoObjectSnapshot', 'A specific and exact (byte-for-byte) version of a [[VideoObject]]. Two byte-for-byte identical files, for the purposes of this type, considered identical. If they have different embedded metadata the files will differ. Different external facts about the files, e.g. creator or dateCreated that aren\'t represented in their actual content, do not affect this notion of identity.'),
(289, 1, 5, 'DeactivateAction', 'DeactivateAction', 'The act of stopping or deactivating a device or application (e.g. stopping a timer or turning off a flashlight).'),
(290, 1, 5, 'OccupationalTherapy', 'OccupationalTherapy', 'A treatment of people with physical, emotional, or social problems, using purposeful activity to help them overcome or learn to deal with their problems.'),
(291, 1, 5, 'EndorsementRating', 'EndorsementRating', 'An EndorsementRating is a rating that expresses some level of endorsement, for example inclusion in a \"critic\'s pick\" blog, a\n\"Like\" or \"+1\" on a social network. It can be considered the [[result]] of an [[EndorseAction]] in which the [[object]] of the action is rated positively by\nsome [[agent]]. As is common elsewhere in schema.org, it is sometimes more useful to describe the results of such an action without explicitly describing the [[Action]].\n\nAn [[EndorsementRating]] may be part of a numeric scale or organized system, but this is not required: having an explicit type for indicating a positive,\nendorsement rating is particularly useful in the absence of numeric scales as it helps consumers understand that the rating is broadly positive.\n'),
(292, 1, 5, 'UserPageVisits', 'UserPageVisits', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(293, 1, 5, 'TieAction', 'TieAction', 'The act of reaching a draw in a competitive activity.'),
(294, 1, 5, 'Distillery', 'Distillery', 'A distillery.'),
(295, 1, 5, 'ImageGallery', 'ImageGallery', 'Web page type: Image gallery page.'),
(296, 1, 5, 'Poster', 'Poster', 'A large, usually printed placard, bill, or announcement, often illustrated, that is posted to advertise or publicize something.'),
(297, 1, 5, 'ViewAction', 'ViewAction', 'The act of consuming static visual content.'),
(298, 1, 5, 'QAPage', 'QAPage', 'A QAPage is a WebPage focussed on a specific Question and its Answer(s), e.g. in a question answering site or documenting Frequently Asked Questions (FAQs).'),
(299, 1, 5, 'ContactPage', 'ContactPage', 'Web page type: Contact page.'),
(300, 1, 5, 'EmailMessage', 'EmailMessage', 'An email message.'),
(301, 1, 5, 'FundingAgency', 'FundingAgency', 'A FundingAgency is an organization that implements one or more [[FundingScheme]]s and manages\n    the granting process (via [[Grant]]s, typically [[MonetaryGrant]]s).\n    A funding agency is not always required for grant funding, e.g. philanthropic giving, corporate sponsorship etc.\n    \nExamples of funding agencies include ERC, REA, NIH, Bill and Melinda Gates Foundation, ...\n    '),
(302, 1, 5, 'AudioObjectSnapshot', 'AudioObjectSnapshot', 'A specific and exact (byte-for-byte) version of an [[AudioObject]]. Two byte-for-byte identical files, for the purposes of this type, considered identical. If they have different embedded metadata the files will differ. Different external facts about the files, e.g. creator or dateCreated that aren\'t represented in their actual content, do not affect this notion of identity.'),
(303, 1, 5, 'SearchRescueOrganization', 'SearchRescueOrganization', 'A Search and Rescue organization of some kind.'),
(304, 1, 5, 'GatedResidenceCommunity', 'GatedResidenceCommunity', 'Residence type: Gated community.'),
(305, 1, 5, 'GardenStore', 'GardenStore', 'A garden store.'),
(306, 1, 5, 'Ligament', 'Ligament', 'A short band of tough, flexible, fibrous connective tissue that functions to connect multiple bones, cartilages, and structurally support joints.'),
(307, 1, 5, 'ComicSeries', 'ComicSeries', 'A sequential publication of comic stories under a\n    	unifying title, for example \"The Amazing Spider-Man\" or \"Groo the\n    	Wanderer\".'),
(308, 1, 5, 'InsuranceAgency', 'InsuranceAgency', 'An Insurance agency.'),
(309, 1, 5, 'Taxi', 'Taxi', 'A taxi.'),
(310, 1, 5, 'Sculpture', 'Sculpture', 'A piece of sculpture.'),
(311, 1, 5, 'AdvertiserContentArticle', 'AdvertiserContentArticle', 'An [[Article]] that an external entity has paid to place or to produce to its specifications. Includes [advertorials](https://en.wikipedia.org/wiki/Advertorial), sponsored content, native advertising and other paid content.'),
(312, 1, 5, 'Crematorium', 'Crematorium', 'A crematorium.'),
(313, 1, 5, 'SeaBodyOfWater', 'SeaBodyOfWater', 'A sea (for example, the Caspian sea).'),
(314, 1, 5, 'Plumber', 'Plumber', 'A plumbing service.'),
(315, 1, 5, 'MedicalSymptom', 'MedicalSymptom', 'Any complaint sensed and expressed by the patient (therefore defined as subjective)  like stomachache, lower-back pain, or fatigue.'),
(316, 1, 5, 'ShareAction', 'ShareAction', 'The act of distributing content to people for their amusement or edification.'),
(317, 1, 5, 'ParkingFacility', 'ParkingFacility', 'A parking lot or other parking facility.'),
(318, 1, 5, 'SurgicalProcedure', 'SurgicalProcedure', 'A medical procedure involving an incision with instruments; performed for diagnose, or therapeutic purposes.'),
(319, 1, 5, 'Bridge', 'Bridge', 'A bridge.'),
(320, 1, 5, 'ElectronicsStore', 'ElectronicsStore', 'An electronics store.'),
(321, 1, 5, 'UserReview', 'UserReview', 'A review created by an end-user (e.g. consumer, purchaser, attendee etc.), in contrast with [[CriticReview]].'),
(322, 1, 5, 'Attorney', 'Attorney', 'Professional service: Attorney. \\n\\nThis type is deprecated - [[LegalService]] is more inclusive and less ambiguous.'),
(323, 1, 5, 'MusicVideoObject', 'MusicVideoObject', 'A music video file.'),
(324, 1, 5, 'MeetingRoom', 'MeetingRoom', 'A meeting room, conference room, or conference hall is a room provided for singular events such as business conferences and meetings (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Conference_hall\">http://en.wikipedia.org/wiki/Conference_hall</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(325, 1, 5, 'GovernmentOrganization', 'GovernmentOrganization', 'A governmental organization or agency.'),
(326, 1, 5, 'ReadAction', 'ReadAction', 'The act of consuming written content.'),
(327, 1, 5, 'Winery', 'Winery', 'A winery.'),
(328, 1, 5, 'HairSalon', 'HairSalon', 'A hair salon.'),
(329, 1, 5, 'ArtGallery', 'ArtGallery', 'An art gallery.'),
(330, 1, 5, 'Library', 'Library', 'A library.'),
(331, 1, 5, 'EventVenue', 'EventVenue', 'An event venue.'),
(332, 1, 5, 'ShoppingCenter', 'ShoppingCenter', 'A shopping center or mall.'),
(333, 1, 5, 'MensClothingStore', 'MensClothingStore', 'A men\'s clothing store.'),
(334, 1, 5, 'Consortium', 'Consortium', 'A Consortium is a membership [[Organization]] whose members are typically Organizations.'),
(335, 1, 5, 'Code', 'Code', 'Computer programming source code. Example: Full (compile ready) solutions, code snippet samples, scripts, templates.'),
(336, 1, 5, 'ShortStory', 'ShortStory', 'Short story or tale. A brief work of literature, usually written in narrative prose.'),
(337, 1, 5, 'VideoGameClip', 'VideoGameClip', 'A short segment/part of a video game.'),
(338, 1, 5, 'Optician', 'Optician', 'A store that sells reading glasses and similar devices for improving vision.'),
(339, 1, 5, 'ActivateAction', 'ActivateAction', 'The act of starting or activating a device or application (e.g. starting a timer or turning on a flashlight).'),
(340, 1, 5, 'RVPark', 'RVPark', 'A place offering space for \"Recreational Vehicles\", Caravans, mobile homes and the like.'),
(341, 1, 5, 'Manuscript', 'Manuscript', 'A book, document, or piece of music written by hand rather than typed or printed.'),
(342, 1, 5, 'OfferForLease', 'OfferForLease', 'An [[OfferForLease]] in Schema.org represents an [[Offer]] to lease out something, i.e. an [[Offer]] whose\n  [[businessFunction]] is [lease out](http://purl.org/goodrelations/v1#LeaseOut.). See [Good Relations](https://en.wikipedia.org/wiki/GoodRelations) for\n  background on the underlying concepts.\n  '),
(343, 1, 5, 'MusicEvent', 'MusicEvent', 'Event type: Music event.'),
(344, 1, 5, 'Newspaper', 'Newspaper', 'A publication containing information about varied topics that are pertinent to general information, a geographic area, or a specific subject matter (i.e. business, culture, education). Often published daily.'),
(345, 1, 5, 'ChildCare', 'ChildCare', 'A Childcare center.'),
(346, 1, 5, 'BedAndBreakfast', 'BedAndBreakfast', 'Bed and breakfast.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(347, 1, 5, 'PaintAction', 'PaintAction', 'The act of producing a painting, typically with paint and canvas as instruments.'),
(348, 1, 5, 'CheckInAction', 'CheckInAction', 'The act of an agent communicating (service provider, social media, etc) their arrival by registering/confirming for a previously reserved service (e.g. flight check-in) or at a place (e.g. hotel), possibly resulting in a result (boarding pass, etc).\\n\\nRelated actions:\\n\\n* [[CheckOutAction]]: The antonym of CheckInAction.\\n* [[ArriveAction]]: Unlike ArriveAction, CheckInAction implies that the agent is informing/confirming the start of a previously reserved service.\\n* [[ConfirmAction]]: Unlike ConfirmAction, CheckInAction implies that the agent is informing/confirming the *start* of a previously reserved service rather than its validity/existence.'),
(349, 1, 5, 'SiteNavigationElement', 'SiteNavigationElement', 'A navigation element of the page.'),
(350, 1, 5, 'AssignAction', 'AssignAction', 'The act of allocating an action/event/task to some destination (someone or something).'),
(351, 1, 5, 'AcceptAction', 'AcceptAction', 'The act of committing to/adopting an object.\\n\\nRelated actions:\\n\\n* [[RejectAction]]: The antonym of AcceptAction.'),
(352, 1, 5, 'GroceryStore', 'GroceryStore', 'A grocery store.'),
(353, 1, 5, 'Float', 'Float', 'Data type: Floating number.'),
(354, 1, 5, 'Season', 'Season', 'A media season, e.g. TV, radio, video game etc.'),
(355, 1, 5, 'School', 'School', 'A school.'),
(356, 1, 5, 'Continent', 'Continent', 'One of the continents (for example, Europe or Africa).'),
(357, 1, 5, 'VitalSign', 'VitalSign', 'Vital signs are measures of various physiological functions in order to assess the most basic body functions.'),
(358, 1, 5, 'DanceEvent', 'DanceEvent', 'Event type: A social dance.'),
(359, 1, 5, 'Conversation', 'Conversation', 'One or more messages between organizations or people on a particular topic. Individual messages can be linked to the conversation with isPartOf or hasPart properties.'),
(360, 1, 5, 'Beach', 'Beach', 'Beach.'),
(361, 1, 5, 'MusicStore', 'MusicStore', 'A music store.'),
(362, 1, 5, 'SheetMusic', 'SheetMusic', 'Printed music, as opposed to performed or recorded music.'),
(363, 1, 5, 'TheaterGroup', 'TheaterGroup', 'A theater group or company, for example, the Royal Shakespeare Company or Druid Theatre.'),
(364, 1, 5, 'AutoWash', 'AutoWash', 'A car wash business.'),
(365, 1, 5, 'MotorizedBicycle', 'MotorizedBicycle', 'A motorized bicycle is a bicycle with an attached motor used to power the vehicle, or to assist with pedaling.'),
(366, 1, 5, 'DrawAction', 'DrawAction', 'The act of producing a visual/graphical representation of an object, typically with a pen/pencil and paper as instruments.'),
(367, 1, 5, 'IgnoreAction', 'IgnoreAction', 'The act of intentionally disregarding the object. An agent ignores an object.'),
(368, 1, 5, 'MedicalGuidelineContraindication', 'MedicalGuidelineContraindication', 'A guideline contraindication that designates a process as harmful and where quality of the data supporting the contraindication is sound.'),
(369, 1, 5, 'SearchResultsPage', 'SearchResultsPage', 'Web page type: Search results page.'),
(370, 1, 5, 'RadioEpisode', 'RadioEpisode', 'A radio episode which can be part of a series or season.'),
(371, 1, 5, 'BusReservation', 'BusReservation', 'A reservation for bus travel. \\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(372, 1, 5, 'ShoeStore', 'ShoeStore', 'A shoe store.'),
(373, 1, 5, 'FireStation', 'FireStation', 'A fire station. With firemen.'),
(374, 1, 5, 'Pharmacy', 'Pharmacy', 'A pharmacy or drugstore.'),
(375, 1, 5, 'ApplyAction', 'ApplyAction', 'The act of registering to an organization/service without the guarantee to receive it.\\n\\nRelated actions:\\n\\n* [[RegisterAction]]: Unlike RegisterAction, ApplyAction has no guarantees that the application will be accepted.'),
(376, 1, 5, 'Aquarium', 'Aquarium', 'Aquarium.'),
(377, 1, 5, 'LegislativeBuilding', 'LegislativeBuilding', 'A legislative building&#x2014;for example, the state capitol.'),
(378, 1, 5, 'Preschool', 'Preschool', 'A preschool.'),
(379, 1, 5, 'DefenceEstablishment', 'DefenceEstablishment', 'A defence establishment, such as an army or navy base.'),
(380, 1, 5, 'Hostel', 'Hostel', 'A hostel - cheap accommodation, often in shared dormitories.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(381, 1, 5, 'EatAction', 'EatAction', 'The act of swallowing solid objects.'),
(382, 1, 5, 'LiteraryEvent', 'LiteraryEvent', 'Event type: Literary event.'),
(383, 1, 5, 'BookStore', 'BookStore', 'A bookstore.'),
(384, 1, 5, 'EmployerReview', 'EmployerReview', 'An [[EmployerReview]] is a review of an [[Organization]] regarding its role as an employer, written by a current or former employee of that organization.'),
(385, 1, 5, 'ComputerStore', 'ComputerStore', 'A computer store.'),
(386, 1, 5, 'RoofingContractor', 'RoofingContractor', 'A roofing contractor.'),
(387, 1, 5, 'RadioBroadcastService', 'RadioBroadcastService', 'A delivery service through which radio content is provided via broadcast over the air or online.'),
(388, 1, 5, 'AutoRepair', 'AutoRepair', 'Car repair business.'),
(389, 1, 5, 'WholesaleStore', 'WholesaleStore', 'A wholesale store.'),
(390, 1, 5, 'Bone', 'Bone', 'Rigid connective tissue that comprises up the skeletal structure of the human body.'),
(391, 1, 5, 'PetStore', 'PetStore', 'A pet store.'),
(392, 1, 5, 'BuddhistTemple', 'BuddhistTemple', 'A Buddhist temple.'),
(393, 1, 5, 'EmployerAggregateRating', 'EmployerAggregateRating', 'An aggregate rating of an Organization related to its role as an employer.'),
(394, 1, 5, 'AskPublicNewsArticle', 'AskPublicNewsArticle', 'A [[NewsArticle]] expressing an open call by a [[NewsMediaOrganization]] asking the public for input, insights, clarifications, anecdotes, documentation, etc., on an issue, for reporting purposes.'),
(395, 1, 5, 'ItemPage', 'ItemPage', 'A page devoted to a single item, such as a particular product or hotel.'),
(396, 1, 5, 'PoliceStation', 'PoliceStation', 'A police station.'),
(397, 1, 5, 'Courthouse', 'Courthouse', 'A courthouse.'),
(398, 1, 5, 'TreatmentIndication', 'TreatmentIndication', 'An indication for treating an underlying condition, symptom, etc.'),
(399, 1, 5, 'DownloadAction', 'DownloadAction', 'The act of downloading an object.'),
(400, 1, 5, 'DepartmentStore', 'DepartmentStore', 'A department store.'),
(401, 1, 5, 'Play', 'Play', 'A play is a form of literature, usually consisting of dialogue between characters, intended for theatrical performance rather than just reading. Note: A performance of a Play would be a [[TheaterEvent]] or [[BroadcastEvent]] - the *Play* being the [[workPerformed]].'),
(402, 1, 5, 'VideoGallery', 'VideoGallery', 'Web page type: Video gallery page.'),
(403, 1, 5, 'Brewery', 'Brewery', 'Brewery.'),
(404, 1, 5, 'NGO', 'NGO', 'Organization: Non-governmental Organization.'),
(405, 1, 5, 'MiddleSchool', 'MiddleSchool', 'A middle school (typically for children aged around 11-14, although this varies somewhat).'),
(406, 1, 5, 'Electrician', 'Electrician', 'An electrician.'),
(407, 1, 5, 'CollegeOrUniversity', 'CollegeOrUniversity', 'A college, university, or other third-level educational institution.'),
(408, 1, 5, 'PerformingArtsTheater', 'PerformingArtsTheater', 'A theater or other performing art center.'),
(409, 1, 5, 'Florist', 'Florist', 'A florist.'),
(410, 1, 5, 'AccountingService', 'AccountingService', 'Accountancy business.\\n\\nAs a [[LocalBusiness]] it can be described as a [[provider]] of one or more [[Service]]\\(s).\n      '),
(411, 1, 5, 'CheckoutPage', 'CheckoutPage', 'Web page type: Checkout page.'),
(412, 1, 5, 'SubwayStation', 'SubwayStation', 'A subway station.'),
(413, 1, 5, 'UserLikes', 'UserLikes', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(414, 1, 5, 'WatchAction', 'WatchAction', 'The act of consuming dynamic/moving visual content.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(415, 1, 5, 'Table', 'Table', 'A table on a Web page.'),
(416, 1, 5, 'ProfilePage', 'ProfilePage', 'Web page type: Profile page.'),
(417, 1, 5, 'PalliativeProcedure', 'PalliativeProcedure', 'A medical procedure intended primarily for palliative purposes, aimed at relieving the symptoms of an underlying health condition.'),
(418, 1, 5, 'GeneralContractor', 'GeneralContractor', 'A general contractor.'),
(419, 1, 5, 'GasStation', 'GasStation', 'A gas station.'),
(420, 1, 5, 'Motel', 'Motel', 'A motel.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(421, 1, 5, 'SocialEvent', 'SocialEvent', 'Event type: Social event.'),
(422, 1, 5, 'Atlas', 'Atlas', 'A collection or bound volume of maps, charts, plates or tables, physical or in media form illustrating any subject.'),
(423, 1, 5, 'CancelAction', 'CancelAction', 'The act of asserting that a future event/action is no longer going to happen.\\n\\nRelated actions:\\n\\n* [[ConfirmAction]]: The antonym of CancelAction.'),
(424, 1, 5, 'FastFoodRestaurant', 'FastFoodRestaurant', 'A fast-food restaurant.'),
(425, 1, 5, 'TouristInformationCenter', 'TouristInformationCenter', 'A tourist information center.'),
(426, 1, 5, 'EventReservation', 'EventReservation', 'A reservation for an event like a concert, sporting event, or lecture.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(427, 1, 5, 'HobbyShop', 'HobbyShop', 'A store that sells materials useful or necessary for various hobbies.'),
(428, 1, 5, 'EmploymentAgency', 'EmploymentAgency', 'An employment agency.'),
(429, 1, 5, 'SelfStorage', 'SelfStorage', 'A self-storage facility.'),
(430, 1, 5, 'TakeAction', 'TakeAction', 'The act of gaining ownership of an object from an origin. Reciprocal of GiveAction.\\n\\nRelated actions:\\n\\n* [[GiveAction]]: The reciprocal of TakeAction.\\n* [[ReceiveAction]]: Unlike ReceiveAction, TakeAction implies that ownership has been transferred.'),
(431, 1, 5, 'ReportedDoseSchedule', 'ReportedDoseSchedule', 'A patient-reported or observed dosing schedule for a drug or supplement.'),
(432, 1, 5, 'RejectAction', 'RejectAction', 'The act of rejecting to/adopting an object.\\n\\nRelated actions:\\n\\n* [[AcceptAction]]: The antonym of RejectAction.'),
(433, 1, 5, 'BeautySalon', 'BeautySalon', 'Beauty salon.'),
(434, 1, 5, 'ElementarySchool', 'ElementarySchool', 'An elementary school.'),
(435, 1, 5, 'ResumeAction', 'ResumeAction', 'The act of resuming a device or application which was formerly paused (e.g. resume music playback or resume a timer).'),
(436, 1, 5, 'RadioClip', 'RadioClip', 'A short radio program or a segment/part of a radio program.'),
(437, 1, 5, 'DepartAction', 'DepartAction', 'The act of  departing from a place. An agent departs from a fromLocation for a destination, optionally with participants.'),
(438, 1, 5, 'Locksmith', 'Locksmith', 'A locksmith.'),
(439, 1, 5, 'PhotographAction', 'PhotographAction', 'The act of capturing still images of objects using a camera.'),
(440, 1, 5, 'SportsClub', 'SportsClub', 'A sports club.'),
(441, 1, 5, 'StadiumOrArena', 'StadiumOrArena', 'A stadium.'),
(442, 1, 5, 'TextDigitalDocument', 'TextDigitalDocument', 'A file composed primarily of text.'),
(443, 1, 5, 'FilmAction', 'FilmAction', 'The act of capturing sound and moving images on film, video, or digitally.'),
(444, 1, 5, 'Bakery', 'Bakery', 'A bakery.'),
(445, 1, 5, 'Embassy', 'Embassy', 'An embassy.'),
(446, 1, 5, 'OutletStore', 'OutletStore', 'An outlet store.'),
(447, 1, 5, 'EventSeries', 'EventSeries', 'A series of [[Event]]s. Included events can relate with the series using the [[superEvent]] property.\n\nAn EventSeries is a collection of events that share some unifying characteristic. For example, \"The Olympic Games\" is a series, which\nis repeated regularly. The \"2012 London Olympics\" can be presented both as an [[Event]] in the series \"Olympic Games\", and as an\n[[EventSeries]] that included a number of sporting competitions as Events.\n\nThe nature of the association between the events in an [[EventSeries]] can vary, but typical examples could\ninclude a thematic event series (e.g. topical meetups or classes), or a series of regular events that share a location, attendee group and/or organizers.\n\nEventSeries has been defined as a kind of Event to make it easy for publishers to use it in an Event context without\nworrying about which kinds of series are really event-like enough to call an Event. In general an EventSeries\nmay seem more Event-like when the period of time is compact and when aspects such as location are fixed, but\nit may also sometimes prove useful to describe a longer-term series as an Event.\n   '),
(448, 1, 5, 'ExerciseGym', 'ExerciseGym', 'A gym.'),
(449, 1, 5, 'DanceGroup', 'DanceGroup', 'A dance group&#x2014;for example, the Alvin Ailey Dance Theater or Riverdance.'),
(450, 1, 5, 'SkiResort', 'SkiResort', 'A ski resort.'),
(451, 1, 5, 'LakeBodyOfWater', 'LakeBodyOfWater', 'A lake (for example, Lake Pontrachain).'),
(452, 1, 5, 'AppendAction', 'AppendAction', 'The act of inserting at the end if an ordered collection.'),
(453, 1, 5, 'AdultEntertainment', 'AdultEntertainment', 'An adult entertainment establishment.'),
(454, 1, 5, 'TaxiStand', 'TaxiStand', 'A taxi stand.'),
(455, 1, 5, 'Canal', 'Canal', 'A canal, like the Panama Canal.'),
(456, 1, 5, 'HomeGoodsStore', 'HomeGoodsStore', 'A home goods store.'),
(457, 1, 5, 'AnimalShelter', 'AnimalShelter', 'Animal shelter.'),
(458, 1, 5, 'URL', 'URL', 'Data type: URL.'),
(459, 1, 5, 'Diet', 'Diet', 'A strategy of regulating the intake of food to achieve or maintain a specific health-related goal.'),
(460, 1, 5, 'Organization', 'Organization', 'An organization such as a school, NGO, corporation, club, etc.'),
(461, 1, 5, 'StructuredValue', 'StructuredValue', 'Structured values are used when the value of a property has a more complex structure than simply being a textual value or a reference to another thing.'),
(462, 1, 5, 'MediaReviewItem', 'MediaReviewItem', 'Represents an item or group of closely related items treated as a unit for the sake of evaluation in a [[MediaReview]]. Authorship etc. apply to the items rather than to the curation/grouping or reviewing party.'),
(463, 1, 5, 'MusicRelease', 'MusicRelease', 'A MusicRelease is a specific release of a music album.'),
(464, 1, 5, 'Answer', 'Answer', 'An answer offered to a question; perhaps correct, perhaps opinionated or wrong.'),
(465, 1, 5, 'Ticket', 'Ticket', 'Used to describe a ticket to an event, a flight, a bus ride, etc.'),
(466, 1, 5, 'ReactAction', 'ReactAction', 'The act of responding instinctively and emotionally to an object, expressing a sentiment.'),
(467, 1, 5, 'MedicalProcedureType', 'MedicalProcedureType', 'An enumeration that describes different types of medical procedures.'),
(468, 1, 5, 'FinancialProduct', 'FinancialProduct', 'A product provided to consumers and businesses by financial institutions such as banks, insurance companies, brokerage firms, consumer finance companies, and investment companies which comprise the financial services industry.'),
(469, 1, 5, 'ReplyAction', 'ReplyAction', 'The act of responding to a question/message asked/sent by the object. Related to [[AskAction]].\\n\\nRelated actions:\\n\\n* [[AskAction]]: Appears generally as an origin of a ReplyAction.'),
(470, 1, 5, 'ChemicalSubstance', 'ChemicalSubstance', 'A chemical substance is \'a portion of matter of constant composition, composed of molecular entities of the same type or of different types\' (source: [ChEBI:59999](https://www.ebi.ac.uk/chebi/searchId.do?chebiId=59999)).'),
(471, 1, 5, 'Language', 'Language', 'Natural languages such as Spanish, Tamil, Hindi, English, etc. Formal language code tags expressed in [BCP 47](https://en.wikipedia.org/wiki/IETF_language_tag) can be used via the [[alternateName]] property. The Language type previously also covered programming languages such as Scheme and Lisp, which are now best represented using [[ComputerLanguage]].'),
(472, 1, 5, 'HyperToc', 'HyperToc', 'A HyperToc represents a hypertext table of contents for complex media objects, such as [[VideoObject]], [[AudioObject]]. Items in the table of contents are indicated using the [[tocEntry]] property, and typed [[HyperTocEntry]]. For cases where the same larger work is split into multiple files, [[associatedMedia]] can be used on individual [[HyperTocEntry]] items.'),
(473, 1, 5, 'Person', 'Person', 'A person (alive, dead, undead, or fictional).'),
(474, 1, 5, 'BodyMeasurementTypeEnumeration', 'BodyMeasurementTypeEnumeration', 'Enumerates types (or dimensions) of a person\'s body measurements, for example for fitting of clothes.'),
(475, 1, 5, 'Observation', 'Observation', 'Instances of the class [[Observation]] are used to specify observations about an entity (which may or may not be an instance of a [[StatisticalPopulation]]), at a particular time. The principal properties of an [[Observation]] are [[observedNode]], [[measuredProperty]], [[measuredValue]] (or [[median]], etc.) and [[observationDate]] ([[measuredProperty]] properties can, but need not always, be W3C RDF Data Cube \"measure properties\", as in the [lifeExpectancy example](https://www.w3.org/TR/vocab-data-cube/#dsd-example)).\nSee also [[StatisticalPopulation]], and the [data and datasets](/docs/data-and-datasets.html) overview for more details.\n  '),
(476, 1, 5, 'QuantitativeValueDistribution', 'QuantitativeValueDistribution', 'A statistical distribution of values.'),
(477, 1, 5, 'ReplaceAction', 'ReplaceAction', 'The act of editing a recipient by replacing an old object with a new object.'),
(478, 1, 5, 'FlightReservation', 'FlightReservation', 'A reservation for air travel.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(479, 1, 5, 'CommunicateAction', 'CommunicateAction', 'The act of conveying information to another person via a communication medium (instrument) such as speech, email, or telephone conversation.'),
(480, 1, 5, 'Vehicle', 'Vehicle', 'A vehicle is a device that is designed or used to transport people or cargo over land, water, air, or through space.'),
(481, 1, 5, 'TouristTrip', 'TouristTrip', 'A tourist trip. A created itinerary of visits to one or more places of interest ([[TouristAttraction]]/[[TouristDestination]]) often linked by a similar theme, geographic area, or interest to a particular [[touristType]]. The [UNWTO](http://www2.unwto.org/) defines tourism trip as the Trip taken by visitors.\n  (See examples below.)'),
(482, 1, 5, 'Report', 'Report', 'A Report generated by governmental or non-governmental organization.'),
(483, 1, 5, 'Taxon', 'Taxon', 'A set of organisms asserted to represent a natural cohesive biological unit.'),
(484, 1, 5, 'ArchiveOrganization', 'ArchiveOrganization', 'An organization with archival holdings. An organization which keeps and preserves archival material and typically makes it accessible to the public.'),
(485, 1, 5, 'DataFeedItem', 'DataFeedItem', 'A single item within a larger data feed.'),
(486, 1, 5, 'HowToItem', 'HowToItem', 'An item used as either a tool or supply when performing the instructions for how to achieve a result.'),
(487, 1, 5, 'PriceTypeEnumeration', 'PriceTypeEnumeration', 'Enumerates different price types, for example list price, invoice price, and sale price.'),
(488, 1, 5, 'ExerciseAction', 'ExerciseAction', 'The act of participating in exertive activity for the purposes of improving health and fitness.'),
(489, 1, 5, 'ScreeningEvent', 'ScreeningEvent', 'A screening of a movie or other video.'),
(490, 1, 5, 'PronounceableText', 'PronounceableText', 'Data type: PronounceableText.'),
(491, 1, 5, 'SportsOrganization', 'SportsOrganization', 'Represents the collection of all sports organizations, including sports teams, governing bodies, and sports associations.'),
(492, 1, 5, 'ActionStatusType', 'ActionStatusType', 'The status of an Action.'),
(493, 1, 5, 'IndividualProduct', 'IndividualProduct', 'A single, identifiable product instance (e.g. a laptop with a particular serial number).'),
(494, 1, 5, 'InteractionCounter', 'InteractionCounter', 'A summary of how users have interacted with this CreativeWork. In most cases, authors will use a subtype to specify the specific type of interaction.'),
(495, 1, 5, 'Event', 'Event', 'An event happening at a certain time and location, such as a concert, lecture, or festival. Ticketing information may be added via the [[offers]] property. Repeated events may be structured as separate Event objects.'),
(496, 1, 5, 'CookAction', 'CookAction', 'The act of producing/preparing food.'),
(497, 1, 5, 'HealthPlanCostSharingSpecification', 'HealthPlanCostSharingSpecification', 'A description of costs to the patient under a given network or formulary.'),
(498, 1, 5, 'EnergyStarEnergyEfficiencyEnumeration', 'EnergyStarEnergyEfficiencyEnumeration', 'Used to indicate whether a product is EnergyStar certified.'),
(499, 1, 5, 'MedicalAudienceType', 'MedicalAudienceType', 'Target audiences types for medical web pages. Enumerated type.'),
(500, 1, 5, 'SendAction', 'SendAction', 'The act of physically/electronically dispatching an object for transfer from an origin to a destination. Related actions:\\n\\n* [[ReceiveAction]]: The reciprocal of SendAction.\\n* [[GiveAction]]: Unlike GiveAction, SendAction does not imply the transfer of ownership (e.g. I can send you my laptop, but I\'m not necessarily giving it to you).'),
(501, 1, 5, 'RentAction', 'RentAction', 'The act of giving money in return for temporary use, but not ownership, of an object such as a vehicle or property. For example, an agent rents a property from a landlord in exchange for a periodic payment.'),
(502, 1, 5, 'Thesis', 'Thesis', 'A thesis or dissertation document submitted in support of candidature for an academic degree or professional qualification.'),
(503, 1, 5, 'EducationalOccupationalProgram', 'EducationalOccupationalProgram', 'A program offered by an institution which determines the learning progress to achieve an outcome, usually a credential like a degree or certificate. This would define a discrete set of opportunities (e.g., job, courses) that together constitute a program with a clear start, end, set of requirements, and transition to a new occupational opportunity (e.g., a job), or sometimes a higher educational opportunity (e.g., an advanced degree).'),
(504, 1, 5, 'OrderItem', 'OrderItem', 'An order item is a line of an order. It includes the quantity and shipping details of a bought offer.'),
(505, 1, 5, 'Audiobook', 'Audiobook', 'An audiobook.'),
(506, 1, 5, 'Duration', 'Duration', 'Quantity: Duration (use [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601)).'),
(507, 1, 5, 'CreateAction', 'CreateAction', 'The act of deliberately creating/producing/generating/building a result out of the agent.'),
(508, 1, 5, 'MedicalRiskFactor', 'MedicalRiskFactor', 'A risk factor is anything that increases a person\'s likelihood of developing or contracting a disease, medical condition, or complication.'),
(509, 1, 5, 'MenuItem', 'MenuItem', 'A food or drink item listed in a menu or menu section.'),
(510, 1, 5, 'PaymentStatusType', 'PaymentStatusType', 'A specific payment status. For example, PaymentDue, PaymentComplete, etc.'),
(511, 1, 5, 'MedicalDevicePurpose', 'MedicalDevicePurpose', 'Categories of medical devices, organized by the purpose or intended use of the device.'),
(512, 1, 5, 'PriceSpecification', 'PriceSpecification', 'A structured value representing a price or price range. Typically, only the subclasses of this type are used for markup. It is recommended to use [[MonetaryAmount]] to describe independent amounts of money such as a salary, credit card limits, etc.'),
(513, 1, 5, 'InvestmentOrDeposit', 'InvestmentOrDeposit', 'A type of financial product that typically requires the client to transfer funds to a financial service in return for potential beneficial financial return.'),
(514, 1, 5, 'AdministrativeArea', 'AdministrativeArea', 'A geographical region, typically under the jurisdiction of a particular government.'),
(515, 1, 5, 'CategoryCode', 'CategoryCode', 'A Category Code.'),
(516, 1, 5, 'Distance', 'Distance', 'Properties that take Distances as values are of the form \'&lt;Number&gt; &lt;Length unit of measure&gt;\'. E.g., \'7 ft\'.'),
(517, 1, 5, 'InfectiousDisease', 'InfectiousDisease', 'An infectious disease is a clinically evident human disease resulting from the presence of pathogenic microbial agents, like pathogenic viruses, pathogenic bacteria, fungi, protozoa, multicellular parasites, and prions. To be considered an infectious disease, such pathogens are known to be able to cause this disease.'),
(518, 1, 5, 'SizeSystemEnumeration', 'SizeSystemEnumeration', 'Enumerates common size systems for different categories of products, for example \"EN-13402\" or \"UK\" for wearables or \"Imperial\" for screws.'),
(519, 1, 5, 'AboutPage', 'AboutPage', 'Web page type: About page.'),
(520, 1, 5, 'MedicalSign', 'MedicalSign', 'Any physical manifestation of a person\'s medical condition discoverable by objective diagnostic tests or physical examination.'),
(521, 1, 5, 'HomeAndConstructionBusiness', 'HomeAndConstructionBusiness', 'A construction business.\\n\\nA HomeAndConstructionBusiness is a [[LocalBusiness]] that provides services around homes and buildings.\\n\\nAs a [[LocalBusiness]] it can be described as a [[provider]] of one or more [[Service]]\\(s).'),
(522, 1, 5, 'MedicalOrganization', 'MedicalOrganization', 'A medical organization (physical or not), such as hospital, institution or clinic.'),
(523, 1, 5, 'PlayGameAction', 'PlayGameAction', 'The act of playing a video game.'),
(524, 1, 5, 'Comment', 'Comment', 'A comment on an item - for example, a comment on a blog post. The comment\'s content is expressed via the [[text]] property, and its topic via [[about]], properties shared with all CreativeWorks.'),
(525, 1, 5, 'Class', 'Class', 'A class, also often called a \'Type\'; equivalent to rdfs:Class.'),
(526, 1, 5, 'BrainStructure', 'BrainStructure', 'Any anatomical structure which pertains to the soft nervous tissue functioning as the coordinating center of sensation and intellectual and nervous activity.'),
(527, 1, 5, 'RsvpResponseType', 'RsvpResponseType', 'RsvpResponseType is an enumeration type whose instances represent responding to an RSVP request.'),
(528, 1, 5, 'MusicRecording', 'MusicRecording', 'A music recording (track), usually a single song.'),
(529, 1, 5, 'BankAccount', 'BankAccount', 'A product or service offered by a bank whereby one may deposit, withdraw or transfer money and in some cases be paid interest.'),
(530, 1, 5, 'LegalValueLevel', 'LegalValueLevel', 'A list of possible levels for the legal validity of a legislation.'),
(531, 1, 5, 'WebContent', 'WebContent', 'WebContent is a type representing all [[WebPage]], [[WebSite]] and [[WebPageElement]] content. It is sometimes the case that detailed distinctions between Web pages, sites and their parts are not always important or obvious. The  [[WebContent]] type makes it easier to describe Web-addressable content without requiring such distinctions to always be stated. (The intent is that the existing types [[WebPage]], [[WebSite]] and [[WebPageElement]] will eventually be declared as subtypes of [[WebContent]].)'),
(532, 1, 5, 'AchieveAction', 'AchieveAction', 'The act of accomplishing something via previous efforts. It is an instantaneous action rather than an ongoing process.'),
(533, 1, 5, 'DefinedRegion', 'DefinedRegion', 'A DefinedRegion is a geographic area defined by potentially arbitrary (rather than political, administrative or natural geographical) criteria. Properties are provided for defining a region by reference to sets of postal codes.\n\nExamples: a delivery destination when shopping. Region where regional pricing is configured.\n\nRequirement 1:\nCountry: US\nStates: \"NY\", \"CA\"\n\nRequirement 2:\nCountry: US\nPostalCode Set: { [94000-94585], [97000, 97999], [13000, 13599]}\n{ [12345, 12345], [78945, 78945], }\nRegion = state, canton, prefecture, autonomous community...\n'),
(534, 1, 5, 'Artery', 'Artery', 'A type of blood vessel that specifically carries blood away from the heart.'),
(535, 1, 5, 'Accommodation', 'Accommodation', 'An accommodation is a place that can accommodate human beings, e.g. a hotel room, a camping pitch, or a meeting room. Many accommodations are for overnight stays, but this is not a mandatory requirement.\nFor more specific types of accommodations not defined in schema.org, one can use additionalType with external vocabularies.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(536, 1, 5, 'ComicStory', 'ComicStory', 'The term \"story\" is any indivisible, re-printable\n    	unit of a comic, including the interior stories, covers, and backmatter. Most\n    	comics have at least two stories: a cover (ComicCoverArt) and an interior story.'),
(537, 1, 5, 'UserInteraction', 'UserInteraction', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(538, 1, 5, 'FloorPlan', 'FloorPlan', 'A FloorPlan is an explicit representation of a collection of similar accommodations, allowing the provision of common information (room counts, sizes, layout diagrams) and offers for rental or sale. In typical use, some [[ApartmentComplex]] has an [[accommodationFloorPlan]] which is a [[FloorPlan]].  A FloorPlan is always in the context of a particular place, either a larger [[ApartmentComplex]] or a single [[Apartment]]. The visual/spatial aspects of a floor plan (i.e. room layout, [see wikipedia](https://en.wikipedia.org/wiki/Floor_plan)) can be indicated using [[image]]. '),
(539, 1, 5, 'CategoryCodeSet', 'CategoryCodeSet', 'A set of Category Code values.'),
(540, 1, 5, 'GovernmentOffice', 'GovernmentOffice', 'A government office&#x2014;for example, an IRS or DMV office.'),
(541, 1, 5, 'Corporation', 'Corporation', 'Organization: A business corporation.'),
(542, 1, 5, 'MedicalObservationalStudyDesign', 'MedicalObservationalStudyDesign', 'Design models for observational medical studies. Enumerated type.'),
(543, 1, 5, 'NLNonprofitType', 'NLNonprofitType', 'NLNonprofitType: Non-profit organization type originating from the Netherlands.'),
(544, 1, 5, 'LendAction', 'LendAction', 'The act of providing an object under an agreement that it will be returned at a later date. Reciprocal of BorrowAction.\\n\\nRelated actions:\\n\\n* [[BorrowAction]]: Reciprocal of LendAction.'),
(545, 1, 5, 'AudioObject', 'AudioObject', 'An audio file.'),
(546, 1, 5, 'AdultOrientedEnumeration', 'AdultOrientedEnumeration', 'Enumeration of considerations that make a product relevant or potentially restricted for adults only.'),
(547, 1, 5, 'AnatomicalStructure', 'AnatomicalStructure', 'Any part of the human body, typically a component of an anatomical system. Organs, tissues, and cells are all anatomical structures.'),
(548, 1, 5, 'Boolean', 'Boolean', 'Boolean: True or False.'),
(549, 1, 5, 'MedicalCondition', 'MedicalCondition', 'Any condition of the human body that affects the normal functioning of a person, whether physically or mentally. Includes diseases, injuries, disabilities, disorders, syndromes, etc.'),
(550, 1, 5, 'PublicationEvent', 'PublicationEvent', 'A PublicationEvent corresponds indifferently to the event of publication for a CreativeWork of any type, e.g. a broadcast event, an on-demand event, a book/journal publication via a variety of delivery media.'),
(551, 1, 5, 'MedicalGuideline', 'MedicalGuideline', 'Any recommendation made by a standard society (e.g. ACC/AHA) or consensus statement that denotes how to diagnose and treat a particular condition. Note: this type should be used to tag the actual guideline recommendation; if the guideline recommendation occurs in a larger scholarly article, use MedicalScholarlyArticle to tag the overall article, not this type. Note also: the organization making the recommendation should be captured in the recognizingAuthority base property of MedicalEntity.'),
(552, 1, 5, 'ChooseAction', 'ChooseAction', 'The act of expressing a preference from a set of options or a large or unbounded set of choices/options.'),
(553, 1, 5, 'RefundTypeEnumeration', 'RefundTypeEnumeration', 'Enumerates several kinds of product return refund types.'),
(554, 1, 5, 'GeoShape', 'GeoShape', 'The geographic shape of a place. A GeoShape can be described using several properties whose values are based on latitude/longitude pairs. Either whitespace or commas can be used to separate latitude and longitude; whitespace should be used when writing a list of several such points.'),
(555, 1, 5, 'AllocateAction', 'AllocateAction', 'The act of organizing tasks/objects/events by associating resources to it.'),
(556, 1, 5, 'InviteAction', 'InviteAction', 'The act of asking someone to attend an event. Reciprocal of RsvpAction.'),
(557, 1, 5, 'ExchangeRateSpecification', 'ExchangeRateSpecification', 'A structured value representing exchange rate.'),
(558, 1, 5, 'GovernmentBenefitsType', 'GovernmentBenefitsType', 'GovernmentBenefitsType enumerates several kinds of government benefits to support the COVID-19 situation. Note that this structure may not capture all benefits offered.'),
(559, 1, 5, 'PublicationIssue', 'PublicationIssue', 'A part of a successively published publication such as a periodical or publication volume, often numbered, usually containing a grouping of works such as articles.\\n\\nSee also [blog post](http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html).'),
(560, 1, 5, 'PhysicalActivity', 'PhysicalActivity', 'Any bodily activity that enhances or maintains physical fitness and overall health and wellness. Includes activity that is part of daily living and routine, structured exercise, and exercise prescribed as part of a medical treatment or recovery plan.'),
(561, 1, 5, 'MedicalSpecialty', 'MedicalSpecialty', 'Any specific branch of medical science or practice. Medical specialities include clinical specialties that pertain to particular organ systems and their respective disease states, as well as allied health specialties. Enumerated type.'),
(562, 1, 5, 'LoanOrCredit', 'LoanOrCredit', 'A financial product for the loaning of an amount of money, or line of credit, under agreed terms and charges.'),
(563, 1, 5, 'MedicalProcedure', 'MedicalProcedure', 'A process of care used in either a diagnostic, therapeutic, preventive or palliative capacity that relies on invasive (surgical), non-invasive, or other techniques.'),
(564, 1, 5, 'DrugClass', 'DrugClass', 'A class of medical drugs, e.g., statins. Classes can represent general pharmacological class, common mechanisms of action, common physiological effects, etc.'),
(565, 1, 5, 'TrainTrip', 'TrainTrip', 'A trip on a commercial train line.'),
(566, 1, 5, 'MerchantReturnEnumeration', 'MerchantReturnEnumeration', 'Enumerates several kinds of product return policies.'),
(567, 1, 5, 'OnlineBusiness', 'OnlineBusiness', 'A particular online business, either standalone or the online part of a broader organization. Examples include an eCommerce site, an online travel booking site, an online learning site, an online logistics and shipping provider, an online (virtual) doctor, etc.'),
(568, 1, 5, 'ReturnAction', 'ReturnAction', 'The act of returning to the origin that which was previously received (concrete objects) or taken (ownership).'),
(569, 1, 5, 'SomeProducts', 'SomeProducts', 'A placeholder for multiple similar products of the same kind.'),
(570, 1, 5, 'Course', 'Course', 'A description of an educational course which may be offered as distinct instances which take place at different times or take place at different locations, or be offered through different media or modes of study. An educational course is a sequence of one or more educational events and/or creative works which aims to build knowledge, competence or ability of learners.'),
(571, 1, 5, 'ProductCollection', 'ProductCollection', 'A set of products (either [[ProductGroup]]s or specific variants) that are listed together e.g. in an [[Offer]].'),
(572, 1, 5, 'DrugLegalStatus', 'DrugLegalStatus', 'The legal availability status of a medical drug.'),
(573, 1, 5, 'WearableSizeSystemEnumeration', 'WearableSizeSystemEnumeration', 'Enumerates common size systems specific for wearable products'),
(574, 1, 5, 'BusinessEntityType', 'BusinessEntityType', 'A business entity type is a conceptual entity representing the legal form, the size, the main line of business, the position in the value chain, or any combination thereof, of an organization or business person.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#Business\\n* http://purl.org/goodrelations/v1#Enduser\\n* http://purl.org/goodrelations/v1#PublicInstitution\\n* http://purl.org/goodrelations/v1#Reseller\n	  '),
(575, 1, 5, 'HealthPlanFormulary', 'HealthPlanFormulary', 'For a given health insurance plan, the specification for costs and coverage of prescription drugs. '),
(576, 1, 5, 'CDCPMDRecord', 'CDCPMDRecord', 'A CDCPMDRecord is a data structure representing a record in a CDC tabular data format\n      used for hospital data reporting. See [documentation](/docs/cdc-covid.html) for details, and the linked CDC materials for authoritative\n      definitions used as the source here.\n      '),
(577, 1, 5, 'WarrantyScope', 'WarrantyScope', 'A range of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#Labor-BringIn\\n* http://purl.org/goodrelations/v1#PartsAndLabor-BringIn\\n* http://purl.org/goodrelations/v1#PartsAndLabor-PickUp\n      '),
(578, 1, 5, 'Invoice', 'Invoice', 'A statement of the money due for goods or services; a bill.'),
(579, 1, 5, 'AssessAction', 'AssessAction', 'The act of forming one\'s opinion, reaction or sentiment.'),
(580, 1, 5, 'LegislationObject', 'LegislationObject', 'A specific object or file containing a Legislation. Note that the same Legislation can be published in multiple files. For example, a digitally signed PDF, a plain PDF and an HTML version.'),
(581, 1, 5, 'MovieSeries', 'MovieSeries', 'A series of movies. Included movies can be indicated with the hasPart property.'),
(582, 1, 5, 'ShippingDeliveryTime', 'ShippingDeliveryTime', 'ShippingDeliveryTime provides various pieces of information about delivery times for shipping.'),
(583, 1, 5, 'Occupation', 'Occupation', 'A profession, may involve prolonged training and/or a formal qualification.'),
(584, 1, 5, 'MediaGallery', 'MediaGallery', 'Web page type: Media gallery page. A mixed-media page that can contain media such as images, videos, and other multimedia.'),
(585, 1, 5, 'RecommendedDoseSchedule', 'RecommendedDoseSchedule', 'A recommended dosing schedule for a drug or supplement as prescribed or recommended by an authority or by the drug/supplement\'s manufacturer. Capture the recommending authority in the recognizingAuthority property of MedicalEntity.'),
(586, 1, 5, 'MedicalTest', 'MedicalTest', 'Any medical test, typically performed for diagnostic purposes.'),
(587, 1, 5, 'SoftwareSourceCode', 'SoftwareSourceCode', 'Computer programming source code. Example: Full (compile ready) solutions, code snippet samples, scripts, templates.'),
(588, 1, 5, 'ReservationPackage', 'ReservationPackage', 'A group of multiple reservations with common values for all sub-reservations.'),
(589, 1, 5, 'MediaManipulationRatingEnumeration', 'MediaManipulationRatingEnumeration', ' Codes for use with the [[mediaAuthenticityCategory]] property, indicating the authenticity of a media object (in the context of how it was published or shared). In general these codes are not mutually exclusive, although some combinations (such as \'original\' versus \'transformed\', \'edited\' and \'staged\') would be contradictory if applied in the same [[MediaReview]]. Note that the application of these codes is with regard to a piece of media shared or published in a particular context.'),
(590, 1, 5, 'LegalService', 'LegalService', 'A LegalService is a business that provides legally-oriented services, advice and representation, e.g. law firms.\\n\\nAs a [[LocalBusiness]] it can be described as a [[provider]] of one or more [[Service]]\\(s).'),
(591, 1, 5, 'ReturnLabelSourceEnumeration', 'ReturnLabelSourceEnumeration', 'Enumerates several types of return labels for product returns.'),
(592, 1, 5, 'TouristAttraction', 'TouristAttraction', 'A tourist attraction.  In principle any Thing can be a [[TouristAttraction]], from a [[Mountain]] and [[LandmarksOrHistoricalBuildings]] to a [[LocalBusiness]].  This Type can be used on its own to describe a general [[TouristAttraction]], or be used as an [[additionalType]] to add tourist attraction properties to any other type.  (See examples below)'),
(593, 1, 5, 'AnatomicalSystem', 'AnatomicalSystem', 'An anatomical system is a group of anatomical structures that work together to perform a certain task. Anatomical systems, such as organ systems, are one organizing principle of anatomy, and can include circulatory, digestive, endocrine, integumentary, immune, lymphatic, muscular, nervous, reproductive, respiratory, skeletal, urinary, vestibular, and other systems.'),
(594, 1, 5, 'ControlAction', 'ControlAction', 'An agent controls a device or application.'),
(595, 1, 5, 'RealEstateAgent', 'RealEstateAgent', 'A real-estate agent.'),
(596, 1, 5, 'Action', 'Action', 'An action performed by a direct agent and indirect participants upon a direct object. Optionally happens at a location with the help of an inanimate instrument. The execution of the action may produce a result. Specific action sub-type documentation specifies the exact expectation of each argument/role.\\n\\nSee also [blog post](http://blog.schema.org/2014/04/announcing-schemaorg-actions.html) and [Actions overview document](https://schema.org/docs/actions.html).'),
(597, 1, 5, 'WorkBasedProgram', 'WorkBasedProgram', 'A program with both an educational and employment component. Typically based at a workplace and structured around work-based learning, with the aim of instilling competencies related to an occupation. WorkBasedProgram is used to distinguish programs such as apprenticeships from school, college or other classroom based educational programs.'),
(598, 1, 5, 'PaymentChargeSpecification', 'PaymentChargeSpecification', 'The costs of settling the payment using a particular payment method.'),
(599, 1, 5, 'WarrantyPromise', 'WarrantyPromise', 'A structured value representing the duration and scope of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.'),
(600, 1, 5, 'SpecialAnnouncement', 'SpecialAnnouncement', 'A SpecialAnnouncement combines a simple date-stamped textual information update\n      with contextualized Web links and other structured data.  It represents an information update made by a\n      locally-oriented organization, for example schools, pharmacies, healthcare providers,  community groups, police,\n      local government.\n\nFor work in progress guidelines on Coronavirus-related markup see [this doc](https://docs.google.com/document/d/14ikaGCKxo50rRM7nvKSlbUpjyIk2WMQd3IkB1lItlrM/edit#).\n\nThe motivating scenario for SpecialAnnouncement is the [Coronavirus pandemic](https://en.wikipedia.org/wiki/2019%E2%80%9320_coronavirus_pandemic), and the initial vocabulary is oriented to this urgent situation. Schema.org\nexpect to improve the markup iteratively as it is deployed and as feedback emerges from use. In addition to our\nusual [Github entry](https://github.com/schemaorg/schemaorg/issues/2490), feedback comments can also be provided in [this document](https://docs.google.com/document/d/1fpdFFxk8s87CWwACs53SGkYv3aafSxz_DTtOQxMrBJQ/edit#).\n\n\nWhile this schema is designed to communicate urgent crisis-related information, it is not the same as an emergency warning technology like [CAP](https://en.wikipedia.org/wiki/Common_Alerting_Protocol), although there may be overlaps. The intent is to cover\nthe kinds of everyday practical information being posted to existing websites during an emergency situation.\n\nSeveral kinds of information can be provided:\n\nWe encourage the provision of \"name\", \"text\", \"datePosted\", \"expires\" (if appropriate), \"category\" and\n\"url\" as a simple baseline. It is important to provide a value for \"category\" where possible, most ideally as a well known\nURL from Wikipedia or Wikidata. In the case of the 2019-2020 Coronavirus pandemic, this should be \"https://en.wikipedia.org/w/index.php?title=2019-20\\_coronavirus\\_pandemic\" or \"https://www.wikidata.org/wiki/Q81068910\".\n\nFor many of the possible properties, values can either be simple links or an inline description, depending on whether a summary is available. For a link, provide just the URL of the appropriate page as the property\'s value. For an inline description, use a [[WebContent]] type, and provide the url as a property of that, alongside at least a simple \"[[text]]\" summary of the page. It is\nunlikely that a single SpecialAnnouncement will need all of the possible properties simultaneously.\n\nWe expect that in many cases the page referenced might contain more specialized structured data, e.g. contact info, [[openingHours]], [[Event]], [[FAQPage]] etc. By linking to those pages from a [[SpecialAnnouncement]] you can help make it clearer that the events are related to the situation (e.g. Coronavirus) indicated by the [[category]] property of the [[SpecialAnnouncement]].\n\nMany [[SpecialAnnouncement]]s will relate to particular regions and to identifiable local organizations. Use [[spatialCoverage]] for the region, and [[announcementLocation]] to indicate specific [[LocalBusiness]]es and [[CivicStructure]]s. If the announcement affects both a particular region and a specific location (for example, a library closure that serves an entire region), use both [[spatialCoverage]] and [[announcementLocation]].\n\nThe [[about]] property can be used to indicate entities that are the focus of the announcement. We now recommend using [[about]] only\nfor representing non-location entities (e.g. a [[Course]] or a [[RadioStation]]). For places, use [[announcementLocation]] and [[spatialCoverage]]. Consumers of this markup should be aware that the initial design encouraged the use of [[about]] for locations too.\n\nThe basic content of [[SpecialAnnouncement]] is similar to that of an [RSS](https://en.wikipedia.org/wiki/RSS) or [Atom](https://en.wikipedia.org/wiki/Atom_(Web_standard)) feed. For publishers without such feeds, basic feed-like information can be shared by posting\n[[SpecialAnnouncement]] updates in a page, e.g. using JSON-LD. For sites with Atom/RSS functionality, you can point to a feed\nwith the [[webFeed]] property. This can be a simple URL, or an inline [[DataFeed]] object, with [[encodingFormat]] providing\nmedia type information, e.g. \"application/rss+xml\" or \"application/atom+xml\".\n'),
(601, 1, 5, 'Claim', 'Claim', 'A [[Claim]] in Schema.org represents a specific, factually-oriented claim that could be the [[itemReviewed]] in a [[ClaimReview]]. The content of a claim can be summarized with the [[text]] property. Variations on well known claims can have their common identity indicated via [[sameAs]] links, and summarized with a [[name]]. Ideally, a [[Claim]] description includes enough contextual information to minimize the risk of ambiguity or inclarity. In practice, many claims are better understood in the context in which they appear or the interpretations provided by claim reviews.\n\n  Beyond [[ClaimReview]], the Claim type can be associated with related creative works - for example a [[ScholarlyArticle]] or [[Question]] might be [[about]] some [[Claim]].\n\n  At this time, Schema.org does not define any types of relationship between claims. This is a natural area for future exploration.\n  '),
(602, 1, 5, 'BedDetails', 'BedDetails', 'An entity holding detailed information about the available bed types, e.g. the quantity of twin beds for a hotel room. For the single case of just one bed of a certain type, you can use bed directly with a text. See also [[BedType]] (under development).'),
(603, 1, 5, 'Blog', 'Blog', 'A [blog](https://en.wikipedia.org/wiki/Blog), sometimes known as a \"weblog\". Note that the individual posts ([[BlogPosting]]s) in a [[Blog]] are often colloquially referred to by the same term.'),
(604, 1, 5, 'ReturnMethodEnumeration', 'ReturnMethodEnumeration', 'Enumerates several types of product return methods.'),
(605, 1, 5, 'DateTime', 'DateTime', 'A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (see Chapter 5.4 of ISO 8601).'),
(606, 1, 5, 'MedicalEntity', 'MedicalEntity', 'The most generic type of entity related to health and the practice of medicine.'),
(607, 1, 5, 'DataType', 'DataType', 'The basic data types such as Integers, Strings, etc.'),
(608, 1, 5, 'PriceComponentTypeEnumeration', 'PriceComponentTypeEnumeration', 'Enumerates different price components that together make up the total price for an offered product.'),
(609, 1, 5, 'ComicIssue', 'ComicIssue', 'Individual comic issues are serially published as\n    	part of a larger series. For the sake of consistency, even one-shot issues\n    	belong to a series comprised of a single issue. All comic issues can be\n    	uniquely identified by: the combination of the name and volume number of the\n    	series to which the issue belongs; the issue number; and the variant\n    	description of the issue (if any).'),
(610, 1, 5, 'MoveAction', 'MoveAction', 'The act of an agent relocating to a place.\\n\\nRelated actions:\\n\\n* [[TransferAction]]: Unlike TransferAction, the subject of the move is a living Person or Organization rather than an inanimate object.'),
(611, 1, 5, 'TaxiService', 'TaxiService', 'A service for a vehicle for hire with a driver for local travel. Fares are usually calculated based on distance traveled.'),
(612, 1, 5, 'DatedMoneySpecification', 'DatedMoneySpecification', 'A DatedMoneySpecification represents monetary values with optional start and end dates. For example, this could represent an employee\'s salary over a specific period of time. __Note:__ This type has been superseded by [[MonetaryAmount]], use of that type is recommended.'),
(613, 1, 5, 'TravelAction', 'TravelAction', 'The act of traveling from a fromLocation to a destination by a specified mode of transport, optionally with participants.'),
(614, 1, 5, 'Time', 'Time', 'A point in time recurring on multiple days in the form hh:mm:ss[Z|(+|-)hh:mm] (see [XML schema for details](http://www.w3.org/TR/xmlschema-2/#time)).'),
(615, 1, 5, 'MedicalObservationalStudy', 'MedicalObservationalStudy', 'An observational study is a type of medical study that attempts to infer the possible effect of a treatment through observation of a cohort of subjects over a period of time. In an observational study, the assignment of subjects into treatment groups versus control groups is outside the control of the investigator. This is in contrast with controlled studies, such as the randomized controlled trials represented by MedicalTrial, where each subject is randomly assigned to a treatment group or a control group before the start of the treatment.'),
(616, 1, 5, 'Chapter', 'Chapter', 'One of the sections into which a book is divided. A chapter usually has a section number or a name.'),
(617, 1, 5, 'DrugCostCategory', 'DrugCostCategory', 'Enumerated categories of medical drug costs.'),
(618, 1, 5, 'PodcastSeries', 'PodcastSeries', 'A podcast is an episodic series of digital audio or video files which a user can download and listen to.'),
(619, 1, 5, 'Flight', 'Flight', 'An airline flight.'),
(620, 1, 5, 'MusicReleaseFormatType', 'MusicReleaseFormatType', 'Format of this release (the type of recording media used, i.e. compact disc, digital media, LP, etc.).'),
(621, 1, 5, 'CriticReview', 'CriticReview', 'A [[CriticReview]] is a more specialized form of Review written or published by a source that is recognized for its reviewing activities. These can include online columns, travel and food guides, TV and radio shows, blogs and other independent Web sites. [[CriticReview]]s are typically more in-depth and professionally written. For simpler, casually written user/visitor/viewer/customer reviews, it is more appropriate to use the [[UserReview]] type. Review aggregator sites such as Metacritic already separate out the site\'s user reviews from selected critic reviews that originate from third-party sources.'),
(622, 1, 5, 'MediaReview', 'MediaReview', 'A [[MediaReview]] is a more specialized form of Review dedicated to the evaluation of media content online, typically in the context of fact-checking and misinformation.\n    For more general reviews of media in the broader sense, use [[UserReview]], [[CriticReview]] or other [[Review]] types. This definition is\n    a work in progress. While the [[MediaManipulationRatingEnumeration]] list reflects significant community review amongst fact-checkers and others working\n    to combat misinformation, the specific structures for representing media objects, their versions and publication context, are still evolving. Similarly, best practices for the relationship between [[MediaReview]] and [[ClaimReview]] markup have not yet been finalized.'),
(623, 1, 5, 'EmergencyService', 'EmergencyService', 'An emergency service, such as a fire station or ER.'),
(624, 1, 5, 'PayAction', 'PayAction', 'An agent pays a price to a participant.'),
(625, 1, 5, 'Map', 'Map', 'A map.'),
(626, 1, 5, 'Protein', 'Protein', 'Protein is here used in its widest possible definition, as classes of amino acid based molecules. Amyloid-beta Protein in human (UniProt P05067), eukaryota (e.g. an OrthoDB group) or even a single molecule that one can point to are all of type schema:Protein. A protein can thus be a subclass of another protein, e.g. schema:Protein as a UniProt record can have multiple isoforms inside it which would also be schema:Protein. They can be imagined, synthetic, hypothetical or naturally occurring.'),
(627, 1, 5, 'ConsumeAction', 'ConsumeAction', 'The act of ingesting information/resources/food.'),
(628, 1, 5, 'MedicalImagingTechnique', 'MedicalImagingTechnique', 'Any medical imaging modality typically used for diagnostic purposes. Enumerated type.'),
(629, 1, 5, 'SolveMathAction', 'SolveMathAction', 'The action that takes in a math expression and directs users to a page potentially capable of solving/simplifying that expression.'),
(630, 1, 5, 'DriveWheelConfigurationValue', 'DriveWheelConfigurationValue', 'A value indicating which roadwheels will receive torque.'),
(631, 1, 5, 'MedicalClinic', 'MedicalClinic', 'A facility, often associated with a hospital or medical school, that is devoted to the specific diagnosis and/or healthcare. Previously limited to outpatients but with evolution it may be open to inpatients as well.'),
(632, 1, 5, 'Question', 'Question', 'A specific question - e.g. from a user seeking answers online, or collected in a Frequently Asked Questions (FAQ) document.'),
(633, 1, 5, 'BroadcastFrequencySpecification', 'BroadcastFrequencySpecification', 'The frequency in MHz and the modulation used for a particular BroadcastService.'),
(634, 1, 5, 'DeliveryMethod', 'DeliveryMethod', 'A delivery method is a standardized procedure for transferring the product or service to the destination of fulfillment chosen by the customer. Delivery methods are characterized by the means of transportation used, and by the organization or group that is the contracting party for the sending organization or person.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#DeliveryModeDirectDownload\\n* http://purl.org/goodrelations/v1#DeliveryModeFreight\\n* http://purl.org/goodrelations/v1#DeliveryModeMail\\n* http://purl.org/goodrelations/v1#DeliveryModeOwnFleet\\n* http://purl.org/goodrelations/v1#DeliveryModePickUp\\n* http://purl.org/goodrelations/v1#DHL\\n* http://purl.org/goodrelations/v1#FederalExpress\\n* http://purl.org/goodrelations/v1#UPS\n        '),
(635, 1, 5, 'Drug', 'Drug', 'A chemical or biologic substance, used as a medical therapy, that has a physiological effect on an organism. Here the term drug is used interchangeably with the term medicine although clinical knowledge makes a clear difference between them.'),
(636, 1, 5, 'ItemList', 'ItemList', 'A list of items of any sort&#x2014;for example, Top 10 Movies About Weathermen, or Top 100 Party Songs. Not to be confused with HTML lists, which are often used only for formatting.'),
(637, 1, 5, 'PerformAction', 'PerformAction', 'The act of participating in performance arts.'),
(638, 1, 5, 'DigitalDocumentPermission', 'DigitalDocumentPermission', 'A permission for a particular person or group to access a particular file.'),
(639, 1, 5, 'Guide', 'Guide', '[[Guide]] is a page or article that recommends specific products or services, or aspects of a thing for a user to consider. A [[Guide]] may represent a Buying Guide and detail aspects of products or services for a user to consider. A [[Guide]] may represent a Product Guide and recommend specific products or services. A [[Guide]] may represent a Ranked List and recommend specific products or services with ranking.'),
(640, 1, 5, 'SocialMediaPosting', 'SocialMediaPosting', 'A post to a social media platform, including blog posts, tweets, Facebook posts, etc.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(641, 1, 5, 'TherapeuticProcedure', 'TherapeuticProcedure', 'A medical procedure intended primarily for therapeutic purposes, aimed at improving a health condition.'),
(642, 1, 5, 'BoatTerminal', 'BoatTerminal', 'A terminal for boats, ships, and other water vessels.'),
(643, 1, 5, 'Quotation', 'Quotation', 'A quotation. Often but not necessarily from some written work, attributable to a real world author and - if associated with a fictional character - to any fictional Person. Use [[isBasedOn]] to link to source/origin. The [[recordedIn]] property can be used to reference a Quotation from an [[Event]].'),
(644, 1, 5, 'PublicationVolume', 'PublicationVolume', 'A part of a successively published publication such as a periodical or multi-volume work, often numbered. It may represent a time span, such as a year.\\n\\nSee also [blog post](http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html).'),
(645, 1, 5, 'WebApplication', 'WebApplication', 'Web applications.'),
(646, 1, 5, 'Substance', 'Substance', 'Any matter of defined composition that has discrete existence, whose origin may be biological, mineral or chemical.'),
(647, 1, 5, 'CssSelectorType', 'CssSelectorType', 'Text representing a CSS selector.'),
(648, 1, 5, 'BroadcastService', 'BroadcastService', 'A delivery service through which content is provided via broadcast over the air or online.'),
(649, 1, 5, 'Place', 'Place', 'Entities that have a somewhat fixed, physical extension.'),
(650, 1, 5, 'MaximumDoseSchedule', 'MaximumDoseSchedule', 'The maximum dosing schedule considered safe for a drug or supplement as recommended by an authority or by the drug/supplement\'s manufacturer. Capture the recommending authority in the recognizingAuthority property of MedicalEntity.'),
(651, 1, 5, 'UKNonprofitType', 'UKNonprofitType', 'UKNonprofitType: Non-profit organization type originating from the United Kingdom.'),
(652, 1, 5, 'DrugPregnancyCategory', 'DrugPregnancyCategory', 'Categories that represent an assessment of the risk of fetal injury due to a drug or pharmaceutical used as directed by the mother during pregnancy.'),
(653, 1, 5, 'EmployeeRole', 'EmployeeRole', 'A subclass of OrganizationRole used to describe employee relationships.'),
(654, 1, 5, 'Mass', 'Mass', 'Properties that take Mass as values are of the form \'&lt;Number&gt; &lt;Mass unit of measure&gt;\'. E.g., \'7 kg\'.'),
(655, 1, 5, 'MedicalTestPanel', 'MedicalTestPanel', 'Any collection of tests commonly ordered together.'),
(656, 1, 5, 'FinancialService', 'FinancialService', 'Financial services business.'),
(657, 1, 5, 'CarUsageType', 'CarUsageType', 'A value indicating a special usage of a car, e.g. commercial rental, driving school, or as a taxi.'),
(658, 1, 5, 'DietarySupplement', 'DietarySupplement', 'A product taken by mouth that contains a dietary ingredient intended to supplement the diet. Dietary ingredients may include vitamins, minerals, herbs or other botanicals, amino acids, and substances such as enzymes, organ tissues, glandulars and metabolites.'),
(659, 1, 5, 'StatusEnumeration', 'StatusEnumeration', 'Lists or enumerations dealing with status types.'),
(660, 1, 5, 'InteractAction', 'InteractAction', 'The act of interacting with another person or organization.'),
(661, 1, 5, 'CivicStructure', 'CivicStructure', 'A public structure, such as a town hall or concert hall.'),
(662, 1, 5, 'MedicalContraindication', 'MedicalContraindication', 'A condition or factor that serves as a reason to withhold a certain medical therapy. Contraindications can be absolute (there are no reasonable circumstances for undertaking a course of action) or relative (the patient is at higher risk of complications, but these risks may be outweighed by other considerations or mitigated by other measures).'),
(663, 1, 5, 'LeaveAction', 'LeaveAction', 'An agent leaves an event / group with participants/friends at a location.\\n\\nRelated actions:\\n\\n* [[JoinAction]]: The antonym of LeaveAction.\\n* [[UnRegisterAction]]: Unlike UnRegisterAction, LeaveAction implies leaving a group/team of people rather than a service.'),
(664, 1, 5, 'AskAction', 'AskAction', 'The act of posing a question / favor to someone.\\n\\nRelated actions:\\n\\n* [[ReplyAction]]: Appears generally as a response to AskAction.'),
(665, 1, 5, 'OrderStatus', 'OrderStatus', 'Enumerated status values for Order.'),
(666, 1, 5, 'CorrectionComment', 'CorrectionComment', 'A [[comment]] that corrects [[CreativeWork]].'),
(667, 1, 5, 'RestrictedDiet', 'RestrictedDiet', 'A diet restricted to certain foods or preparations for cultural, religious, health or lifestyle reasons. '),
(668, 1, 5, 'Text', 'Text', 'Data type: Text.'),
(669, 1, 5, 'CollectionPage', 'CollectionPage', 'Web page type: Collection page.'),
(670, 1, 5, 'MusicComposition', 'MusicComposition', 'A musical composition.'),
(671, 1, 5, 'LodgingBusiness', 'LodgingBusiness', 'A lodging business, such as a motel, hotel, or inn.'),
(672, 1, 5, 'OrderAction', 'OrderAction', 'An agent orders an object/product/service to be delivered/sent.'),
(673, 1, 5, 'VideoObject', 'VideoObject', 'A video file.'),
(674, 1, 5, 'MedicalCause', 'MedicalCause', 'The causative agent(s) that are responsible for the pathophysiologic process that eventually results in a medical condition, symptom or sign. In this schema, unless otherwise specified this is meant to be the proximate cause of the medical condition, symptom or sign. The proximate cause is defined as the causative agent that most directly results in the medical condition, symptom or sign. For example, the HIV virus could be considered a cause of AIDS. Or in a diagnostic context, if a patient fell and sustained a hip fracture and two days later sustained a pulmonary embolism which eventuated in a cardiac arrest, the cause of the cardiac arrest (the proximate cause) would be the pulmonary embolism and not the fall. Medical causes can include cardiovascular, chemical, dermatologic, endocrine, environmental, gastroenterologic, genetic, hematologic, gynecologic, iatrogenic, infectious, musculoskeletal, neurologic, nutritional, obstetric, oncologic, otolaryngologic, pharmacologic, psychiatric, pulmonary, renal, rheumatologic, toxic, traumatic, or urologic causes; medical conditions can be causes as well.'),
(675, 1, 5, 'TouristDestination', 'TouristDestination', 'A tourist destination. In principle any [[Place]] can be a [[TouristDestination]] from a [[City]], Region or [[Country]] to an [[AmusementPark]] or [[Hotel]]. This Type can be used on its own to describe a general [[TouristDestination]], or be used as an [[additionalType]] to add tourist relevant properties to any other [[Place]].  A [[TouristDestination]] is defined as a [[Place]] that contains, or is colocated with, one or more [[TouristAttraction]]s, often linked by a similar theme or interest to a particular [[touristType]]. The [UNWTO](http://www2.unwto.org/) defines Destination (main destination of a tourism trip) as the place visited that is central to the decision to take the trip.\n  (See examples below.)'),
(676, 1, 5, 'PhysicalExam', 'PhysicalExam', 'A type of physical examination of a patient performed by a physician. '),
(677, 1, 5, 'LegalForceStatus', 'LegalForceStatus', 'A list of possible statuses for the legal force of a legislation.'),
(678, 1, 5, 'ItemListOrderType', 'ItemListOrderType', 'Enumerated for values for itemListOrder for indicating how an ordered ItemList is organized.'),
(679, 1, 5, 'SportsEvent', 'SportsEvent', 'Event type: Sports event.'),
(680, 1, 5, 'WearableMeasurementTypeEnumeration', 'WearableMeasurementTypeEnumeration', 'Enumerates common types of measurement for wearables products.'),
(681, 1, 5, 'Patient', 'Patient', 'A patient is any person recipient of health care services.'),
(682, 1, 5, 'Store', 'Store', 'A retail good store.'),
(683, 1, 5, 'NonprofitType', 'NonprofitType', 'NonprofitType enumerates several kinds of official non-profit types of which a non-profit organization can be.'),
(684, 1, 5, '3DModel', '3DModel', 'A 3D model represents some kind of 3D content, which may have [[encoding]]s in one or more [[MediaObject]]s. Many 3D formats are available (e.g. see [Wikipedia](https://en.wikipedia.org/wiki/Category:3D_graphics_file_formats)); specific encoding formats can be represented using the [[encodingFormat]] property applied to the relevant [[MediaObject]]. For the\ncase of a single file published after Zip compression, the convention of appending \'+zip\' to the [[encodingFormat]] can be used. Geospatial, AR/VR, artistic/animation, gaming, engineering and scientific content can all be represented using [[3DModel]].'),
(685, 1, 5, 'Car', 'Car', 'A car is a wheeled, self-powered motor vehicle used for transportation.'),
(686, 1, 5, 'DayOfWeek', 'DayOfWeek', 'The day of the week, e.g. used to specify to which day the opening hours of an OpeningHoursSpecification refer.\n\nOriginally, URLs from [GoodRelations](http://purl.org/goodrelations/v1) were used (for [[Monday]], [[Tuesday]], [[Wednesday]], [[Thursday]], [[Friday]], [[Saturday]], [[Sunday]] plus a special entry for [[PublicHolidays]]); these have now been integrated directly into schema.org.\n      '),
(687, 1, 5, 'TypeAndQuantityNode', 'TypeAndQuantityNode', 'A structured value indicating the quantity, unit of measurement, and business function of goods included in a bundle offer.'),
(688, 1, 5, 'ShippingRateSettings', 'ShippingRateSettings', 'A ShippingRateSettings represents re-usable pieces of shipping information. It is designed for publication on an URL that may be referenced via the [[shippingSettingsLink]] property of an [[OfferShippingDetails]]. Several occurrences can be published, distinguished and matched (i.e. identified/referenced) by their different values for [[shippingLabel]].'),
(689, 1, 5, 'PaymentCard', 'PaymentCard', 'A payment method using a credit, debit, store or other card to associate the payment with an account.'),
(690, 1, 5, 'MedicalStudy', 'MedicalStudy', 'A medical study is an umbrella type covering all kinds of research studies relating to human medicine or health, including observational studies and interventional trials and registries, randomized, controlled or not. When the specific type of study is known, use one of the extensions of this type, such as MedicalTrial or MedicalObservationalStudy. Also, note that this type should be used to mark up data that describes the study itself; to tag an article that publishes the results of a study, use MedicalScholarlyArticle. Note: use the code property of MedicalEntity to store study IDs, e.g. clinicaltrials.gov ID.'),
(691, 1, 5, 'MortgageLoan', 'MortgageLoan', 'A loan in which property or real estate is used as collateral. (A loan securitized against some real estate.)'),
(692, 1, 5, 'Collection', 'Collection', 'A collection of items, e.g. creative works or products.'),
(693, 1, 5, 'InfectiousAgentClass', 'InfectiousAgentClass', 'Classes of agents or pathogens that transmit infectious diseases. Enumerated type.'),
(694, 1, 5, 'APIReference', 'APIReference', 'Reference documentation for application programming interfaces (APIs).'),
(695, 1, 5, 'Country', 'Country', 'A country.'),
(696, 1, 5, 'PropertyValue', 'PropertyValue', 'A property-value pair, e.g. representing a feature of a product or place. Use the \'name\' property for the name of the property. If there is an additional human-readable version of the value, put that into the \'description\' property.\\n\\n Always use specific schema.org properties when a) they exist and b) you can populate them. Using PropertyValue as a substitute will typically not trigger the same effect as using the original, specific property.\n    '),
(697, 1, 5, 'HowToSupply', 'HowToSupply', 'A supply consumed when performing the instructions for how to achieve a result.'),
(698, 1, 5, 'StatisticalPopulation', 'StatisticalPopulation', 'A StatisticalPopulation is a set of instances of a certain given type that satisfy some set of constraints. The property [[populationType]] is used to specify the type. Any property that can be used on instances of that type can appear on the statistical population. For example, a [[StatisticalPopulation]] representing all [[Person]]s with a [[homeLocation]] of East Podunk California would be described by applying the appropriate [[homeLocation]] and [[populationType]] properties to a [[StatisticalPopulation]] item that stands for that set of people.\nThe properties [[numConstraints]] and [[constrainingProperty]] are used to specify which of the populations properties are used to specify the population. Note that the sense of \"population\" used here is the general sense of a statistical\npopulation, and does not imply that the population consists of people. For example, a [[populationType]] of [[Event]] or [[NewsArticle]] could be used. See also [[Observation]], and the [data and datasets](/docs/data-and-datasets.html) overview for more details.\n  '),
(699, 1, 5, 'Periodical', 'Periodical', 'A publication in any medium issued in successive parts bearing numerical or chronological designations and intended to continue indefinitely, such as a magazine, scholarly journal, or newspaper.\\n\\nSee also [blog post](http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html).'),
(700, 1, 5, 'Hospital', 'Hospital', 'A hospital.'),
(701, 1, 5, 'WebAPI', 'WebAPI', 'An application programming interface accessible over Web/Internet technologies.'),
(702, 1, 5, 'ActionAccessSpecification', 'ActionAccessSpecification', 'A set of requirements that must be fulfilled in order to perform an Action.'),
(703, 1, 5, 'QualitativeValue', 'QualitativeValue', 'A predefined value for a product characteristic, e.g. the power cord plug type \'US\' or the garment sizes \'S\', \'M\', \'L\', and \'XL\'.'),
(704, 1, 5, 'BroadcastChannel', 'BroadcastChannel', 'A unique instance of a BroadcastService on a CableOrSatelliteService lineup.'),
(705, 1, 5, 'WriteAction', 'WriteAction', 'The act of authoring written creative content.'),
(706, 1, 5, 'Rating', 'Rating', 'A rating is an evaluation on a numeric scale, such as 1 to 5 stars.'),
(707, 1, 5, 'Trip', 'Trip', 'A trip or journey. An itinerary of visits to one or more places.'),
(708, 1, 5, 'TradeAction', 'TradeAction', 'The act of participating in an exchange of goods and services for monetary compensation. An agent trades an object, product or service with a participant in exchange for a one time or periodic payment.'),
(709, 1, 5, 'GeospatialGeometry', 'GeospatialGeometry', '(Eventually to be defined as) a supertype of GeoShape designed to accommodate definitions from Geo-Spatial best practices.'),
(710, 1, 5, 'EnergyEfficiencyEnumeration', 'EnergyEfficiencyEnumeration', 'Enumerates energy efficiency levels (also known as \"classes\" or \"ratings\") and certifications that are part of several international energy efficiency standards.'),
(711, 1, 5, 'DataDownload', 'DataDownload', 'All or part of a [[Dataset]] in downloadable form. '),
(712, 1, 5, 'ReturnFeesEnumeration', 'ReturnFeesEnumeration', 'Enumerates several kinds of policies for product return fees.'),
(713, 1, 5, 'LinkRole', 'LinkRole', 'A Role that represents a Web link, e.g. as expressed via the \'url\' property. Its linkRelationship property can indicate URL-based and plain textual link types, e.g. those in IANA link registry or others such as \'amphtml\'. This structure provides a placeholder where details from HTML\'s link element can be represented outside of HTML, e.g. in JSON-LD feeds.'),
(714, 1, 5, 'NewsArticle', 'NewsArticle', 'A NewsArticle is an article whose content reports news, or provides background context and supporting materials for understanding the news.\n\nA more detailed overview of [schema.org News markup](/docs/news.html) is also available.\n'),
(715, 1, 5, 'Game', 'Game', 'The Game type represents things which are games. These are typically rule-governed recreational activities, e.g. role-playing games in which players assume the role of characters in a fictional setting.'),
(716, 1, 5, 'ParcelDelivery', 'ParcelDelivery', 'The delivery of a parcel either via the postal service or a commercial service.'),
(717, 1, 5, 'GameServerStatus', 'GameServerStatus', 'Status of a game server.'),
(718, 1, 5, 'Demand', 'Demand', 'A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services. For describing demand using this type, the very same properties used for Offer apply.'),
(719, 1, 5, 'MathSolver', 'MathSolver', 'A math solver which is capable of solving a subset of mathematical problems.'),
(720, 1, 5, 'WebPageElement', 'WebPageElement', 'A web page element, like a table or an image.'),
(721, 1, 5, 'MedicalGuidelineRecommendation', 'MedicalGuidelineRecommendation', 'A guideline recommendation that is regarded as efficacious and where quality of the data supporting the recommendation is sound.'),
(722, 1, 5, 'TVSeason', 'TVSeason', 'Season dedicated to TV broadcast and associated online delivery.'),
(723, 1, 5, 'SearchAction', 'SearchAction', 'The act of searching for an object.\\n\\nRelated actions:\\n\\n* [[FindAction]]: SearchAction generally leads to a FindAction, but not necessarily.'),
(724, 1, 5, 'CableOrSatelliteService', 'CableOrSatelliteService', 'A service which provides access to media programming like TV or radio. Access may be via cable or satellite.'),
(725, 1, 5, 'MonetaryAmountDistribution', 'MonetaryAmountDistribution', 'A statistical distribution of monetary amounts.'),
(726, 1, 5, 'BusStop', 'BusStop', 'A bus stop.'),
(727, 1, 5, 'ExercisePlan', 'ExercisePlan', 'Fitness-related activity designed for a specific health-related purpose, including defined exercise routines as well as activity prescribed by a clinician.'),
(728, 1, 5, 'Photograph', 'Photograph', 'A photograph.'),
(729, 1, 5, 'MenuSection', 'MenuSection', 'A sub-grouping of food or drink items in a menu. E.g. courses (such as \'Dinner\', \'Breakfast\', etc.), specific type of dishes (such as \'Meat\', \'Vegan\', \'Drinks\', etc.), or some other classification made by the menu provider.'),
(730, 1, 5, 'Order', 'Order', 'An order is a confirmation of a transaction (a receipt), which can contain multiple line items, each represented by an Offer that has been accepted by the customer.'),
(731, 1, 5, 'AlignmentObject', 'AlignmentObject', 'An intangible item that describes an alignment between a learning resource and a node in an educational framework.\n\nShould not be used where the nature of the alignment can be described using a simple property, for example to express that a resource [[teaches]] or [[assesses]] a competency.'),
(732, 1, 5, 'Legislation', 'Legislation', 'A legal document such as an act, decree, bill, etc. (enforceable or not) or a component of a legal act (like an article).'),
(733, 1, 5, 'ApartmentComplex', 'ApartmentComplex', 'Residence type: Apartment complex.'),
(734, 1, 5, 'WearableSizeGroupEnumeration', 'WearableSizeGroupEnumeration', 'Enumerates common size groups (also known as \"size types\") for wearable products.'),
(735, 1, 5, 'Project', 'Project', 'An enterprise (potentially individual but typically collaborative), planned to achieve a particular aim.\nUse properties from [[Organization]], [[subOrganization]]/[[parentOrganization]] to indicate project sub-structures. \n   '),
(736, 1, 5, 'DefinedTermSet', 'DefinedTermSet', 'A set of defined terms, for example a set of categories or a classification scheme, a glossary, dictionary or enumeration.'),
(737, 1, 5, 'SteeringPositionValue', 'SteeringPositionValue', 'A value indicating a steering position.'),
(738, 1, 5, 'BusTrip', 'BusTrip', 'A trip on a commercial bus line.'),
(739, 1, 5, 'DeliveryTimeSettings', 'DeliveryTimeSettings', 'A DeliveryTimeSettings represents re-usable pieces of shipping information, relating to timing. It is designed for publication on an URL that may be referenced via the [[shippingSettingsLink]] property of an [[OfferShippingDetails]]. Several occurrences can be published, distinguished (and identified/referenced) by their different values for [[transitTimeLabel]].'),
(740, 1, 5, 'OfferCatalog', 'OfferCatalog', 'An OfferCatalog is an ItemList that contains related Offers and/or further OfferCatalogs that are offeredBy the same provider.'),
(741, 1, 5, 'MedicalTrialDesign', 'MedicalTrialDesign', 'Design models for medical trials. Enumerated type.'),
(742, 1, 5, 'CoverArt', 'CoverArt', 'The artwork on the outer surface of a CreativeWork.'),
(743, 1, 5, 'PhysicalActivityCategory', 'PhysicalActivityCategory', 'Categories of physical activity, organized by physiologic classification.'),
(744, 1, 5, 'Product', 'Product', 'Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.'),
(745, 1, 5, 'InsertAction', 'InsertAction', 'The act of adding at a specific location in an ordered collection.'),
(746, 1, 5, 'BuyAction', 'BuyAction', 'The act of giving money to a seller in exchange for goods or services rendered. An agent buys an object, product, or service from a seller for a price. Reciprocal of SellAction.'),
(747, 1, 5, 'MoneyTransfer', 'MoneyTransfer', 'The act of transferring money from one place to another place. This may occur electronically or physically.'),
(748, 1, 5, 'MapCategoryType', 'MapCategoryType', 'An enumeration of several kinds of Map.'),
(749, 1, 5, 'SoftwareApplication', 'SoftwareApplication', 'A software application.'),
(750, 1, 5, 'BreadcrumbList', 'BreadcrumbList', 'A BreadcrumbList is an ItemList consisting of a chain of linked Web pages, typically described using at least their URL and their name, and typically ending with the current page.\\n\\nThe [[position]] property is used to reconstruct the order of the items in a BreadcrumbList. The convention is that a breadcrumb list has an [[itemListOrder]] of [[ItemListOrderAscending]] (lower values listed first), and that the first items in this list correspond to the \"top\" or beginning of the breadcrumb trail, e.g. with a site or section homepage. The specific values of \'position\' are not assigned meaning for a BreadcrumbList, but they should be integers, e.g. beginning with \'1\' for the first item in the list.\n      '),
(751, 1, 5, 'ItemAvailability', 'ItemAvailability', 'A list of possible product availability options.'),
(752, 1, 5, 'Airline', 'Airline', 'An organization that provides flights for passengers.'),
(753, 1, 5, 'BoatTrip', 'BoatTrip', 'A trip on a commercial ferry line.'),
(754, 1, 5, 'SpeakableSpecification', 'SpeakableSpecification', 'A SpeakableSpecification indicates (typically via [[xpath]] or [[cssSelector]]) sections of a document that are highlighted as particularly [[speakable]]. Instances of this type are expected to be used primarily as values of the [[speakable]] property.'),
(755, 1, 5, 'HealthAndBeautyBusiness', 'HealthAndBeautyBusiness', 'Health and beauty.'),
(756, 1, 5, 'MonetaryGrant', 'MonetaryGrant', 'A monetary grant.'),
(757, 1, 5, 'Article', 'Article', 'An article, such as a news article or piece of investigative report. Newspapers and magazines have articles of many different types and this is intended to cover them all.\\n\\nSee also [blog post](http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html).'),
(758, 1, 5, 'OpeningHoursSpecification', 'OpeningHoursSpecification', 'A structured value providing information about the opening hours of a place or a certain service inside a place.\\n\\n\nThe place is __open__ if the [[opens]] property is specified, and __closed__ otherwise.\\n\\nIf the value for the [[closes]] property is less than the value for the [[opens]] property then the hour range is assumed to span over the next day.\n      '),
(759, 1, 5, 'Audience', 'Audience', 'Intended audience for an item, i.e. the group for whom the item was created.'),
(760, 1, 5, 'ClaimReview', 'ClaimReview', 'A fact-checking review of claims made (or reported) in some creative work (referenced via itemReviewed).'),
(761, 1, 5, 'EducationalOrganization', 'EducationalOrganization', 'An educational organization.'),
(762, 1, 5, 'LodgingReservation', 'LodgingReservation', 'A reservation for lodging at a hotel, motel, inn, etc.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(763, 1, 5, 'DataFeed', 'DataFeed', 'A single feed providing structured information about one or more entities or topics.'),
(764, 1, 5, 'HealthPlanNetwork', 'HealthPlanNetwork', 'A US-style health insurance plan network. '),
(765, 1, 5, 'HowToDirection', 'HowToDirection', 'A direction indicating a single action to do in the instructions for how to achieve a result.'),
(766, 1, 5, 'MedicalAudience', 'MedicalAudience', 'Target audiences for medical web pages.'),
(767, 1, 5, 'BioChemEntity', 'BioChemEntity', 'Any biological, chemical, or biochemical thing. For example: a protein; a gene; a chemical; a synthetic chemical.'),
(768, 1, 5, 'SellAction', 'SellAction', 'The act of taking money from a buyer in exchange for goods or services rendered. An agent sells an object, product, or service to a buyer for a price. Reciprocal of BuyAction.'),
(769, 1, 5, 'OccupationalExperienceRequirements', 'OccupationalExperienceRequirements', 'Indicates employment-related experience requirements, e.g. [[monthsOfExperience]].'),
(770, 1, 5, 'TechArticle', 'TechArticle', 'A technical article - Example: How-to (task) topics, step-by-step, procedural troubleshooting, specifications, etc.'),
(771, 1, 5, 'Schedule', 'Schedule', 'A schedule defines a repeating time period used to describe a regularly occurring [[Event]]. At a minimum a schedule will specify [[repeatFrequency]] which describes the interval between occurrences of the event. Additional information can be provided to specify the schedule more precisely.\n      This includes identifying the day(s) of the week or month when the recurring event will take place, in addition to its start and end time. Schedules may also\n      have start and end dates to indicate when they are active, e.g. to define a limited calendar of events.'),
(772, 1, 5, 'ArchiveComponent', 'ArchiveComponent', 'An intangible type to be applied to any archive content, carrying with it a set of properties required to describe archival items and collections.'),
(773, 1, 5, 'Permit', 'Permit', 'A permit issued by an organization, e.g. a parking pass.'),
(774, 1, 5, 'QuantitativeValue', 'QuantitativeValue', ' A point value or interval for product characteristics and other purposes.'),
(775, 1, 5, 'RepaymentSpecification', 'RepaymentSpecification', 'A structured value representing repayment.'),
(776, 1, 5, 'OwnershipInfo', 'OwnershipInfo', 'A structured value providing information about when a certain organization or person owned a certain product.'),
(777, 1, 5, 'Gene', 'Gene', 'A discrete unit of inheritance which affects one or more biological traits (Source: [https://en.wikipedia.org/wiki/Gene](https://en.wikipedia.org/wiki/Gene)). Examples include FOXP2 (Forkhead box protein P2), SCARNA21 (small Cajal body-specific RNA 21), A- (agouti genotype).'),
(778, 1, 5, 'Resort', 'Resort', 'A resort is a place used for relaxation or recreation, attracting visitors for holidays or vacations. Resorts are places, towns or sometimes commercial establishments operated by a single company (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Resort\">http://en.wikipedia.org/wiki/Resort</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n    '),
(779, 1, 5, 'UnitPriceSpecification', 'UnitPriceSpecification', 'The price asked for a given offer by the respective organization or person.'),
(780, 1, 5, 'HowToStep', 'HowToStep', 'A step in the instructions for how to achieve a result. It is an ordered list with HowToDirection and/or HowToTip items.'),
(781, 1, 5, 'RsvpAction', 'RsvpAction', 'The act of notifying an event organizer as to whether you expect to attend the event.'),
(782, 1, 5, 'TVSeries', 'TVSeries', 'CreativeWorkSeries dedicated to TV broadcast and associated online delivery.'),
(783, 1, 5, 'DigitalPlatformEnumeration', 'DigitalPlatformEnumeration', 'Enumerates some common technology platforms, for use with properties such as [[actionPlatform]]. It is not supposed to be comprehensive - when a suitable code is not enumerated here, textual or URL values can be used instead. These codes are at a fairly high level and do not deal with versioning and other nuance. Additional codes can be suggested [in github](https://github.com/schemaorg/schemaorg/issues/3057). '),
(784, 1, 5, 'USNonprofitType', 'USNonprofitType', 'USNonprofitType: Non-profit organization type originating from the United States.'),
(785, 1, 5, 'MedicalWebPage', 'MedicalWebPage', 'A web page that provides medical information.'),
(786, 1, 5, 'FollowAction', 'FollowAction', 'The act of forming a personal connection with someone/something (object) unidirectionally/asymmetrically to get updates polled from.\\n\\nRelated actions:\\n\\n* [[BefriendAction]]: Unlike BefriendAction, FollowAction implies that the connection is *not* necessarily reciprocal.\\n* [[SubscribeAction]]: Unlike SubscribeAction, FollowAction implies that the follower acts as an active agent constantly/actively polling for updates.\\n* [[RegisterAction]]: Unlike RegisterAction, FollowAction implies that the agent is interested in continuing receiving updates from the object.\\n* [[JoinAction]]: Unlike JoinAction, FollowAction implies that the agent is interested in getting updates from the object.\\n* [[TrackAction]]: Unlike TrackAction, FollowAction refers to the polling of updates of all aspects of animate objects rather than the location of inanimate objects (e.g. you track a package, but you don\'t follow it).'),
(787, 1, 5, 'Movie', 'Movie', 'A movie.'),
(788, 1, 5, 'Dataset', 'Dataset', 'A body of structured information describing some topic(s) of interest.'),
(789, 1, 5, 'Offer', 'Offer', 'An offer to transfer some rights to an item or to provide a service — for example, an offer to sell tickets to an event, to rent the DVD of a movie, to stream a TV show over the internet, to repair a motorcycle, or to loan a book.\\n\\nNote: As the [[businessFunction]] property, which identifies the form of offer (e.g. sell, lease, repair, dispose), defaults to http://purl.org/goodrelations/v1#Sell; an Offer without a defined businessFunction value can be assumed to be an offer to sell.\\n\\nFor [GTIN](http://www.gs1.org/barcodes/technical/idkeys/gtin)-related fields, see [Check Digit calculator](http://www.gs1.org/barcodes/support/check_digit_calculator) and [validation guide](http://www.gs1us.org/resources/standards/gtin-validation-guide) from [GS1](http://www.gs1.org/).'),
(790, 1, 5, 'Book', 'Book', 'A book.'),
(791, 1, 5, 'NewsMediaOrganization', 'NewsMediaOrganization', 'A News/Media organization such as a newspaper or TV station.'),
(792, 1, 5, 'PaymentMethod', 'PaymentMethod', 'A payment method is a standardized procedure for transferring the monetary amount for a purchase. Payment methods are characterized by the legal and technical structures used, and by the organization or group carrying out the transaction.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#ByBankTransferInAdvance\\n* http://purl.org/goodrelations/v1#ByInvoice\\n* http://purl.org/goodrelations/v1#Cash\\n* http://purl.org/goodrelations/v1#CheckInAdvance\\n* http://purl.org/goodrelations/v1#COD\\n* http://purl.org/goodrelations/v1#DirectDebit\\n* http://purl.org/goodrelations/v1#GoogleCheckout\\n* http://purl.org/goodrelations/v1#PayPal\\n* http://purl.org/goodrelations/v1#PaySwarm\n        '),
(793, 1, 5, 'CompoundPriceSpecification', 'CompoundPriceSpecification', 'A compound price specification is one that bundles multiple prices that all apply in combination for different dimensions of consumption. Use the name property of the attached unit price specification for indicating the dimension of a price component (e.g. \"electricity\" or \"final cleaning\").'),
(794, 1, 5, 'BusStation', 'BusStation', 'A bus station.'),
(795, 1, 5, 'DrugStrength', 'DrugStrength', 'A specific strength in which a medical drug is available in a specific country.'),
(796, 1, 5, 'Brand', 'Brand', 'A brand is a name used by an organization or business person for labeling a product, product group, or similar.'),
(797, 1, 5, 'BoardingPolicyType', 'BoardingPolicyType', 'A type of boarding policy used by an airline.'),
(798, 1, 5, 'PerformingGroup', 'PerformingGroup', 'A performance group, such as a band, an orchestra, or a circus.'),
(799, 1, 5, 'Service', 'Service', 'A service provided by an organization, e.g. delivery service, print services, etc.'),
(800, 1, 5, 'TrackAction', 'TrackAction', 'An agent tracks an object for updates.\\n\\nRelated actions:\\n\\n* [[FollowAction]]: Unlike FollowAction, TrackAction refers to the interest on the location of innanimates objects.\\n* [[SubscribeAction]]: Unlike SubscribeAction, TrackAction refers to  the interest on the location of innanimate objects.'),
(801, 1, 5, 'GovernmentService', 'GovernmentService', 'A service provided by a government organization, e.g. food stamps, veterans benefits, etc.'),
(802, 1, 5, 'MovieTheater', 'MovieTheater', 'A movie theater.'),
(803, 1, 5, 'MonetaryAmount', 'MonetaryAmount', 'A monetary value or range. This type can be used to describe an amount of money such as $50 USD, or a range as in describing a bank account being suitable for a balance between £1,000 and £1,000,000 GBP, or the value of a salary, etc. It is recommended to use [[PriceSpecification]] Types to describe the price of an Offer, Invoice, etc.'),
(804, 1, 5, 'MedicineSystem', 'MedicineSystem', 'Systems of medical practice.'),
(805, 1, 5, 'MerchantReturnPolicySeasonalOverride', 'MerchantReturnPolicySeasonalOverride', 'A seasonal override of a return policy, for example used for holidays.'),
(806, 1, 5, 'BankOrCreditUnion', 'BankOrCreditUnion', 'Bank or credit union.'),
(807, 1, 5, 'HyperTocEntry', 'HyperTocEntry', 'A HyperToEntry is an item within a [[HyperToc]], which represents a hypertext table of contents for complex media objects, such as [[VideoObject]], [[AudioObject]]. The media object itself is indicated using [[associatedMedia]]. Each section of interest within that content can be described with a [[HyperTocEntry]], with associated [[startOffset]] and [[endOffset]]. When several entries are all from the same file, [[associatedMedia]] is used on the overarching [[HyperTocEntry]]; if the content has been split into multiple files, they can be referenced using [[associatedMedia]] on each [[HyperTocEntry]].'),
(808, 1, 5, 'PostalCodeRangeSpecification', 'PostalCodeRangeSpecification', 'Indicates a range of postal codes, usually defined as the set of valid codes between [[postalCodeBegin]] and [[postalCodeEnd]], inclusively.'),
(809, 1, 5, 'GovernmentBuilding', 'GovernmentBuilding', 'A government building.'),
(810, 1, 5, 'ContactPointOption', 'ContactPointOption', 'Enumerated options related to a ContactPoint.'),
(811, 1, 5, 'Message', 'Message', 'A single message from a sender to one or more organizations or people.'),
(812, 1, 5, 'Role', 'Role', 'Represents additional information about a relationship or property. For example a Role can be used to say that a \'member\' role linking some SportsTeam to a player occurred during a particular time period. Or that a Person\'s \'actor\' role in a Movie was for some particular characterName. Such properties can be attached to a Role entity, which is then associated with the main entities using ordinary properties like \'member\' or \'actor\'.\\n\\nSee also [blog post](http://blog.schema.org/2014/06/introducing-role.html).'),
(813, 1, 5, 'LearningResource', 'LearningResource', 'The LearningResource type can be used to indicate [[CreativeWork]]s (whether physical or digital) that have a particular and explicit orientation towards learning, education, skill acquisition, and other educational purposes.\n\n[[LearningResource]] is expected to be used as an addition to a primary type such as [[Book]], [[VideoObject]], [[Product]] etc.\n\n[[EducationEvent]] serves a similar purpose for event-like things (e.g. a [[Trip]]). A [[LearningResource]] may be created as a result of an [[EducationEvent]], for example by recording one.'),
(814, 1, 5, 'BedType', 'BedType', 'A type of bed. This is used for indicating the bed or beds available in an accommodation.'),
(815, 1, 5, 'MusicAlbumReleaseType', 'MusicAlbumReleaseType', 'The kind of release which this album is: single, EP or album.'),
(816, 1, 5, 'MerchantReturnPolicy', 'MerchantReturnPolicy', 'A MerchantReturnPolicy provides information about product return policies associated with an [[Organization]], [[Product]], or [[Offer]].'),
(817, 1, 5, 'GameServer', 'GameServer', 'Server that provides game interaction in a multiplayer game.'),
(818, 1, 5, 'PlaceOfWorship', 'PlaceOfWorship', 'Place of worship, such as a church, synagogue, or mosque.'),
(819, 1, 5, 'UseAction', 'UseAction', 'The act of applying an object to its intended purpose.'),
(820, 1, 5, 'Grant', 'Grant', 'A grant, typically financial or otherwise quantifiable, of resources. Typically a [[funder]] sponsors some [[MonetaryAmount]] to an [[Organization]] or [[Person]],\n    sometimes not necessarily via a dedicated or long-lived [[Project]], resulting in one or more outputs, or [[fundedItem]]s. For financial sponsorship, indicate the [[funder]] of a [[MonetaryGrant]]. For non-financial support, indicate [[sponsor]] of [[Grant]]s of resources (e.g. office space).\n\nGrants support  activities directed towards some agreed collective goals, often but not always organized as [[Project]]s. Long-lived projects are sometimes sponsored by a variety of grants over time, but it is also common for a project to be associated with a single grant.\n\nThe amount of a [[Grant]] is represented using [[amount]] as a [[MonetaryAmount]].\n    '),
(821, 1, 5, 'PerformanceRole', 'PerformanceRole', 'A PerformanceRole is a Role that some entity places with regard to a theatrical performance, e.g. in a Movie, TVSeries etc.'),
(822, 1, 5, 'SportsActivityLocation', 'SportsActivityLocation', 'A sports location, such as a playing field.'),
(823, 1, 5, 'MedicalRiskScore', 'MedicalRiskScore', 'A simple system that adds up the number of risk factors to yield a score that is associated with prognosis, e.g. CHAD score, TIMI risk score.'),
(824, 1, 5, 'Seat', 'Seat', 'Used to describe a seat, such as a reserved seat in an event reservation.'),
(825, 1, 5, 'PropertyValueSpecification', 'PropertyValueSpecification', 'A Property value specification.'),
(826, 1, 5, 'Recipe', 'Recipe', 'A recipe. For dietary restrictions covered by the recipe, a few common restrictions are enumerated via [[suitableForDiet]]. The [[keywords]] property can also be used to add more detail.'),
(827, 1, 5, 'LocationFeatureSpecification', 'LocationFeatureSpecification', 'Specifies a location feature by providing a structured value representing a feature of an accommodation as a property-value pair of varying degrees of formality.'),
(828, 1, 5, 'CreativeWorkSeason', 'CreativeWorkSeason', 'A media season, e.g. TV, radio, video game etc.'),
(829, 1, 5, 'LymphaticVessel', 'LymphaticVessel', 'A type of blood vessel that specifically carries lymph fluid unidirectionally toward the heart.'),
(830, 1, 5, 'JoinAction', 'JoinAction', 'An agent joins an event/group with participants/friends at a location.\\n\\nRelated actions:\\n\\n* [[RegisterAction]]: Unlike RegisterAction, JoinAction refers to joining a group/team of people.\\n* [[SubscribeAction]]: Unlike SubscribeAction, JoinAction does not imply that you\'ll be receiving updates.\\n* [[FollowAction]]: Unlike FollowAction, JoinAction does not imply that you\'ll be polling for updates.'),
(831, 1, 5, 'PathologyTest', 'PathologyTest', 'A medical test performed by a laboratory that typically involves examination of a tissue sample by a pathologist.'),
(832, 1, 5, 'GiveAction', 'GiveAction', 'The act of transferring ownership of an object to a destination. Reciprocal of TakeAction.\\n\\nRelated actions:\\n\\n* [[TakeAction]]: Reciprocal of GiveAction.\\n* [[SendAction]]: Unlike SendAction, GiveAction implies that ownership is being transferred (e.g. I may send my laptop to you, but that doesn\'t mean I\'m giving it to you).'),
(833, 1, 5, 'ScholarlyArticle', 'ScholarlyArticle', 'A scholarly article.'),
(834, 1, 5, 'AuthorizeAction', 'AuthorizeAction', 'The act of granting permission to an object.'),
(835, 1, 5, 'TipAction', 'TipAction', 'The act of giving money voluntarily to a beneficiary in recognition of services rendered.'),
(836, 1, 5, 'Vessel', 'Vessel', 'A component of the human body circulatory system comprised of an intricate network of hollow tubes that transport blood throughout the entire body.'),
(837, 1, 5, 'TaxiReservation', 'TaxiReservation', 'A reservation for a taxi.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use [[Offer]].'),
(838, 1, 5, 'ImagingTest', 'ImagingTest', 'Any medical imaging modality typically used for diagnostic purposes.'),
(839, 1, 5, 'MedicalIndication', 'MedicalIndication', 'A condition or factor that indicates use of a medical therapy, including signs, symptoms, risk factors, anatomical states, etc.'),
(840, 1, 5, 'DDxElement', 'DDxElement', 'An alternative, closely-related condition typically considered later in the differential diagnosis process along with the signs that are used to distinguish it.'),
(841, 1, 5, 'SingleFamilyResidence', 'SingleFamilyResidence', 'Residence type: Single-family home.'),
(842, 1, 5, 'GenderType', 'GenderType', 'An enumeration of genders.'),
(843, 1, 5, 'GameAvailabilityEnumeration', 'GameAvailabilityEnumeration', 'For a [[VideoGame]], such as used with a [[PlayGameAction]], an enumeration of the kind of game availability offered. '),
(844, 1, 5, 'Reservation', 'Reservation', 'Describes a reservation for travel, dining or an event. Some reservations require tickets. \\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, restaurant reservations, flights, or rental cars, use [[Offer]].'),
(845, 1, 5, 'DonateAction', 'DonateAction', 'The act of providing goods, services, or money without compensation, often for philanthropic reasons.'),
(846, 1, 5, 'Vein', 'Vein', 'A type of blood vessel that specifically carries blood to the heart.'),
(847, 1, 5, 'MusicAlbum', 'MusicAlbum', 'A collection of music tracks.'),
(848, 1, 5, 'GamePlayMode', 'GamePlayMode', 'Indicates whether this game is multi-player, co-op or single-player.'),
(849, 1, 5, 'MeasurementTypeEnumeration', 'MeasurementTypeEnumeration', 'Enumeration of common measurement types (or dimensions), for example \"chest\" for a person, \"inseam\" for pants, \"gauge\" for screws, or \"wheel\" for bicycles.'),
(850, 1, 5, 'MolecularEntity', 'MolecularEntity', 'Any constitutionally or isotopically distinct atom, molecule, ion, ion pair, radical, radical ion, complex, conformer etc., identifiable as a separately distinguishable entity.'),
(851, 1, 5, 'EducationalOccupationalCredential', 'EducationalOccupationalCredential', 'An educational or occupational credential. A diploma, academic degree, certification, qualification, badge, etc., that may be awarded to a person or other entity that meets the requirements defined by the credentialer.'),
(852, 1, 5, 'EducationEvent', 'EducationEvent', 'Event type: Education event.'),
(853, 1, 5, 'Joint', 'Joint', 'The anatomical location at which two or more bones make contact.'),
(854, 1, 5, 'ReceiveAction', 'ReceiveAction', 'The act of physically/electronically taking delivery of an object that has been transferred from an origin to a destination. Reciprocal of SendAction.\\n\\nRelated actions:\\n\\n* [[SendAction]]: The reciprocal of ReceiveAction.\\n* [[TakeAction]]: Unlike TakeAction, ReceiveAction does not imply that the ownership has been transferred (e.g. I can receive a package, but it does not mean the package is now mine).'),
(855, 1, 5, 'DeliveryChargeSpecification', 'DeliveryChargeSpecification', 'The price for the delivery of an offer using a particular delivery method.'),
(856, 1, 5, 'ListItem', 'ListItem', 'An list item, e.g. a step in a checklist or how-to description.'),
(857, 1, 5, 'XPathType', 'XPathType', 'Text representing an XPath (typically but not necessarily version 1.0).'),
(858, 1, 5, 'VideoGame', 'VideoGame', 'A video game is an electronic game that involves human interaction with a user interface to generate visual feedback on a video device.'),
(859, 1, 5, 'WinAction', 'WinAction', 'The act of achieving victory in a competitive activity.'),
(860, 1, 5, 'BodyOfWater', 'BodyOfWater', 'A body of water, such as a sea, ocean, or lake.'),
(861, 1, 5, 'EnergyConsumptionDetails', 'EnergyConsumptionDetails', 'EnergyConsumptionDetails represents information related to the energy efficiency of a product that consumes energy. The information that can be provided is based on international regulations such as for example [EU directive 2017/1369](https://eur-lex.europa.eu/eli/reg/2017/1369/oj) for energy labeling and the [Energy labeling rule](https://www.ftc.gov/enforcement/rules/rulemaking-regulatory-reform-proceedings/energy-water-use-labeling-consumer) under the Energy Policy and Conservation Act (EPCA) in the US.'),
(862, 1, 5, 'EntryPoint', 'EntryPoint', 'An entry point, within some Web-based protocol.'),
(863, 1, 5, 'TVEpisode', 'TVEpisode', 'A TV episode which can be part of a series or season.'),
(864, 1, 5, 'MedicalSignOrSymptom', 'MedicalSignOrSymptom', 'Any feature associated or not with a medical condition. In medicine a symptom is generally subjective while a sign is objective.'),
(865, 1, 5, 'OfferItemCondition', 'OfferItemCondition', 'A list of possible conditions for the item.'),
(866, 1, 5, 'DeliveryEvent', 'DeliveryEvent', 'An event involving the delivery of an item.'),
(867, 1, 5, 'PlanAction', 'PlanAction', 'The act of planning the execution of an event/task/action/reservation/plan to a future date.'),
(868, 1, 5, 'Nerve', 'Nerve', 'A common pathway for the electrochemical nerve impulses that are transmitted along each of the axons.'),
(869, 1, 5, 'HowToTool', 'HowToTool', 'A tool used (but not consumed) when performing instructions for how to achieve a result.'),
(870, 1, 5, 'Review', 'Review', 'A review of an item - for example, of a restaurant, movie, or store.'),
(871, 1, 5, 'EUEnergyEfficiencyEnumeration', 'EUEnergyEfficiencyEnumeration', 'Enumerates the EU energy efficiency classes A-G as well as A+, A++, and A+++ as defined in EU directive 2017/1369.'),
(872, 1, 5, 'FoodEstablishment', 'FoodEstablishment', 'A food-related business.'),
(873, 1, 5, 'ParentAudience', 'ParentAudience', 'A set of characteristics describing parents, who can be interested in viewing some content.'),
(874, 1, 5, 'AggregateRating', 'AggregateRating', 'The average rating based on multiple ratings or reviews.'),
(875, 1, 5, 'CreativeWork', 'CreativeWork', 'The most generic kind of creative work, including books, movies, photographs, software programs, etc.'),
(876, 1, 5, 'HowToSection', 'HowToSection', 'A sub-grouping of steps in the instructions for how to achieve a result (e.g. steps for making a pie crust within a pie recipe).'),
(877, 1, 5, 'TrainStation', 'TrainStation', 'A train station.'),
(878, 1, 5, 'ReservationStatusType', 'ReservationStatusType', 'Enumerated status values for Reservation.'),
(879, 1, 5, 'HealthTopicContent', 'HealthTopicContent', '[[HealthTopicContent]] is [[WebContent]] that is about some aspect of a health topic, e.g. a condition, its symptoms or treatments. Such content may be comprised of several parts or sections and use different types of media. Multiple instances of [[WebContent]] (and hence [[HealthTopicContent]]) can be related using [[hasPart]] / [[isPartOf]] where there is some kind of content hierarchy, and their content described with [[about]] and [[mentions]] e.g. building upon the existing [[MedicalCondition]] vocabulary.\n  '),
(880, 1, 5, 'AutomotiveBusiness', 'AutomotiveBusiness', 'Car repair, sales, or parts.'),
(881, 1, 5, 'Residence', 'Residence', 'The place where a person lives.'),
(882, 1, 5, 'ImageObject', 'ImageObject', 'An image file.'),
(883, 1, 5, 'MedicalEnumeration', 'MedicalEnumeration', 'Enumerations related to health and the practice of medicine: A concept that is used to attribute a quality to another concept, as a qualifier, a collection of items or a listing of all of the elements of a set in medicine practice.'),
(884, 1, 5, 'MediaSubscription', 'MediaSubscription', 'A subscription which allows a user to access media including audio, video, books, etc.'),
(885, 1, 5, 'House', 'House', 'A house is a building or structure that has the ability to be occupied for habitation by humans or other creatures (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/House\">http://en.wikipedia.org/wiki/House</a>).'),
(886, 1, 5, 'MedicalConditionStage', 'MedicalConditionStage', 'A stage of a medical condition, such as \'Stage IIIa\'.'),
(887, 1, 5, 'LocalBusiness', 'LocalBusiness', 'A particular physical business or branch of an organization. Examples of LocalBusiness include a restaurant, a particular branch of a restaurant chain, a branch of a bank, a medical practice, a club, a bowling alley, etc.'),
(888, 1, 5, 'Date', 'Date', 'A date value in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601).'),
(889, 1, 5, 'LiveBlogPosting', 'LiveBlogPosting', 'A [[LiveBlogPosting]] is a [[BlogPosting]] intended to provide a rolling textual coverage of an ongoing event through continuous updates.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(890, 1, 5, 'RentalCarReservation', 'RentalCarReservation', 'A reservation for a rental car.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(891, 1, 5, 'Apartment', 'Apartment', 'An apartment (in American English) or flat (in British English) is a self-contained housing unit (a type of residential real estate) that occupies only part of a building (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Apartment\">http://en.wikipedia.org/wiki/Apartment</a>).'),
(892, 1, 5, 'MobileApplication', 'MobileApplication', 'A software application designed specifically to work well on a mobile device such as a telephone.'),
(893, 1, 5, 'Property', 'Property', 'A property, used to indicate attributes and relationships of some Thing; equivalent to rdf:Property.'),
(894, 1, 5, 'ProductGroup', 'ProductGroup', 'A ProductGroup represents a group of [[Product]]s that vary only in certain well-described ways, such as by [[size]], [[color]], [[material]] etc.\n\nWhile a ProductGroup itself is not directly offered for sale, the various varying products that it represents can be. The ProductGroup serves as a prototype or template, standing in for all of the products who have an [[isVariantOf]] relationship to it. As such, properties (including additional types) can be applied to the ProductGroup to represent characteristics shared by each of the (possibly very many) variants. Properties that reference a ProductGroup are not included in this mechanism; neither are the following specific properties [[variesBy]], [[hasVariant]], [[url]]. '),
(895, 1, 5, 'DataCatalog', 'DataCatalog', 'A collection of datasets.'),
(896, 1, 5, 'Muscle', 'Muscle', 'A muscle is an anatomical structure consisting of a contractile form of tissue that animals use to effect movement.'),
(897, 1, 5, 'Recommendation', 'Recommendation', '[[Recommendation]] is a type of [[Review]] that suggests or proposes something as the best option or best course of action. Recommendations may be for products or services, or other concrete things, as in the case of a ranked list or product guide. A [[Guide]] may list multiple recommendations for different categories. For example, in a [[Guide]] about which TVs to buy, the author may have several [[Recommendation]]s.'),
(898, 1, 5, 'SeekToAction', 'SeekToAction', 'This is the [[Action]] of navigating to a specific [[startOffset]] timestamp within a [[VideoObject]], typically represented with a URL template structure.'),
(899, 1, 5, 'Menu', 'Menu', 'A structured representation of food or drink items available from a FoodEstablishment.'),
(900, 1, 5, 'OrganizationRole', 'OrganizationRole', 'A subclass of Role used to describe roles within organizations.'),
(901, 1, 5, 'EventAttendanceModeEnumeration', 'EventAttendanceModeEnumeration', 'An EventAttendanceModeEnumeration value is one of potentially several modes of organising an event, relating to whether it is online or offline.'),
(902, 1, 5, 'Enumeration', 'Enumeration', 'Lists or enumerations—for example, a list of cuisines or music genres, etc.'),
(903, 1, 5, 'HealthAspectEnumeration', 'HealthAspectEnumeration', 'HealthAspectEnumeration enumerates several aspects of health content online, each of which might be described using [[hasHealthAspect]] and [[HealthTopicContent]].'),
(904, 1, 5, 'PeopleAudience', 'PeopleAudience', 'A set of characteristics belonging to people, e.g. who compose an item\'s target audience.'),
(905, 1, 5, 'BusinessFunction', 'BusinessFunction', 'The business function specifies the type of activity or access (i.e., the bundle of rights) offered by the organization or business person through the offer. Typical are sell, rental or lease, maintenance or repair, manufacture / produce, recycle / dispose, engineering / construction, or installation. Proprietary specifications of access rights are also instances of this class.\\n\\nCommonly used values:\\n\\n* http://purl.org/goodrelations/v1#ConstructionInstallation\\n* http://purl.org/goodrelations/v1#Dispose\\n* http://purl.org/goodrelations/v1#LeaseOut\\n* http://purl.org/goodrelations/v1#Maintain\\n* http://purl.org/goodrelations/v1#ProvideService\\n* http://purl.org/goodrelations/v1#Repair\\n* http://purl.org/goodrelations/v1#Sell\\n* http://purl.org/goodrelations/v1#Buy\n        '),
(906, 1, 5, 'EventStatusType', 'EventStatusType', 'EventStatusType is an enumeration type whose instances represent several states that an Event may be in.'),
(907, 1, 5, 'Landform', 'Landform', 'A landform or physical feature.  Landform elements include mountains, plains, lakes, rivers, seascape and oceanic waterbody interface features such as bays, peninsulas, seas and so forth, including sub-aqueous terrain features such as submersed mountain ranges, volcanoes, and the great ocean basins.'),
(908, 1, 5, 'FindAction', 'FindAction', 'The act of finding an object.\\n\\nRelated actions:\\n\\n* [[SearchAction]]: FindAction is generally lead by a SearchAction, but not necessarily.'),
(909, 1, 5, 'RadioChannel', 'RadioChannel', 'A unique instance of a radio BroadcastService on a CableOrSatelliteService lineup.'),
(910, 1, 5, 'MedicalEvidenceLevel', 'MedicalEvidenceLevel', 'Level of evidence for a medical guideline. Enumerated type.'),
(911, 1, 5, 'MusicAlbumProductionType', 'MusicAlbumProductionType', 'Classification of the album by its type of content: soundtrack, live album, studio album, etc.'),
(912, 1, 5, 'Airport', 'Airport', 'An airport.'),
(913, 1, 5, 'HealthInsurancePlan', 'HealthInsurancePlan', 'A US-style health insurance plan, including PPOs, EPOs, and HMOs. '),
(914, 1, 5, 'AddAction', 'AddAction', 'The act of editing by adding an object to a collection.'),
(915, 1, 5, 'MedicalStudyStatus', 'MedicalStudyStatus', 'The status of a medical study. Enumerated type.'),
(916, 1, 5, 'TransferAction', 'TransferAction', 'The act of transferring/moving (abstract or concrete) animate or inanimate objects from one place to another.'),
(917, 1, 5, 'EndorseAction', 'EndorseAction', 'An agent approves/certifies/likes/supports/sanctions an object.'),
(918, 1, 5, 'DiagnosticLab', 'DiagnosticLab', 'A medical laboratory that offers on-site or off-site diagnostic services.'),
(919, 1, 5, 'WebPage', 'WebPage', 'A web page. Every web page is implicitly assumed to be declared to be of type WebPage, so the various properties about that webpage, such as <code>breadcrumb</code> may be used. We recommend explicit declaration if these properties are specified, but if they are found outside of an itemscope, they will be assumed to be about the page.'),
(920, 1, 5, 'Number', 'Number', 'Data type: Number.\\n\\nUsage guidelines:\\n\\n* Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similar Unicode symbols.\\n* Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.'),
(921, 1, 5, 'InformAction', 'InformAction', 'The act of notifying someone of information pertinent to them, with no expectation of a response.'),
(922, 1, 5, 'Suite', 'Suite', 'A suite in a hotel or other public accommodation, denotes a class of luxury accommodations, the key feature of which is multiple rooms (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Suite_(hotel)\">http://en.wikipedia.org/wiki/Suite_(hotel)</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(923, 1, 5, 'DoseSchedule', 'DoseSchedule', 'A specific dosing schedule for a drug or supplement.'),
(924, 1, 5, 'VisualArtwork', 'VisualArtwork', 'A work of art that is primarily visual in character.'),
(925, 1, 5, 'GeoCircle', 'GeoCircle', 'A GeoCircle is a GeoShape representing a circular geographic area. As it is a GeoShape\n          it provides the simple textual property \'circle\', but also allows the combination of postalCode alongside geoRadius.\n          The center of the circle can be indicated via the \'geoMidpoint\' property, or more approximately using \'address\', \'postalCode\'.\n       '),
(926, 1, 5, 'MediaObject', 'MediaObject', 'A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset, i.e. DataDownload. Note that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 [[AudioObject]]s).'),
(927, 1, 5, 'GeoCoordinates', 'GeoCoordinates', 'The geographic coordinates of a place or event.'),
(928, 1, 5, 'MedicalScholarlyArticle', 'MedicalScholarlyArticle', 'A scholarly article in the medical domain.'),
(929, 1, 5, 'MedicalCode', 'MedicalCode', 'A code for a medical entity.'),
(930, 1, 5, 'DigitalDocumentPermissionType', 'DigitalDocumentPermissionType', 'A type of permission which can be granted for accessing a digital document.'),
(931, 1, 5, 'JobPosting', 'JobPosting', 'A listing that describes a job opening in a certain organization.'),
(932, 1, 5, 'DrugCost', 'DrugCost', 'The cost per unit of a medical drug. Note that this type is not meant to represent the price in an offer of a drug for sale; see the Offer type for that. This type will typically be used to tag wholesale or average retail cost of a drug, or maximum reimbursable cost. Costs of medical drugs vary widely depending on how and where they are paid for, so while this type captures some of the variables, costs should be used with caution by consumers of this schema\'s markup.'),
(933, 1, 5, 'DrugPrescriptionStatus', 'DrugPrescriptionStatus', 'Indicates whether this drug is available by prescription or over-the-counter.'),
(934, 1, 5, 'NutritionInformation', 'NutritionInformation', 'Nutritional information about the recipe.'),
(935, 1, 5, 'PostalAddress', 'PostalAddress', 'The mailing address.'),
(936, 1, 5, 'Thing', 'Thing', 'The most generic type of item.'),
(937, 1, 5, 'BroadcastEvent', 'BroadcastEvent', 'An over the air or online broadcast event.'),
(938, 1, 5, 'ServiceChannel', 'ServiceChannel', 'A means for accessing a service, e.g. a government office location, web site, or phone number.'),
(939, 1, 5, 'LoseAction', 'LoseAction', 'The act of being defeated in a competitive activity.'),
(940, 1, 5, 'BlogPosting', 'BlogPosting', 'A blog post.'),
(941, 1, 5, 'ReviewAction', 'ReviewAction', 'The act of producing a balanced opinion about the object for an audience. An agent reviews an object with participants resulting in a review.'),
(942, 1, 5, 'RadioSeries', 'RadioSeries', 'CreativeWorkSeries dedicated to radio broadcast and associated online delivery.'),
(943, 1, 5, 'HotelRoom', 'HotelRoom', 'A hotel room is a single room in a hotel.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(944, 1, 5, 'Specialty', 'Specialty', 'Any branch of a field in which people typically develop specific expertise, usually after significant study, time, and effort.'),
(945, 1, 5, 'MusicGroup', 'MusicGroup', 'A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.'),
(946, 1, 5, 'ProductModel', 'ProductModel', 'A datasheet or vendor specification of a product (in the sense of a prototypical description).'),
(947, 1, 5, 'Intangible', 'Intangible', 'A utility class that serves as the umbrella for a number of \'intangible\' things such as quantities, structured values, etc.'),
(948, 1, 5, 'Integer', 'Integer', 'Data type: Integer.'),
(949, 1, 5, 'EngineSpecification', 'EngineSpecification', 'Information about the engine of the vehicle. A vehicle can have multiple engines represented by multiple engine specification entities.'),
(950, 1, 5, 'AggregateOffer', 'AggregateOffer', 'When a single product is associated with multiple offers (for example, the same pair of shoes is offered by different merchants), then AggregateOffer can be used.\\n\\nNote: AggregateOffers are normally expected to associate multiple offers that all share the same defined [[businessFunction]] value, or default to http://purl.org/goodrelations/v1#Sell if businessFunction is not explicitly defined.'),
(951, 1, 5, 'ComputerLanguage', 'ComputerLanguage', 'This type covers computer programming languages such as Scheme and Lisp, as well as other language-like computer representations. Natural languages are best represented with the [[Language]] type.'),
(952, 1, 5, 'MedicalIntangible', 'MedicalIntangible', 'A utility class that serves as the umbrella for a number of \'intangible\' things in the medical space.'),
(953, 1, 5, 'HowTo', 'HowTo', 'Instructions that explain how to achieve a result by performing a sequence of steps.'),
(954, 1, 5, 'Series', 'Series', 'A Series in schema.org is a group of related items, typically but not necessarily of the same kind. See also [[CreativeWorkSeries]], [[EventSeries]].'),
(955, 1, 5, 'OfferShippingDetails', 'OfferShippingDetails', 'OfferShippingDetails represents information about shipping destinations.\n\nMultiple of these entities can be used to represent different shipping rates for different destinations:\n\nOne entity for Alaska/Hawaii. A different one for continental US. A different one for all France.\n\nMultiple of these entities can be used to represent different shipping costs and delivery times.\n\nTwo entities that are identical but differ in rate and time:\n\nE.g. Cheaper and slower: $5 in 5-7 days\nor Fast and expensive: $15 in 1-2 days.'),
(956, 1, 5, 'LifestyleModification', 'LifestyleModification', 'A process of care involving exercise, changes to diet, fitness routines, and other lifestyle changes aimed at improving a health condition.'),
(957, 1, 5, 'BookFormatType', 'BookFormatType', 'The publication format of the book.'),
(958, 1, 5, 'EducationalAudience', 'EducationalAudience', 'An EducationalAudience.'),
(959, 1, 5, 'CommentAction', 'CommentAction', 'The act of generating a comment about a subject.'),
(960, 1, 5, 'MedicalDevice', 'MedicalDevice', 'Any object used in a medical capacity, such as to diagnose or treat a patient.'),
(961, 1, 5, 'DefinedTerm', 'DefinedTerm', 'A word, name, acronym, phrase, etc. with a formal definition. Often used in the context of category or subject classification, glossaries or dictionaries, product or creative work types, etc. Use the name property for the term being defined, use termCode if the term has an alpha-numeric code allocated, use description to provide the definition of the term.'),
(962, 1, 5, 'VideoGameSeries', 'VideoGameSeries', 'A video game series.'),
(963, 1, 5, 'MedicalTherapy', 'MedicalTherapy', 'Any medical intervention designed to prevent, treat, and cure human diseases and medical conditions, including both curative and palliative therapies. Medical therapies are typically processes of care relying upon pharmacotherapy, behavioral therapy, supportive therapy (with fluid or nutrition for example), or detoxification (e.g. hemodialysis) aimed at improving or preventing a health condition.'),
(964, 1, 5, 'OrganizeAction', 'OrganizeAction', 'The act of manipulating/administering/supervising/controlling one or more objects.'),
(965, 1, 5, 'RealEstateListing', 'RealEstateListing', 'A [[RealEstateListing]] is a listing that describes one or more real-estate [[Offer]]s (whose [[businessFunction]] is typically to lease out, or to sell).\n  The [[RealEstateListing]] type itself represents the overall listing, as manifested in some [[WebPage]].\n  '),
(966, 1, 5, 'MedicalBusiness', 'MedicalBusiness', 'A particular physical or virtual business of an organization for medical purposes. Examples of MedicalBusiness include different businesses run by health professionals.'),
(967, 1, 5, 'UpdateAction', 'UpdateAction', 'The act of managing by changing/editing the state of the object.'),
(968, 1, 5, 'BorrowAction', 'BorrowAction', 'The act of obtaining an object under an agreement to return it at a later date. Reciprocal of LendAction.\\n\\nRelated actions:\\n\\n* [[LendAction]]: Reciprocal of BorrowAction.'),
(969, 1, 5, 'MedicalTrial', 'MedicalTrial', 'A medical trial is a type of medical study that uses a scientific process to compare the safety and efficacy of medical therapies or medical procedures. In general, medical trials are controlled and subjects are allocated at random to the different treatment and/or control groups.'),
(970, 1, 5, 'VirtualLocation', 'VirtualLocation', 'An online or virtual location for attending events. For example, one may attend an online seminar or educational event. While a virtual location may be used as the location of an event, virtual locations should not be confused with physical locations in the real world.'),
(971, 1, 5, 'SizeSpecification', 'SizeSpecification', 'Size related properties of a product, typically a size code ([[name]]) and optionally a [[sizeSystem]], [[sizeGroup]], and product measurements ([[hasMeasurement]]). In addition, the intended audience can be defined through [[suggestedAge]], [[suggestedGender]], and suggested body measurements ([[suggestedMeasurement]]).'),
(972, 1, 5, 'Physician', 'Physician', 'A doctor\'s office.'),
(973, 1, 5, 'SuperficialAnatomy', 'SuperficialAnatomy', 'Anatomical features that can be observed by sight (without dissection), including the form and proportions of the human body as well as surface landmarks that correspond to deeper subcutaneous structures. Superficial anatomy plays an important role in sports medicine, phlebotomy, and other medical specialties as underlying anatomical structures can be identified through surface palpation. For example, during back surgery, superficial anatomy can be used to palpate and count vertebrae to find the site of incision. Or in phlebotomy, superficial anatomy can be used to locate an underlying vein; for example, the median cubital vein can be located by palpating the borders of the cubital fossa (such as the epicondyles of the humerus) and then looking for the superficial signs of the vein, such as size, prominence, ability to refill after depression, and feel of surrounding tissue support. As another example, in a subluxation (dislocation) of the glenohumeral joint, the bony structure becomes pronounced with the deltoid muscle failing to cover the glenohumeral joint allowing the edges of the scapula to be superficially visible. Here, the superficial anatomy is the visible edges of the scapula, implying the underlying dislocation of the joint (the related anatomical structure).'),
(974, 1, 5, 'ProgramMembership', 'ProgramMembership', 'Used to describe membership in a loyalty programs (e.g. \"StarAliance\"), traveler clubs (e.g. \"AAA\"), purchase clubs (\"Safeway Club\"), etc.'),
(975, 1, 5, 'UserComments', 'UserComments', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use [[Action]]-based vocabulary, alongside types such as [[Comment]].'),
(976, 1, 5, 'EntertainmentBusiness', 'EntertainmentBusiness', 'A business providing entertainment.'),
(977, 1, 5, 'SizeGroupEnumeration', 'SizeGroupEnumeration', 'Enumerates common size groups for various product categories.'),
(978, 1, 5, 'Episode', 'Episode', 'A media episode (e.g. TV, radio, video game) which can be part of a series or season.'),
(979, 1, 5, 'CourseInstance', 'CourseInstance', 'An instance of a [[Course]] which is distinct from other instances because it is offered at a different time or location or through different media or modes of study or to a specific section of students.'),
(980, 1, 5, 'Room', 'Room', 'A room is a distinguishable space within a structure, usually separated from other spaces by interior walls (source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Room\">http://en.wikipedia.org/wiki/Room</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.\n'),
(981, 1, 5, 'Energy', 'Energy', 'Properties that take Energy as values are of the form \'&lt;Number&gt; &lt;Energy unit of measure&gt;\'.'),
(982, 1, 5, 'FoodEstablishmentReservation', 'FoodEstablishmentReservation', 'A reservation to dine at a food-related business.\\n\\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(983, 1, 5, 'BusOrCoach', 'BusOrCoach', 'A bus (also omnibus or autobus) is a road vehicle designed to carry passengers. Coaches are luxury busses, usually in service for long distance travel.'),
(984, 1, 5, 'Clip', 'Clip', 'A short TV or radio program or a segment/part of a program.'),
(985, 1, 5, 'MedicalRiskEstimator', 'MedicalRiskEstimator', 'Any rule set or interactive tool for estimating the risk of developing a complication or condition.'),
(986, 1, 5, 'Church', 'Church', 'A church.'),
(987, 1, 5, 'SportsTeam', 'SportsTeam', 'Organization: Sports team.'),
(988, 1, 5, 'FoodEvent', 'FoodEvent', 'Event type: Food event.'),
(989, 1, 5, 'TVClip', 'TVClip', 'A short TV program or a segment/part of a TV program.'),
(990, 1, 5, 'MusicPlaylist', 'MusicPlaylist', 'A collection of music tracks in playlist form.'),
(991, 1, 5, 'CreativeWorkSeries', 'CreativeWorkSeries', 'A CreativeWorkSeries in schema.org is a group of related items, typically but not necessarily of the same kind. CreativeWorkSeries are usually organized into some order, often chronological. Unlike [[ItemList]] which is a general purpose data structure for lists of things, the emphasis with CreativeWorkSeries is on published materials (written e.g. books and periodicals, or media such as TV, radio and games).\\n\\nSpecific subtypes are available for describing [[TVSeries]], [[RadioSeries]], [[MovieSeries]], [[BookSeries]], [[Periodical]] and [[VideoGameSeries]]. In each case, the [[hasPart]] / [[isPartOf]] properties can be used to relate the CreativeWorkSeries to its parts. The general CreativeWorkSeries type serves largely just to organize these more specific and practical subtypes.\\n\\nIt is common for properties applicable to an item from the series to be usefully applied to the containing group. Schema.org attempts to anticipate some of these cases, but publishers should be free to apply properties of the series parts to the series as a whole wherever they seem appropriate.\n	  '),
(992, 1, 5, 'BusinessAudience', 'BusinessAudience', 'A set of characteristics belonging to businesses, e.g. who compose an item\'s target audience.'),
(993, 1, 5, 'Quantity', 'Quantity', 'Quantities such as distance, time, mass, weight, etc. Particular instances of say Mass are entities like \'3 kg\' or \'4 milligrams\'.'),
(994, 1, 5, 'PlayAction', 'PlayAction', 'The act of playing/exercising/training/performing for enjoyment, leisure, recreation, competition or exercise.\\n\\nRelated actions:\\n\\n* [[ListenAction]]: Unlike ListenAction (which is under ConsumeAction), PlayAction refers to performing for an audience or at an event, rather than consuming music.\\n* [[WatchAction]]: Unlike WatchAction (which is under ConsumeAction), PlayAction refers to showing/displaying for an audience or at an event, rather than consuming visual content.'),
(995, 1, 5, 'WebSite', 'WebSite', 'A WebSite is a set of related web pages and other items typically served from a single web domain and accessible via URLs.'),
(996, 1, 5, 'DigitalDocument', 'DigitalDocument', 'An electronic file or document.'),
(997, 1, 5, 'ContactPoint', 'ContactPoint', 'A contact point&#x2014;for example, a Customer Complaints department.'),
(998, 1, 5, 'VoteAction', 'VoteAction', 'The act of expressing a preference from a fixed/finite/structured set of choices/options.');

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
(2, 1, 473, 1450, 1000, 'LDS Person'),
(3, 1, 460, 1450, 1523, 'LDS Organization'),
(4, 1, 711, 1450, 737, 'LDS Distribution'),
(5, 1, 788, 1450, 737, 'LDS Dataset'),
(6, 1, 895, 1450, 737, 'LDS Datacatalog');

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
(21, 2, 1450, NULL, NULL, 1, NULL, 0, 0, NULL),
(22, 2, 1000, NULL, NULL, 2, NULL, 0, 0, NULL),
(23, 2, 711, NULL, NULL, 3, NULL, 0, 0, NULL),
(24, 3, 1450, 'Naam', 'The name of the organization.', 1, NULL, 1, 0, NULL),
(25, 3, 1523, 'Internetadres', NULL, 2, '[\"uri\"]', 0, 0, NULL),
(26, 3, 462, 'Alternatieve naam of afkorting', 'Alternative names such as an abbreviation that the organization is known under.', 3, NULL, 0, 0, NULL),
(27, 3, 1131, 'Hetzelfde als', 'Links to the organization in other databases.', 4, '[\"uri\"]', 0, 0, NULL),
(28, 3, 399, 'Contactpersoon', NULL, 5, '[\"resource:item\"]', 0, 0, NULL),
(29, 4, 836, 'Inhouds-URL', 'The URL where the distribution can be directly accessed.', 4, '[\"uri\"]', 1, 0, NULL),
(30, 4, 1323, 'Coderingsformaat', 'The distribution’s MIME format.', 3, '[\"customvocab:1\"]', 1, 0, NULL),
(31, 4, 1450, 'Naam', 'Name of the distribution, depicting the type of distribution.', 1, NULL, 0, 0, NULL),
(32, 4, 737, 'Beschrijving', 'A description of the the distribution.', 2, NULL, 0, 0, NULL),
(33, 4, 555, 'Publicatiedatum', 'Date (or datetime) the distribution was published.', 5, '[\"numeric:timestamp\"]', 0, 0, NULL),
(34, 4, 951, 'Wijzigingsdatum', 'Date (or datetime) the distribution was last updated.', 6, '[\"numeric:timestamp\"]', 0, 0, NULL),
(35, 4, 766, 'Taal', NULL, 7, '[\"customvocab:2\"]', 0, 0, NULL),
(36, 4, 1573, 'Licentie', 'The URL of the (open) license under which the distribution can be used. ', 8, '[\"customvocab:3\"]', 0, 0, NULL),
(37, 4, 1577, 'Inhoudsgrootte', 'A measure indicating the size of the distribution.', 9, '[\"numeric:integer\"]', 0, 0, NULL),
(38, 4, 1479, 'Gebruiksinformatie', 'A link to the API documentation; required if custom API', 10, '[\"uri\"]', 0, 0, NULL),
(39, 5, 1450, 'Naam', 'The name of the dataset.', 1, NULL, 1, 0, NULL),
(40, 5, 737, 'Beschrijving', 'A description of the dataset.', 2, NULL, 0, 0, NULL),
(41, 5, 1526, 'Uitgever', 'The publisher of the dataset.', 3, '[\"resource:item\"]', 1, 0, NULL),
(42, 5, 1573, 'Licentie', 'The URL of the (open) license under which the dataset can be used.', 4, '[\"customvocab:3\"]', 1, 0, NULL),
(43, 5, 282, 'Distributie', 'Distributions tell consumers where and how they can get the data. Distributions can be data dumps in RDF or some other format such as CSV, live SPARQL endpoints, OAI-PMH endpoints or other APIs.', 5, '[\"resource:item\"]', 0, 0, NULL),
(44, 5, 1212, 'Maker', 'The owner of the dataset.', 6, '[\"resource:item\"]', 0, 0, NULL),
(45, 5, 480, 'Financier', NULL, 7, '[\"resource:item\"]', 0, 0, NULL),
(46, 5, 1479, 'Informatie omtrent gebruik', 'The URL of dataset this dataset is based on.', 8, '[\"uri\"]', 0, 0, NULL),
(47, 5, 921, 'Creatiedatum', 'The date on which  the dataset description was originally created.', 9, '[\"numeric:timestamp\"]', 0, 0, NULL),
(48, 5, 555, 'Publicatiedatum', 'The date on which  the dataset description was originally published.', 10, '[\"numeric:timestamp\"]', 0, 0, NULL),
(49, 5, 951, 'Wijzigingsdatum', 'The date on which  the dataset description was last modified.', 11, '[\"numeric:timestamp\"]', 0, 0, NULL),
(50, 5, 610, 'Versie', NULL, 12, NULL, 0, 0, NULL),
(51, 5, 1604, 'Geeft informatie over', 'URL of a webpage where the dataset is described OR Item set', 13, '[\"uri\",\"resource:itemset\"]', 0, 0, NULL),
(52, 5, 766, 'Taal', NULL, 14, '[\"customvocab:2\"]', 0, 0, NULL),
(53, 5, 1385, 'Is gebaseerd op', 'A reference to a dataset on which this dataset was based.', 15, NULL, 0, 0, NULL),
(54, 5, 638, 'Citatie', 'A citation or reference for the dataset.', 16, NULL, 0, 0, NULL),
(55, 5, 1272, NULL, NULL, 17, NULL, 0, 0, NULL),
(56, 5, 771, 'Trefwoorden', 'One or more keyword which describe the dataset.', 18, NULL, 0, 0, NULL),
(57, 5, 298, 'Ruimtelijke dekking', 'Indicates the place(s) which are the focus of the dataset.', 19, NULL, 0, 0, NULL),
(58, 5, 225, 'Tijdelijke dekking', 'Indicates the period that the dataset applies to.', 20, NULL, 0, 0, NULL),
(59, 5, 368, 'Onderdeel van datacatalogus', NULL, 21, '[\"resource:item\"]', 0, 0, NULL),
(60, 6, 1450, 'Naam', 'The name of the data catalog.', 1, NULL, 1, 0, NULL),
(61, 6, 737, 'Beschrijving', 'A description of the data catalog.', 2, '[\"literal\"]', 0, 0, NULL),
(62, 6, 1599, 'Datasets', 'The datasets that are contained in the data catalog.', 3, '[\"resource:item\"]', 0, 0, NULL),
(63, 6, 1526, 'Uitgever', 'The publisher of the data catalog.', 4, '[\"resource:item\"]', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'admin@example.com', 'Test Admin', '2023-04-06 08:40:22', '2023-04-06 08:40:22', '$2y$10$aRSkqth3Q94WQ6ZQlrzkyOjIQhX3vWFOIcpR5kDhJUBfU9970kGHi', 'global_admin', 1);

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
(3, 3, 1450, NULL, NULL, 'literal', '', 'AAA', NULL, 1),
(4, 4, 1450, NULL, NULL, 'literal', '', 'BBB', NULL, 1),
(5, 5, 1450, NULL, NULL, 'literal', '', 'CCC', NULL, 1),
(6, 6, 1450, NULL, NULL, 'literal', '', 'DDD', NULL, 1),
(7, 7, 1450, NULL, NULL, 'literal', '', '111', NULL, 1),
(8, 8, 1450, NULL, NULL, 'literal', '', '222', NULL, 1),
(9, 9, 1450, NULL, NULL, 'literal', '', '333', NULL, 1),
(10, 10, 1450, NULL, NULL, 'literal', '', '444', NULL, 1),
(11, 11, 1450, NULL, NULL, 'literal', '', 'Organisaties.nt.gz', NULL, 1),
(12, 11, 1323, NULL, NULL, 'customvocab:1', NULL, 'application/n-triples+gzip', NULL, 1),
(13, 11, 836, NULL, NULL, 'uri', '', '', 'TODO', 1),
(14, 11, 555, NULL, NULL, 'numeric:timestamp', NULL, '2023-04-06', NULL, 1),
(15, 12, 1450, NULL, NULL, 'literal', '', 'Organisaties.ttl', NULL, 1),
(16, 12, 1323, NULL, NULL, 'customvocab:1', NULL, 'text/turtle', NULL, 1),
(17, 12, 836, NULL, NULL, 'uri', '', '', 'TODO', 1),
(18, 12, 555, NULL, NULL, 'numeric:timestamp', NULL, '2023-04-23', NULL, 1),
(19, 13, 1450, NULL, NULL, 'literal', '', 'Organisaties', NULL, 1),
(20, 13, 1526, 3, NULL, 'resource:item', NULL, NULL, NULL, 1),
(21, 13, 1573, NULL, NULL, 'customvocab:3', NULL, 'CC0 1.0 Universal (CC0 1.0) Public Domain Dedication', 'http://creativecommons.org/publicdomain/zero/1.0/', 1),
(22, 13, 282, 12, NULL, 'resource:item', NULL, NULL, NULL, 1),
(23, 13, 282, 11, NULL, 'resource:item', NULL, NULL, NULL, 1),
(24, 13, 555, NULL, NULL, 'numeric:timestamp', NULL, '2023-04-06', NULL, 1),
(25, 13, 1604, 1, NULL, 'resource', NULL, NULL, NULL, 1),
(26, 13, 771, NULL, NULL, 'literal', '', 'test', NULL, 1),
(27, 14, 1450, NULL, NULL, 'literal', '', 'Personen.ttl.gz', NULL, 1),
(28, 14, 1323, NULL, NULL, 'customvocab:1', NULL, 'text/turtle+gzip', NULL, 1),
(29, 14, 836, NULL, NULL, 'uri', '', '', 'TODO', 1),
(30, 14, 555, NULL, NULL, 'numeric:timestamp', NULL, '2023-04-06', NULL, 1),
(31, 15, 1450, NULL, NULL, 'literal', '', 'Personen', NULL, 1),
(32, 15, 1526, 3, NULL, 'resource:item', NULL, NULL, NULL, 1),
(33, 15, 1573, NULL, NULL, 'customvocab:3', NULL, 'CC0 1.0 Universal (CC0 1.0) Public Domain Dedication', 'http://creativecommons.org/publicdomain/zero/1.0/', 1),
(34, 15, 282, 14, NULL, 'resource:item', NULL, NULL, NULL, 1),
(35, 15, 1212, 4, NULL, 'resource:item', NULL, NULL, NULL, 1),
(36, 15, 555, NULL, NULL, 'numeric:timestamp', NULL, '2023-04-06', NULL, 1),
(37, 15, 1604, 2, NULL, 'resource', NULL, NULL, NULL, 1),
(38, 15, 771, NULL, NULL, 'literal', '', 'test', NULL, 1),
(39, 16, 1450, NULL, NULL, 'literal', '', 'CatalogusEen', NULL, 1),
(40, 16, 1599, 15, NULL, 'resource:item', NULL, NULL, NULL, 1),
(41, 16, 1599, 13, NULL, 'resource:item', NULL, NULL, NULL, 1),
(42, 16, 1526, 5, NULL, 'resource:item', NULL, NULL, NULL, 1),
(43, 15, 368, 16, NULL, 'resource:item', NULL, NULL, NULL, 1),
(44, 13, 368, 16, NULL, 'resource:item', NULL, NULL, NULL, 1),
(45, 17, 1450, NULL, NULL, 'literal', '', 'PersonenOrganisaties.jsonld', NULL, 1),
(46, 17, 1323, NULL, NULL, 'customvocab:1', NULL, 'application/ld+json', NULL, 1),
(47, 17, 836, NULL, NULL, 'uri', '', '', 'TODO', 1),
(48, 17, 555, NULL, NULL, 'numeric:timestamp', NULL, '2023-04-06', NULL, 1),
(49, 17, 1573, NULL, NULL, 'customvocab:3', NULL, 'CC0 1.0 Universal (CC0 1.0) Public Domain Dedication', 'http://creativecommons.org/publicdomain/zero/1.0/', 1),
(50, 18, 1450, NULL, NULL, 'literal', '', 'PersonenOrganisaties', NULL, 1),
(51, 18, 1526, 6, NULL, 'resource:item', NULL, NULL, NULL, 1),
(52, 18, 1573, NULL, NULL, 'customvocab:3', NULL, 'CC0 1.0 Universal (CC0 1.0) Public Domain Dedication', 'http://creativecommons.org/publicdomain/zero/1.0/', 1),
(53, 18, 282, 17, NULL, 'resource:item', NULL, NULL, NULL, 1),
(54, 18, 555, NULL, NULL, 'numeric:timestamp', NULL, '2023-04-06', NULL, 1),
(55, 18, 766, NULL, NULL, 'customvocab:2', NULL, 'nl', NULL, 1),
(56, 18, 1604, 2, NULL, 'resource', NULL, NULL, NULL, 1),
(57, 18, 1604, 1, NULL, 'resource', NULL, NULL, NULL, 1),
(58, 18, 771, NULL, NULL, 'literal', '', 'test', NULL, 1),
(59, 19, 1450, NULL, NULL, 'literal', '', 'CatalogusTwee', NULL, 1),
(60, 19, 1599, 18, NULL, 'resource:item', NULL, NULL, NULL, 1),
(61, 19, 1526, 6, NULL, 'resource:item', NULL, NULL, NULL, 1),
(62, 18, 368, 19, NULL, 'resource:item', NULL, NULL, NULL, 1);

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
(5, 1, 'https://schema.org/', 'sdo', 'Schema.org', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `numeric_data_types_duration`
--
ALTER TABLE `numeric_data_types_duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `numeric_data_types_integer`
--
ALTER TABLE `numeric_data_types_integer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1637;

--
-- AUTO_INCREMENT voor een tabel `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT voor een tabel `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999;

--
-- AUTO_INCREMENT voor een tabel `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT voor een tabel `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
