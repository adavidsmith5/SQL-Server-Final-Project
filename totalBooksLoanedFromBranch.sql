USE db_library_management_system2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tony Smith>
-- Create date: <3/3/19>
-- Description:	<Find how many books are loaned out from each branch>
-- =============================================
CREATE PROCEDURE dbo.totalBooksLoanedFromBranch

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		a3.branch_name, COUNT(a2.loans_book_id) AS books_loaned_out
		FROM tbl_book_loans a2
		INNER JOIN tbl_library_branch a3 ON a3.branch_id = a2.loans_branch_id
		GROUP BY a3.branch_name
	;
END
