# Laptops Database

## **Collaborators:**
- Rishi Kavikondala
- Tanner Kooistra
- Brian Ying
- Ryan Kim

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
- Less than 64 GB must not be a valid storage option
- A laptop order must have a quantity between 1 and 20 inclusive

<ins>Ryan</ins>
- A customer cannot be under 18 years of age
- Rating value must be between 1 and 5 inclusive

## **Computed columns:**

<ins>Rishi</ins>
- Number of orders per region
- Number of products of type laptop per security type <br>

<ins>Tanner</ins>
- Number of orders a customer has previously placed
- Sum of money each customer has spent on products of type laptop <br>

<ins>Brian</ins>
- Average rating value for a product of type laptop
- Number of orders previously placed for a product of type laptop

<ins>Ryan</ins>
- Number of times a rating value has been assigned in the past six months
- Number of products of type laptop that have a particular color

## **Views:**
<ins>Rishi</ins>
- Count products of type laptop by the number of unique brands that contributed features to them (CASE statement).
- Rank the top 3 most expensive products of type laptop with an average rating greater than 3.0 that rely on external audio part producing brands for their audio systems.

<ins>Tanner</ins>
- Find the top 3 lightest products of type laptop in order, which: run on non-Windows OS, have a display resolution of 2880 x 1800, consists of any color except black, and must have been ordered at least once in the last year.
- Find the average price of a product of type laptop: with an Intel CPU that has at least 2 cores, battery life greater than or equal to 10 hours, released in the last 2 years, and that purchased only by customers over 30 years old.

<ins>Brian</ins>
- Find the three lowest priced 2019-released laptops that: run on Windows 10 Home, has at least 1 speaker, and weighs more than 3 lbs.
- Find the customers who have: ordered over $1000 of laptops (that also have never been rated below 3 stars) in the last six months.

<ins>Ryan</ins>
- Find the top 5 products of type laptop meeting the following conditions: not affiliated with Apple, a graphics card made by NVIDIA, received an average rating of 3 or higher, priced under $1000, released before 2020 (ordered output by price highest to lowest).
- Find and group the products of type laptop (which have been ordered at least once by people younger than 50 in the West or South) into 3 groups (CASE statement). <br>

## **Lookup tables:**
- tblBRAND_TYPE
- tblPRODUCT_TYPE
- tblCOLOR
- tblRATING
- tblVERSION
- tblSECURITY_TYPE