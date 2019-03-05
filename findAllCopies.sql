USE db_library_management_system2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tony Smith>
-- Create date: <3/2/19>
-- Description:	<Find how many copies of a book at each branch in the system>
-- =============================================
CREATE PROCEDURE dbo.findAllCopies
	-- Add the parameters for the stored procedure here
	@bookTitle VARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

	/*This will give the same error even if they type in a wrong book title, mis-capitalized book title or branch,
	or other possible problems with user input. Future editing would account for the many different possible 
	problems that could be encountered fomr users entering information. It at least gives a good erorr message for
	someone knowing what is expected to be typed in such as myself.*/
	DECLARE @errorString varchar(100)
	DECLARE @results AS varchar(5)
	SET @errorString = 'The book' + @bookTitle +' is not found at any branch.'

    -- Insert statements for procedure here
	BEGIN TRY
		SET @results = (SELECT COUNT(a1.copies_book_id) FROM tbl_book_copies a1 INNER JOIN tbl_books a2 ON a2.book_id = a1.copies_book_id WHERE a2.book_title = @bookTitle)
		IF @results = 0
			BEGIN
				/*LOGIC TO FOLLOW IF THIS CONDITION IS TRUE*/
				RAISERROR (@errorString,16,1)
				RETURN
			END
		ELSE
			BEGIN
				SELECT a3.branch_name, a1.copies_number_of_copies
				FROM tbl_book_copies a1
				INNER JOIN tbl_books a2 ON a2.book_id = a1.copies_book_id
				INNER JOIN tbl_library_branch a3 ON a3.branch_id = a1.copies_branch_id
				WHERE a2.book_title = @bookTitle
				;
			END
	END TRY

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10,1)
	END CATCH
END
