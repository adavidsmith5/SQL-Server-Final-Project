USE db_library_management_system2
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tony Smith>
-- Create date: <3/2/19>
-- Description:	<Find how many copies of a book are at a specific branch>
-- =============================================
CREATE PROCEDURE dbo.findBook
	-- Add the parameters for the stored procedure here
	@bookTitle VARCHAR(50),
	@libraryBranch VARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	DECLARE @errorString varchar(100)
	DECLARE @results AS varchar(5)
	SET @errorString = 'The book' + @bookTitle +' is not found at the ' + @libraryBranch + ' branch.'

    -- Insert statements for procedure here
	BEGIN TRY
		SET @results = (SELECT COUNT(a1.copies_book_id) FROM tbl_book_copies a1 INNER JOIN tbl_books a2 ON a2.book_id = a1.copies_book_id INNER JOIN tbl_library_branch a3 ON a3.branch_id = a1.copies_branch_id WHERE a2.book_title = @bookTitle AND a3.branch_name = @libraryBranch)
		IF @results = 0
			BEGIN
				/*LOGIC TO FOLLOW IF THIS CONDITION IS TRUE*/
				RAISERROR (@errorString,16,1)
				RETURN
			END
		ELSE
			BEGIN
				SELECT a1.copies_number_of_copies
				FROM tbl_book_copies a1
				INNER JOIN tbl_books a2 ON a2.book_id = a1.copies_book_id
				INNER JOIN tbl_library_branch a3 ON a3.branch_id = a1.copies_branch_id
				WHERE a2.book_title = @bookTitle AND a3.branch_name = @libraryBranch
				;
			END
	END TRY

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10,1)
	END CATCH
END
