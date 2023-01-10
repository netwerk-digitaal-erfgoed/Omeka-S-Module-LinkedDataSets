Module LinkedDataSets
=====================


This module provides assistance to use your [Omeka-S](https://omeka.org/s/) system
to *describe* and *publish* your data collections as so called  **LinkedDataSets**,
following the guidelines described in [NDE Requirements for datasets](https://netwerk-digitaal-erfgoed.github.io/requirements-datasets/).

The module adds a *LinkedData Sets Catalog* functionality to your Omeka-S system where you can create and store
descriptions of your data collections as so called *Dataset* elements and thereby make them online  *findable* and *accessible*
as [*LinkedData*](), readable for both man and machine.

The description in such a *Dataset* may contain "metadata like" information of the data collection, for example 
about its creators, licenses etc. 
Besides that, it can carry references to representations of the actual data e.g. in  datadump file,
a so called *Distribution* (a.k.a. *DataDownload*) in the guideline terminology.

Note that for such a *Distribution* the actual data(file) 
can reside e.g. in a *datadump file* resource  within your Omeka-S system itself.
But, alternatively, the actual may reside  at an other, external location e.g. as a file on server.
In that case it should be referenced explicitely by a external Uri.


<a name="sec2"></a>

## The LinkedData Sets conceptual  model


In the [NDE Requirements for datasets](https://netwerk-digitaal-erfgoed.github.io/requirements-datasets/).
is described how we can make descriptions of a *Dataset*, in a [*LinkedData*]() way, in the form of RDF objects.
The guidelines promotes the use of a small part of the Schema.org vocabulary for this purpose.

With this vocabulary aspects like ownership, creators, license, titles, data locations etc. are all described
using a [simple conceptual model](https://netwerk-digitaal-erfgoed.github.io/requirements-datasets/#conceptual-model).
of 4 key elements: *DataCatalog*, *Dataset*, *Distribution*(or *DataDownload*) and *Organization*.
See figure. 

![The NDE LinkedDataSet Conceptual Model](./nde_conceptual_model.png)



<a name="sec2.1"><a/>

### The LinkedData Sets conceptual model implemented in Omeka-S

The LinkedDataSets module translates the various parts of the LinkedDatasSet conceptual model to
Omeka-S resources(Items, Media, ..) with appropiate properties, so that Omeka-S can be used to create
the descriptions.
Subsequently the module then provides an *LD Reposistory Endpoint* from where these descriptions can online be accessed as RDF (and HTML) resources.
See [section 4](#sec4)

The "LD Sets conceptual model implementation." table below shows how the elements from
guideline correspond to Omeka-S resources.

| Concept in guideline | Usage | Type in guideline | LinkedDataSets implementation | Remarks |
|---|---|---|---|---|
| DataCatalog | Top element, has collection of Datasets | schema:DataCatalog | **Item** with class **schema:DataCatalog** | resource template DataCatalog |
| Dataset | Has links to some Distributions | schema:Dataset | **Item** with class **schema:Dataset** | resource template Dataset |
| Distribution | Element that references a datadump or data endpoint | schema:DataDownload | **Media** with class **schema:DataDownload** attached to a Dataset Item| resource template Distribution |
| Organization | Element used to represent person or organization | schema:Organization | **Item** with class **schema:Organization** | resource template Organization |


<a name="sec3"></a>

## Managing LinkedData Sets in Omeka-S

The LD Sets as described above can, in principle,  be managed with the standard Omeka-S off the
shelf means for handling Items and Media.

### The description process - tools

Nevertheless the module LinkedDataSets comes with four sets of tools to make it easier
to Manage the LinkedData Sets:

- a set of resource templates and vocabularies to easily create new Datacatalog, Dataset, Distribution and Organization elements.
  These are automatically installed by the module.
  
- a *LinkedData Sets Manager Dashboard* that provides an overview of the LD Sets and comes with 
  handy links to explore the managed LD Sets resources  and to add new elements to it.

- an extra *Linked Data Sets tab section* in the edit pages of Datacatalog, Dataset and Distribution elements.
  These tabs provides some helpers to select and view the LinkedData specific properties of the elements.

- a set of *smart Distribution Ingesters* that help to create a new Distribution for a given Datadump file
  or for a repository endpoint, and subsequently link it to a *Dataset*.
  This is the *Datadump(Link,Download,Upload)* ingester that features:
  - *Upload* to upload a Datadump file for a new *Distribution*  
  - *Link URL* to link some external online Datadump for a new *Distribution*  
  - *Download URL* to make a local copy of an external online Datadump for a new *Distribution*   
  
  and the *Datadump(Generate)* ingester that allows,
  based on a chosen *datadump recipes*, to generate a  new Datadump file for the data in a local Omeka-S *Itemset* and use it for a new *Distribution*   

### The description process - a proposed workflow

A roadmap to start the description process of your data collection, as a *LinkedDataset*, could be:

1. Create *Organization* elements for the owners, creators etc. of your data.
   Do this for example from the *LD Manage Dasboard* and use the *Add new Organization* button .
   (the plus sign right to *Organizations*).
   Fill all fields given by the template for the new *Organization* element.

2. Add a new (top) *DataCatalog* that should hold all your *Dataset* descriptions. 
   You may need only one, but if you need to create another, you can use the *Add new DataCatalog* button
   from the *LD registry Dashboard* (the plus sign right to *Datacatalogs*)
   Fill all fields given by the template for the element and also check the fields in its *LD Registry tab*

3. When step 1. and 2. are done it is a good moment to start adding some *Datasets*.
   Again this can be initiated from the *LD Manage Dashboard*.
   And again, fill all fields given by the template for the new *Dataset* element and also check the fields in its *Linked Data Sets tab*

   3.1 If you have a *Datadump file* for the collection denoted by the *Dataset* or a url to such a file or to a repository endpoint for the dataset, 
       you can now go to your *Dataset* element and then, from its *Media tab* use the *Datadump(Link,Download,Upload)*
       ingester to create and add a new
       *Distribution* to the dataset, with the datadump file attached.
   
   3.2 If you want to generate a new Datadump of all the data in one of your Itemsets, you can do this
       using the *Datadump(Generate)* ingester. This will start a generation job, that, once finished,
       delivers a new Datadump attached to a new  *Distribution* linked to the Dataset.
   
4. If you are happy with your Datasets and Distributions, you should link them to your DataCatalog
  element by adding it as new value to its *dataset* property.
  When done, it will be published via the LinkedData Repository Endpoint (see ..)

<a name="sec4"></a>

## The LinkedData Repository Endpoint

This module provides adds a  dedicated endpoint to you Omeka-S system that
can be used to access the registry components DataCatalog, Datasets and Distributions in an LD
compatible way.

Content Negotiation lets you retrieve the information as either
- html - for a human readible descriptive webpage, or
- ld-json, turtle, xmlrdf .. - for RDF encodings in machine readible serializations


### Routes and urls

All routes of the LD repository Api  are defined in `config/module.config.php`.
They follow the recommandations of the [Dutch Uri strategy specifications](https://www.pldn.nl/wiki/Concept_URI-strategie).

To retrieve  the serialized RDF objects of the various LinkedData registry use
these urls (replace `:dcid` by a proper DataCatalog item id,
`:dsid` by a proper Dataset item id and `:dbtid` by a proper DataDownload media id):

- 'https://example.org/ld/id/datacatalog' for the collection of al DataCatalog elements
- 'https://example.org/ld/id/datacatalog/:dcid' for single DataCatalog element referred to by `:dcid`
- 'https://example.org/ld/id/dataset' for the collection of al Dataset elements
- 'https://example.org/ld/id/dataset/:dsid' for single Dataset element referred to by `:dsid`
- 'https://example.org/ld/id/distribution' for the collection of al Distribution( aka DataDownload) elements
- 'https://example.org/ld/id/distribution/:dtbid' for single Dataset element referred to by `:dsid`

The RDF encoding of the response is settled by *Content Negotiation*

>  Should we allow explicitly providing an extension to request a specific encoding, like:
>  'https://example.org/ld/id/dataset/:dsid.:format' to retrieve a single Dataset element referred to by identifier `:dsid` in 
>  a desired in encoding `:format`. With `:format` for example 'ttl', 'ldjson', 'n3' or 'html'?

Human readible variants can also be retrieved explicitly by using the `doc` type, instead of `id`, in the LD Api url, as in:

- 'https://example.org/ld/doc/datacatalog' gives the html search resultpage for all DataCatalog Items
- https://example.org/ld/doc/datacatalog/:dcid gives the html view or site page for  DataCatalog element referred to by `:dcid`
- etc.

(Note: when using `html` as requested Content in the variants above with`/ld/id/..` base, these are 303
redirected to the corresponding `/ld/doc/..` page):


By default, ids are the internal ids of Omeka S, but it is recommended to use
your own single and permanent identifiers that don’t depend on an internal
pointer in a database. The term `Dublin Core Identifier` is designed for that
and a record can have multiple single identifiers. There are many possibilities:
named number like in a library or a museum, isbn for books, or random id like
with ark, noid, doi, etc. They can be displayed in the public url with the
modules [Ark] and/or [Clean Url].
(N.B. This is currently not yet implemented, see Todo section.)

## Required and Recommended modules

 - DataTypeDateTime  
 - DataTypeClass (or newer variant: DataTypeTypedResource)  
 - Custom Vocab__


## Todo and missing functionality

 - proper handling of PermanentIDentifiers (PID) when used with for example module PID or ARK
   in the LD Repository Endpoint.
   Clearly this is an important issue for proper use of RDF and URI's. Implementation is very doable
   but multiple variants could be chosen. (Maybe chosing between the variants in a module config option
   is best.)

