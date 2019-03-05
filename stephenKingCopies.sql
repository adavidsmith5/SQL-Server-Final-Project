USE db_library_management_system2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tony Smith>
-- Create date: <3/3/19>
-- Description:	<Find number of copies of stephen king's books at the central branch>
-- =============================================
CREATE PROCEDURE dbo.stephenKingCopies

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a1.book_title, a2.copies_number_of_copies
		FROM tbl_books a1
		INNER JOIN tbl_book_copies a2 ON a2.copies_book_id = a1.book_id
		INNER JOIN book_authors a3 ON a3.authors_book_id = a1.book_id
		INNER JOIN tbl_library_branch a4 ON a4.branch_id = a2.copies_branch_id
		WHERE a3.authors_name = 'Stephen King' AND a4.branch_name = 'Central'
	;
END
