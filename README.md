Module Linked Data Sets
=====================


This module provides assistance to use your [Omeka-S](https://omeka.org/s/) system
to *describe* and *publish* your data collections as so called  **Linked Data Sets**,
following the guidelines described in [NDE Requirements for datasets](https://netwerk-digitaal-erfgoed.github.io/requirements-datasets/).

The module adds a *Linked Data Sets* functionality to your Omeka-S system where you can create and store
descriptions of your data collections as so called *Dataset* elements and thereby make them online  *findable* and *accessible*
in a RDF format.

## The conceptual model

The [NDE Requirements for datasets](https://netwerk-digitaal-erfgoed.github.io/requirements-datasets/).
describes how a dataset description should be defined. 
The guidelines promotes the use of a small part of the Schema.org vocabulary for this purpose.

With this vocabulary aspects like ownership, creators, license, titles, data locations etc. are all described
using a [simple conceptual model](https://netwerk-digitaal-erfgoed.github.io/requirements-datasets/#conceptual-model).
of 4 key elements: *DataCatalog*, *Dataset*, *Distribution*(or *DataDownload*), *Person* and *Organization*.
See figure. 

![The NDE LinkedDataSet Conceptual Model](./nde_conceptual_model.png)

### The conceptual model implemented in Omeka S

The Linked Data Sets module translates the various parts of the conceptual model to
Omeka S resources (Items) with the appropiate properties, so that Omeka-S can be used to create
the descriptions.

The table below shows how the elements from the guideline correspond to Omeka S resources.

| Concept in guideline | Usage | Type |  Resource template |
|---|---|---|---|
| DataCatalog | Top element, has collection of Datasets | schema:DataCatalog | LDS DataCatalog |
| Dataset | Has links to some Distributions 1) | schema:Dataset | LDS Dataset |
| Distribution | Element that references a datadump or data endpoint 1) | schema:DataDownloa | LDS Distribution |
| Organization | Element used to represent organization (for publisher, creator and/or funder) | schema:Organization | LDS Organization |
| Person | Element used to represent person (for publisher, creator and/or funder) | schema:Person |  LDS Person |

1 - When a Dataset has a property schema:isBasedOn which has an Itemset, the module can crawl this dataset and output the RDF in the in the Distribution defined property schema:encodingFormat.

## Required modules

 - [Custom Vocab](https://github.com/omeka-s-modules/CustomVocab)
 - [Numeric Data Types](https://github.com/omeka-s-modules/NumericDataTypes)

## Development
For development purposes there's a small prefilled database in /database/test.omeka.sql. The admin user `admin@example.com` with password `password`
