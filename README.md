# Laptops Database

## **Collaborators:**
- Rishi Kavikondala
- Tanner Kooistra
- Brian Ying
- Ryan Kim

## **Lookup tables:**
- tblBRAND_TYPE
- tblPRODUCT_TYPE
- tblCOLOR
- tblRATING
- tblVERSION
- tblSECURITY_TYPE

## **Stored procedures:** <br>
<ins>Rishi</ins>
- tblCOMMENT
- tblFEATURE
- tblBRAND
- Feature subtypes
    - tblOS
    - tblDISPLAY
    - tblCPU
    - tblGRAPHICS
    - tblSECURITY
    - tblWEBCAM
    - tblAUDIO
    - tblSTORAGE <br>

<ins>Tanner</ins>
- tblPRODUCT
- tblPRODUCT_FEATURE <br>

<ins>Brian</ins>
- tblPRODUCT_ORDER
- tblORDER <br>

<ins>Ryan</ins>
- tblCUSTOMER
- tblREVIEW <br>

## **Check constraints:**
<ins>Rishi</ins>
- No product of type laptop can have a weight of less than 1 pound
- No product by Apple can have an NVIDIA graphics card

<ins>Tanner</ins>
- No customer can have a phone number with letters or an email containing less or more than one '@' symbol
- Two reviews cannot have the exact same comment

<ins>Brian</ins>
- Less than 2 cores must not be a valid CPU feature
- A laptop order must have a quantity between 1 and 20 inclusive

<ins>Ryan</ins>
- A customer cannot be under 18 years of age
- RatingValue must be between 1 and 5 inclusive

## **Computed columns:**

<ins>Rishi</ins>
- Number of orders per region
- Number of products of type laptop per security type <br>

<ins>Tanner</ins>
- Total number of orders a customer has placed 
- Total sum of money a customer has spent on products of type laptop <br>

<ins>Brian</ins>
- Average rating value for a product of type laptop
- Number of orders previously placed for a product of type laptop

<ins>Ryan</ins>
- Total number of orders for a product of type laptop in the past six months
- Total number of products of type laptop that have a particular color

## **Views:**
<ins>Rishi</ins>
- 
- V2

<ins>Tanner</ins>
- V3
- V4

<ins>Brian</ins>
- V5
- V6

<ins>Ryan</ins>
- V7
- V8
