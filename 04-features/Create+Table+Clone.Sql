// Create a new database named from a clone of the Udemy database
// Note: This creates a new database exactly the same as the source database but with no additional 
// storage but completely separate from the source database.
Create or Replace Database Udemy_Clone 
Clone Udemy

// Let's verify the new database exists
Select * From Udemy_Clone.Public.Sales

// Let's create the database again, using cloning and time travel. We'll base the new database on the
// state of the source database as of 1 hour ago.
Create or Replace Database Udemy_Clone 
Clone Udemy
BEFORE (OFFSET => -60 * 60);

// Official syntax looks like this:
CREATE [ OR REPLACE ] { DATABASE | SCHEMA | TABLE | STREAM } [ IF NOT EXISTS ] <object_name>
  CLONE <source_object_name>
        [ { AT | BEFORE } ( { TIMESTAMP => <timestamp> | OFFSET => <time_difference> | STATEMENT => <id> } ) ]
        
/* Four points to remember
1) An error is returned if the source object did not exist at the time specified in the AT or BEFORE clause.
2) Child objects that did not exist at the time specified in the AT or BEFORE clause will not be cloned. No errors are generated.
3) An error is returned if any of the objects required to clone the object have not maintained historical data. 
4) Time travel maintains both data and metadata, which means a standard time travel query can retrieve historic names of columns and similar metadata. 
   A clone on the other hand retrieves the data from the historical store, however the metadata is retrieved the current state of the source object. 
*/