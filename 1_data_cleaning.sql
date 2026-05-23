-- ====================================================================
-- PROJECT SUBMISSION: PART 1 - DATA CLEANING & TRANSFORMATION
-- Objective: Standardize raw operational tables and fix null entries
-- ====================================================================

-- A. Create a clean working table copy to protect raw source records
SELECT * 
INTO [Working Set]
FROM [raw_superstore_data];

-- B. Standardize Text Formatting & Remove Extraneous Whitespace
UPDATE [Working Set]
SET 
    [Customer Name] = TRIM([Customer Name]),
    [City] = TRIM([City]),
    [State] = TRIM([State]),
    [Region] = TRIM([Region]),
    [Category] = TRIM([Category]),
    [Sub-Category] = TRIM([Sub-Category]);

-- C. Handle Missing / Null Postal Codes by Null-to-Zero Flagging
UPDATE [Working Set]
SET [Postal Code] = 0
WHERE [Postal Code] IS NULL;

-- D. Enforce Primary Key Constraints on the Order Pipeline
ALTER TABLE [Working Set]
ALTER COLUMN [Row ID] INT NOT NULL;

ALTER TABLE [Working Set]
ADD CONSTRAINT PK_WorkingSet_RowID PRIMARY KEY ([Row ID]);